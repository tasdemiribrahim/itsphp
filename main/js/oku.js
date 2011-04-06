$(document).ready(function() {	
	activateMain();

	$.getScript("/main/js/jquery/jquery.masonry.min.js", function () {	$('.wrap').masonry({columnWidth: 210, singleMode: true, itemSelector: '.box' });	});

	$.getScript("http://sandbox.sebnitu.com/jquery/quovolver/demo/jquery.quovolver.mini.js", function () {	 		$('blockquote').quovolver(500,20000);	});

	$('.blue li a').bind('click',function(event){
		var $anchor = $(this);
		$('html,body').stop().animate({
			scrollTop: $($anchor.attr("href")).offset().top-50
		}, 1500,'easeInOutExpo'); 
		event.preventDefault();
	});
	/*
		"http://feeds2.feedburner.com/ScriptAndStyle"
		"http://www.phpdeveloper.org/feed"
		"http://www.asp.net/rss/spotlight"
		"http://feeds.feedburner.com/codrops"
		"http://feeds2.feedburner.com/w3avenue"
	*/
});
