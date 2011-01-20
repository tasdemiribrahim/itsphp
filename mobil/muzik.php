<?php

require_once "admin/db_connect.php";
require_once("../library/smarty/Smarty.class.php");
$smarty = new Smarty; 
$smarty->debugging = false;
$smarty->compile_check=true;
$smarty->caching=1;
$smarty->cache_dir="../cache";
$smarty->compile_dir="../cache";
$smarty->cache_lifetime=3600;
$smarty->cache_modified_check=true;
$smarty->security=true;

$sth = $db->prepare('SELECT grupAd,grupID,tur FROM muzik ORDER BY tur');
$sth->execute();
$smarty->assign("rows",$sth->fetchAll());

if(isset($_GET["id"]))
	$sth = $db->prepare("SELECT * FROM muzik WHERE grupID=".temizSayi($_GET["id"]));
else
	$sth = $db->prepare("SELECT * FROM muzik ORDER BY grupID DESC LIMIT 1");
$sth->execute();
$row = $sth->fetch(PDO::FETCH_ASSOC);

$smarty->assign("row",$row);
$smarty->assign("resim",getResim($row["grupID"],"muzik"));

$sth = $db->prepare('SELECT * FROM eleman WHERE grupID='.$row["grupID"]);
$sth->execute();
$smarty->assign("elemanlar",$sth->fetchAll());

$sth = $db->prepare('SELECT * FROM album WHERE grupID='.$row["grupID"]);
$sth->execute();
$smarty->assign("albumler",$sth->fetchAll());
	
$smarty->display('muzik.tpl', "muzik|".$_GET["id"]);

