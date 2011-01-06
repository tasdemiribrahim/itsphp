$("#FS_slider section").width($("#FS_slider").width()-13);
var t,pixels,vP,slide = 1,slider_width =$("#FS_slider section").width(),num_slides = $("#FS_slider section").length,db;
if ($.browser.webkit) 
	vP = "-webkit-";
else if ($.browser.msie) 
	vP = "-ms-";
else if ($.browser.mozilla) 
	vP = "-moz-";
else if ($.browser.opera) 
	vP = "-o-";
function slideTo(slide, width) 
{
	pixels = width * (slide - 1);	
	$("#FS_controls a").removeClass("active");	
	$("#FS_controls a[href=#content"+slide+"]").addClass("active");
	if (Modernizr.csstransforms3d && Modernizr.csstransforms && Modernizr.csstransitions) 
		$("#FS_holder").css(vP+"transform","translate3d(-"+pixels+"px, 0px, 0px)").css("transform","translate3d(-"+pixels+"px, 0px, 0px)");		
	else if (Modernizr.csstransforms && Modernizr.csstransitions) 
		$("#FS_holder").css(vP+"transform","translate(-"+pixels+"px, 0px)").css("transform","translate(-"+pixels+"px, 0px)");		
	else if (Modernizr.csstransitions) 
		$("#FS_holder").css("margin-left","-"+pixels+"px");
	else 
		$("#FS_holder").animate({"margin-left":"-"+pixels+"px"},600); //If you animate left, IE breaks.	
}
function autoSlide()
{
	slide++;
	if (slide > num_slides) 
		slide = 1;
	slideTo(slide,slider_width);
}
function startTimer() 
{
	t = setInterval(autoSlide,100000);
}
function stopTimer() 
{
	clearInterval(t);
}
$('html').addClass('js-on');

//console.log("admin_ayarlar.js Yuklendi.");
function heavyGrupDetayGetir(grupIDJS,markYaziJS,markYaziYaziJS)
{           
	var art=$("#rcnt article");
      	art.hide("blind", { direction: "vertical" }, 5000);
	_gaq.push(['_trackEvent', 'Grup', grupIDJS]);
	if (db)
		db.transaction(function (tx) {tx.executeSql("REPLACE INTO itsphp (sayfa, veri) VALUES(?, ?)", ["muzik", grupIDJS]);});
	else if (Modernizr.localstorage)
		localStorage.setItem("muzik",grupIDJS);
	else if (Modernizr.sessionstorage)
		sessionStorage.setItem("muzik", grupIDJS);
	else
		$.cookie("muzik", grupIDJS, cookieOptions);
	$.ajax({
		data: 'gosterilecekGrupID='+grupIDJS+"&markYazi="+markYaziJS+"&markYaziYazi="+markYaziYaziJS,
		success: function(cevap){
			if(!cevap) art.show("blind", { direction: "vertical" }, 5000);
			var parcalar= cevap.split("}"),veriler;
			var grupInfoJS=parcalar[0].split("|");
			art.find("h3").html(grupInfoJS[0]+":").next().html(grupInfoJS[1]);
			var grupElemanInfoJS=parcalar[1].split("&");
			var i=grupElemanInfoJS.length-1,mesaj="";
			while(i--)
			{
				veriler=grupElemanInfoJS[i].split("|");
				mesaj+="<li><span class=\"twitter_search\">"+veriler[0]+"</span>("+veriler[1]+")</li>";
			}
			art.find("ul").eq(0).html(mesaj);
			mesaj="";
			var grupAlbumInfoJS=parcalar[2].split("&");
			var i=grupAlbumInfoJS.length-1;
			while(i--)
			{
				veriler=grupAlbumInfoJS[i].split("|");
				mesaj+="<li>"+veriler[1]+"-<span class=\"twitter_search\">"+veriler[0]+"</span></li>";
			}
			art.find("ul").eq(1).html(mesaj);
			mesaj="";
			art.show("blind", { direction: "vertical" }, 5000);
			$('.twitter_search').twitterpopup();
		}
	});
}

$(document).ready(function() {	

	if(Modernizr.websqldatabase) 
	{
		db = openDatabase("itsphp", "1.0", "ibrahim tasdemirin kisisel ana sayfasi", 2 * 1024 * 1024);
		db.transaction(function (tx) {tx.executeSql("CREATE TABLE IF NOT EXISTS itsphp(sayfa, veri)");});
	}
	
	activateMain();
	 $.ajaxSetup({
	        type: 'GET',
	        timeout: 20000,  
	        cache: true,
	        url: '/main/index/ajax',
			beforeSend: function(){	$(".progress").show();	},
			complete:function(){	$(".progress").fadeOut();	},
			error: function(xhr, status) { $(".progress").fadeOut(); }
	    });

	$("#rssTakip").append('<a href="http://feeds.feedburner.com/muzik-itsphp" target="_blank" rel="nofollow" type="application/rss+xml" title="Müzik RSS Haberleri"><img src="http://www.feedburner.com/fb/images/pub/feed-icon32x32.png" alt="Müzik-ITSPHP" /></a>');
	
	startTimer();
	$("#FS_slider #FS_holder").width(slider_width * num_slides).height($("#FS_slider section").height());	
	$("#FS_slider").hover(	function () {	stopTimer();	},	function () {	startTimer();	} );
	$("#FS_controls a").not("#FS_right,#FS_left").bind("click",function(){
		slide = parseInt($(this).attr("href").replace("#content", ""));
		slideTo(slide,slider_width);
		return false;
	});
	$("#FS_right").bind("click",function(){
		slide++;
		if (slide > num_slides) 
			slide = 1;
		slideTo(slide,slider_width);
	});
	$("#FS_left").bind("click",function(){
		slide--;
		if (slide < 1) 
			slide = num_slides;
		slideTo(slide,slider_width);
	});

	 $.getScript("http://demo.tutorialzine.com/2010/07/youtube-api-custom-player-jquery-css/youTubeEmbed/youTubeEmbed-jquery-1.0.js", function () {
		$('.heavyTable').bind("click",function(e){
			if($(e.target).is("img"))
			{
				$('#player').html("").youTubeEmbed({  video : 'http://www.youtube.com/watch?v='+$(e.target).attr("id"),  width : 400 }); 
				$('#bounceBox').bounceBoxShow();
			}
		});
	});
	
	$(".heavyTable a").bind("click",function(){
		_gaq.push(['_trackEvent', 'GrupDetay', $(this).attr("id")]);
		heavyGrupDetayGetir($(this).attr("id"),0,"");
		return false;
	});

	if(db)
		db.transaction(function (tx) 
		{
			tx.executeSql('SELECT * FROM itsphp WHERE sayfa="muzik"', [], function(tx, results) 
			{
				if(results.rows.length>0)
					heavyGrupDetayGetir(results.rows.item(results.rows.length-1).veri,0,"");
			});
		});
	else if (Modernizr.localstorage && localStorage.getItem("muzik"))
		heavyGrupDetayGetir(localStorage.getItem("muzik"),0,"");
	else if (Modernizr.sessionStorage && sessionStorage.getItem("muzik"))
		heavyGrupDetayGetir(sessionStorage.getItem("muzik"),0,"");
	else if ($.cookie("muzik"))
		heavyGrupDetayGetir($.cookie("muzik"),0,"");
	
	$.getScript("/main/js/jquery/jquery.jplayer.min.js", function () {
		var playItem = 0;

		if(db)
			db.transaction(function (tx) 
			{
				tx.executeSql('SELECT * FROM itsphp WHERE sayfa="playlist"', [], function(tx, results) 
				{
					if(results.rows.length>0)
						playItem=results.rows.item(results.rows.length-1).veri;
				});
			});
		else if (Modernizr.localstorage && localStorage.getItem("playlist"))
			playItem=localStorage.getItem("playlist");
		else if (Modernizr.sessionStorage && sessionStorage.getItem("playlist"))
			playItem=sessionStorage.getItem("playlist");
		else if ($.cookie("playlist"))
			playItem=$.cookie("playlist");

		var myPlayList = [
			{name:"James Allen - Introduction<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/01-jamesallen-introduction.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/01-jamesallen-introduction.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/01-jamesallen-introduction.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/01-jamesallen-introduction.ogg"},
			{name:"Partition 36 - Cyberpunks<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/02-partition-36-cyberpunks.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/02-partition-36-cyberpunks.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/02-partition-36-cyberpunks.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/02-partition-36-cyberpunks.ogg"},
			{name:"My Brother And I - What a Night<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/03-mybrotherandi-whatanight.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/03-mybrotherandi-whatanight.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/03-mybrotherandi-whatanight.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/03-mybrotherandi-whatanight.ogg"},
			{name:"Lee Fernandes - PHP<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/04-leefernandes-php.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/04-leefernandes-php.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/04-leefernandes-php.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/04-leefernandes-php.ogg"},
			{name:"Jazpicious - You Make Me Feel<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/05-jazpicious-youmakemefeel.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/05-jazpicious-youmakemefeel.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/05-jazpicious-youmakemefeel.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/05-jazpicious-youmakemefeel.ogg"},
			{name:"The Compilers - Sleep Tick v2<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/06-thecompilers-sleeptickv-2.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/06-thecompilers-sleeptickv-2.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/06-thecompilers-sleeptickv-2.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/06-thecompilers-sleeptickv-2.ogg"},
			{name:"Sea of Arrows - Gravity Amplifier<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/07-seaofarrows-gravityamplifier.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/07-seaofarrows-gravityamplifier.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/07-seaofarrows-gravityamplifier.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/07-seaofarrows-gravityamplifier.ogg"},
			{name:"Sean McCracken - Audua<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/08-seanmccracken-audua.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/08-seanmccracken-audua.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/08-seanmccracken-audua.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/08-seanmccracken-audua.ogg"},
			{name:"An Early Morning Letter, Displaced - Strangling Strangers<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/09-anearlymorningletter-displac.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/09-anearlymorningletterdisplace.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/09-anearlymorningletter-displac.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/09-anearlymorningletterdisplace.ogg"},
			{name:"Bugbear - A Mother's Love<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/10-bugbear-amotherslove.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/10-bugbear-amotherslove.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/10-bugbear-amotherslove.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/10-bugbear-amotherslove.ogg"},
			{name:"Sleepwalker - The White Lodge<a class='mp3' target='_blank' rel='nofollow' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/11-sleepwalker-thewhitelodge.mp3' title='MP3 İndir'>MP3 İndir</a><a class='ogg' target='_blank' href='http://ibrahimtasdemir.mysites.com/get_file/emergant/11-sleepwalker-thewhitelodge.ogg' rel='nofollow' title='OGG İndir'>OGG İndir</a>",mp3:"http://ibrahimtasdemir.mysites.com/get_file/emergant/11-sleepwalker-thewhitelodge.mp3",ogg:"http://ibrahimtasdemir.mysites.com/get_file/emergant/11-sleepwalker-thewhitelodge.ogg"}
		];
		var jpPlayTime = $("#jplayer_play_time");
		var jpTotalTime = $("#jplayer_total_time");

		$("#jquery_jplayer").jPlayer({	ready: function() {displayPlayList();playListInit(false); }, oggSupport: true ,swfPath: "/main/js", preload: "auto" })
		.jPlayer("onProgressChange", function(loadPercent, playedPercentRelative, playedPercentAbsolute, playedTime, totalTime) {
			jpPlayTime.text($.jPlayer.convertTime(playedTime));
			jpTotalTime.text($.jPlayer.convertTime(totalTime));
		})
		.jPlayer("onSoundComplete", function() {	playListNext(); });
		$("#jplayer_previous").bind("click",function() {	playListPrev();	$(this).blur();	return false;	});
		$("#jplayer_next").bind("click",function() {	playListNext();	$(this).blur();	return false;	});	
		function displayPlayList() {
			$("#jplayer_playlist ul").empty();
			for (i=0; i < myPlayList.length; i++) {
				var listItem = (i == myPlayList.length-1) ? "<li class='jplayer_playlist_item_last'>" : "<li>";
				listItem += "<a href='#' id='jplayer_playlist_item_"+i+"' tabindex='1'>"+ myPlayList[i].name +"</a></li>";
				$("#jplayer_playlist ul").append(listItem);
				$("#jplayer_playlist_item_"+i).data( "index", i ).click( function() {
					var index = $(this).data("index");
					if (playItem != index) {
						playListChange( index );
					} else {
						$("#jquery_jplayer").jPlayer("play");
					}
					$(this).blur();
					return false;
				});
				$("#jplayer_playlist_get_mp3_"+i).data( "index", i ).click( function() {
					var index = $(this).data("index");
					$("#jplayer_playlist_item_"+index).trigger("click");
					$(this).blur();
					return false;
				});
			}
		}

		function playListInit(autoplay) 
		{
			if(autoplay) 
				playListChange( playItem );
			else 
				playListConfig( playItem );
		}

		function playListConfig( index ) 
		{
			$("#jplayer_playlist_item_"+playItem).removeClass("jplayer_playlist_current").parent().removeClass("jplayer_playlist_current");
			$("#jplayer_playlist_item_"+index).addClass("jplayer_playlist_current").parent().addClass("jplayer_playlist_current");
			playItem = index;
			$("#jquery_jplayer").jPlayer("setFile", myPlayList[playItem].mp3, myPlayList[playItem].ogg);
		}

		function playListChange( index ) 
		{ 
			if (db)
				db.transaction(function (tx) {tx.executeSql("REPLACE INTO itsphp (sayfa, veri) VALUES(?, ?)", ["playlist", index]);});
			else if (Modernizr.localstorage)
				localStorage.setItem("playlist",index);
			else if (Modernizr.sessionstorage)
				sessionStorage.setItem("playlist", index);
			else
				$.cookie("playlist", index, cookieOptions);
			playListConfig( index );
			$("#jquery_jplayer").jPlayer("play");	
		}

		function playListNext() { var index = (playItem+1 < myPlayList.length) ? playItem+1 : 0; playListChange( index ); }

		function playListPrev() { var index = (playItem-1 >= 0) ? playItem-1 : myPlayList.length-1;	playListChange( index );	 }

        });
});
