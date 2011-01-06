<?php
require_once "admin/db_connect.php";
require_once ("../library/smarty/Smarty.class.php");
require_once '../main/Helpers/TMDb.php';
$smarty = new Smarty; 
$smarty->debugging = false;
$smarty->compile_check=true;
$smarty->caching=1;
$smarty->cache_dir="../cache";
$smarty->compile_dir="../cache";
$smarty->cache_lifetime=3600;
$smarty->cache_modified_check=true;
$smarty->security=true;

$sth = $db->prepare("SELECT * FROM film ORDER BY id");
$sth->execute();
$smarty->assign("rows",$sth->fetchAll());

if(isset($_GET["id"]))
	$sth = $db->prepare("SELECT * FROM film WHERE id=".temizSayi($_GET["id"]));
else
	$sth = $db->prepare("SELECT * FROM film ORDER BY id DESC LIMIT 1");
$sth->execute();
$film = $sth->fetch(PDO::FETCH_ASSOC);
$smarty->assign("film",$film);

$tmdb = new TMDb(TMDB_API_KEY);
$movies_result = json_decode($tmdb->searchMovie($film['film_ad']));
$smarty->assign("movies_result",$movies_result);

$smarty->display('film.tpl', "film|".$_GET["id"]);

