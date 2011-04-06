<?php
require_once('/main/application/helpers/API/Recaptcha.php');
class LoginController extends Zend_Controller_Action
{
	public function indexAction()
	{
		$this->_helper->layout->setLayout('minimal');
		$this->view->recaptcha = recaptcha_get_html(RECAPTCHA_PUBLIC_KEY,null); 
    	}
}

