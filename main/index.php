<?php
if ((isset($_SERVER["HTTPS"]) && strtolower($_SERVER["HTTPS"] == "on")) && preg_match("/MSIE/", $_SERVER["HTTP_USER_AGENT"])) 
	header('Pragma: cache');
else 
	header('Pragma: no-cache');
date_default_timezone_set('Europe/Istanbul');
ini_set('display_errors', 'On');
ini_set('session.bug_compat_warn',0);
ini_set('session.bug_compat_42',0);
ini_set('zend.enable_gc',1);
ini_set('error_prepend_string', '<phphata>');
ini_set('error_append_string', '</phphata>');
define('E_FATAL', 'efatal');

defined('APPLICATION_PATH')  || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/application'));
defined('APPLICATION_ENV')   || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

define("AKISMET_API_KEY","");
define("TMDB_API_KEY","");
define("RECAPTCHA_PUBLIC_KEY","");
define("RECAPTCHA_PRIVATE_KEY","");
define("TWITTER_CONSUMER_KEY","");
define("TWITTER_CONSUMER_SECRET","");
define("FLICKR_API_KEY","");
define("DIGG_API_KEY","");
define("DIGG_SECRET_KEY","");
define("BITLY_API_KEY","");
define("BITLY_LOGIN","");
define("DISQUS_PRIVATE_KEY","");
define("DISQUS_PUBLIC_KEY","");
define("AMAZON_KEY_ID","");
define("AMAZON_SECRET_KEY","");
define("FACEBOOK_APP_ID","");
define("FACEBOOK_APP_SECRET","");
define("GOOGLE_API_KEY","");
define("KULLANICI","");

set_include_path(implode(PATH_SEPARATOR, array(realpath(APPLICATION_PATH . '/../../library'),realpath(APPLICATION_PATH . '/../../'),get_include_path())));

require_once 'Zend/Application.php';  
require_once 'main/Helpers/input.php';  
require_once 'main/Helpers/ErrorHandler.php'; 

/*
	include_once 'Doctrine/Doctrine.php';
	spl_autoload_register(array('Doctrine', 'autoload'));
	Doctrine_Core::compile('Doctrine.compiled.php', array('mysql'));
	// create Doctrine manager
	$manager = Doctrine_Manager::getInstance();
	// create database connection
	$conn = Doctrine_Manager::connection('mysql://user:pass@url/db', 'doctrine');
	// auto-generate models
	Doctrine::generateModelsFromDb('./tmp/models',array('doctrine'),array('classPrefix' => 'main_Models_'));
*/
$application = new Zend_Application( APPLICATION_ENV, APPLICATION_PATH . '/application.ini');

$application->bootstrap()->run();
