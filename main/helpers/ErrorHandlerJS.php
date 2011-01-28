<?php
$errMesaj="HataVeren:".$_GET['parent']."-:-URL:".$_GET['url']."-:-Satir:".$_GET['line']."-:-Tarayici:".$_GET['agent']."-:-Mesaj:".$_GET['msg'].PHP_EOL;
$fp = fopen($_SERVER['DOCUMENT_ROOT']."/error/hataJS.log", "a+");
flock($fp, LOCK_EX);
while(!feof($fp))
{
	$satir=fgets($fp);
	if(strpos($satir, $errMesaj) !== false)
	{
		flock($fp, LOCK_UN);
		fclose($fp);
		exit;
	}
}
fwrite($fp,$errMesaj);
flock($fp, LOCK_UN);
fclose($fp);
