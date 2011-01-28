<?php
class Zend_View_Helper_Lastfm extends Zend_View_Helper_Abstract
{
	public function lastfm()
	{
		if(file_exists('File/XSPF.php') && file_exists('XML/RSS.php'))
		{
			require_once ('File/XSPF.php');
			require_once ('XML/RSS.php');
			$songsArray = array();
			$xspfObj = new File_XSPF();
			$xspfObj->parseFile('http://ws.audioscrobbler.com/1.0/user/'.KULLANICI.'/toptracks.xspf');
			$topTracks = $xspfObj->getTracks();
			$rss = new XML_RSS('http://ws.audioscrobbler.com/1.0/user/'.KULLANICI.'/recenttracks.rss');
			$rss->parse(); 
			$recentTracks = $rss->getItems();
			foreach ($topTracks as $trackObj) 
				$songsArray[] =	$trackObj->getCreator() . " - " . $trackObj->getTitle();
			foreach ($recentTracks as $tracksArray) 
			{
				$tempSong =htmlentities($tracksArray['title'], ENT_COMPAT, 'UTF-8');
				$songsArray[] = str_replace('&ndash;', "-", $tempSong);
			}
			return "<details open>
				<summary class='ui-widget ui-widget-header'><span class='dc ui-icon-closethick'>x</span>Dinlendi</summary>
				<ul>
					<li>".implode('</li><li>',array_slice(sort(array_unique($songsArray)), 0, 10))."</li>
				</ul>
			</details>";
		}
		return "";
	}
}

