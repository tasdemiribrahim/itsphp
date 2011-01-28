<?php
set_error_handler("hataYakalayici", E_ALL);
function hataYakalayici($errno, $errmsg, $filename, $linenum, $vars) 
{ 
       $errortype = array (
                E_ERROR              => 'Error',
                E_WARNING            => 'Warning',
                E_PARSE              => 'Parsing Error',
                E_NOTICE             => 'Notice',
                E_CORE_ERROR         => 'Core Error',
                E_CORE_WARNING       => 'Core Warning',
                E_COMPILE_ERROR      => 'Compile Error',
                E_COMPILE_WARNING    => 'Compile Warning',
                E_USER_ERROR         => 'User Error',
                E_USER_WARNING       => 'User Warning',
                E_USER_NOTICE        => 'User Notice',
                E_STRICT             => 'Runtime Notice',
				E_FATAL				 => 'Fatal Error',
                E_RECOVERABLE_ERROR  => 'Catchable Fatal Error'
                );
	
    $user_errors = array(E_USER_ERROR, E_USER_WARNING, E_USER_NOTICE);
	//if(strpos($filename,SCRIPT_PATH)!==0)									// Dis hatalar atlanir
	//	return;	
	$filename = basename($filename);
	$errMesaj="$errortype[$errno]:$filename:$linenum:$errmsg";
    if (in_array($errno, $user_errors))
        $errMesaj .= serialize($vars);
	$errMesaj .=PHP_EOL;
	
	$fp = fopen($_SERVER['DOCUMENT_ROOT']."/error/hata.log", "a+");
	flock($fp, LOCK_EX);
	while(!feof($fp))
	{
		$satir=fgets($fp);
		if(0 == strcmp($satir,$errMesaj))
		{
			flock($fp, LOCK_UN);
			fclose($fp);
			return;
		}
	}
	fwrite($fp,$errMesaj);
    flock($fp, LOCK_UN);
	fclose($fp);
}

//ob_start('olumculHataYakalayici');
function  olumculHataYakalayici($bufferContent)
{
	$output     = $bufferContent;
	$matches    = array();
	$errors     = "";
	$var=null;
	if ( preg_match('|<phphata>.*</phphata>|s', $output, &$matches) )
	{
		foreach ($matches as $match)
			$errors .= strip_tags($match) . "\n\n---\n\n";
		$var = hataYakalayici('efatal', 'Fatal Error', 'unknown', 'unknown', $errors);
		$filename = "/htdocs/error/Error.php?err=500";
		$handle = fopen($filename, "r");
		$contents = fread($handle, filesize($filename));
		fclose($handle);
		$output =  $contents;
	}
	return $var;
}
