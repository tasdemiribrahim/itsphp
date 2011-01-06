<?php

require("../library/smarty/Smarty.class.php");
$smarty = new Smarty; 
$smarty->debugging = false;
$smarty->compile_check=true;
$smarty->caching=1;
$smarty->cache_dir="../cache";
$smarty->compile_dir="../cache";
$smarty->cache_lifetime=3600;
$smarty->cache_modified_check=true;
$smarty->security=true;
//$smarty->secure_dir=array();

$smarty->display('index.tpl', "index");

