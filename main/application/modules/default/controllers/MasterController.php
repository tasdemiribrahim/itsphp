<?php
abstract class MasterController extends Zend_Controller_Action
{
	public function __call( $method, $args )
	{
		if('Action' == substr($method, -6)) 
			$this->_forward('index');
	}

	public function init()
	{
		$signed_request = $this->_getParam('signed_request', null);
		if(!empty($signed_request))
		{
			$this->_helper->facebook($signed_request);
			$FB = new Application_Model_Facebook($signed_request);
			if (!$FB->hasInstalled)
			{
				$this->view->redirect_url = FACEBOOK_ALLOW_URL.'?client_id='.FACEBOOK_APP_ID.'&redirect_uri='.$_SERVER['HTTP_REFERER'];
				$this->_helper->viewRenderer->setScriptAction('redirect');
			}
			$this->view->fbid = $FB->fbData['user_id'];
		}

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
	}
}
