<?php
include_once "admin/db_connect.php";
require("../library/smarty/Smarty.class.php");
$smarty = new Smarty; 
$smarty->debugging = TRUE;
$smarty->compile_check=true;
$smarty->caching=1;
$smarty->cache_dir="../cache";
$smarty->compile_dir="../cache";
$smarty->cache_lifetime=3600;
$smarty->cache_modified_check=true;
$smarty->security=true;

$smarty->assign('revenues', array(1 => '$0-$10000',2 => '$10000-$20000',3 => '$20000-$50000',4 => '$50000+'));
$smarty->assign('revenue', 2);

$smarty->assign('oses', array(1 => 'Windows XP',2 => 'Linux',3 => 'Sun Solaris',4 => 'Mac OS'));
$smarty->assign("os", array(2,1));

/*
$smarty->assign('revenues', array(1 => '$0-$10000',2 => '$10000-$20000',3 => '$20000-$50000',4 => '$50000+'));
$smarty->assign('revenue', 2);

$smarty->assign('oses', array(1 => 'Windows XP',2 => 'Linux',3 => 'Sun Solaris',4 => 'Mac OS'));
$smarty->assign("os", array(2,1));


{html_radios name="yearly_revenue" options=$revenues selected=$revenue separator="<br />"}
{html_checkboxes name="os" options=$oses selected=$os separator="<br />"}
{html_select_date display_years=true}&nbsp;
{html_select_time display_seconds=false minute_interval=15}
<label for="slider">Value this site:</label>
<select name="q" id="q">
	{html_options options=$rows selected=$q}
</select>

*/

echo $smarty->fetch("forum.tpl", "forum"));

