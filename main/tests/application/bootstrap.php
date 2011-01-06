<?php
header("Content-Type: text/html; charset=ISO-8859-9"); 

define('BASE_PATH', realpath(dirname(__FILE__) . '/../../'));
defined('APPLICATION_PATH')  || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));
set_include_path(implode(PATH_SEPARATOR, array(realpath(APPLICATION_PATH . '/../../library'),realpath(APPLICATION_PATH . '/../../'),get_include_path())));

define('APPLICATION_ENV', 'testing');

require_once 'controllers/ControllerTestCase.php';
