<?php
class Zend_View_Helper_Reader extends Zend_View_Helper_Abstract
{
	public function reader()
	{
		$gr = new gr;
		$mesaj='<div class="cont"><h5 class="fire">Takip Ediyor</h5><br />';
		$subs = $gr->get_subscriptions();
		foreach($subs->subscriptions as $sub) 
			$mesaj .= "<p><a href='".$sub->id."' target='_blank' rel='nofollow'>".$sub->title."</a></p>";
		return $mesaj."</div>";
	}
}

class gr 
{
	public $proxy = 0;
	public $proxyUrl = '';
	public $userInfo = '';
	protected $_urlApi = 'http://www.google.com/reader/api/0';
	protected $auth = '';
	protected $token = '';

	function gr() 
	{
		$data = '&Email=tasdemiribrahimbm@gmail.com&Passwd=elendil6883&service=reader&source=itsphp+rss+bot&continue=http://www.google.com';
		$result = $this->post_anon_url('https://www.google.com/accounts/ClientLogin',$data);
		preg_match('/Auth=(\S*)/', $result, $match);
		$this->auth = $match[1];
		$this->token = $this->get_url('https://www.google.com/reader/api/0/token');
		$this->userInfo = json_decode($this->get_url('https://www.google.com/reader/api/0/user-info'));
	}

	function get_subscriptions() 
	{
		$result = $this->get_url('https://www.google.com/reader/api/0/subscription/list?output=json');
		return json_decode($result);
	}

	function get_tags() 
	{
		$result = $this->get_url('https://www.google.com/reader/api/0/tag/list?output=json');
		return json_decode($result);
	}

	function get_friends() 
	{
		$result = $this->get_url('https://www.google.com/reader/api/0/friend/list?output=json');
		return json_decode($result);
	}

	function get_stream_items($stream = '',$xt_a = array('user/-/state/com.google/read'),$daysago = 3,$n = 20,$magic = True) 
	{
		$stream = str_replace(' ','%20',$stream);
		$ot = time() - ($daysago * 86400);
		$ck = time() * 1000;
		if ($magic == True) { $r = 'a'; } else { $r = 'n'; }  // sort by magic $r = 'o'
		$xt = '';
		foreach($xt_a as $key=>$value) { $xt .= '&xt='.$value; } 
		$url = 'https://www.google.com/reader/api/0/stream/contents/'.$stream.'?ot='.$ot.'&r='.$r.$xt.'&n='.$n.'&ck='.$ck.'&client='.$this->userAgent;
		$result = $this->get_url($url);
		//echo $url;
		return json_decode($result);
	}

	function set_article_read($id,$stream) 
	{
		$url = $this->_urlApi . '/edit-tag?pos=0&client=' . $this->userAgent;
		$data = 'a=user/-/state/com.google/read&async=true&s='.$stream.'&i='.$id.'&T='.$this->token;
		return $this->post_url($url,$data);
	}

	function set_article_starred($id,$stream) 
	{
		$url = $this->_urlApi . '/edit-tag?pos=0&client=' . $this->userAgent;
		$data = 'a=user/-/state/com.google/starred&async=true&s='.$stream.'&i='.$id.'&T='.$this->token;
		return $this->post_url($url,$data);
	}

	function set_article_broadcast($id,$stream) 
	{
		$url = $this->_urlApi . '/edit-tag?pos=0&client=' . $this->userAgent;
		$data = 'a=user/-/state/com.google/broadcast&async=true&s='.$stream.'&i='.$id.'&T='.$this->token;
		return $this->post_url($url,$data);
	}

	function set_article_review($id,$stream) 
	{
		$url = $this->_urlApi . '/edit-tag?pos=0&client=' . $this->userAgent;
		$data = 'a=user/'.$this->userInfo->userId.'/label/Review&async=true&s='.$stream.'&i='.$id.'&T='.$this->token;
		return $this->post_url($url,$data);
	}


	function get_url($url) 
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);      
		if ($this->proxy == 1) { curl_setopt($ch, CURLOPT_PROXY, $this->proxyUrl); }
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt ($ch, CURLOPT_HTTPHEADER, array('Authorization: GoogleLogin auth=' . $this->auth));
		curl_setopt ($ch, CURLOPT_USERAGENT, $this->userAgent);
		curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
		curl_close($ch);
		return $result;
	}

	function get_anon_url($url) 
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);      
		if ($this->proxy == 1) { curl_setopt($ch, CURLOPT_PROXY, $this->proxyUrl); }
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt ($ch, CURLOPT_USERAGENT, $this->userAgent);
		curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		curl_close($ch);
		return $result;
	}

	function post_url($url,$data) 
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);      
		curl_setopt ($ch, CURLOPT_POST, true);
		if ($this->proxy == 1) { curl_setopt($ch, CURLOPT_PROXY, $this->proxyUrl); }
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt ($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt ($ch, CURLOPT_HTTPHEADER, array('Authorization: GoogleLogin auth=' . $this->auth));
		curl_setopt ($ch, CURLOPT_USERAGENT, $this->userAgent);
		curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		curl_close($ch);
		return $result;
	}

	function post_anon_url($url,$data) 
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);      
		curl_setopt ($ch, CURLOPT_POST, true);
		if ($this->proxy == 1) { curl_setopt($ch, CURLOPT_PROXY, $this->proxyUrl); }
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt ($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt ($ch, CURLOPT_USERAGENT, $this->userAgent);
		curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);
		$result = curl_exec($ch);
		curl_close($ch);
		return $result;
	}
}  

