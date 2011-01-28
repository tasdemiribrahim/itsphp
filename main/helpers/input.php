<?php
/**
* Site Name Getter
*
* @return string name of the site eg. http://www.example.com/
*/
function getSiteName(){ return "http://tasdemir.0fees.net/"; }
/**
* Picture Getter
*
* @param string $id The name of the image
* @param string $dosya The folder of the image
*
* @return string Returns "/main/images/$dosya/$id.jpg" when the image exists. Returns "/main/images/blankImage.jpg" when the image does not exist.
*/
function getResim($id,$dosya="aile")
{
	if(file_exists($_SERVER['DOCUMENT_ROOT']."/main/images/resimler/$dosya/$id.jpg"))
		return "/main/images/resimler/$dosya/$id.jpg";
	else
		return "/main/images/blankImage.jpg";
}
/**
* Feed getter using simplePie library
*
* @param string $url The url of the feed
*
* @return array last feed 
*/
function feedburn($url)
{
	require_once "../../library/SimplePie/simplepie.inc";
	$feed = new SimplePie();
	$feed->set_cache_location("../../cache");
	$feed->set_feed_url($url);
	$feed->init();
	$feed->handle_content_type();
	$mesaj= array($feed->get_permalink(),$feed->get_title(),$feed->get_description());
	$item = $feed->get_item();
	return array_merge($mesaj,array($item->get_permalink(),$item->get_title(),$item->get_description()));
}
if(isset($_GET["feedburn"]))
	echo implode("|",feedburn($_GET["feedburn"]));
/**
* gravatar getter
*
* @param string $email The email of the person
* @param int $size The size of the gravatar image default 23
*
* @return string the url of the gravatar image
*/
function gravatar($email, $size=23)
{
	return 'http://www.gravatar.com/avatar/'.md5(strtolower(trim($email))).'?size='.$size.'&amp;default='.urlencode('http://www.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?size='.$size);
}
/**
* Returns bitly short url
*
* @param string $bitly The url of the page
*
* @return string
*/
function getBitly($bitly)
{	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_URL, "http://api.bit.ly/v3/shorten?login=".BITLY_LOGIN."&apiKey=".BITLY_API_KEY."&longUrl=$bitly%2F&format=txt");
	$r = curl_exec($ch);
	//curl_setopt($ch, CURLOPT_URL, "http://api.bit.ly/v3/clicks?shortUrl=$r&login=".BITLY_LOGIN."&apiKey=".BITLY_API_KEY."&format=json");
	//$p=curl_exec($ch);
	curl_close($ch);  
	return $r;
}
/**
* Returns tiny short url
*
* @param string $tinyurl The url of the page
*
* @return string
*/
function getTiny($tinyurl)
{
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, "http://tinyurl.com/api-create.php?url=".$tinyurl);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$r = curl_exec($ch);
	curl_close($ch);  
	return $r;
}
/**
* Returns goo.gl short url
*
* @param string $google The url of the page
*
* @return string
*/
function getGoogle($google)
{
	define('GOOGLE_ENDPOINT', 'https://www.googleapis.com/urlshortener/v1');
        $ch = curl_init(sprintf('%s/url?key=%s', GOOGLE_ENDPOINT, GOOGLE_API_KEY));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $requestData = array('longUrl' => $google);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-type: application/json'));
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($requestData));
        $result = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($result, true);
        return $response['id'];
}
/**
* Returns the sum of the feed followers
*
* @param string $url The url of the feed
*
* @return int
*/
function getSocial($url)
{
	$whaturl="https://feedburner.google.com/api/awareness/1.0/GetFeedData?uri=".$url;
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $whaturl);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$data = curl_exec($ch);
	curl_close($ch);
	$xml = new SimpleXMLElement($data);
	$fb = $xml->feed->entry['circulation'];
	return number_format($fb);
}
/**
* Returns the error safe string
*
* @param string $string The string to sanitize
*
* @return string
*/	
function temizYazi($string) 
{   
	$string = strip_tags(trim($string));   
	$string = preg_replace('/<(.*)\s+(\w+=.*?)>/', '', $string);
	if(get_magic_quotes_gpc()) 
		$string = stripslashes($string);
	// $string = mysql_escape_string($string); 
	if(strlen($string) > 500) 
		$string =substr($string,0,500);
	return $string;
}  
/**
* Returns the error safe int
*
* @param int $int The int to sanitize
*
* @return int
*/	
function temizSayi($int)
{
	return $int=="" ? $int : strval(intval(trim($int)));
}
/**
* Returns the error safe tel
*
* @param string $no The tel to sanitize
*
* @return string
*/	
function temizTel($no)
{
	$tel = filter_var(trim($no), FILTER_SANITIZE_NUMBER_INT);
	$tel = str_replace('-', '', $tel);
	$tel = str_replace('+', '', $tel);
	$tel = str_replace('.', '', $tel);
	return $tel==0 ? "" : $tel;
}
/**
* Returns the error safe email
*
* @param string $email The email to sanitize
*
* @return string
*/
function temizEMail($email)
{
	$email=filter_var(trim($email),FILTER_SANITIZE_EMAIL);
	if(eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$", $email))
		return $email;
	return "";
}
/**
* Returns the error safe url
*
* @param string $url The url to sanitize
*
* @return string
*/
function temizURL($url)
{
	return htmlspecialchars(filter_var(trim($url),FILTER_SANITIZE_URL));
}
function temizKredi($cc)
{
	$cc = str_replace('-', '', trim($cc));
	$cc = str_replace('+', '', $cc);
	$cc = str_replace('.', '', $cc);
	$cc = str_replace(' ', '', $cc);
	if(strlen($cc)!=16) return false;
	$total=0;
	for($i=0;$i<16;$i++)
	{
		if($i%2==0)
		{
			if(($cc[$i]*2)>9)
				$total++;
			$total+=($cc[$i]*2)%10;
			continue;
		}
		$total+=$cc[$i];
	}
	return $total%10==0;	
}
/**
* Marks a word in the paragraph
*
* @param string $sString The paragraph
* @param string or array $aWords The word(s) to mark
*
* @return string
*/
function markYazi($sString, $aWords) 
{
	if (!is_array ($aWords) || empty ($aWords) || !is_string ($sString)) 
		return false;

	$sWords = implode ('|', $aWords);
 	return preg_replace ('@\b('.$sWords.')\b@si', '<mark>$1</mark>', $sString);
}
/**
* Sorts the array
*
* @param array $array
*
* @return array
*/
function quicksort($array)
{
	if (count($array) == 0)
		return array();
	$pivot = $array[0];
	$left = $right = array();
	for ($i = 1; $i < count($array); $i++) 
	{
		if ($array[$i] < $pivot)
			$left[] = $array[$i];
		else
			$right[] = $array[$i];
	}
	return array_merge(quicksort($left), array($pivot), quicksort($right));
}
/**
* dumps the formatted string of params
*/
function dump()
{
    list($callee) = debug_backtrace();
    $arguments = $callee['args'];
    $total_arguments = count($arguments);

    echo '<fieldset style="background: #fefefe !important; border:2px red solid; padding:5px">';
    echo '<legend style="background:lightgrey; padding:5px;">'.$callee['file'].' @ line: '.$callee['line'].'</legend><pre>';
    $i = 0;
    foreach ($arguments as $argument)
    {
        echo '<br/><strong>Debug #'.(++$i).' of '.$total_arguments.'</strong>: ';
		if (is_array($argument))
			print_r($argument);
		else
			var_dump($argument);
    }

    echo "</pre>";
    echo "</fieldset>";
}
/**
* Find the age
*
* @param string $birthday
*
* @return int
*/
function yas ($birthday)
{
    list($year,$month,$day) = explode("-",$birthday);
    $year_diff  = date("Y") - $year;
    $month_diff = date("m") - $month;
    $day_diff   = date("d") - $day;
    if ($day_diff < 0 || $month_diff < 0)
      $year_diff--;
    return $year_diff;
}
/**
* Returns the markup for comment
*
* @param array $row comment
*
* @return string
*/
function markup($row)
{
	$d = &$row;
	$lo = '';
	$lc = '';
	if($d['u'])
	{
		$lo = '<a rel="nofollow" target="_blank" href="'.$d['u'].'">';
		$lc =  '</a>';
	}
	$ts = new DateTime($d['dt']);
	return '
		<article>
			<header> 
				<p>'.$lo.$d['n'].$lc.'</p> 
				<time datetime="'.$ts->format(DATE_ISO8601).'">'.$ts->format('\G\ü\n\: Y-m-d \S\a\a\t\: H:i').'</time><br/> 
				<div class="avatarcnt"> 
					'.$lo.'
					<img src="'.gravatar($d['m'],70).'" alt='.$d['n'].' />
					'.$lc.'
				</div> 
			</header>
			<p>'.$d['b'].'</p> 
		</article>
	';
}

