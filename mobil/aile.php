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

$id=0;
if(isset($_GET["id"]))	
{
	$id=temizSayi($_GET["id"]);
	$smarty->assign("ad",$record["ad"]);
	$sth = $db->prepare("SELECT * FROM aa a,aad d WHERE d.id=a.id AND a.id=$id");
}
else
	$sth = $db->prepare("SELECT * FROM aa a,aad d WHERE d.id=a.id ORDER BY a.id DESC LIMIT 1");
$sth->execute();
$record = $sth->fetch(PDO::FETCH_ASSOC);

$smarty->assign("record", $record);
$smarty->assign("resim", getResim($record["id"]));

$sth = $db->prepare("SELECT * FROM aa WHERE eid=$id ORDER BY id");
$sth->execute();
$smarty->assign("rows",$sth->fetchAll());

$smarty->display('aile.tpl', "aile|$id");

