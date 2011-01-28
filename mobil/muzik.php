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

$sth = $db->prepare('SELECT dm.ad,dm.id,dmt.ad as tur FROM dm LEFT JOIN dmt ON (dm.tur=dmt.id) ORDER BY dm.tur');
$sth->execute();
$smarty->assign("rows",$sth->fetchAll());

if(isset($_GET["id"]))
	$sth = $db->prepare("SELECT dm.id,dm.ad,dm.tanim,dmm.ad as mem FROM dm,dmm WHERE dm.id=".temizSayi($_GET["id"])." AND dm.mem=dmm.id");
else
	$sth = $db->prepare("SELECT dm.id,dm.ad,dm.tanim,dmm.ad as mem FROM dm,dmm WHERE dm.mem=dmm.id ORDER BY dm.id DESC LIMIT 1");
$sth->execute();
$row = $sth->fetch(PDO::FETCH_ASSOC);

$smarty->assign("row",$row);
$smarty->assign("resim",getResim($row["id"],"muzik"));

$sth = $db->prepare('SELECT * FROM dme WHERE grupID='.$row["id"]);
$sth->execute();
$smarty->assign("elemanlar",$sth->fetchAll());

$sth = $db->prepare('SELECT * FROM dma WHERE grupID='.$row["id"]);
$sth->execute();
$smarty->assign("albumler",$sth->fetchAll());
	
$smarty->display('muzik.tpl', "muzik|".$_GET["id"]);

