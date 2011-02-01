<?php
class ErrorController extends Zend_Controller_Action
{
    public function errorAction()
    {
	$this->_helper->layout->setLayout('minimal');
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
	$writer = new Zend_Log_Writer_Stream($config['logPath'] . $config['logFile']);
	$logger->addWriter($writer);
	$writer->setFormatter(new Zend_Log_Formatter_Simple($config['format'] . PHP_EOL));
	//$logger->addWriter(new main_helpers_Log_Writer_Doctrine($config['column']['table'], $config['column']['map']));
	$logger->addWriter(new Zend_Log_Writer_Firebug());
	$logger->setEventItem('stacktrace',$errors->exception->getTraceAsString());
	$logger->setEventItem('request',Zend_Debug::dump($errors->request->getParams()));

	$logger->log($errors->exception->getMessage(), Zend_Log::ERR);
    }
}
