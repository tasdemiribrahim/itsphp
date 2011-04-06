<?php
class ErrorController extends Zend_Controller_Action
{
    public function errorAction()
    {
        $errors = $this->_getParam('error_handler');
	$this->_helper->layout->setLayout('minimal');
        switch ($errors->type) 
	{ 
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ROUTE:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:
                $this->getResponse()->setHttpResponseCode(404);
                $this->view->errCode = '404';
                break;
            default:
                $this->getResponse()->setHttpResponseCode(500);
                $this->view->errCode = '500';
                break;
        }
        $this->view->exception = $errors->exception;
        $this->view->request   = $errors->request;
		
	$logger = new Zend_Log();
	$writer = new Zend_Log_Writer_Stream(APPLICATION_PATH ."/../../error/hata.log");
	$writer->setFormatter(new Zend_Log_Formatter_Simple("%timestamp%: %priorityName%: %message%: %request%: %stacktrace%" . PHP_EOL));
	$logger->addWriter($writer);
	$logger->addWriter(new Zend_Log_Writer_Firebug());
	$logger->setEventItem('stacktrace',$errors->exception->getTraceAsString());
	$logger->setEventItem('request',Zend_Debug::dump($errors->request->getParams()));
	$logger->registerErrorHandler();
	$logger->log($errors->exception->getMessage(), Zend_Log::ERR);
    }
}
