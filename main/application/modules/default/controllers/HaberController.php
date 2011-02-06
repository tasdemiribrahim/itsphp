<?php
class HaberController extends Zend_Controller_Action
{
	public function init()
	{
		$this->_helper->layout->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);
	}

	public function muzikAction()
	{
		//if($_SERVER['HTTP_USER_AGENT']!="FeedBurner")
		//	$this->_redirect("http://feeds.feedburner.com/muzik-itsphp");
		$q = Doctrine_Query::create()->from('main_models_Dmr r')->orderby("r.id DESC");
		$result = $q->fetchArray();
		$q->free();
		echo "<?xml version='1.0' encoding='UTF-8' ?>
				<rss version='2.0'>
					<channel>
						<title>Müzik - ITSPHP</title>
						<link>".getSiteName()."dinle/metal</link>
						<pubDate>2010-08-29 00:00:00</pubDate>
						<description>04b80b244e4f45f68117eedf59ff3be1</description>
						<language>tr-TR</language>";
		foreach ($result as $r) 
			echo "\n<item><title>".$r['title']."</title><link>".$r['link']."</link><pubDate>".$r['date']."</pubDate><description><![CDATA[".$r['description']."]]></description></item>";
		echo "</channel></rss>";
	}

	public function aileAction()
	{		
		//if($_SERVER['HTTP_USER_AGENT']!="FeedBurner")
		//	$this->_redirect("http://feeds.feedburner.com/aile-itsphp");
		$q = Doctrine_Query::create()->from('main_models_Aar r')->orderby("r.id DESC");
		$result = $q->fetchArray();
		$q->free();
		echo "<?xml version='1.0' encoding='UTF-8' ?>
				<rss version='2.0'>
					<channel>
						<title>Aile - ITSPHP</title>
						<link>".getSiteName()."main/aile</link>
						<pubDate>2010-08-29 00:00:00</pubDate>
						<description>İbrahim Taşdemir'in Kişisel Ana Sayfası</description>
						<language>tr-TR</language>
						<image>
							<title />
							<url />
							<link />
							<width />
							<height />
						</image>";
		foreach ($result as $r) 
			echo "\n<item><title>".$r['title']."</title><link>".$r['link']."</link><pubDate>".$r['date']."</pubDate><description>".$r['description']."</description></item>";
		echo "\n</channel></rss>";
	}

	public function aatomAction()
	{
		$feed = new Zend_Feed_Writer_Feed;
		$feed->setTitle('Aile - ITSPHP(Atom)');
		$feed->setLink(getSiteName());
		$feed->setFeedLink(getSiteName().'haber/aile/atom', 'atom');
		$feed->addAuthor(array(
		    'name'  => 'İbrahim Taşdemir',
		    'email' => 'tasdemiribrahim@mynet.com',
		    'uri'   => getSiteName()
		));
		$feed->setDateModified(time());
		//$feed->addHub('http://pubsubhubbub.appspot.com/');

		$q = Doctrine_Query::create()->from('main_models_Aar r')->orderby("r.id DESC");
		$result = $q->fetchArray();
		foreach ($result as $r) 
		{
			$entry = $feed->createEntry();
			$entry->setTitle($r['title']);
			$entry->setLink(getSiteName()."main/aile");
			$entry->addAuthor(array(
			    'name'  => 'İbrahim Taşdemir',
			    'email' => 'tasdemiribrahim@mynet.com',
			    'uri'   => getSiteName()
			));
			$entry->setDateModified(strtotime($r['date']));
			$entry->setDateCreated(strtotime($r['date']));
			$entry->setDescription($r['description']);
			$entry->setContent($r['description']);
			$feed->addEntry($entry);
		}
		echo $feed->export('atom');
	}

	public function matomAction()
	{

		$feed = new Zend_Feed_Writer_Feed;
		$feed->setTitle('Müzik - ITSPHP(Atom)');
		$feed->setLink(getSiteName());
		$feed->setFeedLink(getSiteName().'haber/muzik/atom', 'atom');
		$feed->addAuthor(array(
		    'name'  => 'İbrahim Taşdemir',
		    'email' => 'tasdemiribrahim@mynet.com',
		    'uri'   => getSiteName()
		));
		$feed->setDateModified(time());

		$q = Doctrine_Query::create()->from('main_models_Dmr r')->orderby("r.id DESC");
		$result = $q->fetchArray();
		foreach ($result as $r) 
		{
			$entry = $feed->createEntry();
			$entry->setTitle($r['title']);
			$entry->setLink(getSiteName()."main/dinle/metal");
			$entry->addAuthor(array(
			    'name'  => 'İbrahim Taşdemir',
			    'email' => 'tasdemiribrahim@mynet.com',
			    'uri'   => getSiteName()
			));
			$entry->setDateModified(strtotime($r['date']));
			$entry->setDateCreated(strtotime($r['date']));
			$entry->setDescription($r['description']);
			$entry->setContent($r['description']);
			$feed->addEntry($entry);
		}
		echo $feed->export('atom');
	}

	public function katomAction()
	{
		$feed = new Zend_Feed_Writer_Feed;
		$feed->setTitle('Kitap - ITSPHP(Atom)');
		$feed->setLink(getSiteName());
		$feed->setFeedLink(getSiteName().'haber/kitap/atom', 'atom');
		$feed->addAuthor(array(
		    'name'  => 'İbrahim Taşdemir',
		    'email' => 'tasdemiribrahim@mynet.com',
		    'uri'   => getSiteName()
		));
		$feed->setDateModified(time());

		$xml = new SimpleXMLElement(file_get_contents("../feed/kitap.xml"));
		foreach ($xml->channel->item as $r) 
		{
			$entry = $feed->createEntry();
			$entry->setTitle((string)$r->title);
			$entry->setLink((string)$r->link);
			$entry->addAuthor(array(
			    'name'  => 'İbrahim Taşdemir',
			    'email' => 'tasdemiribrahim@mynet.com',
			    'uri'   => getSiteName()
			));
			$entry->setDateModified(strtotime((string)$r->pubdate));
			$entry->setDateCreated(strtotime((string)$r->{'pubdate'}));
			$entry->setDescription((string)$r->description);
			$entry->setContent((string)$r->description);
			$feed->addEntry($entry);
		}
		echo $feed->export('atom');
	}
	
	public function adsenseAction()
	{		
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
