<?php
class Zend_View_Helper_Breadcrumb extends Zend_View_Helper_Abstract
{
	public function breadcrumb()
	{
		$a=explode("/",$this->view->url());
		$href=SITE;
		$mesaj="<ul class='brec ieden sakla'>";
		foreach($a as $b)
		{
			if($b=="index" || empty($b)) continue;
			$c=explode("&",urldecode($b));
			$i=0;
			foreach($c as $d)
			{
				if(++$i==1)
					$href.="/".urlencode($d);
				else
					$href.="&".urlencode($d);
				$mesaj.='<li><a href="'.$href.'">'.ucfirst($d).'</a></li>';
			}
		}
		return $mesaj."</ul>";
	}
}

