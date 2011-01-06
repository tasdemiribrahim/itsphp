<?php
class main_Helpers_Log_Writer_Doctrine extends Zend_Log_Writer_Abstract
{
	public function __construct($modelName, $columnMap)
	{
		$this->_modelName = $modelName;
		$this->_columnMap = $columnMap;
	}
	
	public function setFormatter($formatter)
	{
		require_once 'Zend/Log/Exception.php';
		throw new Zend_Log_Exception(get_class() . ' does not support formatting');
	}
	
	protected function _write($message)
	{
		$data = array();
		foreach ($this->_columnMap as $messageField => $modelField) 
			$data[$modelField] = $message[$messageField];
		$model = new $this->_modelName();
		$model->fromArray($data);
		$model->save();
	}
	
	static public function factory($config)
	{
		return new self(self::_parseConfig($config));
	}
}