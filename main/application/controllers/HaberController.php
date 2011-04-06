<?php
class HaberController extends Zend_Controller_Action
{
	public function adsenseAction()
	{		
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);
		$username="tasdemiribrahimbm@gmail.com"; 
		$password="elendil6883";
		$daterange = 20 ; 
		$cookie=".cookiefile";

		$daysbefore = mktime(0, 0, 0, date("m") , date("d") - $daterange, date("Y"));
		list ($d_from,$m_from,$y_from) = split(':',date("j:n:Y", $daysbefore));
		list ($d_to,$m_to,$y_to) = split(':',date("j:n:Y"));

		$destination="/adsense/report/aggregate?"
			."sortColumn=0"
			."&reverseSort=false"
			."&outputFormat=TSV_EXCEL"
			."&product=afc"
			."&dateRange.simpleDate=today"
			."&dateRange.dateRangeType=custom"
			."&dateRange.customDate.start.day=$d_from"
			."&dateRange.customDate.start.month=$m_from"
			."&dateRange.customDate.start.year=$y_from"
			."&dateRange.customDate.end.day=$d_to"
			."&dateRange.customDate.end.month=$m_to"
			."&dateRange.customDate.end.year=$y_to"
			."&unitPref=page"
			."&reportType=property"
			."&searchField="
			."&groupByPref=date";

		$postdata="destination=".urlencode($destination)."&username=".urlencode($username)."&password=".urlencode($password)."&null=Login";

		$ch = curl_init(); 
		curl_setopt ($ch, CURLOPT_URL,"https://www.google.com/adsense/login.do"); 
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, FALSE); 
		curl_setopt ($ch, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)"); 
		curl_setopt ($ch, CURLOPT_TIMEOUT, 20); 
		curl_setopt ($ch, CURLOPT_FOLLOWLOCATION,1); 
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1); 
		curl_setopt ($ch, CURLOPT_COOKIEJAR, $cookie); 
		curl_setopt ($ch, CURLOPT_COOKIEFILE, $cookie); 
		curl_setopt ($ch, CURLOPT_POSTFIELDS, $postdata); 
		curl_setopt ($ch, CURLOPT_POST, 1); 
		$result = curl_exec ($ch); 
		curl_close($ch); 

		$result=preg_split("/\n/",$result);
		array_pop($result);
		array_pop($result);
		array_shift($result);
		$result = array_reverse($result);

		$xml= '<?xml version="1.0" encoding="UTF-8" ?>';
		$xml.= '\n
		<rss version="2.0" 
			xmlns:content="http://purl.org/rss/1.0/modules/content/"
			xmlns:wfw="http://wellformedweb.org/CommentAPI/"
			xmlns:dc="http://purl.org/dc/elements/1.1/"
		>
		<channel>
			<title><?php echo "$daterange günlük Adsense kazancı"; ?></title>
			<link>https://www.google.com/adsense/</link>
			<description>An RSS feed of my Adsense earnings for the last <?php echo $daterange ?> days</description>
			<language>en</language>';
			
		$firstday=1;
		foreach ($result as $line) 
		{
			$item = array();
			$line = str_replace("\x00",'',$line);
			$line = str_replace('"','',$line);
			list($day, $pages, $clicks, $ctr, $eCPM, $income) = preg_split("/\s/",$line);
			$item['title']= "<title>$day günde \$$income</title>";
			$item['guid'] = '<guid isPermaLink="false">' . md5($username.$day) . "</guid>";
			$day = split('-',$day);
			$day = mktime(0, 0, 0, $day[1] , $day[0], $day[2]);
			if ($firstday == 1) 
			{
				$day = date("D, d M Y H:i:s +0000");
				$firstday = 0;
			} 
			else 
				$day = date("D, d M Y H:i:s +0000", $day);
			$item['pubDate'] = "<pubDate>$day</pubDate>";
			$item['category'] = "<category>adsense</category>";
			$item['description'] = "<description>\$$income ($clicks clicks on $pages pages : CTR = $ctr - eCPM = $eCPM)</description>";
			$item['content'] = "<content:encoded><![CDATA[
			<table>
			<tr><td>Sayfa</td><td>Tıklar</td><td>CTR</td><td>eCPM</td><td>Kazanım</td></tr>
			<tr><td>$pages</td><td>$clicks</td><td>$ctr</td><td>$eCPM</td><td>$income</td></tr>
			</table>
			]]></content:encoded>";
			
			$xml.= "<item>\n".$item['title'] ."\n".$item['guid'] ."\n".$item['pubDate'] ."\n".$item['category'] ."\n".$item['description'] ."\n". $item['content'] ."\n</item>\n";
		}
		echo $xml."</channel></rss>";
	}
}
