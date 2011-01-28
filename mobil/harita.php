<!DOCTYPE html>  
<html lang="tr">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width; height=device-height; initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<link rel="apple-touch-icon" href="img/apple-touch-icon.png"/>
	<title>Harita | ITSPHP</title>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a2/jquery.mobile-1.0a2.min.css" />
	<div id="m" data-role="fieldcontain" height="300"></div>
	<script src="http://code.google.com/apis/gears/gears_init.js"></script>
	<script src="http://maps.google.com/maps/api/js?sensor=true&language=tr&region=TR"></script>
	<script><?php echo "var adres='".(isset($_GET["h"])?$_GET["h"]:"null")."',ad='".(isset($_GET["a"])?$_GET["a"]:"null")."';"; ?></script>
</head>
<body>
<div id="m" style="height:300px;"></div>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script src="http://code.jquery.com/mobile/1.0a2/jquery.mobile-1.0a2.min.js"></script>
<script>
	var map=new google.maps.Map($("#m")[0],{zoom:5,mapTypeId:google.maps.MapTypeId.ROADMAP}),browserSupportFlag=true,geocoder=new google.maps.Geocoder(),infowindow=new google.maps.InfoWindow();
	console.log("start");
	initialLocation = new google.maps.LatLng("38.729983","35.485153");
	map.setCenter(initialLocation);
	console.log("center");
	if(navigator.geolocation) 
	{
		navigator.geolocation.getCurrentPosition(function(position) {
				mark(position.coords.latitude,position.coords.longitude,"<b>Sizin Konumunuz!</b><p>Bu nokta sadece yol gösterici olarak konmuştur. Haritadaki noktalar adres değerleri çözümlenerek elde edilmiştir. Bu yüzden kesin sonuçlar içermeyebilir. Girdiğiniz her yeni bireyin adresi otomatik olarak haritada işaretlenecektir.</p>",true);
			console.log("geolocation mark");
			}, function() {
		 		handleNoGeolocation(browserSupportFlag);
				console.log("geolocation error");
			}
		);
	} 
	else if (google.gears) 
	{
		var geo = google.gears.factory.create("beta.geolocation");
		geo.getCurrentPosition(function(position) {
			mark(position.latitude,position.longitude,"<b>Sizin Konumunuz!</b><p>Bu nokta sadece yol gösterici olarak konmuştur. Haritadaki noktalar adres değerleri çözümlenerek elde edilmiştir. Bu yüzden kesin sonuçlar içermeyebilir. Girdiğiniz her yeni bireyin adresi otomatik olarak haritada işaretlenecektir.</p>",true);
			console.log("gears mark");
		}, function() {
	  		handleNoGeoLocation(browserSupportFlag);
			console.log("gears error");
		});
	} 
	else 
	{
		console.log("support error");
		browserSupportFlag = false;
		handleNoGeolocation(browserSupportFlag);
	}
	function mark(lat,lon,title,center)
	{
		console.log("mark");
		var initialLocation = new google.maps.LatLng(lat,lon);
		var curMarker = new google.maps.Marker({position: initialLocation, map: map,title:title});
		google.maps.event.addListener(curMarker, "click", function() {
			map.setZoom(15);
			infowindow.setContent(title);
			infowindow.open(map, curMarker);
		});
		if(center) map.setCenter(initialLocation);
	}

	function handleNoGeolocation(errorFlag) 
	{
		if (errorFlag == true) 
		  alert("Geolocation servisi yerinizi bulamadı.");
		else 
		  alert("Tarayıcınız eski olduğundan yeriniz bulunamadı.");
	}

	geocoder.geocode( { "address":adres}, function(results, status) 
	{
		if (status == google.maps.GeocoderStatus.OK) 
		{
			console.log("geo code"+adres);
			var curMarker = new google.maps.Marker({position: results[0].geometry.location, map: map,title:ad});
	
			google.maps.event.addListener(curMarker, "click", function() {
				infowindow.setContent("<b>"+ad+"</b><br />");
				infowindow.open(map, curMarker);
				map.setZoom(15);
			});
		} 
		else alert(ad+" adresi alınamadı!"+status);
	});
</script>
</body>
</html>
