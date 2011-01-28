var voteTime,commentTime,flickrTime,db,veri;

$.fn.infCour = function () {
    function repeat(str, num) {
        return new Array( num + 1 ).join( str );
    }
    return this.each(function () {
        var $wrapper = $('> div', this).css('overflow', 'hidden'),
            $slider = $wrapper.find('> ul'),
            $items = $slider.find('> li'),
            $single = $items.filter(':first'),
            singleWidth = $single.outerWidth(), 
            visible = Math.ceil($wrapper.innerWidth() / singleWidth),
            currentPage = 1,
            pages = Math.ceil($items.length / visible);            
        if (($items.length % visible) != 0) {
            $slider.append(repeat('<li class="empty" />', visible - ($items.length % visible)));
            $items = $slider.find('> li');
        }
        $items.filter(':first').before($items.slice(- visible).clone().addClass('cloned'));
        $items.filter(':last').after($items.slice(0, visible).clone().addClass('cloned'));
        $items = $slider.find('> li');
        $wrapper.scrollLeft(singleWidth * visible);
        function gotoPage(page) {
            var dir = page < currentPage ? -1 : 1,
                n = Math.abs(currentPage - page),
                left = singleWidth * dir * visible * n;
            $wrapper.filter(':not(:animated)').animate({
                scrollLeft : '+=' + left
            }, 1000, function () {
                if (page == 0) {
                    $wrapper.scrollLeft(singleWidth * visible * pages);
                    page = pages;
                } else if (page > pages) {
                    $wrapper.scrollLeft(singleWidth * visible);
                    page = 1;
                } 
                currentPage = page;
            });    
            return false;
        }
        $wrapper.after('<a class="infia downBlue back">&lt;</a><a class="infia upBlue forward">&gt;</a>');
        $('a.back', this).bind("click",function () {
            return gotoPage(currentPage - 1);
        });
        $('a.forward', this).bind("click",function () {
            return gotoPage(currentPage + 1);
        });
        $(this).bind('goto', function (event, page) {
            gotoPage(page);
        }).bind('next', function () {
	    return gotoPage(currentPage + 1);
	});
    });  
};

function pbd()
{
	$('#photobar').stop().animate({'bottom':'-96px'},200,function(){
		$('#images').css('bottom','-125px');
	});
}

function isle(cevap)
{
	if(voteTime) clearTimeout(voteTime);
	if(commentTime) clearTimeout(commentTime);
	if(flickrTime) clearTimeout(flickrTime);

	var parcalar= cevap.split("|");
	if(parcalar[0]=="1986-08-12")
	{
		veri[0]=11;
		veri[1]="İbrahim Taşdemir";
	}
	$("#aidh").val(veri[0]);
	$('#aadi').attr('src',getResim(veri[0],"aile"));
	$('#abdb').attr("href","/main/aile/form/"+veri[0]);
	if(parcalar[1]=="0000-00-00")
		parcalar[1]="";
	else
		parcalar[1]="/ "+parcalar[1];
	$("#aadd h3").html(veri[1]+" ("+parcalar[0]+parcalar[1]+")");
	var i=2;
	$("#aadd span").each(function(){ $(this).html(parcalar[i++]);	});   
	commentTime=setTimeout(get_comments, 250);
	voteTime=setTimeout(set_votes, 500);
	flickrTime=setTimeout(function () { loadFlickrFoto($('#aadf').html()); },750);
	pbd();
	deleteNotice();
}

function set_votes() 
{
	$.ajax({
		data: "oy="+$("#aidh").val(),
		dataType:"json",
		success: function(cevap)
		{
			console.log(cevap);
			var star=$("#ratew").find('.s_' + cevap.on);
			star.prevAll().andSelf().addClass('srv');
			star.nextAll().removeClass('srv'); 
			$("#ratew").find('.stv').text(cevap.to + ' oy kullanıldı (' + cevap.ort + ' puan)' );
		}
	});
}

function get_comments() 
{
	$.ajax({
		data: "yorum="+$("#aidh").val(),
		dataType: "json",
		success: function(cevap)
		{	
			console.log(cevap);
			$(".cmnt_hdr").html(cevap.sayi + " Yorum...");
			$('#comments').hide().html(cevap.yorumlar).slideDown();
		}
	});
}

function aadd(veriler)
{
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
	$("#aidh").val(veri[0]);
	$.ajax({
		type: 'GET',  
		async: true,
		cache: true,
		dataType :"jsonp",
		url: 'http://itsphp.couchone.com/itsphp/aile'+veri[0],
		success: function(cevap){ 
			$('#aadi').attr('src',getResim(veri[0],"aile"));
			$('#abdb').attr("href","/main/aile/form/"+veri[0]);
			if(cevap.olum=="0000-00-00")
				cevap.olum="";
			else
				cevap.olum="/ "+cevap.olum;
			$("#aadd h3").html(veri[1]+" ("+cevap.dogum+cevap.olum+")");
			var i=$("#aadd span");
			i.eq(0).html(cevap.es);
			$("#aadd .adr").html(cevap.adres);  
			$("#aadd .email").html(cevap.mail); 
			$("#aadd .tel").html(cevap.tel);  
			$("#aadd #aadt").html(cevap.twitter);  
			$("#aadd #aadf").html(cevap.flickr);  
			i.eq(7).html(cevap.tanim);
			loadFlickrFoto(cevap.flickr);
			deleteNotice();
		}
	});
	pbd();
	get_comments();
	set_votes();
}

$(document).ready(function() {	
	//window.log("aile_agaci.js DOM Yuklendi.");

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
		$("#aliste ul").treeview({'collapsed':true,persist: "cookie",prerendered: false,animated: "fast"});
	});

	getScript("/main/js/aile_extra.js");

	var auto= true;
	$('.infCour').infCour().mouseover(function(){ auto=false; }).mouseout(function(){ auto=true; });
	setInterval(function(){if(auto){ $('.infCour').trigger('next') }},10000);
	 $.getScript("http://ufd.googlecode.com/svn-history/r111/trunk/examples/js/jquery.bgiframe.min.js", function () {
		$('#dialog').dialog({
			autoOpen: false,
			height: 280,
			modal: true,
			resizable: true,
			bgiframe: true
		}).removeClass("sakla");
	});

	$('.infCour').bind("click",function(e) {
		var figure=$(e.target).closest('figure');
		$("#ui-dialog-title-dialog").html(figure.children("figcaption").html());
		$('#dialog img').attr("src",figure.children("img").attr("src")).parent().dialog('open');
	});
	
	var sf=$('#sf');
	sf.validate({
		rules: {q: "required" },
		messages: {q: "Kişinin adını girin!"},
		submitHandler: function(form) {
			$('.r').remove();
			if($("#q").val().length<2) return false;
			$.ajax({
				data: "q="+$("#q").val(),
				dataType:"json",
				success:function(cevap){
					console.log(cevap);
					if(cevap=="") sf.append("<hr /><p class='r'>Arama bulunamadı!</p><hr />");
					else
					{
						var mesaj="";		
						if(cevap.mu) mesaj="<p class='r'>Bunu mu demek istediniz?</p>";		
						for(i in cevap.mu)
							mesaj +="<p class='r'><a href='#' id='"+cevap.mu[i].id+"'>"+cevap.mu[i].id+"-"+cevap.mu[i].ad+"</a></p>";		
						mesaj +="<hr class='r' />";	
						for(i in cevap.bu)
							mesaj +="<p class='r'><a href='#' id='"+cevap.bu[i].id+"'>"+cevap.bu[i].id+"-"+cevap.bu[i].ad+"</a></p>";
						sf.append(mesaj+"<hr class='r' />");
					}
				}
			});
			return false;
		}
	});

	if(db)
		db.transaction(function (tx) 
		{
			tx.executeSql('SELECT * FROM itsphp WHERE sayfa="aile"', [], function(tx, results) 
			{
				if(results.rows.length>0)
					aadd(results.rows.item(results.rows.length-1).veri);
			});
		});
	else if (Modernizr.localstorage && localStorage.getItem("aile"))
		aadd(localStorage.getItem("aile"));
	else if (Modernizr.sessionStorage && sessionStorage.getItem("aile"))
		aadd(sessionStorage.getItem("aile"));
	else if ($.cookie("aile"))
		aadd($.cookie("aile"));
	else
		set_votes();
	
	$('#rcnt .r a').live("click",function(){
		aadd($(this).html());
		return false;
	});
	
	$('#ratew .rates').hover(
		function() {
			$(this).prevAll().andSelf().addClass('sro');
			$(this).nextAll().removeClass('srv'); 
		},
		function() {
			$(this).prevAll().andSelf().removeClass('sro');
		}
	).bind('click', function() {
		$.ajax({
			dataType:"json",
			data: "yildiz="+$(this).attr('class')+"&id="+$("#aidh").val(),
			success:function(){	
				set_votes();
				addNotice("<p>Oyunuz kaydedilmiştir!</p>");
			}
		}); 
	});
	$('#ratew').hover(function(){},function() {set_votes();});
	
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
				data: 'id='+$("#aidh").val()+'&fileName='+uniqueFile,
				success: function(cevap)
				{
					$('#aadi').attr('src',cevap);
				}
				});
		}
        }});
	
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
		username = $("#aadt").html();
		if(username!="")
		{
			loadTweets();
			$('#bounceb').bounceBoxShow();
		}
		else addNotice("<p>Kullanıcı adı yok.</p>");
		return false;
	});
	
	$("#aliste ul a").each(function(){
		$(this).after($(this).html()).remove();
	});
	
	var data;
	 
	$('#aliste ul li').bind("dblclick",function(event)
	{
		data=$(this).attr('id');
		$.doTimeout( 't', $.tripleclickThreshold, function(){
			aadd(data);
		});
		return false;
	});
	 
	$.getScript("http://github.com/cowboy/jquery-dotimeout/raw/v1.0/jquery.ba-dotimeout.min.js", function () {
		$('#aliste ul li').bind( 'tripleclick',500, function(event){
			$.doTimeout( 't' );
			veri=$(this).attr("title").split("-");
			window.location = getSiteName()+"main/aile/form/"+veri[0];
		});
	});
	//$.tripleclickThreshold = 5000;
	
	var working = false;
	$("#adf").validate({
		debug: false,
		rules: {
			acn: "required",
			ace: {required:true,email:true},
			acu:"url",
			acb:"required"
		},
		messages: {
			acn: "Adınızı girin!<br>",
			ace:{required:"Bir e-mail adresi girin!<br>",email:"E-mail format kontrol edin!<br>"},
			acu:"URL format kontrol edin!<br>",
			acb:"Bir mesaj yaz!<br>"
		},
		submitHandler: function(form){
			if(working) return false;
			if($('#fax').val()!="") return false;
			working = true;
			$('#adf input[type="submit"]').val('Bekleyin...');
			$('span.error').remove(); 
			$.ajax({
				type : 'POST',
				dataType :"json",
				data : $('#adf').serialize(),
				success: function(msg){
					working = false;
					$("#cmnt_hdr span").text(1+parseInt($("#cmnt_hdr span").text()));
					$(msg.html).hide().appendTo('#comments').slideDown();
			}});
			$('#adf input:not(#aidh),#adf textarea').val("");
			$('#adf input[type="submit"]').val('Kaydet');
		  	return false;
		}
	});

	if(!Modernizr.borderimage) $("#aadi").css({"width":"100%","border-width":"0"});
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
