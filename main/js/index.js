function getColorAvg(frame) 
{
	r = 0;
	g = 0;
	b = 0;
	// calculate average color from image in canvas
	for (var i = 0; i < frame.data.length; i += 4) 
	{
		r += frame.data[i];
		g += frame.data[i + 1];
		b += frame.data[i + 2];
	}
	r = Math.ceil(r / (frame.data.length / 4));
	g = Math.ceil(g / (frame.data.length / 4));
	b = Math.ceil(b / (frame.data.length / 4));
	return Array(r, g, b);
}

function initCanvas() 
{
	ambience = document.getElementById("ambience");
	video = document.getElementById("vid");
	scratch = document.getElementById("scratch");
	sctxt = scratch.getContext("2d");
}

function paintAmbience()
{
	// set up scratch frame
	sctxt.drawImage(video, 0, 0, 320, 160);
	frame = sctxt.getImageData(0, 0, 320, 160);
	// get average color for frame and transition to it
	color = getColorAvg(frame);
	ambience.style.backgroundColor ='rgb('+color[0]+','+color[1]+','+color[2]+')';
	if (video.paused || video.ended) return;
	// don't do it more often than once a second
	setTimeout(function () {paintAmbience();}, 1000);
}

var sctxt, video, ambience;
/* Entegre etmeden silme
if(Modernizr.history)
{
	window.onpopstate = function(event) 
	{
		if(event.state)
		{
			var dmid = (event.state["dmid"]);
			heavyGrupDetayGetir(dmid);
		}
	};
}
_gaq.push(['_trackEvent', 'Grup', id]);
if (db)
	db.transaction(function (tx) {tx.executeSql("REPLACE INTO itsphp (sayfa, veri) VALUES(?, ?)", ["muzik", id]);});
else if (Modernizr.localstorage)
	localStorage.setItem("muzik",id);
else if (Modernizr.sessionstorage)
	sessionStorage.setItem("muzik", id);
else
	$.cookie("muzik", id, cookieOptions);

	if(db)
		db.transaction(function (tx) 
		{
			tx.executeSql('SELECT * FROM itsphp WHERE sayfa="muzik"', [], function(tx, results) 
			{
				if(results.rows.length>0)
					heavyGrupDetayGetir(results.rows.item(results.rows.length-1).veri);
			});
		});
	else if (Modernizr.localstorage && localStorage.getItem("muzik"))
		heavyGrupDetayGetir(localStorage.getItem("muzik"));
	else if (Modernizr.sessionStorage && sessionStorage.getItem("muzik"))
		heavyGrupDetayGetir(sessionStorage.getItem("muzik"));
	else if ($.cookie("muzik"))
		heavyGrupDetayGetir($.cookie("muzik"));

	if(Modernizr.webworkers)
	{
		var worker = new Worker("worker/aile.js");
		worker.postMessage('getir='+veri[0]);
		worker.onmessage = function (event) {
alert(event.data);
		 	isle(event.data);
		};
	}
*/

$(document).ready(function() {
	activateMain();	

	initCanvas();

	$.getScript("http://jquery.thewikies.com/swfobject/jquery.swfobject.1-1-1.min.js", function () {
	 $.getScript("http://demo.tutorialzine.com/2010/07/youtube-api-custom-player-jquery-css/youTubeEmbed/youTubeEmbed-jquery-1.0.js", function () {
		$('.dmt').bind("click",function(e){
			$('#player').html("").youTubeEmbed({  video : 'http://www.youtube.com/watch?v='+$(this).attr("id"),  width : 400 }); 
			$('#bounceb').bounceBoxShow();
		});
	});});

	var videoDevice = document.getElementsByTagName("device")[0];
	if(videoDevice.data)
	{
		var video = document.getElementById("imv"),button = document.getElementById("imb"),recording = false,videoStream;
		$("#imv,#imb").removeClass("sakla");

		videoDevice.addEventListener("change", play, false);
		function play() 
		{
			videoStream = this.data;
			video.src = videoStream.url;
			video.play();
			button.disabled = false;
		}

		button.addEventListener("click", recordToggle, false);
		function recordToggle() 
		{
			if (!recording) 
			{
				recorder = videoStream.record();
				recording = true;
				button.value = "Dur";
			} 
			else 
			{
				file = recorder.stop();
				// do something with the file
				upload(file);
				recording = false;
				button.value = "Kayıt";
			}
		}
	}
});
