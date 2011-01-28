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

$(document).ready(function() {
//console.log("index.js DOM Yuklendi.");
	activateMain();	

	initCanvas();

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
