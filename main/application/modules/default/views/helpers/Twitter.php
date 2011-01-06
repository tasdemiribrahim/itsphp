<?php
class Zend_View_Helper_Twitter extends Zend_View_Helper_Abstract
{
	public function twitter()
	{
		$t = new TwitterStatus('sitepointdotcom', 10);
		return $t->Render();
	}
}

/* 
TwitterStatus class
Retrieves latest tweets and returns an HTML widget
By Craig Buckler,		http://twitter.com/craigbuckler
of OptimalWorks.net,	http://www.optimalworks.net/

Refer to http://blogs.sitepoint.com/create-your-own-twitter-widget-1

This code can be used without any restrictions, but please don't expect support either!
*/
class TwitterStatus
{
	public $ID;				// twitter user name
	public $Count;				// tweets to fetch
	public $WidgetTemplate;	// widget template
	public $TweetTemplate;		// template for each tweet
	public $ParseLinks;		// parse links in Twitter status
	public $DateFormat;		// PHP or "friendly" dates
	public $CacheFor;			// number of seconds to cache feed
	private $cache;			// location of cache files

	// ______________________________________________
	// constructor
	public function __construct($id = null, $count = 0) {

		// constants
		$this->cache = 'cache/';	// cache location
		$this->CacheFor = 1200;		// cache feed for 15 minutes
	
		$this->ID = $id;
		$this->Count = $count;
		$this->ParseLinks = true;
		$this->DateFormat = 'friendly';
	
		// default widget template
		$this->WidgetTemplate = 
			'<div class="twitterstatus">' .
			'<h3><a href="http://twitter.com/{screen_name}"><img src="{profile_image_url}" width="24" height="24" alt="{name}" />{name}</a></h3>' . 
			'<ul>{TWEETS}</ul>' . 
			'</div>';
			
		// default tweet template
		$this->TweetTemplate ='<li>{text} <time>{created_at}</time></li>';
	
	}
	
	
	// ______________________________________________
	// returns formatted feed widget
	public function Render() 
	{
		// returned HTML string
		$render = '';
		// cached file available?
		$cache = $this->cache . $this->ID . '-' . $this->Count . '.html';
		$cacheage = (file_exists($cache) ? time() - filemtime($cache) : -1);
		if ($cacheage < 0 || $cacheage > $this->CacheFor) 
		{
			// fetch feed
			$json = $this->FetchFeed();
			if ($json) 
			{
				$widget = '';
				$status = '';
				// examine all tweets
				for ($t = 0, $tl = count($json); $t < $tl; $t++) 
				{
					// parse widget template
					if ($t == 0) 
						$widget .= $this->ParseStatus($json[$t], $this->WidgetTemplate);
					// parse tweet
					$status .= $this->ParseStatus($json[$t], $this->TweetTemplate);
				}
				// parse Twitter links
				$render = str_replace('{TWEETS}', $status, $widget);
				// update cache file
				file_put_contents($cache, $render);
			}
		
		}
		// fetch from cache
		if ($render == '' && $cacheage > 0) 
			$render = file_get_contents($cache);
		return $this->ParseDates($render);
	}
	

	// ______________________________________________
	// returns JSON-formatted status feed or false on failure
	private function FetchFeed() 
	{
		$r = '';
		if ($this->ID != '' && $this->Count > 0) 
		{
			// fetch feed
			$c = curl_init();
			curl_setopt_array($c, array(CURLOPT_URL => 'http://twitter.com/statuses/user_timeline/' . $this->ID . '.json?count=' . $this->Count,CURLOPT_HEADER => false,CURLOPT_TIMEOUT => 10,CURLOPT_RETURNTRANSFER => true));
			$r = curl_exec($c);
			curl_close($c);
		}
		// return JSON as array
		return (!!$r ? json_decode($r, true) : false);
	}
	
	
	// ______________________________________________
	// parses tweet data
	private function ParseStatus($data, $template) 
	{
		// replace all {tags}
		preg_match_all('/{(.+)}/U', $template, $m);
		for ($i = 0, $il = count($m[0]); $i < $il; $i++) 
		{
			$name = $m[1][$i];
			// Twitter value found?
			$d = false;
			if (isset($data[$name])) 
				$d = $data[$name];
			else if (isset($data['user'][$name])) 
				$d = $data['user'][$name];
			// replace data
			if ($d) 
			{
				switch ($name) 
				{
					// parse status links
					case 'text':
						if ($this->ParseLinks) 
							$d = $this->ParseTwitterLinks($d);
						break;
					// tweet date
					case 'created_at':
						$d = "{DATE:$d}";
						break;
				}
				$template = str_replace($m[0][$i], $d, $template);
			}
		}
		return $template;
	}
	
	
	// ______________________________________________
	// parses Twitter links
	private function ParseTwitterLinks($str) 
	{
		// parse URL
		$str = preg_replace('/(https{0,1}:\/\/[\w\-\.\/#?&=]*)/', '<a href="$1">$1</a>', $str);
		// parse @id
		$str = preg_replace('/@(\w+)/', '@<a href="http://twitter.com/$1" class="at">$1</a>', $str);
		// parse #hashtag
		$str = preg_replace('/\s#(\w+)/', ' <a href="http://twitter.com/#!/search?q=%23$1" class="hashtag">#$1</a>', $str);
		return $str;
	}
	
	
	// ______________________________________________
	// parses Tweet dates
	private function ParseDates($str) 
	{
		// current datetime
		$now = new DateTime();
		preg_match_all('/{DATE:(.+)}/U', $str, $m);
		for ($i = 0, $il = count($m[0]); $i < $il; $i++) 
		{
			$stime = new DateTime($m[1][$i]);
			if ($this->DateFormat == 'friendly') 
			{
				// friendly date format
				$ival = $now->diff($stime);
				$yr = $ival->y;
				$mh = $ival->m + ($ival->d > 15);
				if ($mh > 11) $yr = 1;
				$dy = $ival->d + ($ival->h > 15);
				$hr = $ival->h;
				$mn = $ival->i + ($ival->s > 29);
				if ($yr > 0) 
				{
					if ($yr == 1) $date = 'geçen sene';
					else $date = $yr . ' yıl önce';
				}
				else if ($mh > 0) 
				{
					if ($mh == 1) $date = 'geçen ay';
					else $date = $mh . ' ay önce';
				}
				else if ($dy > 0) 
				{
					if ($dy == 1) $date = 'dün';
					else if ($dy < 8) $date = $dy . ' dgün önce';
					else if ($dy < 15) $date = 'geçen hafta';
					else $date = round($dy / 7) . ' hafta önce';
				}
				else if ($hr > 0) 
				{
					$hr += ($ival->i > 29);
					$date = $hr . ' saat önce';
				}
				else 
				{
					if ($mn < 3) $date = 'az önce';
					else $date = $mn . ' dakika önce';
				}

			}
			else $date = $stime->format($this->DateFormat);
			// replace date
			$str = str_replace($m[0][$i], $date, $str);
		}
		return $str;
	}
}
