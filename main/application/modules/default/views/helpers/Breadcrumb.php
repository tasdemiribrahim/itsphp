<?php
class Zend_View_Helper_Breadcrumb extends Zend_View_Helper_Abstract
{
	public function breadcrumb()
	{
		$a=explode("/",$this->view->url);
		$href=getSiteName()."main";
		$mesaj="<ul class='breadcrumb ieden sakla'><li><a href='".getSiteName()."main'>Main</a></li>";
		foreach($a as $b)
		{
			$href.="/".$b;
			$mesaj.='<li><a href="'.$href.'">'.ucfirst($b).'</a></li>';
		}
		return $mesaj.$this->view->bread."</ul>";
	}
}

