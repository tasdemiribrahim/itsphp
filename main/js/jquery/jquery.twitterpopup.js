/*http://tasdemir.0fees.net/main/js/jquery.twitterpopup.js*/(function(window,$){$.fn.twitterpopup=function(options){var opts=$.extend({},$.fn.twitterpopup.defaults,options);return this.each(function(){var $this=$(this);var o=$.meta?$.extend({},opts,$this.data()):opts;$this.bind('click',function(e){var $this=$(this);if($this.data('active'))return;var $search=$('<div class="search_results"></div>').appendTo($('BODY'));$search.twitterSearch({term:$this.html(),bird:false,colorExterior:'#ddd',colorInterior:'#f6f6f6',pause:true,timeout:3000});var PopupPositions=$.fn.twitterpopup.calculatePopupPositions($this,$search);$search.resizable({alsoResize:$search.find('.twitterSearchContainter'),handles:'se'}).draggable();$search.css({left:(PopupPositions.left+'px'),top:(PopupPositions.top+'px')}).show();$this.data('active',true);$search.find('.twitterSearchClose').bind('click',function(){$search.remove();$this.data('active',false);});});});};$.fn.twitterpopup.getWindowSize=function(){var WindowSize={width:window.width(),height:window.height()};return WindowSize;};$.fn.twitterpopup.calculatePopupPositions=function($elem,$popup){var WindowSize=$.fn.twitterpopup.getWindowSize();var popupL=$elem.offset().left+$elem.width()+20;var popupT=$elem.offset().top;var popupWidth=$popup.width();if(popupL+popupWidth>WindowSize.width)popupL=$elem.offset().left-popupWidth-20;var $elemOffsetTop=$elem.offset().top-window.scrollTop();var popupHeight=$popup.height();if($elemOffsetTop<0){popupT=$elem.offset().top-$elemOffsetTop;}else if($elemOffsetTop+popupHeight>WindowSize.height){var diff=$elemOffsetTop+popupHeight-WindowSize.height;popupT=$elem.offset().top-diff-20;}var PopupPositions={left:popupL,top:popupT};return PopupPositions;};})(jQuery(window),jQuery);