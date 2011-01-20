<?php
include_once "admin/db_connect.php";
require_once ('../library/smarty/Smarty.class.php');
$smarty = new Smarty;
$smarty->debugging = false;
$smarty->compile_check=true;
$smarty->caching=1;
$smarty->cache_dir="../cache";
$smarty->compile_dir="../cache";
$smarty->cache_lifetime=3600;
$smarty->cache_modified_check=true;
$smarty->security=true;

if(isset($_GET["id"]))
	$sth = $db->prepare("SELECT * FROM aile_agaci a,aile_agaci_detay d,aile_agaci_oy o WHERE d.aileID=a.aileID AND o.aileID=a.aileID AND a.aileID=".temizSayi($_GET["id"]));
else
	$sth = $db->prepare("SELECT * FROM aile_agaci a,aile_agaci_detay d,aile_agaci_oy o WHERE d.aileID=a.aileID AND o.aileID=a.aileID ORDER BY a.aileID DESC LIMIT 1");
$sth->execute();
$record = $sth->fetch(PDO::FETCH_ASSOC);

$smarty->assign("record", $record);
$smarty->assign("resim", getResim($record["aileID"]));

$id=0;
if(isset($_GET["id"]))	
{
	$id=$_GET["id"];
	$smarty->assign("aileAd",$record["aileAd"]);
}

$sth = $db->prepare("SELECT * FROM aile_agaci WHERE ebeveynID=".temizSayi($id)." ORDER BY aileID");
$sth->execute();
$smarty->assign("rows",$sth->fetchAll());

$smarty->display('aile.tpl', "aile|".$_GET["id"]);

