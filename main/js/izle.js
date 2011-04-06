var db,updateInterval = 25000,frameWidth = 100,frameHeight = 75,frameRows = 4,frameColumns = 4,frameGrid = frameRows * frameColumns,frameCount = 0,intervalId=false,videoStarted = false,timeline = document.getElementById("timeline"),ctx = timeline.getContext("2d");
function startVideo() 
{
	$("#cnvHed").html("Ekran Görüntüleri(Tıklayarak o sahneye gidebilirsiniz!)");
	// calculate an initial frame, then create
	// additional frames on a regular timer
	updateFrame();
	if(!intervalId)
		intervalId = setInterval(updateFrame, updateInterval);
	
// only set up the timer the first time the
	// video is started
	if (videoStarted)
	  return;
	
	videoStarted = true;

	// set up a handler to seek the video when a frame
	// is clicked
	var timeline = document.getElementById("timeline");
	timeline.onclick = function(evt) {
	    var offX = evt.layerX - timeline.offsetLeft;
	    var offY = evt.layerY - timeline.offsetTop;

	    // calculate which frame in the grid was clicked
	    // from a zero-based index
	    var clickedFrame = Math.floor(offY / frameHeight) * frameRows;
	    clickedFrame += Math.floor(offX / frameWidth);

	    // find the actual frame since the video started
	    var seekedFrame = (((Math.floor(frameCount / frameGrid)) * frameGrid) + clickedFrame);

	    // if the user clicked ahead of the current frame
	    // then assume it was the last round of frames
	    if (clickedFrame > (frameCount % 16))
		seekedFrame -= frameGrid;

	    // can't seek before the video
	    if (seekedFrame < 0)
	      return;

	    // seek the video to that frame (in seconds)
	    var video = document.getElementById("movies");
	    video.currentTime = seekedFrame * updateInterval / 1000;

	    // then set the frame count to our destination
	    frameCount = seekedFrame;
	    if(!intervalId)
		intervalId = setInterval(updateFrame, updateInterval);
	}
}

// paint a representation of the video frame into our canvas
function updateFrame() {
	var video = document.getElementById("movies");

	// calculate out the current position based on frame
	// count, then draw the image there using the video
	// as a source
	var framePosition = frameCount % frameGrid;
	var frameX = (framePosition % frameColumns) * frameWidth;
	var frameY = (Math.floor(framePosition / frameRows)) * frameHeight;
	ctx.drawImage(video, 0, 0, video.videoWidth, video.videoHeight, frameX, frameY, frameWidth, frameHeight);

	frameCount++;
}

$(document).ready(function() {
	activateMain(); 
});
