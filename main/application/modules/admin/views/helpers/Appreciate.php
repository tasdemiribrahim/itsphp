<?php
class Zend_View_Helper_Appreciate extends Zend_View_Helper_Abstract
{
	public function appreciate()
	{
		$hash = md5(temizURL(urlencode(getSiteName()."main/".$this->view->url)));
		$ip = sprintf('%u',ip2long($_SERVER['REMOTE_ADDR']));
		$appreciated = 0;
		$voted = "active";
		$q = Doctrine_Query::create()->select("id,appreciated")->from('main_Models_AppreciatePages a')->where('a.hash = ?', $hash);
		$result = $q->fetchOne();
		if($result)
		{
			$q = Doctrine_Query::create()->select("a.ip")->from('main_Models_AppreciateVotes a')->where('a.ip = '. $ip)->addwhere('a.pageid = '. $result['id']);
			if($q->fetchOne())
				$voted = "inactive";
			$appreciated=$result['appreciated'];
		}
		return '<details open>
				<summary class="sidetit_l ui-widget ui-widget-header"><span class="details-close ui-icon ui-icon-closethick">X</span><span id="appreciateCount">'.$appreciated.'</span> Kişi Beğendi</summary><br /><a href="#" id="appreciateBadge" class="'.$voted.' tour_2">Sayfayı Beğendim</a><br /></details>';
	}
}

