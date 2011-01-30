<?php
class Zend_View_Helper_Appreciate extends Zend_View_Helper_Abstract
{
	public function appreciate()
	{
		$hash = md5(temizURL(urlencode(getSiteName()."main/".$this->view->url)));
		$ip = sprintf('%u',ip2long($_SERVER['REMOTE_ADDR']));
		$ap = 0;
		$voted = "active";
		$q = Doctrine_Query::create()->select("id,ap")->from('main_models_Appages a')->where('a.hash = ?', $hash);
		$result = $q->fetchOne();
		if($result)
		{
			$q = Doctrine_Query::create()->select("a.ip")->from('main_models_Apvotes a')->where('a.ip = '. $ip)->addwhere('a.pageid = '. $result['id']);
			if($q->fetchOne())
				$voted = "ina";
			$ap=$result['ap'];
		}
		return '<details open>
				<summary class="st_l ui-widget ui-widget-header"><span class="dc ui-icon ui-icon-closethick">X</span><span id="aprec">'.$ap.'</span> Kişi Beğendi</summary><br /><div id="apreb" class="'.$voted.' tour_2">Sayfayı Beğendim</div><br /></details>';
	}
}

