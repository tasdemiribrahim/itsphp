<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>irArchiver Arşiv Programı</title>
	<link rel="stylesheet" type="text/css" href="css/styles.css" />
</head>
<body>
	<div id="page">
	    <nav>
		<ul>
		    <li><a href="/main">Ana Sayfa</a></li>
		    <li><a href="/mobil">Mobil Sayfa</a></li>
		    <li><a href="irarchiver.jnlp">İndir</a></li>
		</ul>
	    </nav>
	    
	    <div id="icerik">
	   	<img src="img/ir.jpg" alt="irArchiver 1.0.1" title="irArchiver 1.0.1" />
	    	<ul>
			<li>AES2 Şifreleme</li>
			<li>Parçalı Arşivler</li>
			<li>Sesli ve Görüntülü Uyarı</li>
			<li>Geçmiş Kaydı</li>
			<li>Arka Planda Çalışma</li>
			<li>Değiştirilebilir Arayüz</li>
			<li>Otomatik Ayar Kaydı</li>
			<li>Açık Kaynak</li>
			<li><b>Arşiv Formatları</b></li>
			<li>Zip</li>
			<li>GZip</li>
			<li>Tar</li>
			<li>LZMA</li>
			<li>BZip2</li>
		</ul>
		<br class="clear" />
	    </div>
	    <div id="testimonials">
		<ul>
			<?php
				$xmlFile = 'xml/testimonials.xml';
				$xslFile = 'xml/transform.xml';
				$doc = new DOMDocument();
				$xsl = new XSLTProcessor();
				$doc->load($xslFile);
				$xsl->importStyleSheet($doc);
				$doc->load($xmlFile);
				echo $xsl->transformToXML($doc);
		   	?>
		</ul>
	    </div>
	</div>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
