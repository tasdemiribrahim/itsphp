IE6 = (navigator.appVersion.indexOf("MSIE 6.")==-1) ? false : true;
IE7 = (navigator.appVersion.indexOf("MSIE 7.")==-1) ? false : true;
IE8 = (navigator.appVersion.indexOf("MSIE 8.")==-1) ? false : true;

function getSiteName(){ return "http://tasdemir.0fees.net/"; }

function getScript(dosya)
{
	var headID = document.getElementsByTagName("head")[0];         
	var newScript = document.createElement('script');
	newScript.src = dosya;
	headID.appendChild(newScript);
}

function getResim(id,dosya)
{
	var resim="";
	$.ajax({
		type: 'GET',
		timeout: 20000,  
		cache: true,
		async:false,
		data: 'resim='+id+"&dosya="+dosya,
		url: '/main/index/ajax',
		success: function(cevap)
		{
			resim= cevap;
		}
	});
	return resim;
}

function activateGoogleFontAPI()
{
	WebFontConfig = { google: { families: [ 'IM+Fell+DW+Pica', 'Vollkorn:regular,bold' ] }};
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

$.toSource = function(target) {
   if (typeof target.toSource !== 'undefined' && typeof target.callee === 'undefined') 
      return target.toSource().slice(1,-1);
   switch (typeof target) 
   {
      case 'number':
      case 'boolean':
      case 'function':
         return target;
         break;
      case 'string':
         return '\'' + target + '\'';
         break;
      case 'object':
         var result;
         if (target instanceof Date) {
            result = 'new Date('+target.getTime()+')';
         }
         else if (target.constructor === Array || typeof target.callee !== 'undefined') {
            result = '[';
            var i, length = target.length;
            for (i = 0; i < length-1; i++) { result += $.toSource(target[i]) + ','; }
            result += $.toSource(target[i]) + ']';
         }
         else {
            result = '{';
            var key;
            for (key in target) { result += key + ':' + $.toSource(target[key]) + ','; }
            result = result.replace(/\,$/, '') + '}';
         }
         return result;
         break;
      default:
         return '?unsupported-type?';
         break;
   }
}

jQuery.fn.center = function () {
    if(IE6) this.css("position","absolute");
    else this.css("position","fixed");
    this.css("top", ( $(window).height() - this.height() ) / 2+$(window).scrollTop() + "px").css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft() + "px");
    return this;
}

jQuery.fn.takvim= function () {
if(!/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent))
if(!Modernizr.inputtypes.date)
    this.datepicker({ showOtherMonths: true,showOn: "button",buttonImage: "/main/images/aile/calendar.gif",buttonText: "Takvim", buttonImageOnly: true, closeText: 'Seç',changeYear: true,changeMonth: true,currentText: 'Bugün',dateFormat: 'yy-mm-dd',dayNames: ['Pazar', 'Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi'],dayNamesMin: ['Pa', 'Pt', 'Sa', 'Ça', 'Pe', 'Cu', 'Ct'] ,dayNamesShort: ['Paz', 'Pts', 'Sal', 'Çar', 'Per', 'Cum', 'Cts'],defaultDate: new Date("1986-12-08"),firstDay: 1 ,monthNames: ['Ocak','Şubat','Mart','Nisan','Mayıs','Haziran','Temmuz','Ağustos','Eylül','Ekim','Kasım','Aralık'],monthNamesShort: ['Ocak','Şubat','Mart','Nisan','Mayıs','Haziran','Temmuz','Ağustos','Eylül','Ekim','Kasım','Aralık']  });
}

jQuery.fn.toTop = function() {	this.stop().animate({top: $(document).scrollTop()},'slow','easeOutBack'); };

window.log = function(){
  log.history = log.history || [];
  log.history.push(arguments);
  if(this.console)
    console.log( Array.prototype.slice.call(arguments) );
};

var searchBinary = function(needle, haystack, case_insensitive) 
{
	if(needle == "") return [];
	var haystackLength 	= haystack.length;
	var letterNumber 	= needle.length;
	case_insensitive 	= (typeof(case_insensitive) === 'undefined' || case_insensitive) ? true:false;
	needle 				= (case_insensitive) ? needle.toLowerCase():needle;
	var getElementPosition = findElement();
	if(getElementPosition == -1) return [];
	return getRangeElement = findRangeElement();
	function findElement() 
	{
		if (typeof(haystack) === 'undefined' || !haystackLength) return -1;
		var high = haystack.length - 1;
		var low = 0;
		while (low <= high) 
		{
			mid = parseInt((low + high) / 2);
			var element = haystack[mid].substr(0,letterNumber);
			element = (case_insensitive) ? element.toLowerCase():element;
			if (element > needle) high = mid - 1;
			else if (element < needle) low = mid + 1;
			else return mid;
		}
		return -1;
	}
	function findRangeElement()
	{
		for(i=getElementPosition; i>0; i--)
		{
			var element =  (case_insensitive) ? haystack[i].substr(0,letterNumber).toLowerCase() : haystack[i].substr(0,letterNumber);
			if(element != needle)
			{
				var start = i+1;
				break;
			}else
				var start = 0;
		}
		for(i=getElementPosition; i<haystackLength; i++ )
		{
			var element =  (case_insensitive) ? haystack[i].substr(0,letterNumber).toLowerCase() : haystack[i].substr(0,letterNumber);
			if(element != needle)
			{
				var end = i;
				break;
			}else
				var end = haystackLength -1;
		}
		var result = [];
		for(i=start; i<end;i++)
			result.push(haystack[i])
		return result;
	}
};	

function quicksort(arr)
{
	if (arr.length == 0)
		return [];
	var left = new Array();
	var right = new Array();
	var pivot = arr[0];
	for (var i = 1; i < arr.length; i++) 
	{
		if (arr[i] < pivot) 
		left.push(arr[i]);
		else 
		right.push(arr[i]);
	}
	return quicksort(left).concat(pivot, quicksort(right));
}	

function mergeSort(items)
{
	if (items.length == 1) 
		return items;
	var work = [];
	for (var i=0, len=items.length; i < len; i++)
		work.push([items[i]]);
	work.push([]); //in case of odd number of items
	for (var lim=len; lim > 1; lim = (lim+1)/2)
	{
		for (var j=0,k=0; k < lim; j++, k+=2)
			work[j] = merge(work[k], work[k+1]);
		work[j] = []; //in case of odd number of items
	}
	return work[0];
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

(function($){
	var DataTimes;
	$.event.special.multihover = {
		setup: function(data, namespaces) {
			DataTimes =  data && data.times || 5;
			$(this).data('times', DataTimes).bind('mouseover', $.event.special.multihover.handler);
		},
		add: function(handler, data, namespaces) {
			// Do every time you bind another event
		},
		remove: function(namespaces) {
			// Do when an event is unbound
		},
		teardown: function(namespaces) {
			$(this).removeData('times').unbind('mouseover', $.event.special.multihover.handler);
		},
		handler: function(e) {
			// Do your logic
			var times = $(this).data('times') || 0;
			times--;
			$(this).data('times', times);
			if (times <= 0) 
			{
				e.type = 'multihover';
				$.event.handle.apply(this,arguments);
				$(this).data('times', DataTimes);
			}
		}
	}
})(jQuery);

function addNotice(notice) {
	deleteNotice();
	$('<div class="notice"></div>')
	.append('<div class="skin op5 ui-state-error ui-corner-all"></div><div class="escBlue"></div>')
	.append($('<div></div>').html($(notice)))
	.hide()
	.appendTo('#growl')
	.fadeIn(1000);
}

function deleteNotice()
{
	$('#growl .escBlue').click();
}

$.extend($.expr[':'], {
	abovethefold: function(el) {
		return $(el).offset().top < $(window).scrollTop() + $(window).height();
	}
});

function startTour()
{
	$("#tc").addClass("tcb");
	$('#at').remove();
	$('#et,#rt').show();
	if(!autoplay && total_steps > 1) $('#ns').show();
	showOverlay();
	nextStep();
}
function nextStep()
{
	if(!autoplay)
	{
		if(step > 0) $('#ps').show();
		else $('#ps').hide();
		if(step == total_steps-1) $('#ns').hide();
	}	
	if(step >= total_steps)
	{
		endTour();
		return false;
	}
	++step;
	showTooltip();
}
function prevStep()
{
	if(!autoplay)
	{
		if(step > 2)	$('#ps').show();
		else	$('#ps').hide();
		if(step == total_steps)	$('#ns').show();
	}		
	if(step <= 1)	return false;
	--step;
	showTooltip();
}
function endTour()
{
	$("#ts").removeClass("tcb");
	step = 0;
	if(autoplay) clearTimeout(showtime);
	removeTooltip();
	hideControls();
	hideOverlay();
}
function restartTour()
{
	step = 0;
	if(autoplay) clearTimeout(showtime);
	autoplay=true;
	nextStep();
}
function showTooltip()
{
	removeTooltip();
	var step_config	= config[step-1];
	var $elem = $('.' + step_config.name);
	if(autoplay)
		showtime = setTimeout(nextStep,step_config.time);
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
			if(autoplay)
			{
				clearTimeout(showtime);
				showtime = setTimeout(nextStep,step_config.time);
			}
			$tooltip.css(properties).show();
		});
	}
	else $tooltip.css(properties).show();
}
function removeTooltip(){$('#tt').remove();	}
function hideControls(){$('#tc').remove();}
function showOverlay(){	$('BODY').prepend('<div id="to" class="to"></div>');}
function hideOverlay(){	$('#to').remove();}

	/*
	the json config obj.
	name: the class given to the element where you want the tooltip to appear
	text: the text inside the tooltip
	time: if automatic tour, then this is the time in ms for this step
	position: the position of the tip. Possible values are
		TL	top left
		TR  top right
		BL  bottom left
		BR  bottom right
		LT  left top
		LB  left bottom
		RT  right top
		RB  right bottom
		T   top
		R   right
		B   bottom
		L   left
	 */
var cookieOptions = {expires: 7, path: '/', domain:getSiteName(), secure: true },
config = [
	{
		"name" 		: "tour_1",
		"position"	: "L",
		"text"		: "Menü üzerine gelince açılır.",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_2",
		"text"		: "Sayfayı beğendiyseniz lütfen tıklayın.",
		"position"	: "TL",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_3",
		"text"		: "Site açık kaynak araçlar kullanılarak yapılmıştır.",
		"position"	: "LT",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_4",
		"text"		: "En son teknolojiyi kullandığı için eski tarayıcılarda çalışmayabilir.",
		"position"	: "LT",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_5",
		"text"		: "Mümkün olduğunca tasarım kurallarına uyulmaya çalışıldı.",
		"position"	: "LT",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_6",
		"text"		: "İstemediğiniz kutuları başlıklarındaki X işaretine tıklatarak kapatabilirsiniz.",
		"position"	: "TL",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_7",
		"text"		: "Sitedeki yeniliklere ve yeni bilgilere erişmek için e-posta kampanyamıza katılabilir veya RSS beslemelerimizi alabilirsiniz.",
		"position"	: "BR",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_8",
		"text"		: "İnternetin gelişmesine katkımız",
		"position"	: "TR",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_10",
		"text"		: "Herhangi bir CMS kullanılmamıştır",
		"position"	: "B",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_11",
		"text"		: "İstediğiniz kodu alıp kullanmakta serbestsiniz. Yardıma ihtiyaç duyarsanız e-posta atın",
		"position"	: "B",
		"time" 		: 5000
	},
	{
		"name" 		: "tour_12",
		"text"		: "'İyi eğlenceler'",
		"position"	: "T",
		"time" 		: 5000
	}

],
autoplay = false,showtime,step = 0,total_steps= config.length,db;

function activateMain()
{
	if(!IE6 && !IE7 && !IE8) $(".ieden").removeClass("sakla");
	$("#rcnt").prepend('<form id="sf" action="/main/" role="search"><br />'
				+'<input type="search" name="q" id="q" placeholder="Ara.." required aria-required />'
				+'<input type="submit" class="bonBonButton xs drop pink glass" value="" />'
				+'<section class="sakla">'
					+'<input type="radio" name="check" value="site" id="ss" checked/>'
					+'<label for="ss">Bu sitede</label>'
					+'<input type="radio" name="check" value="web" id="sw"/>'
					+'<label for="sw">Nette</label>'
				+'</section>'
				+'<nav role="navigation" class="sakla">'
					+'<ol class="sakla">'
					+'	<li class="web" title="Sayfa Ara" data-st="web">Net</li>'
					+'	<li class="images" title="Resim Ara" data-st="images">Resim</li>'
					+'	<li class="news" title="Haber Ara" data-st="news">Haber</li>'
					+'	<li class="videos" title="Görüntü Ara" data-st="video">Görüntü</li>'
					+'</ol>'
				+'</nav>'
			+'<br class="clear"/></form>');

	var $oe_menu_items = $('#container header menu > ul > li');

	$oe_menu_items.bind('mouseenter',function(){
		var $this = $(this);
		$this.addClass('oesl oes');
		$this.children('div').css('z-index','9999').stop(true,true).slideDown(200,function(){
			$oe_menu_items.not('.oesl').children('div').hide();
			$this.removeClass('oesl');
		});
		if($this.children('div').length==0) $oe_menu_items.children('div').hide();
	}).bind('mouseleave',function(){
		var $this = $(this);
		$this.removeClass('oes').children('div').css('z-index','1');
	});

	$('#container header menu > ul').bind('mouseenter',function(){
		var $this = $(this);
		$this.addClass('oeho');
	}).bind('mouseleave',function(){
		var $this = $(this);
		$this.removeClass('oeho');
		$oe_menu_items.children('div').hide();
	});
 
	activateGoogleFontAPI();

	$("#container > header h2").lettering();
	$("#container > header h2 span").each(function() {  $(this).css({ top: -(Math.floor(Math.random()*1001)+1500), left: Math.floor(Math.random()*1001)-500 }); });
	$("#container > header h2,#tc").removeClass("sakla");
	setTimeout(function() {$('#container > header').addClass("span-one");}, 1000);

	activateBounceBox();
 
	$.getScript("http://line25.com/wp-content/uploads/2010/lastfm/demo/js/last.fm.records.js", function () {
		var _config = {
			placeholder: 'lfr',
			username: 'tasdemiribrahim',
			count: 2,
			period: 'lovedtracks', 
			defaultthumb: 'http://cdn.last.fm/flatness/catalogue/noimage/2/default_album_large.png'
		};
		lastFmRecords.debug();
		lastFmRecords.init(_config);

		$("#lfr a img").addClass("shadow").parent().append("<span class='transitionAll'></span>");  
	});

	$('details summary .dc').click(function(){ $(this).closest("details").fadeOut(); });

	$('#growl .escBlue').live('click', function() {
		$(this).closest('.notice').animate({border: 'none',height: 0,marginBottom: 0,marginTop: '-6px',opacity: 0,	paddingBottom: 0,	paddingTop: 0,queue: false	}, 1000, 
		function() {$(this).remove();});
	});
	$('.twitter_search').twitterpopup();
	$("a[href^='http://']").click(function()
	{
		//_gaq.push(['_trackEvent', 'links', 'external', $(this).attr("href"), 0]);
		_gaq._trackEvent("links", "external", $(this).attr("href"), 0);
	});
	$('[required]').attr("aria-required","true");
	$("#apreb").bind("click",function(){
		var $this=$(this);
		if($this.hasClass('active'))
		{
			$this.removeClass('active').addClass('ina');
			$this.unbind("click");
			$("#aprec").html(1 + parseInt($("#aprec").html()));
			$.getJSON("/main/ajax/appreciate",{url:$("#URL").val()});
		}
		return false;
	});

	$('#accordion').accordion({autoHeight: false,collapsible: true });
	$('.jb').button();	
	$('textarea').not(".cleditor").after("<div id='console'><div class='count'>Geriye 500 karakter kaldı!</div><progress class='bar'></progress></div>").keyup(function(e) {
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
	$('textarea').not(".cleditor").keyup();
	
	//if (Modernizr.inputtypes.email) $("input[type='email']").css("padding-left","0");
	//if (Modernizr.inputtypes.url) $("input[type='url']").attr("placeholder","");

	$('#at').live('click',startTour);
	$('#ct').live('click',endTour);
	$('#et').live('click',endTour);
	$('#rt').live('click',restartTour);
	$('#ns').live('click',nextStep);
	$('#ps').live('click',prevStep);

	$("form").html5form();
	$("input[type='date']").takvim();
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


}
