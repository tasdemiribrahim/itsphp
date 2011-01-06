$(document).ready(function() {
	activateMain();
	$.ajaxSetup({
		type: 'GET',
		cache: true,
		url: '/main/ajax/aile',
		beforeSend: function(){	$(".progress").show();	},
		complete:function(){	$(".progress").fadeOut();	},
		error: function(xhr, status) { $(".progress").fadeOut(); }
	});
	
	$("#rssTakip").append('<a href="http://feeds.feedburner.com/aile-itsphp" target="_blank" rel="alternate" type="application/rss+xml" title="Aile RSS Haberleri"><img src="http://www.feedburner.com/fb/images/pub/feed-icon32x32.png" alt="Aile-ITSPHP" /></a>');


	var map=new google.maps.Map($("#map_canvas")[0],{zoom:5,mapTypeId:google.maps.MapTypeId.ROADMAP,streetViewControl: true}),initialLocation,browserSupportFlag=true,geocoder=new google.maps.Geocoder(),adres,infowindow=new google.maps.InfoWindow(),markers=Array(),directionsService = new google.maps.DirectionsService(),directionsDisplay = new google.maps.DirectionsRenderer({draggable: true}),sv = new google.maps.StreetViewService(),gecMarker,panorama = new  google.maps.StreetViewPanorama(document.getElementById("pano"));

	directionsDisplay.setMap(map);
	map.setStreetView(panorama); 
	panorama.setVisible(false);

	google.maps.event.addListener(map, 'click', function(event) {
		if($("#pano_goster").attr("checked"))
      			sv.getPanoramaByLocation(event.latLng, 50, processSVData);
	});

	google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
		  var total = 0, myroute = directionsDisplay.directions.routes[0];
		  for (i = 0; i < myroute.legs.length; i++) 
		    total += myroute.legs[i].distance.value;
		  $("#toplamYol").html(total / 1000);
	  });
	
	$(".map_pin").live("click",function(){
		map.setCenter($(this).parent().data("map"));
		$(".map_pin").removeClass("uyari");
		$(this).addClass("uyari");
		return false;
	});

	$("#git").click(function(){
	  	var start = $("#startRoute").val(),end = $("#endRoute").val(),selectedMode =$("#mode").val(),waypts = [],checkboxArray = document.getElementById("waypoints");
		if(start=="" || end=="") return;
		for (var i = 0; i < checkboxArray.length; i++) 
			if (checkboxArray.options[i].selected == true) 
				waypts.push({location:checkboxArray[i].value,stopover:true});
		var request = {
			origin:start, 
			destination:end,
			waypoints: waypts,
			optimizeWaypoints: true,
			travelMode: google.maps.DirectionsTravelMode[selectedMode]
		};
	  	directionsService.route(request, function(response, status) {
	    		if (status == google.maps.DirectionsStatus.OK) 
	      			directionsDisplay.setDirections(response);  
			if($("#tarif").attr("checked"))
  				directionsDisplay.setPanel(document.getElementById("directionsPanel"));
			else
			{
				directionsDisplay.setPanel(null);
				var route = response.routes[0],summaryPanel = document.getElementById("directionsPanel");
				summaryPanel.innerHTML = "";
				for (var i = 0; i < route.legs.length; i++) 
				{
					var routeSegment = i+1;
					summaryPanel.innerHTML += "<b>Hedef: " + routeSegment + "</b><br />";
					summaryPanel.innerHTML += route.legs[i].start_address + " => ";
					summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
					summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />";
				}
			}
	  	});
	});

	$("#pano_goster").change(function(){
		if($(this).attr("checked")) $("#pano").removeClass("sakla");
		else $("#pano").addClass("sakla");
	});


/*	$.ajax({
		dataType :"json",
		data: 'map=0',
		success: function(cevap){
			var i=cevap.length-1;
			while(i-->-1)
			{
				mark(cevap[i].lat,cevap[i].lon,cevap[i].aileAd,false);
				if(i!=cevap.length-1) $("#map_canvas").after(",");
					$("<a class='map_pin'>"+cevap[i].aileAd+"</a>").data("lat",cevap[i].lat).data("lon",cevap[i].lon).insertAfter("#map_canvas");
			}
		}
	});

	if($("#aileBireyIDHidden").val())
		$.ajax({
			dataType :"json",
			data: 'map='+$("#aileBireyIDHidden").val(),
			success: function(cevap){
				if(cevap.length>0)
					mark(cevap[0].lat,cevap[0].lon,"<b>"+cevap[0].aileAd+"</b><br /><img width='45' height='45' alt='"+cevap[0].aileAd+"' src='"+getResim(cevap[0].aileID,"aile")+"' />",true);
			}
		});
*/

	if(adresler.length)
	{
		adres=adresler.pop();
		setGeo(adres[0],adres[1],adres[2]);
	}

	if(navigator.geolocation) 
	{
		navigator.geolocation.getCurrentPosition(function(position) {
				mark(position.coords.latitude,position.coords.longitude,"<b>Sizin Konumunuz!</b><p>Bu nokta sadece yol gösterici olarak konmuştur. Haritadaki noktalar adres değerleri çözümlenerek elde edilmiştir. Bu yüzden kesin sonuçlar içermeyebilir. Girdiğiniz her yeni bireyin adresi otomatik olarak haritada işaretlenecektir.</p>",true);
			}, function() {
		 		handleNoGeolocation(browserSupportFlag);
			},
			{
				//enableHighAccuracy: true,
				//timeout: 2000,
				//maximumAge: 0
			}
		);
	} 
	else if (google.gears) 
	{
		var geo = google.gears.factory.create('beta.geolocation');
		geo.getCurrentPosition(function(position) {
			mark(position.latitude,position.longitude,"<b>Sizin Konumunuz!</b><p>Bu nokta sadece yol gösterici olarak konmuştur. Haritadaki noktalar adres değerleri çözümlenerek elde edilmiştir. Bu yüzden kesin sonuçlar içermeyebilir. Girdiğiniz her yeni bireyin adresi otomatik olarak haritada işaretlenecektir.</p>",true);
		}, function() {
	  		handleNoGeoLocation(browserSupportFlag);
		});
	} 
	else 
	{
		browserSupportFlag = false;
		handleNoGeolocation(browserSupportFlag);
	}
	initialLocation = new google.maps.LatLng("38.729983","35.485153");
	map.setCenter(initialLocation);


	function processSVData(data, status) 
	{
		if (status == google.maps.StreetViewStatus.OK) 
		{
			if(gecMarker) gecMarker.setMap(null);
			gecMarker = new google.maps.Marker({
				position: data.location.latLng,
				map: map,
				title: data.location.description
			});

			var markerPanoID = data.location.pano;
			panorama.setPano(markerPanoID);
			panorama.setPov({
				heading: 270,
				pitch: 0,
				zoom: 1
			});

			google.maps.event.addListener(gecMarker, 'click', function() 
			{
				var markerPanoID = data.location.pano;
				panorama.setPano(markerPanoID);
				panorama.setPov({
					heading: 270,
					pitch: 0,
					zoom: 1
				});
			});
			panorama.setVisible(true);
		}
	}

	function mark(lat,lon,title,center)
	{
		initialLocation = new google.maps.LatLng(lat,lon);
		var curMarker = new google.maps.Marker({position: initialLocation, map: map,title:title});
		google.maps.event.addListener(curMarker, 'click', function() {
			map.setZoom(15);
			infowindow.setContent(title);
			infowindow.open(map, curMarker);
		});
		if(center) map.setCenter(initialLocation);
		markers[markers.length]=curMarker;
	}

	function handleNoGeolocation(errorFlag) 
	{
		if (errorFlag == true) 
		  addNotice("<p>Geolocation servisi yerinizi bulamadı.</p>");
		else 
		  addNotice("<p>Tarayıcınız eski olduğundan yeriniz bulunamadı.</p>");
	}

	function setGeo(adres,ad,resim)
	{
		geocoder.geocode( { "address":adres}, function(results, status) 
		{
			if (status == google.maps.GeocoderStatus.OK) 
			{
				var curMarker = new google.maps.Marker({position: results[0].geometry.location, map: map,title:ad}),lng=results[0].geometry.location.lng(),lat=results[0].geometry.location.lat();
				
				$("<li>",{html:"<a class='map_pin' href='#'>"+ad+"</a><br /><abrr title='"+lat+";"+lng+"' class='geo'>"+adres+"</abbr><ul class='geo'><li>Enlem:<span class='latitude'>"+lat+"</span></li><li>Boylam:<span class='longitude'>"+lng+"</span></li></ul>"}).data("map",results[0].geometry.location).appendTo("#hedefListe");
				$("#startRoute,#endRoute,#waypoints").append("<option value='"+adres+"' data-icon='"+resim +"' data-html-text='"+ad+"&lt;i&gt;"+adres+"&lt;/i&gt;' >"+ad+"</option>");
				google.maps.event.addListener(curMarker, 'click', function() {
					infowindow.setContent("<b>"+ad+"</b><br /><img width='45' height='45' alt='"+ad+"' src='"+resim+"' />");
					infowindow.open(map, curMarker);
					map.setZoom(15);
				});
				markers[markers.length]=curMarker;
			} 
			else addNotice("<p>"+ad+" adresi alınamadı!</p><p>"+status+"</p>");
		
			adres=adresler.pop();
			if(adres)
				setGeo(adres[0],adres[1],adres[2]);
			else 
			{
				dropFancy($("#startRoute"),"startBox");
				dropFancy($("#endRoute"),"endBox");
			}
		});
	}

	function dropFancy(select,id)
	{
		if($("#"+id).length) $("#"+id).remove();
		var selectBoxContainer = $('<div>',{
			width		: select.outerWidth(),
			className	: 'fancySelect',
			html		: '<div class="selectBox"></div>'
		});
		selectBoxContainer.attr("id",id);
		var dropDown = $('<ul>',{className:'dropDown'}),selectBox = selectBoxContainer.find('.selectBox');
	
		select.find('option').each(function(i){
			var option = $(this);
		
			if(i==select.attr('selectedIndex'))
				selectBox.html(option.text());
		
			if(option.data('skip'))
				return true;
		
			var li = $('<li>',{html:'<img width="65" height="65" src="'+option.data('icon')+'" /><span>'+option.data('html-text')+'</span>'});
				
			li.click(function(){
				selectBox.html(option.text());
				dropDown.trigger('hide');
				select.attr('selectedIndex',i);
				//select.val(option.val());
				//option.attr("selected","selected");
				return false;
			});
			dropDown.append(li);
		});
	
		selectBoxContainer.append(dropDown.hide());
		select.hide().after(selectBoxContainer);
	
		dropDown.bind('show',function(){
			if(dropDown.is(':animated'))
				return false;
			selectBox.addClass('expanded');
			dropDown.slideDown();
		}).bind('hide',function(){
			if(dropDown.is(':animated'))
				return false;
			selectBox.removeClass('expanded');
			dropDown.slideUp();
		}).bind('toggle',function(){
			if(selectBox.hasClass('expanded'))
				dropDown.trigger('hide');
			else dropDown.trigger('show');
		});
	
		selectBox.click(function(){
			dropDown.trigger('toggle');
			return false;
		});

		$(document).click(function(){
			dropDown.trigger('hide');
		});
	}
});

