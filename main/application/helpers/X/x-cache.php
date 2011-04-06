<?php
$cacheConfig = Array();
define('HTML_CACHE',false);
$cacheConfig['cachepage'] = true;
$cacheConfig['timeout'] = 10800; // 3 hours
$cacheConfig['page'] = md5("http://".$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']);
$cacheConfig['savepage'] = false;
$cacheConfig['cachepage'] = false;
$datauri_supported=true;
function cacheEnabled() 
{
    if (!defined('HTML_CACHE') || (defined('HTML_CACHE') && HTML_CACHE != true)) return false;
    else return true;
}
 
function init_caching() 
{
	global $datauri_supported,$cacheConfig;
	if(function_exists("xcache_isset"))
	{
		if (!cacheEnabled()) 
			return;
		if ($cacheConfig['cachepage'] == true) 
			startHTMLCache();
	}
	elseif($datauri_supported = preg_match("/(Opera|Gecko|MSIE 8)/", $_SERVER['HTTP_USER_AGENT'])) 
		ob_start();
}
	 
function finish_caching() 
{
	global $datauri_supported,$cacheConfig;
	if(function_exists("xcache_isset"))
	{
		if (!cacheEnabled())
			return;
		if ($cacheConfig['savepage'] == true) 
			endHTMLCache();
	}
	elseif($datauri_supported)
	{
		$sanitizedhtml = sanitize_html(ob_get_contents());
		ob_end_clean();
		echo $sanitizedhtml;
	}
}
	 
function endHTMLCache() 
{
	global $cacheConfig;
	$content = sanitize_html(ob_get_contents());
	ob_end_clean();
	xcache_set($cacheConfig['page'],$content,$cacheConfig['timeout']);
	echo $content;
	exit;
}
	 
function startHTMLCache() 
{
	global $cacheConfig;
	if (xcache_isset($cacheConfig['page'])) 
	{
		echo xcache_get($cacheConfig['page']);
		exit;
	}
	else 
	{
	   $cacheConfig['savepage'] = true;
	   ob_start();
	}
}

function create_data_uri($matches)
{
	$filetype = explode('.', $matches[2]);
	$filetype = strtolower($filetype[count($filetype) - 1]);
	if(!preg_match('/^(gif|png|jp[e]?g|bmp)$/i', $filetype))
		return $matches[0];
	if(@filesize($matches[2]) > 1024)  	
		return $matches[0];  
	if(preg_match('/^\//', $matches[2]))
		$matches[2] = $_SERVER['DOCUMENT_ROOT'] . $matches[2];
	@$data = base64_encode(@file_get_contents($matches[2]));
	return $matches[1] . "data:image/$filetype;base64,$data" . $matches[3];
}

function sanitize_html($html)
{
	$mesaj="";
	$matches    = array();
	if(function_exists("tidy_parse_string"))
	{
		$tidy = tidy_parse_string($html);
		if (mb_strlen($tidy->errorBuffer) > 0)
		{
			trigger_error($tidy->errorBuffer);
			$tidy->diagnose();
			trigger_error($tidy->errorBuffer);
		}
	}
	if ( preg_match('|<phphata>.*</phphata>|s', $html, &$matches) )
	{
		foreach ($matches as $match)
			trigger_error(strip_tags($match), E_FATAL);
	}
	$html = preg_split("/\r?\n|\r/", $html);
	while(count($html) > 0)
	{
		//$html[0] = preg_replace_callback("/(src=[\"\'])([^\"\']+)([\"\'])/", 'create_data_uri', $html[0]);
		//$html[0] = preg_replace_callback("/(url\([\'\"]?)([^\"\'\)]+)([\"\']?\))/", 'create_data_uri', $html[0]);
		$mesaj .= $html[0] . "\r\n";
		array_shift($html);
	}
	return $mesaj;
}

init_caching();
