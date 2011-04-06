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

define("TMDB_API_KEY","db8b0ee9039f1ccdbd1273773d7eb715");
define("RECAPTCHA_PUBLIC_KEY","6Ld4DLwSAAAAAN3p_FXEweCxvToqsggyWe6A74gf");
define("RECAPTCHA_PRIVATE_KEY","6Ld4DLwSAAAAAAmdv5dmJ2WtfK0GPWJZN8g_oo_C");
define("FLICKR_API_KEY","5695b987ebb20ad52a6a6b52d9b32b1f");
define("DISQUS_PRIVATE_KEY","NegUgyDRfJIlNFKy93cGQ8EexnTCH7wXh6IvQOJbWR0ANpeLMwAmtQlmo2X9DhMT");
define("DISQUS_PUBLIC_KEY","IIf8Qzb9dxZavVFYKJkKfgTJg2uvB7wvT181oqA9E4EzU1wFEtDAMSnyEUF3Sexq");
define("AMAZON_KEY_ID","AKIAJ2I2OVJXLDYQEWNQ");
define("AMAZON_SECRET_KEY","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");
define("GOOGLE_API_KEY","AIzaSyBgB4KDdJYgNmoStuxfvwV2mgipqGG8PYs");
define("KULLANICI","tasdemiribrahim");
define("SITE","http://tasdemir.0fees.net");

define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/application'));
define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

set_include_path(implode(PATH_SEPARATOR, array(realpath(APPLICATION_PATH . '/../../library'),realpath(APPLICATION_PATH . '/../../'),get_include_path())));

require_once 'Zend/Application.php';  

$application = new Zend_Application( APPLICATION_ENV, APPLICATION_PATH . '/application.ini');
$application->bootstrap()->run();
