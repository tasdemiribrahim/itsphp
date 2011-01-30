<?php
class main_helpers_Auth_Adapter_Doctrine implements Zend_Auth_Adapter_Interface
{
	protected $_resultArray;
	public function __construct($username, $password,$secret)
	{
		$this->username = $username;
		$this->password = hash_hmac('ripemd160',$password,$secret);
	}
	
	public function authenticate()
	{
		$q = Doctrine_Query::create()->from('main_models_Kul')->where("sifre='".$this->password."'");
		$result = $q->fetchArray();
		if(count($result) == 1 && $result[0]['ad']== $this->username)
			return new Zend_Auth_Result(Zend_Auth_Result::SUCCESS, $this->username, array());
		else 
			return new Zend_Auth_Result(Zend_Auth_Result::FAILURE, null,array('Authentication unsuccessful'));
	}
	
	public function getResultArray($excludeFields = null)
	{
		if (!$this->_resultArray) 
			return false;
		if ($excludeFields != null) 
		{
			$excludeFields = (array)$excludeFields;
			foreach ($this->_resultArray as $key => $value) 
				if (!in_array($key, $excludeFields)) 
					$returnArray[$key] = $value;
			return $returnArray;
		} 
		else 
			return $this->_resultArray;
	}
}
