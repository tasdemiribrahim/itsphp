<?php
class ErrorController extends Zend_Controller_Action
{
    public function errorAction()
    {
	$this->_helper->layout->setLayout('admin');
        $errors = $this->_getParam('error_handler');
        switch ($errors->type) { 
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ROUTE:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:
                $this->getResponse()->setHttpResponseCode(404);
                $this->view->title = 'Sayfa Bulunamadı';
                $this->view->errCode = '404';
                break;
            default:
                $this->getResponse()->setHttpResponseCode(500);
                $this->view->title = 'Programlama Hatası';
                $this->view->errCode = '500';
                break;
        }
	$this->view->script="error";
        $this->view->exception = $errors->exception;
        $this->view->request   = $errors->request;
		
	$logger = new Zend_Log();
	$config = $this->getInvokeArg('bootstrap')->getOption('logs');
	$writer = new Zend_Log_Writer_Stream($config['logPath'] . '/hataEx.log');
	$logger->addWriter($writer);
	$format = '%timestamp%: %priorityName%: %message%: %request%: %stacktrace%' . PHP_EOL;
	$formatter = new Zend_Log_Formatter_Simple($format);
	$writer->setFormatter($formatter);
	/*
	$columnMap = array(
	'message' => 'LogMessage',
	'priorityName' => 'LogLevel',
	'timestamp' => 'LogTime',
	'stacktrace' => 'Stack',
	'request' => 'Request',
	);
	$dbWriter = new main_Helpers_Log_Writer_Doctrine('main_Models_Log', $columnMap);
	$logger->addWriter($dbWriter);
	*/
	$fbWriter = new Zend_Log_Writer_Firebug();
	$logger->addWriter($fbWriter);
	$logger->setEventItem('stacktrace',$errors->exception->getTraceAsString());
	$logger->setEventItem('request',Zend_Debug::dump($errors->request->getParams()));

	$logger->log($errors->exception->getMessage(), Zend_Log::ERR);
    }
}
