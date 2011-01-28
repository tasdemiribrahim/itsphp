<?php
class Zend_View_Helper_Git extends Zend_View_Helper_Abstract
{
	public function git()
	{
		$data = json_decode(file_get_contents('http://github.com/api/v2/json/issues/list/tasdemiribrahim/itsphp/open'));
		if(count($data["issues"]))
		{
			$mesaj="<details open>
				<summary class='st_l ui-widget ui-widget-header'>Hatalar</summary>";
			foreach($data["issues"] as $issue)
				$mesaj.="<article><p>".$issue["title"]."</p><p><time>".$issue["created_at"]."</time><p>".$issue["body"]."</p></article>";
			return $mesaj."</details>";
		}
	}
}

