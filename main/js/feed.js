$(document).ready(function() {
//console.log("index.js DOM Yuklendi.");
	activateMain();
	$("#tabs").tabs({
		fx: {opacity: "toggle"},
		select:function (event, tab) 
		{
			var value=[
				["Müzik - ITSPHP","http://feeds.feedburner.com/~fc/muzik-itsphp?bg=99CCFF&amp;fg=444444&amp;anim=0"],
				["Aile - ITSPHP","http://feeds.feedburner.com/~fc/aile-itsphp?bg=FFFFFF&amp;fg=000000&amp;anim=0"],
				["Kitap - ITSPHP","http://feeds.feedburner.com/~fc/kitap-itsphp?bg=99CCFF&amp;fg=444444&amp;anim=0"]
			];
			$("#lastTab img").attr({alt:value[tab.index][0],src:value[tab.index][1] });
		}
	}).tabs("rotate", 60000, true).find("ul").append("<li id='lastTab'><img src='http://feeds.feedburner.com/~fc/muzik-itsphp?bg=99CCFF&amp;fg=444444&amp;anim=0' height='26' width='88' alt='Müzik-ITSPHP' /></li>");
});

