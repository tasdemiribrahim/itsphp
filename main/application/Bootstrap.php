<?php
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
	protected function _initPlaceholder()
	{
		$this->bootstrap('View');
		$view = $this->getResource('View');
		$view->placeholder('sidebar')->setPrefix("")->setSeparator("<br />")->setPostfix("");
	}	

	protected function _initSession()
	{	
		//Zend_Session::setSaveHandler(new main_application_helpers_Session_SaveHandler_Encrypted()); 
	}


	/*

	protected function _initTranslate()
	{
		$tr = new Zend_Translate('array', 'lang', null, array('scan' => Zend_Translate::LOCALE_FILENAME));
		$registry = Zend_Registry::getInstance();
		$registry->set('translate', $tr);
		return $tr;
	}
*/
}
