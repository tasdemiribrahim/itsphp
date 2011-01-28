<?php
define('BASE_PATH', realpath(dirname(__FILE__) . '/../'));
define('APPLICATION_PATH', BASE_PATH . '/application'));
define('TEST_PATH', BASE_PATH . '/../tests');
define('APPLICATION_ENV', 'testing');

set_include_path(implode(PATH_SEPARATOR, array(realpath(APPLICATION_PATH . '/../../library'),realpath(APPLICATION_PATH . '/../../'),get_include_path())));

date_default_timezone_set('Europe/Istanbul');

require_once 'controllers/ControllerTestCase.php';
