function activateGoogleFontAPI()
{
	WebFontConfig = { google: { families: [ 'IM+Fell+DW+Pica' ] }};
        var wf = document.createElement('script');
        wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +  '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.async = 'false';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
}

(function($){
	$.fn.bounceBox=function()
	{
		var pos = 'fixed';
		if (jQuery.browser.msie && parseInt(jQuery.browser.version) == 6)
		{
			pos = 'absolute';
		}
		this.css({top : -(this.outerHeight()+2),marginLeft : -this.outerWidth()/2,position : pos,left : '50%'});
		return this;
	}
	$.fn.bounceBoxShow=function()
	{
		this.stop().animate({top:0},{easing:'easeOutBounce'});
		this.data('bounceShown',true);
		return this;
	}
	$.fn.bounceBoxHide=function()
	{
		this.stop().animate({top:-(this.outerHeight()+2)});
		this.data('bounceShown',false);
		return this;
	}
	$.fn.bounceBoxToggle=function()
	{
		if(this.data('bounceShown'))
			this.bounceBoxHide(); 
		else 
			this.bounceBoxShow();
		return this;
	}
})(jQuery);

function activateBounceBox()
{
	$('#bounceb').removeClass("sakla").bounceBox();
	$('#bouncek').click(function(){
		$('#bounceb').bounceBoxHide();
		$('.flashc').remove();
	}).click();
}

(function($){
  $.clickDisabled = null;
  $.event.special.click = {
    setup: function() 
	{
      $(this).addClass( 'pointed' );
	  $("form").removeClass("pointed");
      return false;
    },
    teardown: function() 
	{
      $(this).removeClass( 'pointed' );
      return false;
    },
    add: function( handleObj ) 
	{
      var old_handler = handleObj.handler,elem = $(this);
      handleObj.handler = function( event ) 
	  {
        if ( $.clickDisabled && elem.is( $.clickDisabled ) ) 
          event.preventDefault();
        else 
          return old_handler.apply( this, arguments );
      };
    }
  };
})(jQuery);

(function($){
  var elems = $([]);
  $.event.special.clickoutside = {
    setup: function(){
      elems = elems.add( this );
      if ( elems.length === 1 ) 
        $(document).bind( 'click', handle_event );
    },
    teardown: function()
	{
      elems = elems.not( this );
      if ( elems.length === 0 ) 
        $(document).unbind( 'click', handle_event );
    },
    add: function( handleObj ) 
	{
      var old_handler = handleObj.handler;
      handleObj.handler = function( event, elem ) 
	  {
        event.target = elem;
        old_handler.apply( this, arguments );
      };
    }
  };
  function handle_event( event ) 
  {
    $(elems).each(function()
	{
      var elem = $(this);
      if ( this !== event.target && !elem.has(event.target).length ) 
        elem.triggerHandler( 'clickoutside', [ event.target ] );
    });
  };
})(jQuery);


(function($){
  $.tripleclickThreshold = 250;
  $.event.special.tripleclick = {
    setup: function( data ) {
      $(this).bind( 'click', click_handler );
    },
    teardown: function() {
      $(this).unbind( 'click', click_handler );
    },
    add: function( handleObj ){
      var old_handler = handleObj.handler,
        clicks = 0,
        last = 0;
      handleObj.handler = function( event, timestamp ) {
        if ( this !== event.target ) { return; }
        var elem = $(this),threshold = handleObj.data || $.tripleclickThreshold;
        if ( timestamp - last > threshold ) 
          clicks = 0;
        last = timestamp;
        if ( ++clicks === 3 ) 
		{
          old_handler.apply( this, arguments );
          clicks = 0;
        }
      };
    }
  };

  function click_handler( event ) {
    $(this).triggerHandler( 'tripleclick', [ event.timeStamp ] );
  };
})(jQuery);

(function($){
  var elems = $([]),timeout_id;
  $.event.special.resize = 
  {
    setup: function() {
      var elem = $(this);
      elems = elems.add( elem );
      elem.data( 'resize', { w: elem.width(), h: elem.height() } );
      if ( elems.length === 1 ) 
        poll();
    },
    teardown: function() 
	{
      var elem = $(this);
      elems = elems.not( elem );
      elem.removeData( 'resize' );
      if ( !elems.length ) 
        clearTimeout( timeout_id );
    }
  };

  function poll() 
  {
    elems.each(function()
	{
      var elem = $(this),width = elem.width(),height = elem.height(),data = elem.data( 'resize' );
      if ( width !== data.w || height !== data.h ) 
	  {
        data.w = width;
        data.h = height;
        elem.triggerHandler( 'resize' );
      }
    });
    timeout_id = setTimeout( poll, 250 );
  };
})(jQuery);

$.extend($.expr[':'], {
	abovethefold: function(el) {
		return $(el).offset().top < $(window).scrollTop() + $(window).height();
	}
});

var cookieOptions = {expires: 7, path: '/', domain:'http://www.itsphp.net', secure: true },db,searchSite=true,tip='web';

$('#sf').submit(function(){  
	var term = $('#q').val();
	if(searchSite)
		term = 'site:http://www.itsphp.net '+term;
	function yahoo()
	{ 
		return $.ajax({
			type: "GET",
			url: 'http://boss.yahooapis.com/ysearch/'+tip+'/v1/'+term+'?appid=R2wQguPIkY2cD5n.Mq26OXSZnkYXsL.B61RpnL6leA--&format=json&callback=myData&count=10',
			dataType:"jsonp",
			success: function(yahoo_data) {}
		});
	}

	function bing()
	{ 
		return $.ajax({
			type: "GET",
			url: 'http://api.search.live.net/json.aspx?JsonCallback=?&Appid=7A7570967E944B7D029F2C5BD7A3E1A3D0CC965C&query='+term+'&sources='+tip,
			dataType:"jsonp",
			success: function(yahoo_data) {}
		});
	}

	function google()
	{ 
		return $.ajax({
			type: "GET",
			url: 'http://ajax.googleapis.com/ajax/services/search/'+tip+'?v=1.0&callback=?&q='+term+'&rsz=8',
			dataType:"jsonp",
			success: function(google_data) {}
		});
	}

	function youtube()
	{
		if(tip=="video")
		return $.ajax({
			type: "GET",
			url:'http://gdata.youtube.com/feeds/api/videos?q='+term+'&format=5&max-results=10&v=2&alt=jsonc',
			dataType:"jsonp",
			success: function(youtube_data)	{}
		});
		else return null;
	}

	$.when( yahoo(), bing(), google(), youtube()).done(function(yahoo_data, bing_data, google_data, youtube_data)
	{
		var 	yahoo=yahoo_data[0].ysearchresponse,
			bing=bing_data[0].SearchResponse,
			google = google_data[0].responseData.results,
			youtube=null,
			pageContainer = $('<div>',{className:'pc'}),
			resultsDiv=$("#rd");

		switch(tip)
		{
			case 'web':
				yahoo=yahoo.resultset_web;
				bing=bing.Web.Results;
				break;
			case 'image':
				yahoo=yahoo.resultset_images;
				bing=bing.Image.Results;
				break;
			case 'video':
				yahoo=null;
				bing=bing.Video.Results;
				youtube=youtube_data.data.items;
				break;
			case 'news':
				yahoo=yahoo.resultset_news;
				break;
		}
		if(yahoo)
		{
			$.each(yahoo, function(i,data)
			{
				var arr = [];
				switch(tip)
				{
					case 'web':
						arr = [
							'<div class="wr">',
							'<h4><a href="',data.url,'" target="_blank">',data.title,'</a></h4>',
							'<p>',data.abstract,'</p>',
							'</div>'
						];
					break;
					case 'image':
						arr = [
							'<div class="ir">',
							'<a target="_blank" href="',data.url,'" title="',data.title,'" class="pic">',
							'<img src="',data.thumbnail_url,'" /></a>',
							'<br class="clear" />','<a href="',data.refererurl,'" target="_blank">',data.refererurl,'</a>',
							'</div>'
						];
					break;
					case 'news':
						arr = [
							'<div class="wr">',
							'<h4><a href="',data.url,'" target="_blank">',data.source,' - ',r.title,'</a></h4>',
							'<p>',data.abstract,'</p>',
							'</div>'
						];
					break;
				}
				pageContainer.append(arr.join(''));
			});
		}

		if(bing)
		{
			$.each(bing, function(i,data)
			{
				var arr = [];
				switch(tip)
				{
					case 'web':
						arr = [
							'<div class="wr">',
							'<h4><a href="',data.Url,'" target="_blank">',data.Title,'</a></h4>',
							'<p>',data.Description,'</p>',
							'</div>'
						];
					break;
					case 'image':
						arr = [
							'<div class="ir">',
							'<a target="_blank" href="',data.Url,'" title="',data.Title,'" class="pic">',
							'<img src="',data.Thumbnail.Url,'" /></a>',
							'<br class="clear" />','<a href="',data.Url,'" target="_blank">',data.Url,'</a>',
							'</div>'
						];
					break;
					case 'video':
						arr = [
							'<div class="ir">',
							'<a target="_blank" href="',data.PlayUrl,'" title="',data.Title,'" class="pic">',
							'<img src="',data.StaticThumbnail.Url,'" /></a>',
							'<br class="clear" />','<a href="',data.ClickThroughPageUrl,'" target="_blank">',data.SourceTitle,'</a>',
							'</div>'
						];
					break;
					case 'news':
						arr = [
							'<div class="wr">',
							'<h4><a href="',data.Url,'" target="_blank">',data.Source,' - ',r.Title,'</a></h4>',
							'<p>',data.Snippet,'</p>',
							'</div>'
						];
					break;
				}
				pageContainer.append(arr.join(''));
			});
		}

		if(google)
		{
			$.each(google, function(i,r)
			{
				var arr = [];
				switch(r.GsearchResultClass)
				{
					case 'GwebSearch':
						arr = [
							'<div class="wr">',
							'<h4><a href="',r.url,'" target="_blank">',r.title,'</a></h4>',
							'<p>',r.content,'</p>',
							'</div>'
						];
					break;
					case 'GimageSearch':
						arr = [
							'<div class="ir">',
							'<a target="_blank" href="',r.url,'" title="',r.titleNoFormatting,'" class="pic">',
							'<img src="',r.tbUrl,'" /></a>',
							'<br class="clear" />','<a href="',r.originalContextUrl,'" target="_blank">',r.visibleUrl,'</a>',
							'</div>'
						];
					break;
					case 'GvideoSearch':
						arr = [
							'<div class="ir">',
							'<a target="_blank" href="',r.url,'" title="',r.titleNoFormatting,'" class="pic">',
							'<img src="',r.tbUrl,'" /></a>',
							'<br class="clear" />','<a href="',r.originalContextUrl,'" target="_blank">',r.publisher,'</a>',
							'</div>'
						];
					break;
					case 'GnewsSearch':
						arr = [
							'<div class="wr">',
							'<h4><a href="',r.unescapedUrl,'" target="_blank">',r.publisher,' - ',r.title,'</a></h4>',
							'<p>',r.content,'</p>',
							'</div>'
						];
					break;
				}
				pageContainer.append(arr.join(''));
			});	
		}

		if(youtube)
		{
			$.each(youtube, function(i,data)
			{
				pageContainer.append('<div class="ir"><a target="_blank" href="'+data.content["5"]+'" title="'+data.description+'" class="pic"><img src="'+data.thumbnail+'" /></a><br class="clear" /><a href="'+data.content["5"]+'" target="_blank">',+data.title+'</a></div>');
			});
		}

		pageContainer.append('<br class="clear" />').hide().appendTo(resultsDiv).slideDown("slow");

		if(!bing && !yahoo && !google && !youtube)
		{
			resultsDiv.empty();
			$('<p>',{className:'notf',html:'Sonuç Bulunamadı!'}).hide().appendTo(resultsDiv).effect("highlight", {"color":"#c80000"}, 3000);
		}

	});
 
	return false;	
});


function activateMain()
{
	if(!$.browser.msie) $(".ieden").removeClass("sakla");

	var arrow = $('<span>',{className:'aa'}).appendTo('#sf ol');
	$('#sf li').bind("click",function(){
		var el = $(this);
		if(el.hasClass('active'))
			return false;
		el.siblings().removeClass('active');
		el.addClass('active');
		arrow.stop().animate({ left : el.position().left, marginLeft	: (el.width()/2)-4	});
		tip = el.attr('data-st');
	});
	$('#ss').click();	
	$('li.web').click(); 
	$('#ss,#sw').change(function(){	searchSite = this.id == 'ss';	});

	activateGoogleFontAPI();

	$("#container > header h2").lettering();
	$("#container > header h2 span").each(function() {  $(this).css({ top: -(Math.floor(Math.random()*1001)+1500), left: Math.floor(Math.random()*1001)-500 }); });
	$("#container > header h2").removeClass("sakla");
	setTimeout(function() {$('#container > header').addClass("span-one");}, 1000);

	activateBounceBox();

	$('.twitter_search').twitterpopup();

	$('textarea').after("<div id='console'><div class='count'>Geriye 500 karakter kaldı!</div><progress class='bar' max='100'></progress></div>").keyup(function(e) {
			var characters = 500;
			var value = $(this).val();
			var count = value.length;
			if (count <= characters) 
			{
				$(this).next().children('.bar').progressbar("option",'value', (count / characters) * 100);
				$(this).next().children('.count').text("Geriye "+(characters - count)+" karakter kaldı!");
			} 
			else 
				$(this).val(value.substring(0,characters));
		});
	$('.bar').progressbar();
	$('textarea').keyup();


	$("form").html5form();
/*
	if(Modernizr.applicationcache)
		applicationCache.onUpdateReady = function () {
			applicationCache.swapCache();
			//addNotice("Sayfanın bazı hataları düzeltilmiştir.Yeni haline ulaşmak için sayfayı yenileyin!");
		};*/

	if(Modernizr.draganddrop)
	{
		$("img").each(function(){ this.ondragstart = function (e) {
			e = e || e.event;
			e.dataTransfer.setData("text/plain","İbrahim Taşdemir'in Kişisel Ana Sayfasından " + this.getAttribute("alt") + ", resmin orjinali: " + this.src);
			};
		});

		var drop = $("#drop");
		$("[draggable]").each(function(){
			this.ondragstart = function (e) {
				e = e || window.e;
				this.setAttribute("aria-grabbed", "true");
				drop.tabIndex = 0; 
				drop.setAttribute("aria-dropeffect", "copy");
			};
			this.ondragend = function () {
			this.setAttribute("aria-grabbed", "false");
			drop.tabIndex = -1;
			drop.removeAttribute("aria-dropeffect");
			};
			this.tabIndex = 0;
			this.setAttribute("aria-grabbed", "false");
		});
	}

	if(Modernizr.websqldatabase) 
	{
		db = openDatabase("itsphp", "1.0", "ibrahim tasdemirin kisisel ana sayfasi", 2 * 1024 * 1024);
		db.transaction(function (tx) {tx.executeSql("CREATE TABLE IF NOT EXISTS itsphp(sayfa, veri)");});
	}
	
	$.getScript("http://ajax.googleapis.com/ajax/libs/chrome-frame/1/CFInstall.min.js",function(){
		CFInstall.check({mode: "inline" ,node: "prompt"});
	});

	Modernizr.addTest("textstroke", function() {
   		var div = document.createElement("div"),success;   
   			
   		if ( "textStroke" in div.style ) return true;
   		
   		"Webkit Moz O Ms Khtml".replace(/([A-Za-z]+)/g, function(val) {
   			if ( val + "TextStroke" in div.style ) success = true;
   		});
   		return success;
   	});
  
	/*Tur */

	$("#tcshow").click(function(){$("#tc").toggleClass("sakla"); return false;});

	var config = [
	{
		"name" 		: "tour_1",
		"position"	: "T",
		"text"		: "'Hoşgeldiniz'"
	},
	{
		"name" 		: "tour_2",
		"text"		: "Mobil sayfamızı ziyaret edebilirsiniz",
		"position"	: "TR"
	},
	{
		"name" 		: "tour_3",
		"text"		: "En son teknolojiyi kullandığı için eski tarayıcılarda çalışmayabilir",
		"position"	: "LT"
	},
	{
		"name" 		: "tour_4",
		"text"		: "Mümkün olduğunca tasarım kurallarına uyulmaya çalışıldı",
		"position"	: "LT"
	},
	{
		"name" 		: "tour_5",
		"text"		: "İstemediğiniz kutuları başlıklarındaki X işaretine tıklatarak kapatabilirsiniz",
		"position"	: "TL"
	},
	{
		"name" 		: "tour_6",
		"text"		: "Daha iyi bir web mümkün",
		"position"	: "TL"
	},
	{
		"name" 		: "tour_7",
		"text"		: "Google,Yahoo,Bing ve Youtube'da arama yap",
		"position"	: "RT"
	},
	{
		"name" 		: "tour_8",
		"text"		: "İstediğiniz kodu alıp kullanmakta serbestsiniz. Yardıma ihtiyaç duyarsanız buralardayım",
		"position"	: "RB"
	},
	{
		"name" 		: "tour_9",
		"text"		: "'İyi eğlenceler'",
		"position"	: "B"
	}
	],step = 0,total_steps= config.length;

	function showTooltip()
	{
		$('#tt').hide();
		var step_config	= config[step-1];
		var $elem = $('.' + step_config.name);
		var $tooltip = $('<div>',{
			id : 'tt',
			className : 'tt',
			html : '<p>'+step_config.text+'</p><span class="tta"></span>'
		}).css({'display' : 'none'});
		var properties = {}, tip_position = step_config.position;
		$('BODY').prepend($tooltip);
		var e_w	= $elem.outerWidth(),e_h = $elem.outerHeight(),e_l = $elem.offset().left,e_t = $elem.offset().top;
		switch(tip_position){
			case 'TL':
				properties = {
					'left'	: e_l,
					'top'	: e_t + e_h + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_TL');
				break;
			case 'TR'	:
				properties = {
					'left'	: e_l + e_w - $tooltip.width() + 'px',
					'top'	: e_t + e_h + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_TR');
				break;
			case 'BL'	:
				properties = {
					'left'	: e_l + 'px',
					'top'	: e_t - $tooltip.height() + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_BL');
				break;
			case 'BR'	:
				properties = {
					'left'	: e_l + e_w - $tooltip.width() + 'px',
					'top'	: e_t - $tooltip.height() + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_BR');
				break;
			case 'LT'	:
				properties = {
					'left'	: e_l + e_w + 'px',
					'top'	: e_t + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_LT');
				break;
			case 'LB'	:
				properties = {
					'left'	: e_l + e_w + 'px',
					'top'	: e_t + e_h - $tooltip.height() + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_LB');
				break;
			case 'RT'	:
				properties = {
					'left'	: e_l - $tooltip.width() + 'px',
					'top'	: e_t + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_RT');
				break;
			case 'RB'	:
				properties = {
					'left'	: e_l - $tooltip.width() + 'px',
					'top'	: e_t + e_h - $tooltip.height() + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_RB');
				break;
			case 'T'	:
				properties = {
					'left'	: e_l + e_w/2 - $tooltip.width()/2 + 'px',
					'top'	: e_t + e_h + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_T');
				break;
			case 'R'	:
				properties = {
					'left'	: e_l - $tooltip.width() + 'px',
					'top'	: e_t + e_h/2 - $tooltip.height()/2 + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_R');
				break;
			case 'B'	:
				properties = {
					'left'	: e_l + e_w/2 - $tooltip.width()/2 + 'px',
					'top'	: e_t - $tooltip.height() + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_B');
				break;
			case 'L'	:
				properties = {
					'left'	: e_l + e_w  + 'px',
					'top'	: e_t + e_h/2 - $tooltip.height()/2 + 'px'
				};
				$tooltip.find('span.tta').addClass('tta_L');
				break;
		}
	
		var w_t	= $(window).scrollTop(), w_b = $(window).scrollTop() + $(window).height(),b_t = parseFloat(properties.top,10);
		if(e_t < b_t) b_t = e_t;
		var b_b = parseFloat(properties.top,10) + $tooltip.height();
		if((e_t + e_h) > b_b) b_b = e_t + e_h;
		if((b_t < w_t || b_t > w_b) || (b_b < w_t || b_b > w_b))
		{
			$('html, body').stop().animate({scrollTop: b_t}, 500, 'easeInOutExpo', function(){
				$tooltip.css(properties).show();
			});
		}
		else $tooltip.css(properties).show();
	}

	$('#at').live('click',function(){
		$("#tc").addClass("tcb");
		$(this).hide();
		$('#et,#rt').show();
		if(total_steps > 1) $('#ns').show();
		$('body').prepend('<div id="to" class="to"></div>');
		$('#ns').click();
	});

	$('#ct,#et').live('click',function (){
		$("#ts").removeClass("tcb");
		step = 0;
		$('#tt').hide();
		$('#tc').addClass("sakla");
		$('#to').remove();
	});

	$('#rt').live('click',function (){
		step = 0;
		$('#ns').click();
	});
	$('#ns').live('click',function (){
		if(step > 0) $('#ps').show();
		else $('#ps').hide();
		if(step == total_steps-1) $(this).hide();
		if(step >= total_steps)
		{
			$('#ct').click();
			return false;
		}
		++step;
		showTooltip();
	});
	$('#ps').live('click',function(){
		if(step > 2)	$('#ps').show();
		else		$('#ps').hide();
		if(step == total_steps)	$('#ns').show();	
		if(step <= 1)	return false;
		--step;
		showTooltip();
	});
}
