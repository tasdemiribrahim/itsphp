$(document).ready(function() {	

	activateMain();
	getScript("/main/js/aile_extra.js");

	initCanvas();
	var kaynak="http://ibrahimtasdemir.mysites.com/get_file/";
	var film_div=$("#avd");
	var video=film_div.find("video").clone(true);
	$("#vidLink a").click(function(){
		film_div.hide("drop", { direction: "down" }, 5000);
		var $this=$(this),p=film_div.find(".uyari");
		i=$this.data("sira");
		$(".translate3").removeClass("translate3");
		var thisId=kaynak+$this.attr("id");
		$this.addClass("translate3");
		film_div.find("video").remove();
		$("#ccnt h3").html($this.text());
		video.find("source").eq(0).attr("src",thisId+".mp4").next().attr("src",thisId+".webm").next().attr("src",thisId+".ogg");
		p.find("a:first").attr("href",thisId+".mp4").next().attr("href",thisId+".ogg").next().attr("href",thisId+".webm");
		film_div.prepend(video).show("drop", { direction: "up" }, 5000);
		initCanvas() 
	});

});
var aa=$("#vidLink a");
var context, rctxt, video,i=0,j=aa.length;
function initCanvas() 
{
	video = document.getElementsByTagName("video")[0];
	reflection = document.getElementById("reflection");
	rctxt = reflection.getContext("2d");
	// flip canvas
	rctxt.translate(0,160);
	rctxt.scale(1,-1);
	// create gradient
	gradient = rctxt.createLinearGradient(0, 105, 0, 160);
	gradient.addColorStop(1, "rgba(255, 255, 255, 0.3)");
	gradient.addColorStop(0, "rgba(255, 255, 255, 1.0)");
	rctxt.fillStyle = gradient;
	rctxt.rect(0, 105, 320, 160);
	video.addEventListener("play", paintFrame, false);
	if (video.readyState >= video.HAVE_METADATA) 
		startPlay();
	else 
		video.addEventListener("loadedmetadata", startPlay, false);
}
function startPlay() { video.play(); }
function paintFrame() 
{
	// draw frame, and fill with the opacity gradient mask
	rctxt.drawImage(video, 0, 0, 320, 160);
	rctxt.globalCompositeOperation = "destination-out";
	rctxt.fill();
	// restore composition operation for next frame draw
	rctxt.globalCompositeOperation = "source-over";
	if (video.paused || video.ended) return;
	setTimeout(function () {paintFrame();}, 0);
}
function yeniVideo()
{
	i=(i+1)%j;
	console.log(i);
	aa.eq(i).click();
}
