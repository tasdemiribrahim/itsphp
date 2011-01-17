var voteTime,commentTime,flickrTime,db,veri;

function isle(cevap)
{
	var parcalar= cevap.split("|");
	if(parcalar[0]=="1986-08-12")
	{
		veri[0]=11;
		veri[1]="İbrahim Taşdemir";
	}
	$("#aileBireyIDHidden").val(veri[0]);
	$('#aileAgacDetayImg').attr('src',getResim(veri[0],"aile"));
	$('#aileBireyDuzenleButton').attr("href","/main/aile/form/"+veri[0]);
	if(parcalar[1]=="0000-00-00")
		parcalar[1]="";
	else
		parcalar[1]="/ "+parcalar[1];
	$("#aileAgaciDetayDiv h3").html(veri[1]+" ("+parcalar[0]+parcalar[1]+")");
	var i=2;
	$("#aileAgaciDetayDiv span").each(function(){ $(this).html(parcalar[i++]);	});   
	commentTime=setTimeout(get_comments, 250);
	voteTime=setTimeout(set_votes, 500);
	flickrTime=setTimeout(function () { loadFlickrFoto($('#aileAgacDetayFlickr').html()); },750);
	$('#photobar').stop().animate({'bottom':'-96px'},200,function(){
		$('#images').css('bottom','-125px');
	});
	deleteNotice();
}

function set_votes() 
{
	$.ajax({
		data: "ailePuanIDAl="+$("#aileBireyIDHidden").val(),
		success: function(cevap)
		{
			var parcalar=cevap.split("|");
			var star=$("#rate_widget").find('.star_' + parcalar[0]);
			star.prevAll().andSelf().addClass('ratings_vote');
			star.nextAll().removeClass('ratings_vote'); 
			$("#rate_widget").find('.total_votes').text(parcalar[1] + ' oy kullanıldı (' + parcalar[2] + ' puan)' );
		}
	});
}

function get_comments() 
{
	$.ajax({
		data: "aileYorumIDAl="+$("#aileBireyIDHidden").val(),
		success: function(cevap)
		{	
			cevaplar=cevap.split("|");
			$(".cmnt_hdr").html(cevaplar[1] + " Yorum...");
			$('#comments').hide().html(cevaplar[0]).slideDown();
		}
	});
}

function aileAgaciDetayDoldur(veriler)
{
	if(voteTime) clearTimeout(voteTime);
	if(commentTime) clearTimeout(commentTime);
	if(flickrTime) clearTimeout(flickrTime);
	
	if (db)
		db.transaction(function (tx) {tx.executeSql("REPLACE INTO itsphp (sayfa, veri) VALUES(?, ?)", ["aile", veriler]);});
	else if (Modernizr.localstorage)
		localStorage.setItem("aile",veriler);
	else if (Modernizr.sessionStorage)
		sessionStorage.setItem("aile",veriler);
	else
		$.cookie("aile", veriler, cookieOptions);
	veri=veriler.split("-");
	addNotice("<p>" + veri[1] + " bilgileri alınıyor.<br />Lütfen bekleyin!</p>");
	$('p.r,hr.r').remove();
	/*if(Modernizr.webworkers)
	{
		var worker = new Worker("worker/aile.js");
		worker.postMessage('akrabaAd='+veri[0]);
		worker.onmessage = function (event) {
alert(event.data);
		 	isle(event.data);
		};
	}
	else
	$.ajax({
		data: 'akrabaAd='+veri[0],
		success: function(cevap){ isle(cevap); }
	});*/
	$.ajax({
		type: 'GET',  
		async: true,
		cache: true,
		dataType :"jsonp",
		url: 'http://itsphp.couchone.com/itsphp/aile'+veri[0],
		success: function(cevap){ 
			$("#aileBireyIDHidden").val(veri[0]);
			$('#aileAgacDetayImg').attr('src',getResim(veri[0],"aile"));
			$('#aileBireyDuzenleButton').attr("href","/main/aile/form/"+veri[0]);
			if(cevap.olum=="0000-00-00")
				cevap.olum="";
			else
				cevap.olum="/ "+cevap.olum;
			$("#aileAgaciDetayDiv h3").html(veri[1]+" ("+cevap.dogum+cevap.olum+")");
			var i=$("#aileAgaciDetayDiv span");
			i.eq(0).html(cevap.es);
			$("#aileAgaciDetayDiv .adr").html(cevap.adres);  
			$("#aileAgaciDetayDiv .email").html(cevap.mail); 
			$("#aileAgaciDetayDiv .tel").html(cevap.tel);  
			i.eq(4).html(cevap.msn);
			$("#aileAgaciDetayDiv #aileAgacDetayTwitter").html(cevap.twitter);  
			$("#aileAgaciDetayDiv #aileAgacDetayFlickr").html(cevap.flickr);  
			i.eq(7).html(cevap.tanim);
			get_comments();
			set_votes();
			loadFlickrFoto(cevap.flickr);
			$('#photobar').stop().animate({'bottom':'-96px'},200,function(){
				$('#images').css('bottom','-125px');
			});
			deleteNotice();
		}
	});
}

$(document).ready(function() {	
	//window.log("aile_agaci.js DOM Yuklendi.");

	if(Modernizr.websqldatabase) 
	{
		db = openDatabase("itsphp", "1.0", "ibrahim tasdemirin kisisel ana sayfasi", 2 * 1024 * 1024);
		db.transaction(function (tx) {tx.executeSql("CREATE TABLE IF NOT EXISTS itsphp(sayfa, veri)");});
	}

	activateMain();  

	var kayGun="";
	$.ajaxSetup({
		type: 'GET',
		timeout: 20000,    
		async: true,
		cache: true,
		url: '/main/ajax/aile',
		beforeSend: function(){	$(".progress").show();	},
		complete:function(){	$(".progress").fadeOut();	},
		error: function(xhr, status) { $(".progress").fadeOut(); }
	});

	$.getScript("http://jquery.bassistance.de/treeview/jquery.treeview.js", function () {
		$("#aileListe ul").treeview({'collapsed':true,persist: "cookie",prerendered: false,animated: "fast"});
	});

	getScript("js/aile_extra.js");

	if(db)
		db.transaction(function (tx) 
		{
			tx.executeSql('SELECT * FROM itsphp WHERE sayfa="aile"', [], function(tx, results) 
			{
				if(results.rows.length>0)
					aileAgaciDetayDoldur(results.rows.item(results.rows.length-1).veri);
			});
		});
	else if (Modernizr.localstorage && localStorage.getItem("aile"))
		aileAgaciDetayDoldur(localStorage.getItem("aile"));
	else if (Modernizr.sessionStorage && sessionStorage.getItem("aile"))
		aileAgaciDetayDoldur(sessionStorage.getItem("aile"));
	if ($.cookie("aile"))
		aileAgaciDetayDoldur($.cookie("aile"));

	$('#search_form').validate({
		rules: {q: "required" },
		messages: {q: "Kişinin adını girin!"},
		submitHandler: function(form) {
			$('.r').remove();
			console.log($("#q").val());
			if($("#q").val().length<2) return false;
			$.ajax({
				data: "aileAraAd="+$("#q").val(),
				success:function(cevap){
					console.log(cevap);
					if(cevap=="&") $('#search_form').append("<hr /><p class='r'>Arama bulunamadı!</p><hr />");
					else
					{
						var parca=cevap.split("&"),mesaj="";		
						if(parca[1]!="") mesaj="<p class='r'>Bunu mu demek istediniz?</p>";		
						var parcalar=parca[1].split("|");
						var i=parcalar.length-2;
						for(;i>0;i=i-2)
							mesaj +="<p class='r'><a href='#' id='"+parcalar[i-1]+"' name='"+parcalar[i-1]+"' class='searchResultData'>"+parcalar[i-1]+"-"+parcalar[i]+"</a></p>";		
						parcalar=parca[0].split("|");
						i=parcalar.length-2;
						mesaj +="<hr class='r' />";
						for(;i>0;i=i-2)
							mesaj +="<p class='r'><a href='#' id='"+parcalar[i-1]+"' name='"+parcalar[i-1]+"' class='searchResultData'>"+parcalar[i-1]+"-"+parcalar[i]+"</a></p>";
						$('#search_form').append(mesaj+"<hr />");
					}
				}
			});
			return false;
		}
	});
	
	$('#rcnt a.searchResultData').live("click",function(){
		aileAgaciDetayDoldur($(this).html());
		return false;
	});
	
	$('#rate_widget .ratings_stars').hover(
		function() {
			$(this).prevAll().andSelf().addClass('ratings_over');
			$(this).nextAll().removeClass('ratings_vote'); 
		},
		function() {
			$(this).prevAll().andSelf().removeClass('ratings_over');
		}
	).bind('click', function() {
		$.ajax({
			data: "yildiz="+$(this).attr('class')+"&ailePuanlaID="+$("#aileBireyIDHidden").val(),
			success:function(){	
				set_votes();
				addNotice("<p>Oyunuz kaydedilmiştir!</p>");
			}
		}); 
	});
	$('#rate_widget').hover(function(){},function() {set_votes();});
	
	var resimBtnUpload=$('#resimUpload');
	var ajaxUploadJS = new AjaxUpload(resimBtnUpload, {
		action: '/main/ajax/aile',
		name: 'uploadResim',
		allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
		sizeLimit: 1000000,
        	onSubmit: function(file, ext){
		    if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
			addNotice("<p>Sadece JPG, PNG veya GIF resimleri yüklenebilir!</p>");
		        return false;
		    }
			addNotice("<p>Resim yükleniyor....</p>");
        },
        onComplete: function(file, uniqueFile){
		var matches,mesajlar=["<p>Resim başarıyla yüklendi...</p>",
		"<p>Resmin boyutu çok fazla, 63 KB'tan daha fazla olamaz.</p>",
		"<p>Gizli MAX_FILE_SIZE alanına göre dosya boyutu fazla. Parametreleri değiştirmek için site yöneticisiyle irtibata geçin!</p>",
		"<p>Dosyayı yüklerken bir hata oluştu, lütfen tekrar deneyin.</p>",
		"<p>Yüklenecek bir dosya seçmediniz, lütfen tekrar deneyin.</p>",
		"<p>Bilinmeyen bir hata meydana geldi, lütfen tekrar deneyin.</p>",
		"<p>Bir PNG,GIF veya JPEG resmi yükleyebilirsiniz, lütfen tekrar deneyin.</p>",
		"<p>Dosya açma başarısız. Lütfen tekrar deneyin.</p>",
		"<p>Bir PNG,GIF veya JPEG resmi yükleyebilirsiniz, lütfen tekrar deneyin.</p>",
		"<p>Resim kaydedilemedi, lütfen tekrar deneyin.</p>",
		"<p>Resim boyutu sunucu ayarlarından yüksek.</p>"];
		if(uniqueFile=="")
			addNotice("<p>Resim kaydedilemedi, boyutu fazla.</p>");
            	else if (/^error[1-9]+$/.test(uniqueFile))
		{
			matches=uniqueFile.match(/^error([1-9]+)$/); 
			addNotice(mesajlar[matches[1]]);
		}
		else
		{
			addNotice(mesajlar[0]);
			$.ajax({
				data: 'resimHedefAileAd='+$("#aileBireyIDHidden").val()+'&fileName='+uniqueFile,
				success: function(cevap)
				{
					$('#aileAgacDetayImg').attr('src',cevap);
				}
				});
		}
        }
    });
	
	var username="";	//"marcofolio"
	var currentPage = 1;
	var pageSize = 15;
	var appendTweet = function(tweet, id) {$("<p />").html(tweet).appendTo($("#tweets"));};
	var loadTweets = function(url) {
		var url = "http://twitter.com/status/user_timeline/"+username+".json?count="+pageSize+"&page="+currentPage+"&callback=?";
		$.getJSON(url,function(data) {
			$.each(data, function(i, post) {
				appendTweet(post.text, post.id);
			});
			$("#loadingTweets").fadeOut();
		});
	};
	$("#tweets").scroll(function() {
		if ($(this).outerHeight() - $(this)[0].scrollHeight + $(this).scrollTop() > -1 ) {
			currentPage++;
			$("#loadingTweets").fadeIn();
			loadTweets();
		}
	});		
	$('#followTwitter').bind("click",function(){
		$("#tweets").html("");
		username = $("#aileAgacDetayTwitter").html();
		if(username!="")
		{
			loadTweets();
			$('#bounceBox').bounceBoxShow();
		}
		else addNotice("<p>Kullanıcı adı yok.</p>");
		return false;
	});
	
	$("#aileListe ul a").each(function(){
		$(this).after($(this).html()).remove();
	});
	
	var data;
	 
	$('#aileListe ul li').bind("dblclick",function(event)
	{
		data=$(this).attr('id');
		$.doTimeout( 't', $.tripleclickThreshold, function(){
			aileAgaciDetayDoldur(data);
		});
		return false;
	});
	 
	$.getScript("http://github.com/cowboy/jquery-dotimeout/raw/v1.0/jquery.ba-dotimeout.min.js", function () {
		$('#aileListe ul li').bind( 'tripleclick',500, function(event){
			$.doTimeout( 't' );
			veri=$(this).attr("title").split("-");
			window.location = getSiteName()+"main/aile/form/"+veri[0];
		});
	});
	//$.tripleclickThreshold = 5000;

	$('#aileListe ul li:not(:has(ul))').css({'list-style-image':'none'});
	
	var working = false;
	$("#addCommentForm").validate({
		errorLabelContainer : $("#uyari"),
		debug: false,
		rules: {
			commentName: "required",
			commentEMail: {required:true,email:true},
			commentUrl:"url",
			commentBody:"required"
		},
		messages: {
			commentName: "Adınızı girin!<br>",
			commentEMail:{required:"Bir e-mail adresi girin!<br>",email:"E-mail format kontrol edin!<br>"},
			commentUrl:"URL format kontrol edin!<br>",
			commentBody:"Bir mesaj yaz!<br>"
		},
		submitHandler: function(form){
			if(working) return false;
			if($('#fax').val()!="") return false;
			working = true;
			$('#addCommentForm input[type="submit"]').val('Bekleyin...');
			$('span.error').remove(); 
			$.ajax({
				type : 'POST',
				dataType :"json",
				data : $('#addCommentForm').serialize(),
				success: function(msg){
					working = false;
					$("#cmnt_hdr span").text(1+parseInt($("#cmnt_hdr span").text()));
					$('#addCommentForm input[type="submit"]').val('Kaydet');
					$(msg.html).hide().appendTo('#comments').slideDown();
					$('#commentBody,#commentName,#commentEMail,#commentUrl').val('');
			}});
		  	return false;
		}
	});

	if(!Modernizr.borderimage) $("#aileAgacDetayImg").css({"width":"100%","border-width":"0"});
});

function loadFlickrFoto(user_id) {
	var api_key 			= '5695b987ebb20ad52a6a6b52d9b32b1f';	
	var large_image_size 	= 'Medium';
	var photo_set_id,photo_id;
	var current	= -1;
	var continueNavigation = false;
	var sets_service 		= 'http://api.flickr.com/services/rest/?&method=flickr.photosets.getList' + '&api_key=' + api_key;
	var sets_url			= sets_service + '&user_id=' + user_id + '&format=json&jsoncallback=?';
	var photos_service 		= 'http://api.flickr.com/services/rest/?&method=flickr.photosets.getPhotos' + '&api_key=' + api_key;
	var large_photo_service = 'http://api.flickr.com/services/rest/?&method=flickr.photos.getSizes' + '&api_key=' + api_key;
	var $setsContainer 		= $('#sets').find('ul');
	$setsContainer.html("");
	var $photosContainer 	= $('#images').find('ul');
	$photosContainer.html("");
	var $photopreview		= $('#flickr_photopreview');
	var $flickrOverlay		= $('#flickr_overlay');
	$flickrOverlay.html("");
	var $loadingStatus		= $('#flickr_toggle').find('.loading_small');
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
		var images_loaded 	= 0;
		$('.toLoad:in-viewport').each(function(i){
			var $space			= $setsContainer.find('.toLoad:first');
			var $img 			= $('<img style="display:none;" />').load(function(){
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
					var photo			= data.photoset.photo[i];
					var photoid			= photo.id;
					var secret			= photo.secret;
					var server			= photo.server;
					var farm			= photo.farm;
					var photoUrl		= 'http://farm'+farm+'.static.flickr.com/'+server+'/'+photoid+'_'+secret+'_s.jpg';
					var $elem 			= $('<li />');
					var $link 			= $('<a class="toLoad" href="#" />');
					$link.data({
						'photoid'		:photoid,
						'secret'		:secret,
						'server'		:server,
						'farm'			:farm,
						'photoUrl'		:photoUrl,
						'photo_title'	:photo.title
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
		var toLoad 			= $('.toLoad:in-viewport').size();
		if(toLoad > 0)
			$loadingStatus.css('visibility','visible');
		var images_loaded 	= 0;
		$('.toLoad:in-viewport').each(function(i){
			var $space			= $photosContainer.find('.toLoad:first');
			var $img 			= $('<img style="display:none;" />').load(function(){
				++images_loaded;
				if(images_loaded == toLoad){
					$loadingStatus.css('visibility','hidden');
					$photosContainer.find('img').fadeIn();
					if(continueNavigation){
						continueNavigation 	= false;
						var $thumb 			= $photosContainer.find('li:nth-child(' + parseInt(current + 1) + ')').find('img');
						photo_id 			= $thumb.attr('alt');
						LoadLargePhoto();
					}
				}	
			}).error(function(){
				++images_loaded;
				if(images_loaded == toLoad){
					$loadingStatus.css('visibility','hidden');
					$photosContainer.find('img').fadeIn();
					if(continueNavigation){
						continueNavigation 	= false;
						var $thumb 			= $photosContainer.find('li:nth-child(' + parseInt(current + 1) + ')').find('img');
						photo_id 			= $thumb.attr('alt');
						LoadLargePhoto();
					}
				}				
			}).attr('src',$space.data('photoUrl'))
			  .attr('alt',$space.data('photoid'));
			var $photo_title	= $('<span/>',{'html':$space.data('photo_title')});
			$space.append($photo_title).append($img).removeClass('toLoad');
		});
	}
	function LoadLargePhoto(){
		window.log("large foto yuklendi");
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
