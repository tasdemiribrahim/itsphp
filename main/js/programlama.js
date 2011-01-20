$(document).ready(function() {	
		console.log("1");
	activateMain();

		console.log("2");
	var d = new Date();
	$.ajaxSetup({
		type: 'GET',
		cache: true,
		url: '/main/Helpers/input.php',
		error: function(xhr) {	}
	});
	console.log("kitap giriş");
	$.getScript("/main/js/jquery/jquery.masonry.min.js", function () {
		$('.wrap').masonry({columnWidth: 210, singleMode: true, itemSelector: '.box' });
		console.log("masonry");
        });

	$.ajax({ data: "feedburn=http://feeds2.feedburner.com/ScriptAndStyle",
		success: function(cevap){
			cevaplar=cevap.split("|");
			$('#cssFeed').html("<header><h3><a href='"+cevaplar[0]+"' title='"+cevaplar[1]+"'>"+cevaplar[1]+"</a></h3><h4>"+cevaplar[2]+"</h4><h5><a href='"+cevaplar[3]+"' title='"+cevaplar[4]+"'>"+cevaplar[4]+"</a></h5></header><br>"+cevaplar[5]);
		}
		});
	$.ajax({ data: "feedburn=http://www.phpdeveloper.org/feed",
		success: function(cevap){
			cevaplar=cevap.split("|");
			$('#phpFeed').html("<header><h3><a href='"+cevaplar[0]+"' title='"+cevaplar[1]+"'>"+cevaplar[1]+"</a></h3><h4>"+cevaplar[2]+"</h4><h5><a href='"+cevaplar[3]+"' title='"+cevaplar[4]+"'>"+cevaplar[4]+"</a></h5></header><br>"+cevaplar[5]);
		}
		});
	$.ajax({ data: "feedburn=http://www.asp.net/rss/spotlight",
		success: function(cevap){
			cevaplar=cevap.split("|");
			$('#aspFeed').html("<header><h3><a href='"+cevaplar[0]+"' title='"+cevaplar[1]+"'>"+cevaplar[1]+"</a></h3><h4>"+cevaplar[2]+"</h4><h5><a href='"+cevaplar[3]+"' title='"+cevaplar[4]+"'>"+cevaplar[4]+"</a></h5></header><br>"+cevaplar[5]);
		}
		});
	$.ajax({ data: "feedburn=http://feeds.feedburner.com/codrops",
		success: function(cevap){ 
			cevaplar=cevap.split("|");
			$('#jsFeed').html("<header><h3><a href='"+cevaplar[0]+"' title='"+cevaplar[1]+"'>"+cevaplar[1]+"</a></h3><h4>"+cevaplar[2]+"</h4><h5><a href='"+cevaplar[3]+"' title='"+cevaplar[4]+"'>"+cevaplar[4]+"</a></h5></header><br>"+cevaplar[5]);
		}
		});
	$.ajax({ data: "feedburn=http://feeds2.feedburner.com/w3avenue",
		success: function(cevap){
			cevaplar=cevap.split("|");
			$('#htmlFeed').html("<header><h3><a href='"+cevaplar[0]+"' title='"+cevaplar[1]+"'>"+cevaplar[1]+"</a></h3><h4>"+cevaplar[2]+"</h4><h5><a href='"+cevaplar[3]+"' title='"+cevaplar[4]+"'>"+cevaplar[4]+"</a></h5></header><br>"+cevaplar[5]);
		}
		});

	$.getScript("http://sandbox.sebnitu.com/jquery/quovolver/demo/jquery.quovolver.mini.js", function () {
  		$('blockquote').quovolver(500,20000);
		console.log("quovolver");
	});
	if(!IE6 && !IE7)
	$('.blue li a').bind('click',function(event){
		var $anchor = $(this);
		$('html,body').stop().animate({
			scrollTop: $($anchor.attr("href")).offset().top-50
		}, 1500,'easeInOutExpo'); 
		event.preventDefault();
	});
		
	var highlight_timeout; 
	$('img.ih_image').bind('mouseenter',function () {
			var $thumb = $(this);
			var $clone = $('<div />',{
				'id'		: 'ih_clone',
				'className': 'ih_image_clone_wrap',
				'html'     	: '<img src="'+$thumb.attr('src')+'" alt="'+$thumb.attr('alt')+'" height="'+$thumb.attr('height')+'" width="'+$thumb.attr('width')+'"/><span class="ih_zoom searchBlue"></span>',
				'style'		: 'top:'+$thumb.offset().top+'px;left:'+$thumb.offset().left+'px;'
			});
			var highlight = function (){
				$('#ih_overlay').show();
				$('BODY').append($clone);
			}
			$('#ih_overlay').bind('click',function(){
				$clone.remove(); 
				$('#ih_overlay').hide("explode", 1000);
				clearTimeout(highlight_timeout);
				$('#ih_overlay').unbind('click');
			});
			highlight_timeout = setTimeout(highlight,300);
			$clone.find('.ih_zoom').bind('click',function(){
				var $zoom = $(this);
				$zoom.addClass('ih_loading').removeClass('ih_zoom searchBlue');
				var imgL_source = $thumb.attr('alt');
				$('<img class="ih_preview" style="display:none;"/>').load(function(){
					var $imgL = $(this);
					$zoom.hide();
					var windowW = $(window).width();
					var windowH = $(window).height();
					var windowS = $(window).scrollTop();
					$clone.append($imgL).animate({
						'top'			: windowH/2 + windowS + 'px',
						'left'			: windowW/2  + 'px',
						'margin-left'	: -$thumb.width()/2 + 'px',
						'margin-top'	: -$thumb.height()/2 + 'px'
					},400,function(){
						var $clone = $(this);
						var largeW = windowW*4/5;
						var largeH = windowH*4/5;
						$imgL.width(largeW).height(largeH);
						$clone.animate({
							'top'			: windowH*4/5 + windowS + 'px',
							'left'			: windowW*4/5  + 'px',
							'margin-left'	: -largeW*4/5 + 'px',
							'margin-top'	: -largeH*4/5 + 'px',
							'width'			: largeW + 'px',
							'height'		: largeH + 'px'
						},400).find('img:first').animate({
							'width'			: largeW + 'px',
							'height'		: largeH + 'px'
						},400,function(){
							var $thumb = $(this);
							$imgL.fadeIn(function(){
								$zoom.addClass('ih_close escBlue').removeClass('ih_loading').fadeIn(function(){
									$(this).bind('click',function(){
										$clone.remove(); 
										$('#ih_overlay').hide("explode", 1000);
										clearTimeout(highlight_timeout);
										$('#ih_overlay').unbind('click');
									});
								});
								$thumb.remove();
							});
						});
					});
				}).error(function(){
					$zoom.fadeOut();
				}).attr('src',imgL_source);
			});		
	}).bind('mouseleave',function(){
		if($('#ih_clone').length) return;
		clearTimeout(highlight_timeout);
	});
	$('#ih_clone').live('mouseleave',function() {
		var $clone = $('#ih_clone');
		if(!$clone.find('.ih_preview').length){
			$clone.remove();
			clearTimeout(highlight_timeout);
			$('#ih_overlay').hide();
		}
	});
});
