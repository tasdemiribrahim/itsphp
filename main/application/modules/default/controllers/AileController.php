<?php
class AileController extends Zend_Controller_Action
{  
	public function preDispatch()
	{
	/*	$session = $this->getInvokeArg('bootstrap')->getResource('session');
		if(empty($session->id) || empty($session->ad))
		{
			$session->requestURL = $this->getRequest()->getRequestUri();
			$this->_redirect('/login');
		}
		$aa = Doctrine::getTable('main_models_Aa')->find($session->id);
		$result =$aa->toArray();
		if($session->ad != $result["ad"])
		{
			$session->requestURL = $this->getRequest()->getRequestUri();
			$this->_redirect('/login');
		}*/
		$this->view->isAile = true;
	}
	
	public function indexAction()
	{
		$this->view->script = "aile";
		$this->view->title = "Aile";
		$this->view->h2 = "Aile";
		$this->view->url = "aile";
		$this->view->aileListe=$this->_helper->cache("aile","main_models_Aa"); 
		if(isset($_GET['id']))
			$q = Doctrine_Query::create()->from('main_models_Aa a')->leftJoin("a.Detay")->leftJoin("a.Yorumlar")->where(' a.id=?',temizSayi($_GET['id']));
		else
			$q = Doctrine_Query::create()->from('main_models_Aa a')->leftJoin("a.Detay")->leftJoin("a.Yorumlar")->orderBy(' a.id DESC')->limit(1);
		$aile = $q->fetchOne();
		$this->view->birey=$aile;
		$this->view->yTotal=count($aile['Yorumlar']);
		foreach($aile['Yorumlar'] as $row)
			$this->view->yorumlar.= markup($row);
		
		$client=Zend_Registry::get('client');
		$view = $client->group(true)->getView('itsphp','evliBekar');
		$this->view->bekar=$view->rows[0]->value;
		$this->view->evli=$view->rows[1]->value;
		$view = $client->limit(1000)->getView('itsphp','canli');
		$this->view->canli=$view->total_rows;
		$view = $client->descending(true)->group(true)->getView('itsphp','wordCount');
		foreach($view->rows as $row)
			$this->view->tag.="<span style='font-size:".($row->value+10)."px'>".$row->key."</span> ";
	}
	
	public function agacAction()
	{
		$this->view->script = "aile_agac";
		$this->view->title = "Aile Ağacı";
		$this->view->url = "aile/agac";
		$this->view->h2 = "Aile Ağacı";
		$this->view->aileListe=$this->_helper->cache("aile","main_models_Aa"); 
		$q = Doctrine_Query::create()->from('main_models_Aa a')->leftJoin("a.Detay");
		$result = $q->execute();
		$this->view->aile = $result->toArray();
		$q->free();
	}
	
	public function resimAction()
	{
		$this->view->script = "aile_resim";
		$this->view->title = "Aile Resim";
		$this->view->url = "aile/resim";
		$this->view->h2 = "Aile Resimleri";
	}
	
	public function videoAction()
	{
		$this->view->script = "aile_video";
		$this->view->title = "Aile Video";
		$this->view->url = "aile/video";
		$this->view->h2 = "Aile Görüntüleri";
	}
	
	public function haritaAction()
	{
		$this->view->script = "aile_harita";
		$this->view->title = "Aile Harita";
		$this->view->url = "aile/harita";
		$this->view->h2 = "Aile Harita";
		$q = Doctrine_Query::create()->select("a.id,a.ad,d.adres")->from('main_models_Aa a')->leftJoin("a.Detay d")->where("d.adres IS NOT NULL")->addwhere("d.adres <> ''");
		$this->view->adres = $q->fetchArray();
	}
	
	public function formAction()
	{
		$this->view->script = "aile_form";
		$this->view->url = "aile/form";
		$this->view->aileListe=$this->_helper->cache("aile","main_models_Aa"); 
		$this->view->h2 = "Yeni Aile Bireyi";
		if ($this->getRequest()->getParam('page')=="")  
			$this->view->title = "Aile Ağacı Birey Ekleme";
		elseif ($this->getRequest()->getParam('page')!="")  
		{
			$q = Doctrine_Query::create()->from('main_models_Aa a')->leftJoin("a.Ebeveyn")->leftJoin("a.Detay")->where("a.id=?",$this->getRequest()->getParam('page'));
			$result = $q->execute();
			$aile=$result->toArray();
			$q->free();
			if (count($aile) > 0) 
			{
				$this->view->title = "Aile Ağacı Birey Güncelleme - ".$aile[0]['ad'];
				$this->view->h2 = $aile[0]['ad'];
				$this->view->ad = $aile[0]['ad'];
				$this->view->bread='<li><a href="#">'.$aile[0]['ad'].'</a></li>';
				$this->view->ebeveynAd = array($aile[0]['Ebeveyn']);
				$this->view->aileBirey = $aile[0]['Detay'];
				$this->view->guncelle = $this->getRequest()->getParam('page');
			}
			else 
				throw new Zend_Controller_Action_Exception('Page not found', 404);
		}
	}
}
