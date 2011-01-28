<?php
class main_helper_Navigation extends Zend_Controller_Action_Helper_Abstract
{
	protected $_container;
	public function __construct(Zend_Navigation $container = null)
	{
		if (null !== $container) 
			$this->_container = $container;
	}
	public function preDispatch()
	{
		$this->getContainer()->findBy('uri', $this->getRequest()->getRequestUri())->active = true;
	}
	public function getContainer()
	{
		if (null === $this->_container) 
			$this->_container = Zend_Registry::get('Zend_Navigation');
		if (null === $this->_container) 
			throw new RuntimeException ('Navigation container unavailable');
		return $this->_container;
	}
}
