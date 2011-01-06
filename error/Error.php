<!DOCTYPE html>  
<head>
<META charset=UTF-8>
<style>
*{
	margin:0;
	padding:0;
}
body{
	background:url('/main/images/login/bg.png') no-repeat center center #1d1d1d;
	color:#eee;
	text-align: center;
	font: 20px Constantia, 'Hoefler Text',  "Adobe Caslon Pro", Baskerville, Georgia, Times, serif; 
	text-shadow: 2px 2px 2px rgba(200, 200, 200, 0.5)
}
h1 { font-size: 50px; margin:50px; }
#rocket{
	width:275px;
	height:375px;
	background:url('/main/images/login/rocket.png') no-repeat;
	margin:140px auto 50px;
	position:relative;
}
.steam1,
.steam2{
	position:absolute;
	bottom:78px;
	left:50px;
	width:80px;
	height:80px;
	background:url('/main/images/login/steam.png') no-repeat;
	opacity:0.8;
}

.steam2{
	background-position:left bottom;
}
hgroup{
	display:block;
	margin:0 auto;
	width:850px;
	text-align:center;
}
a { color: rgb(36, 109, 56); text-decoration:none; }
a:hover { color: rgb(96, 73, 141) ; text-shadow: 2px 2px 2px rgba(36, 109, 56, 0.5) }
p[frown] { transform: rotate(90deg); display:inline-block; color: #bbb; }
</style>

<title>
<?php
$errorNum = (int)$_GET['err'];
echo $errorNum;
?>
-Hatası</title></head><body>
<details><summary><h1>
<?php
switch($errorNum)
	{
		case 400:
			echo "Gezgininiz veya vekil sunucunuz bu sunucunun tanimadigi bir istemde bulundu";
			break;
		case 401:
			echo "Eger bu dokumana erisim izniniz varsa, lutfen kimliginizi ve parolanizi kontrol edip tekrar deneyin.";
			break;
		case 404:   
			echo '<div id="rocket"></div><hgroup><h1>Sayfa Yok</h1><h2>"Houston sayfayla bağlantıyı kaybettik"</h2></hgroup>';
			if(isset($HTTP_REFERER))
				echo "<br><a href='$HTTP_REFERER'>Referans sayfa</a> uzerindeki bağlantı güncel değil. Lütfen <a href='$HTTP_REFERER'>referans sayfa</a>'nın yazarını konuyla ilgili bilgilendirin.";
			break;
		case 405:
			echo isset($REDIRECT_REQUEST_METHOD) ? $REDIRECT_REQUEST_METHOD : "Talep ettiğiniz işlem ";
			echo " yöntemi talep etti&#287;iniz URL icin kullan&#305;lamaz.";
			break;
		case 408:
			echo "Sunucu a&#287; ba&#287;lant&#305;s&#305;n&#305; kapatt&#305; cunku gezgin talebini belirlenmi&#351; sure icinde tamamlayamad&#305;.";
			break;
		case 410:   
			echo "Talep etti&#287;iniz URL bu sunucu uzerinde bar&#305;nd&#305;r&#305;lm&#305;yor ve herhangi bir yoneltme de mevcut de&#287;il.";
			if(isset($HTTP_REFERER))
				echo "LÃ¼tfen <a href='$HTTP_REFERER'>referans sayfan&#305;n</a> yazar&#305;na, bu ba&#287;lant&#305;n&#305;n gÃ¼ncel olmad&#305;&#287;&#305;n&#305; bildirin.";  
			else
				echo "Yabanc&#305; bir sayfadan bu ba&#287;lant&#305;y&#305; izlediyseniz,lutfen sozkonusu sayfan&#305;n yazar&#305; ile ileti&#351;ime gecin.";
			break;
		case 411:
			echo isset($REDIRECT_REQUEST_METHOD) ? $REDIRECT_REQUEST_METHOD : "";
			echo " metodunu kullanan bir talep gecerli bir <code>Content-Length</code> (icerik uzunlu&#287;u) ba&#351;l&#305;&#287;&#305; gerektirir.";
			break;
		case 412:
			echo "URL talebinin on&#351;art&#305;, olumlu sureci ba&#351;ar&#305;s&#305;zl&#305;kla sonland&#305;rd&#305;.";
			break;
		case 413:
			echo isset($REDIRECT_REQUEST_METHOD) ? $REDIRECT_REQUEST_METHOD : "";
			echo " yontemi iletilen veri tipini desteklemez, ya da veri hacmi kapasite limitlerini a&#351;&#305;yor. ";
			break;
		case 414:
			echo "Talep edilen URL'nin uzunlu&#287;u, sunucunun kapasite limitlerini a&#351;&#305;yor. Talep i&#351;lenemiyor.";
			break;
		case 415:
			echo "Sunucu, talep icinde iletilen ortam turunu desteklemiyor.";
			break;
		case 500:  
			if(isset($REDIRECT_ERROR_NOTES))
				echo "Sunucu icinde bir hata olu&#351;tu ve sunucu talebinize hizmet vermekte ba&#351;ar&#305;l&#305; olamad&#305;.<br>Hata mesaj&#305;:<br />$REDIRECT_ERROR_NOTES";
			else
				echo "Sunucu icinde bir hata olu&#351;tu ve sunucu talebinize hizmet vermekte ba&#351;ar&#305;l&#305; olamad&#305;.Ya sunucuya cok yuklenildi, ya da CGI betiklerinde hata belirdi.";
			break;
		case 501:
			echo "Sunucu, gezgin taraf&#305;ndan talep edilen yontemi desteklemiyor.";
			break;
		case 502:
			echo "Vekil (proxy) sunucu ustbirim (upstream) sunucusundan anlams&#305;z bir cevap ald&#305;.";
		case 503:
			echo "Sunucu, kendi icindeki ce&#351;itli sorunlardan oturu, bir sureli&#287;ine taleplerinize cevap veremeyecek. Lutfen daha sonra tekrar deneyin.";
			break;
		case 506:
			echo "Talep edilen eleman&#305;n bir de&#287;i&#351;keninin kendisi zaten payla&#351;&#305;l&#305;r bir kaynak. Eri&#351;im mumkun de&#287;il.";
			break;
	}
?>
</h1></summary>
  <p><span frown><a href="/main/"><--Eve geri dön</a></p>
</details>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
$(window).load(function(){
	function animSteam(){
		$('<span>',{
			className:'steam'+Math.floor(Math.random()*2 + 1),
			css:{
				marginLeft	: -10 + Math.floor(Math.random()*20)
			}
		}).appendTo('#rocket').animate({
			left:'-=58',
			bottom:'-=100'
		}, 120,function(){
			$(this).remove();
			setTimeout(animSteam,10);
		});
	}
	function moveRocket(){
		$('#rocket').animate({'left':'+=100'},5000).delay(1000)
					.animate({'left':'-=100'},5000,function(){
				setTimeout(moveRocket,1000);
		});
	}
	moveRocket();
	animSteam();
});
</script>
</body>
</html>
