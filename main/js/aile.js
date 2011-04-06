$(document).ready(function() {	

	activateMain();  
	
	if($("#disqus_thread").length)
	{
		var username=$('#bft').next().val(),currentPage = 1;
		var appendTweet = function(tweet, id) {$("<p />").html(tweet).appendTo($("#tweets"));};
		var loadTweets = function(url) {
			var url = "http://twitter.com/status/user_timeline/"+username+".json?count=15&page="+currentPage+"&callback=?";
			$.getJSON(url,function(data) {
				$.each(data, function(i, post) {
					appendTweet(post.text, post.id);
				});
				$("#loadt").fadeOut();
			});
		};
		$("#tweets").scroll(function() {
			if ($(this).outerHeight() - $(this)[0].scrollHeight + $(this).scrollTop() > -1 ) {
				currentPage++;
				$("#loadt").fadeIn();
				loadTweets();
			}
		});		
		$('#bft').bind("click",function(){
			$("#tweets").html("");
			currentPage = 1;
			if(username!="")
			{
				loadTweets();
				$('#bounceb').bounceBoxShow();
			}
			return false;
		});

		if(!Modernizr.borderimage) $("img.photo").css({"width":"100%","border-width":"0"});
	
		if($('#flickr_overlay'))
		{
			var api_key = '5695b987ebb20ad52a6a6b52d9b32b1f';	
			var large_image_size = 'Medium';
			var photo_set_id,photo_id;
			var current= -1;
			var continueNavigation = false;
			var sets_service = 'http://api.flickr.com/services/rest/?&method=flickr.photosets.getList' + '&api_key=' + api_key;
			var sets_url= sets_service + '&user_id=' + $("#birey_flickr").val() + '&format=json&jsoncallback=?';
			var photos_service = 'http://api.flickr.com/services/rest/?&method=flickr.photosets.getPhotos' + '&api_key=' + api_key;
			var large_photo_service = 'http://api.flickr.com/services/rest/?&method=flickr.photos.getSizes' + '&api_key=' + api_key;
			var $setsContainer = $('#sets').find('ul');
			$setsContainer.html("");
			var $photosContainer = $('#images').find('ul');
			$photosContainer.html("");
			var $photopreview= $('#flickr_photopreview');
			var $flickrOverlay= $('#flickr_overlay');
			$flickrOverlay.html("");
			var $loadingStatus= $('#flickr_toggle').find('.loading_small');
			$loadingStatus.html("");

			var ul_width,spacefit,fit;
			$('#flickr_toggle').toggle(function(){
				$('#photobar').stop().animate({'bottom':'0px'},200,function(){
					if($setsContainer.is(':empty'))
						LoadSets();
				});
			},function(){
				$('#photobar').stop().animate({'bottom':'-96px'},200,function(){
					$('#images').css('bottom','-125px');
				});
			});
			function LoadSets(){
				$loadingStatus.css('visibility','visible');
				$.getJSON(sets_url,function(data){
					if(data.stat != 'fail') {
						var sets_count = data.photosets.photoset.length;
						ul_width = sets_count * 85 + 85;
						$setsContainer.css('width',ul_width + 'px');
						for(var i = 0; i < sets_count; ++i){
							var photoset		= data.photosets.photoset[i];
							var primary 		= photoset.primary;
							var secret			= photoset.secret;
							var server			= photoset.server;
							var farm			= photoset.farm;
							var photoUrl		= 'http://farm'+farm+'.static.flickr.com/'+server+'/'+primary+'_'+secret+'_s.jpg';
							var $elem 			= $('<li />');
							var $link 			= $('<a class="toLoad" href="#" />');
							$link.data({
								'primary'	:primary,
								'secret'	:secret,
								'server'	:server,
								'farm'		:farm,
								'photoUrl'	:photoUrl,
								'setName'	:photoset.title._content,
								'id'		:photoset.id
							});
				
							$setsContainer.append($elem.append($link));
							$link.bind('click',function(e){
								var $this = $(this);
								$('#images').stop().animate({'bottom':'0px'},200);
								if(photo_set_id!=$this.data('id')){
									photo_set_id = $this.data('id');
									$('#setName').html($this.data('setName'));
									LoadPhotos();
								}
								e.preventDefault();
							});
						}
						LoadSetsImages();
					}
				});	
			}
			function LoadSetsImages(){
				var toLoad = $('.toLoad:in-viewport').size();
				if(toLoad > 0)
					$loadingStatus.css('visibility','visible');
				var images_loaded = 0;
				$('.toLoad:in-viewport').each(function(i){
					var $space= $setsContainer.find('.toLoad:first');
					var $img = $('<img style="display:none;" />').load(function(){
						++images_loaded;
						if(images_loaded == toLoad){
							$loadingStatus.css('visibility','hidden');
							$setsContainer.find('img').fadeIn();
						}	
					}).error(function(){
						++images_loaded;
						if(images_loaded == toLoad){
							$loadingStatus.css('visibility','hidden');
							$setsContainer.find('img').fadeIn();
						}	
					}).attr('src',$space.data('photoUrl')).attr('alt',$space.data('id'));
					var $set_name		= $('<span />',{'html':$space.data('setName')});
					$space.append($set_name).append($img).removeClass('toLoad');
				});
			}
			function LoadPhotos(){
				$photosContainer.empty();
				$loadingStatus.css('visibility','visible');
				var photos_url	= photos_service + '&photoset_id=' + photo_set_id + '&media=photos&format=json&jsoncallback=?';
				$.getJSON(photos_url,function(data){
					if(data.stat != 'fail') {
						var photo_count = data.photoset.photo.length;
						var photo_count_total = photo_count + $photosContainer.children('li').length;
						ul_width = photo_count_total * 85 + 85;
						$photosContainer.css('width',ul_width + 'px');
						for(var i = 0; i < photo_count; ++i){	
							var photo= data.photoset.photo[i],photoid= photo.id,secret= photo.secret,server= photo.server,farm= photo.farm,photoUrl= 'http://farm'+farm+'.static.flickr.com/'+server+'/'+photoid+'_'+secret+'_s.jpg',$elem = $('<li />'),$link = $('<a class="toLoad" href="#" />');
							$link.data({
								'photoid':photoid,
								'secret':secret,
								'server':server,
								'farm':farm,
								'photoUrl':photoUrl,
								'photo_title':photo.title
							});
							$photosContainer.append($elem.append($link));
							$link.bind('click',function(e){
								var $this	= $(this);
								current		= $this.parent().index();
								photo_id 	= $this.data('photoid');
								LoadLargePhoto();
								e.preventDefault();
							});
						}
						LoadPhotosImages();
					}
				});
			}
			function LoadPhotosImages(){
				var toLoad = $('.toLoad:in-viewport').size();
				if(toLoad > 0)
					$loadingStatus.css('visibility','visible');
				var images_loaded 	= 0;
				$('.toLoad:in-viewport').each(function(i){
					var $space= $photosContainer.find('.toLoad:first');
					var $img = $('<img style="display:none;" />').load(function(){
						++images_loaded;
						if(images_loaded == toLoad){
							$loadingStatus.css('visibility','hidden');
							$photosContainer.find('img').fadeIn();
							if(continueNavigation){
								continueNavigation = false;
								var $thumb = $photosContainer.find('li:nth-child(' + parseInt(current + 1) + ')').find('img');
								photo_id = $thumb.attr('alt');
								LoadLargePhoto();
							}
						}	
					}).error(function(){
						++images_loaded;
						if(images_loaded == toLoad){
							$loadingStatus.css('visibility','hidden');
							$photosContainer.find('img').fadeIn();
							if(continueNavigation){
								continueNavigation = false;
								var $thumb = $photosContainer.find('li:nth-child(' + parseInt(current + 1) + ')').find('img');
								photo_id = $thumb.attr('alt');
								LoadLargePhoto();
							}
						}				
					}).attr('src',$space.data('photoUrl'))
					  .attr('alt',$space.data('photoid'));
					var $photo_title= $('<span/>',{'html':$space.data('photo_title')});
					$space.append($photo_title).append($img).removeClass('toLoad');
				});
			}
			function LoadLargePhoto(){
				removeLargeImage();
				var $theThumb 	= $photosContainer.find('li:nth-child(' + parseInt(current + 1) + ')').find('img');
				var photo_title = $theThumb.parent().data('photo_title');
				var $loading	= $photopreview.find('.loading');
				$loading.show();
				$photopreview.show();
				$flickrOverlay.show();
				$('#preview_close').show();
				$("#hsec").hide();
				var large_photo_url = large_photo_service + '&photo_id=' + photo_id + '&format=json&jsoncallback=?';
				$.getJSON(large_photo_url,function(data){
					if(data.stat != 'fail') {
						var count_sizes = data.sizes.size.length;
						var largest_photo_src; 
						for(var i = 0; i < count_sizes; ++i){
							if(data.sizes.size[i].label == large_image_size)
								largest_photo_src 	= data.sizes.size[i].source;
						}
						$('<img />').load(function(){
							var $this = $(this);
							resize($this);
							$loading.hide();
							removeLargeImage();
							$photopreview.find('.preview').append($this);
							$('#large_phototitle').empty().html(photo_title);						
						}).attr('src',largest_photo_src);
					}
				});
			}
			$('#preview_close').bind('click',function(){
				$photopreview.hide();
				$flickrOverlay.hide();
				$('#preview_close').hide();
				$('#large_phototitle').empty()
				removeLargeImage();
				$("#hsec").show();
			});
			function removeLargeImage(){
				$photopreview.find('img').remove();
			}
			$('#preview_img_next').bind('click',function(e){
				++current;
				var $link 	= $photosContainer.find('li:nth-child(' + parseInt(current + 1) + ')');
				var $thumb 	= $link.find('img');
				if(!$thumb.length && $link.length){
					continueNavigation = true;
					removeLargeImage();
					$photopreview.find('.loading').show();
					$('#images').find('.next').trigger('click');
				}
				else if(!$thumb.length && !$link.length){
					--current;
					return;
				}	
				else{	
					photo_id 	= $thumb.attr('alt');
					LoadLargePhoto();
				}	
				e.preventDefault();
			});
			$('#preview_img_prev').bind('click',function(e){
				var $link 	= $photosContainer.find('li:nth-child(' + parseInt(current) + ')');
				--current;
				var $thumb 	= $link.find('img');
				if(!$thumb.length && !$link.length){
					++current;
					return;
				}
				if(!$thumb.is(':in-viewport') && $link.length){
					$('#images').find('.prev').trigger('click');
				}						
				photo_id 	= $thumb.attr('alt');
				LoadLargePhoto();	
				e.preventDefault();
			});
			var scrollAllow = true;
			$('#sets,#images').find('.next').bind('click',function(e) {
				var target_id = $(e.target).parent().attr('id');
				var $theContainer;
				if(target_id == 'sets')
					$theContainer = $setsContainer;
				else if(target_id == 'images')
					$theContainer = $photosContainer;
				if(scrollAllow){
					scrollAllow		= false;
					spacefit 		= $(window).width() -44;
					fit 			= Math.floor(spacefit / 85);
					var left 		= parseFloat($theContainer.css('left'),10);
					var moveleft 	= left - (fit*85);
					if(ul_width - Math.abs(left) < $(window).width()){ 
						scrollAllow = true;
						e.preventDefault();
						return;
					}
					$theContainer.animate({'left':moveleft+'px'},1000,function(){
						scrollAllow = true;
						if(target_id == 'sets')
							LoadSetsImages();
						else if(target_id == 'images')
							LoadPhotosImages();
					});
					e.preventDefault();
				}
			});
			$('#sets,#images').find('.prev').bind('click',function(e) {
				var target_id = $(e.target).parent().attr('id');
				var $theContainer;
				if(target_id == 'sets')
					$theContainer = $setsContainer;
				else if(target_id == 'images')
					$theContainer = $photosContainer;
				if(scrollAllow){
					scrollAllow		= false;
					spacefit 		= $(window).width() -44;
					fit 			= Math.floor(spacefit / 85);
					var left = parseFloat($theContainer.css('left'),10);
					var moveleft = left + (fit*85);
					if(left >= 0){ 
						scrollAllow = true;
						e.preventDefault();
						return;
					}
					$theContainer.animate({'left':moveleft+'px'},1000,function(){
						scrollAllow = true;
					});
					e.preventDefault();
				}
			});
			$('#images_toggle').bind('click',function(){
				$('#images').stop().animate({'bottom':'-125px'},200);
			});	
			$(window).bind('resize', function() {
				var $theLargeImage = $photopreview.find('img');
				if($theLargeImage.length)
					resize($theLargeImage);
			});	
			function resize($image){
				var widthMargin		= 10
				var heightMargin 	= 60;
				var windowH      = $(window).height()-heightMargin;
				var windowW      = $(window).width()-widthMargin;
				$photopreview.find('.preview').css({'width':$(window).width()+'px','height':($(window).height()-25)+'px'});
				var theImage     = new Image();
				theImage.src     = $image.attr("src");
				var imgwidth     = theImage.width;
				var imgheight    = theImage.height;

				if((imgwidth > windowW)||(imgheight > windowH)){
					if(imgwidth > imgheight){
						var newwidth 	= windowW;
						var ratio 		= imgwidth / windowW;
						var newheight	= imgheight / ratio;
						theImage.height = newheight;
						theImage.width	= newwidth;
						if(newheight>windowH){
							var newnewheight= windowH;
							var newratio 	= newheight/windowH;
							var newnewwidth = newwidth/newratio;
							theImage.width 	= newnewwidth;
							theImage.height	= newnewheight;
						}
					}
					else{
						var newheight = windowH;
						var ratio = imgheight / windowH;
						var newwidth = imgwidth / ratio;
						theImage.height = newheight;
						theImage.width= newwidth;
						if(newwidth>windowW)
						{
							var newnewwidth = windowW;
							var newratio = newwidth/windowW;
							var newnewheight =newheight/newratio;
							theImage.height = newnewheight;
							theImage.width= newnewwidth;
						}
					}
				}
				$image.css({'width':theImage.width+'px','height':theImage.height+'px'});
			}
		}
	}
	else
	{
		var map=new google.maps.Map($("#ammc")[0],{zoom:5,mapTypeId:google.maps.MapTypeId.ROADMAP,streetViewControl: true}),initialLocation,browserSupportFlag=true,geocoder=new google.maps.Geocoder(),adres,infowindow=new google.maps.InfoWindow(),markers=Array(),directionsService = new google.maps.DirectionsService(),directionsDisplay = new google.maps.DirectionsRenderer({draggable: true}),sv = new google.maps.StreetViewService(),gecMarker,panorama = new  google.maps.StreetViewPanorama(document.getElementById("pano"));

		directionsDisplay.setMap(map);
		map.setStreetView(panorama); 
		panorama.setVisible(false);

		google.maps.event.addListener(map, 'click', function(event) {
			if($("#ampg").attr("checked"))
	      			sv.getPanoramaByLocation(event.latLng, 50, processSVData);
		});

		google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
			  var total = 0, myroute = directionsDisplay.directions.routes[0];
			  for (i = 0; i < myroute.legs.length; i++) 
			    total += myroute.legs[i].distance.value;
			  $("#amty").html(total / 1000);
		  });

		$(".map_pin").live("click",function(){
			map.setCenter($(this).parent().data("map"));
			$(".map_pin").removeClass("uyari");
			$(this).addClass("uyari");
			return false;
		});

		$("#git").click(function(){
		  	var start = $("#amsr").val(),end = $("#amer").val(),selectedMode =$("#mode").val(),waypts = [],checkboxArray = document.getElementById("amwp");
			if(start=="" || end=="") return;
			for (var i = 0; i < checkboxArray.length; i++) 
				if (checkboxArray.options[i].selected == true) 
					waypts.push({location:checkboxArray[i].value,stopover:true});
			var request = {
				origin:start, 
				destination:end,
				amwp: waypts,
				optimizeamwp: true,
				travelMode: google.maps.DirectionsTravelMode[selectedMode]
			};
		  	directionsService.route(request, function(response, status) {
		    		if (status == google.maps.DirectionsStatus.OK) 
		      			directionsDisplay.setDirections(response);  
				if($("#tarif").attr("checked"))
	  				directionsDisplay.setPanel(document.getElementById("amdp"));
				else
				{
					directionsDisplay.setPanel(null);
					var route = response.routes[0],summaryPanel = document.getElementById("amdp");
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

		$("#ampg").change(function(){
			if($(this).attr("checked")) $("#pano").removeClass("sakla");
			else $("#pano").addClass("sakla");
		});

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
		{ }

		function setGeo(adres,ad,resim)
		{
			geocoder.geocode( { "address":adres}, function(results, status) 
			{
				if (status == google.maps.GeocoderStatus.OK) 
				{
					var curMarker = new google.maps.Marker({position: results[0].geometry.location, map: map,title:ad}),lng=results[0].geometry.location.lng(),lat=results[0].geometry.location.lat();
			
					$("<li>",{html:"<a class='map_pin' href='#'>"+ad+"</a><br /><abrr title='"+lat+";"+lng+"' class='geo'>"+adres+"</abbr><ul class='geo sakla'><li>Enlem:<span class='latitude'>"+lat+"</span></li><li>Boylam:<span class='longitude'>"+lng+"</span></li></ul>"}).data("map",results[0].geometry.location).appendTo("#amhl");
					$("#amsr,#amer,#amwp").append("<option value='"+adres+"' data-icon='"+resim +"' data-html-text='"+ad+"&lt;i&gt;"+adres+"&lt;/i&gt;' >"+ad+"</option>");
					google.maps.event.addListener(curMarker, 'click', function() {
						infowindow.setContent("<b>"+ad+"</b><br /><img width='45' height='45' alt='"+ad+"' src='"+resim+"' />");
						infowindow.open(map, curMarker);
						map.setZoom(15);
					});
					markers[markers.length]=curMarker;
				} 
	
				adres=adresler.pop();
				if(adres)
					setGeo(adres[0],adres[1],adres[2]);
				else 
				{
					dropFancy($("#amsr"),"startBox");
					dropFancy($("#amer"),"endBox");
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

		// Video
		var aa=$("#vidLink li"),context, rctxt, videocan,i=0,j=aa.length,film_div=$("#avd"),videoclone=film_div.find("video").clone(true);
		function initCanvas() 
		{
			videocan = document.getElementsByTagName("video")[0];
			reflection = document.getElementById("reflection");
			rctxt = reflection.getContext("2d");
			// flip canvas
			rctxt.translate(0,160);
			rctxt.scale(1,-1);
			// create gradient
			gradient = rctxt.createLinearGradient(0, 105, 0, 160);
			gradient.addColorStop(1, "rgba(255, 255, 255, 0.3)");
			gradient.addColorStop(0, "rgba(255, 255, 255, 1.0)");
			rctxt.fillStyle = gradient;
			rctxt.rect(0, 105, 320, 160);
			videocan.addEventListener("play", paintFrame, false);
			if (videocan.readyState >= videocan.HAVE_METADATA) 
				startPlay();
			else 
				videocan.addEventListener("loadedmetadata", startPlay, false);
		}
		function startPlay() { videocan.play(); }
		function paintFrame() 
		{
			// draw frame, and fill with the opacity gradient mask
			rctxt.drawImage(videocan, 0, 0, 320, 160);
			rctxt.globalCompositeOperation = "destination-out";
			rctxt.fill();
			// restore composition operation for next frame draw
			rctxt.globalCompositeOperation = "source-over";
			if (videocan.paused || videocan.ended) return;
			setTimeout(function () {paintFrame();}, 0);
		}
		function yeniVideo()
		{
			i=(i+1)%j;
			console.log(i);
			aa.eq(i).click();
		}

		initCanvas() 

		aa.click(function(){
			film_div.hide("drop", { direction: "down" }, 5000);
			var $this=$(this),p=film_div.find(".uyari");
			i=$this.data("sira");
			aa.find(".uyari").removeClass("uyari");
			$this.addClass("uyari");
			film_div.find("video").remove();
			videoclone.attr("src","http://vid.ly/"+$this.attr("id")+"?content=video");
			film_div.prepend(videoclone).show("drop", { direction: "up" }, 5000);
			initCanvas() 
		});

		var timestamps = [],last = 0,all = 0,now = 0,old = 0,j=0;
		$('article').each(function(o){
	      		if($(this).attr('data-start'))
				timestamps.push({start : +$(this).attr('data-start'),end : +$(this).attr('data-end'),elm : $(this)});
	    	});
	    	all = timestamps.length;
	    	$('video').bind('timeupdate',function(event){
	     		now = parseInt(this.currentTime);
	      		if(now > old)
				showsection(now);
	      		old = now;
	    	});
	    	function showsection(t){
	      		for(j=0;j<all;j++){
				if(t >= timestamps[j].start && t <= timestamps[j].end)
		  			timestamps[j].elm.removeClass('sakla');
				else
		  			timestamps[j].elm.addClass('sakla');
	      		}
		};
	}
});
