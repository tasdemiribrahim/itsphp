<?php
class Zend_View_Helper_Tracker extends Zend_View_Helper_Abstract
{
	public function tracker()
	{
		$url = 'http://ipinfodb.com/ip_query.php?ip='.$_SERVER['REMOTE_ADDR'];
		$init = curl_init($url);
		curl_setopt($init, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($init, CURLOPT_TIMEOUT, 10);
		$exec = curl_exec($init);
		$info = curl_getinfo($init);
		curl_close($init);

		if($info['http_code'] === 200) 
		{
			$objDOM = new DOMDocument(); 
			$objDOM->loadXML($exec); 

			$country1 = $objDOM->getElementsByTagName("CountryName"); 
			$country  = $country1->item(0)->nodeValue;
			
			$city1 = $objDOM->getElementsByTagName("City"); 
			$city  = $city1->item(0)->nodeValue;
		}

		$tracker = new main_Models_Tracker();
		$tracker->ip=$_SERVER['REMOTE_ADDR'];
		$tracker->country=$country;
		$tracker->city=$city;
		$tracker->date=date("Y-m-d");
		$tracker->time=date("H:i:s");
		$tracker->query_string=$_SERVER['QUERY_STRING'];
		$tracker->http_referer= isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : "Yok";
		$tracker->http_user_agent=$_SERVER['HTTP_USER_AGENT'];
		$tracker->isbot= $this->is_bot() ? 1 : 0;
		$tracker->replace();
	} 
	
	protected function is_bot()
	{
		$botlist = array("Teoma", "alexa", "froogle", "Gigabot", "inktomi",
		"looksmart", "URL_Spider_SQL", "Firefly", "NationalDirectory",
		"Ask Jeeves", "TECNOSEEK", "InfoSeek", "WebFindBot", "girafabot",
		"crawler", "www.galaxy.com", "Googlebot", "Scooter", "Slurp",
		"msnbot", "appie", "FAST", "WebBug", "Spade", "ZyBorg", "rabaz",
		"Baiduspider", "Feedfetcher-Google", "TechnoratiSnoop", "Rankivabot",
		"Mediapartners-Google", "Sogou web spider", "WebAlta Crawler","TweetmemeBot",
		"Butterfly","Twitturls","Me.dium","Twiceler","bitlybot","Java","Validator");
		foreach($botlist as $bot)
			if(strpos($_SERVER['HTTP_USER_AGENT'], $bot) !== false)
				return true;
		return false;
	}
} 
		
