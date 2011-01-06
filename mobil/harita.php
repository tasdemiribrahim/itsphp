<?php

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

$countries = array("Bangladesh", "India", "Pakistan", "Nepal", "Maldives","Srilanka", "Bhutan");
$country = 0;
$smarty->assign("countries", $countries);
$smarty->assign("country", $country);

$smarty->assign('revenues', array(1 => '$0-$10000',2 => '$10000-$20000',3 => '$20000-$50000',4 => '$50000+'));
$smarty->assign('revenue', 2);

$smarty->assign('oses', array(1 => 'Windows XP',2 => 'Linux',3 => 'Sun Solaris',4 => 'Mac OS'));
$smarty->assign("os", array(2,1));

echo $smarty->fetch("harita.tpl", "harita");

