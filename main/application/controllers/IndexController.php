<?php
class IndexController extends Zend_Controller_Action
{
	public function indexAction()
	{	
		$film=new main_application_helpers_Models_Film();
		$this->view->film=$film->getLast();
		$this->view->agac=new main_application_helpers_Models_Aile();
	}
	
	public function okuAction() { }    
	
	public function izleAction()
	{
		$film=new main_application_helpers_Models_Film();
		$p=urldecode($this->getRequest()->getParam('page'));
		$this->view->filmler = $film;
		if($p=='')
			$this->view->film=$film->getLast();
		else
		{
			if (isset($film[$p])) 
				$this->view->film=$film[$p];
			else 
				throw new Zend_Controller_Action_Exception('Film Bulunamadı!', 404);
		}
	}

	public function galeriAction()	{ $this->_helper->layout->setLayout('minimal'); }
	
	public function ajaxAction()
	{
		$this->_helper->layout()->disableLayout();
		$this->getHelper('viewRenderer')->setNoRender(true);
		header('Content-Type: application/json');

		$album = $_GET['album'];
		$imagesAr = array();
		if(file_exists($_SERVER['DOCUMENT_ROOT'].'/main/images/resimler/'.$album)) 
		{
			$files = array_slice(scandir($_SERVER['DOCUMENT_ROOT'].'/main/images/resimler/'.$album), 2);
			foreach($files as $file) 
		    		if($file != '.' && $file != '..') 
					$imagesArr[] = array('src' => '/main/images/resimler/'.$album.'/'.$file,'alt'=> '/main/images/resimler/'.$album.'/'.$file,'desc'=> "");
		}
		die(json_encode($imagesArr));

	}
}
