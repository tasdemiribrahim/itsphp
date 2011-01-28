$(document).ready(function() {	
	activateMain();

	var d = new Date();
	$.ajaxSetup({
		type: 'GET',
		cache: true,
		url: '/main/helpers/input.php',
		error: function(xhr) {	}
	});

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
	$('img.opii').bind('mouseenter',function () {
			var $thumb = $(this);
			var $clone = $('<div />',{
				'id'		: 'opic',
				'className': 'opicw',
				'html'     	: '<img src="'+$thumb.attr('src')+'" alt="'+$thumb.attr('alt')+'" height="'+$thumb.attr('height')+'" width="'+$thumb.attr('width')+'"/><span class="opiz sblue"></span>',
				'style'		: 'top:'+$thumb.offset().top+'px;left:'+$thumb.offset().left+'px;'
			});
			var highlight = function (){
				$('#opio').show();
				$('BODY').append($clone);
			}
			$('#opio').bind('click',function(){
				$clone.remove(); 
				$('#opio').hide("explode", 1000);
				clearTimeout(highlight_timeout);
				$('#opio').unbind('click');
			});
			highlight_timeout = setTimeout(highlight,300);
			$clone.find('.opiz').bind('click',function(){
				var $zoom = $(this);
				$zoom.addClass('opil').removeClass('opiz sblue');
				var imgL_source = $thumb.attr('alt');
				$('<img class="opip" style="display:none;"/>').load(function(){
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
								$zoom.addClass('opiclose escBlue').removeClass('opil').fadeIn(function(){
									$(this).bind('click',function(){
										$clone.remove(); 
										$('#opio').hide("explode", 1000);
										clearTimeout(highlight_timeout);
										$('#opio').unbind('click');
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
		if($('#opic').length) return;
		clearTimeout(highlight_timeout);
	});
	$('#opic').live('mouseleave',function() {
		var $clone = $('#opic');
		if(!$clone.find('.opip').length){
			$clone.remove();
			clearTimeout(highlight_timeout);
			$('#opio').hide();
		}
	});
});
