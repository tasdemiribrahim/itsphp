<?php
header('Pragma: no-cache');
$mobile_browser = '0';
$mobile_ua = strtolower($_SERVER['HTTP_USER_AGENT']);
if(preg_match('/(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone)/i', $mobile_ua)) $mobile_browser++;
if((strpos(strtolower($_SERVER['HTTP_ACCEPT']),'application/vnd.wap.xhtml+xml')>0) or ((isset($_SERVER['HTTP_X_WAP_PROFILE']) or isset($_SERVER['HTTP_PROFILE'])))) $mobile_browser++; 
$mobile_agents = array( '240x320', 'acs\-', 'alav', 'alcatel', 'amoi', 'android', 'audio', 'avantg', 'benq', 'bird', 'blackberry', 'blaz', 'brew','cdm', 'cell','chtml', 'cldc', 'cmd\-', 'compal', '\d\d\di', 'dang', 'dbt', 'docomo', 'ericson', 'gradi', 'hand', 'hipt', 'htc',  'inno', 'ipaq', 'iphone', 'ipod', 'j2me', 'java', 'jb',  'jigs', 'kdd', 'keji','kg', 'leno', 'lg', 'maui', 'maxo','mib\/', 'midp', 'mitsu', 'mmef','mmp\/', 'mmm','mobi', 'mot\-', 'moto', 'mwbp', 'nec\-', 'newt', 'nokia', 'novarra','opwv', 'palmos','palmsource', 'panasonic', 'pant', 'pda','pg', 'philips', 'phone', 'play', 'pocket',  'port', 'prox',  'pt', 'qwap', 'rover', 'sagem', 'samsung', 'sany', 'sch', 'sec\-', 'sendo', 'seri', 'sgh', 'sharp', 'sie\-', 'siem', 'smal', 'smar', 'sony', 'sph\-', 'symbian', 't\-mo', 'teli', 'tim\-', 'tosh', 'tsm\-','up\.b', 'upg1', 'upsi', 'vk\-v', 'voda','vox','vx','w3c ', 'wap', 'webc', 'webO', 'windows\ ce', 'winw', 'wireless','xda', 'xx');
foreach($mobile_agents as $mobile_agent) if(preg_match('/'.$mobile_agent.'/i',$mobile_ua))	$mobile_browser++; 
if (strpos(strtolower($_SERVER['ALL_HTTP']),'OperaMini')>0) $mobile_browser++;
$badmatches = array('Creative\AutoUpdate','OfficeLiveConnector','MSIE\ 8\.0');
foreach($badmatches as $badstring) if(preg_match('/'.$badstring.'/i',$_SERVER['HTTP_USER_AGENT'])) $mobile_browser=0;
if($mobile_browser>0)
    {
   	header('HTTP/1.1 301 Moved Permanently'); 
	header('Location: ./mobil/'); 
	exit;
    }
else
    {
   	header('HTTP/1.1 301 Moved Permanently'); 
	header('Location: ./main/'); 
	exit;
    }
