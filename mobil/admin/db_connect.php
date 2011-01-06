<?php
if ((isset($_SERVER["HTTPS"]) && strtolower($_SERVER["HTTPS"] == "on")) && preg_match("/MSIE/", $_SERVER["HTTP_USER_AGENT"])) 
	header('Pragma: cache');
else 
	header('Pragma: no-cache');
date_default_timezone_set('Europe/Istanbul');
ini_set('display_errors', 'On');
ini_set('session.bug_compat_warn',0);
ini_set('session.bug_compat_42',0);
define('E_FATAL', 'efatal');
ini_set('error_prepend_string', '<phphata>');
ini_set('error_append_string', '</phphata>');
define("TMDB_API_KEY","db8b0ee9039f1ccdbd1273773d7eb715");
//ob_start('olumculHataYakalayici');

function __autoload($className)
{
    $fileName = strtr($className,'_',DIRECTORY_SEPARATOR).".php";
    include $fileName;
    return;
}

register_shutdown_function('shutdown');
function shutdown()
{
/*
	echo "<br>Bellek Kullanimi:".memory_get_usage()." Byte<br>";
	if(in_array("ob_gzhandler",ob_list_handlers()))
	{
		echo "OB Tampon Buyuklugu:".ob_get_length()." Karakter<br>";
		ob_end_flush();
	}
	*/
	global $db;
	$db=null;
	unset($db);
}

$db = new PDO('mysql:host=sql307.0fees.net;dbname=fees0_6133083_itsphp', "fees0_6133083", "elendil") or trigger_error("Cannot connect to server");

include_once('Exception.php');
include_once('input.php');
if (count(get_included_files()) < 3) 
{
    header("HTTP/1.1 301 Moved Permanently");
	header("Location: index.php");
	exit;
}

function _open() 
{
	if(isset($GLOBALS["db"]))
		return true; 
	else
		return false;
}

function _close() 
{  
	$GLOBALS["db"]=null;
	return true;
}
 
function _read($id)
{
	$id = temizYazi($id); 
	$sth = $GLOBALS["db"]->prepare("SELECT data FROM sessions WHERE id = '$id'");
	if ($sth->execute())
	{
		$record = $sth->fetch(PDO::FETCH_ASSOC);
		return $record['data'];
	}
	return ''; 
}
 
function _write($id, $data) 
{
	$_sess_db = mysql_connect("sql307.0fees.net","fees0_6133083", "elendil" ) or trigger_error("Cannot connect to server");
	mysql_select_db("fees0_6133083_itsphp" );
	$access = time();
	$id = temizYazi($id);
	$access = temizYazi($access);
	$data = temizYazi($data);
	$sonucDeger = mysql_query("REPLACE INTO sessions VALUES ('$id', '$access', '$data')",$_sess_db);
	mysql_close($_sess_db);
	return $sonucDeger;
} 
function _destroy($id) 
{
	$id = temizYazi($id);
	return  $GLOBALS["db"]->exec("DELETE FROM sessions WHERE id = '$id'");
	//mysql_query("DELETE FROM sessions WHERE id = '$id'",$_sess_db); 
}
function _clean($max)
{
	$old = time() - $max;
	$old = temizYazi($old);
	return $GLOBALS["db"]->exec("DELETE FROM sessions WHERE access < '$old'");
	//mysql_query("DELETE FROM sessions WHERE access < '$old'",$_sess_db); 
} 
session_set_save_handler('_open','_close','_read','_write','_destroy','_clean'); 

$db->exec("SET NAMES 'utf8'");
$db->exec("SET CHARACTER SET utf8");
//@session_start();
