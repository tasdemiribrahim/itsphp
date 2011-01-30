$(document).ready(function() {
//console.log("index.js DOM Yuklendi.");
	activateMain();
	$("#tabs").tabs({
		fx: {opacity: "toggle"},
		select:function (event, tab) 
		{
			var value=[
				["Müzik - ITSPHP","http://feeds.feedburner.com/~fc/itsphp/muzik?bg=99CCFF&amp;fg=444444&amp;anim=0"],
				["Aile - ITSPHP","http://feeds.feedburner.com/~fc/itsphp/aile?bg=FFFFFF&amp;fg=000000&amp;anim=0"],
				["Kitap - ITSPHP","http://feeds.feedburner.com/~fc/itsphp/kitap?bg=99CCFF&amp;fg=444444&amp;anim=0"]
			];
			$("#lastTab img").attr({alt:value[tab.index][0],src:value[tab.index][1] });
		}
	}).tabs("rotate", 60000, true).find("ul").append("<li id='lastTab'><img src='http://feeds.feedburner.com/~fc/itsphp/muzik?bg=99CCFF&amp;fg=444444&amp;anim=0' height='26' width='88' alt='Müzik-ITSPHP' /></li>");

	$("#hsec").prepend("<aside id='banner' role='banner'><a id='button_a'><span>Site yapım aşamasındadır. Hataları mail atın.</span></a><a id='slidebttn'>Dik<span>kat</span></a></aside>");
	$("#hsec #banner2").css("left","100px");
	$('#slidebttn').hover(
		function () {
			var $this = $(this);
			var $slidelem = $this.prev();
			$slidelem.stop().animate({'width':'100%'},300);
			$slidelem.find('span').stop(true,true).fadeIn();
			$this.addClass('button_c');
		},
		function () {
			var $this = $(this);
			var $slidelem = $this.prev();
			$slidelem.stop().animate({'width':'65px'},200);
			$slidelem.find('span').stop(true,true).fadeOut();
			$this.removeClass('button_c');
		}
	);
});

