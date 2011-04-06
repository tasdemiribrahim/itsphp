<?php
class AileController extends Zend_Controller_Action
{  	
	public function indexAction()
	{
		$page=$this->getRequest()->getParam('page');
		$agac=new main_application_helpers_Models_Aile();
		if($page=="")
		{
			$this->view->adres=$agac->adres();
			$this->view->atalar=$agac->getResult();
		}
		elseif(isset($agac->$page))
		{
			$sonuc=array();
			if(isset($_FILE["birey_img"]) && move_uploaded_file($_FILE["birey_img"]['tmp_name'], APPLICATION_PATH . "/../images/resimler/aile/".basename($_FILE["birey_img"]['name'])))
				$sonuc["resim"]="/main/images/resimler/aile/".basename($_FILE["birey_img"]['name']);
			if(isset($_POST["birey_twitter"]))
				$sonuc["twitter"]=$_POST["birey_twitter"];
			if(isset($_POST["birey_flickr"]))
				$sonuc["flickr"]=$_POST["birey_flickr"];
			if(isset($_POST["birey_adres"]))
				$sonuc["adres"]=$_POST["birey_adres"];
			if(isset($_POST["cocuk_ad"]) && !empty($_POST["cocuk_ad"]))
			{
				if(!isset($agac->{$page.'&'.urlencode($_POST["cocuk_ad"])}))
				{
					$sonuc=array("ad"=>$_POST["cocuk_ad"]);
					if(empty($sonuc["resim"]))
						$sonuc["resim"]="/main/images/blankImage.jpg";
					$agac->$page=$sonuc;
				}
			}
			elseif(isset($_POST["guncelle"]))
				$agac->update($page,$sonuc);
			$this->view->page=$page;
			$this->view->birey=$agac->$page;
		}
		else
			throw new Zend_Controller_Action_Exception('Birey Bulunamadı!', 404);
	}
}
