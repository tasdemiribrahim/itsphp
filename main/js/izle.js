var db,updateInterval = 25000,frameWidth = 100,frameHeight = 75,frameRows = 4,frameColumns = 4,frameGrid = frameRows * frameColumns,frameCount = 0,intervalId=false,videoStarted = false,timeline = document.getElementById("timeline"),ctx = timeline.getContext("2d"),aj;
if(Modernizr.history)
{
	window.onpopstate = function(event) 
	{
		if(event.state)
		{
			var ifid = (event.state["ifid"]);
			filmGetir(ifid); 
		}
	};
}
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

// stop gathering the timeline frames
function stopTimeline() {
	clearInterval(intervalId);
	intervalId = false;
}

$(document).ready(function() {
	activateMain(); 
	 $.ajaxSetup({
	        type: 'GET',
	        timeout: 20000,  
	        cache: true,
	        url: '/main/index/ajax',
			beforeSend: function(){	$(".progress").show();	},
			complete:function(){	$(".progress").fadeOut();	},
			error: function(xhr, status) { $(".progress").fadeOut(); $("#filmDiv").show(); }
	    });
	
	var min=0,max=45;
	
	if(db)
	{
		db.transaction(function (tx) 
		{
			tx.executeSql('SELECT * FROM itsphp WHERE sayfa="filmMin"', [], function(tx, results) 
			{
				if(results.rows.length>0)
					min=results.rows.item(results.rows.length-1).veri;
			});
		});
		db.transaction(function (tx) 
		{
			tx.executeSql('SELECT * FROM itsphp WHERE sayfa="filmMax"', [], function(tx, results) 
			{
				if(results.rows.length>0)
					max=results.rows.item(results.rows.length-1).veri;
			});
		});
	}
	else if (Modernizr.localstorage)
	{
		if(localStorage.getItem("filmMin"))
			min=localStorage.getItem("filmMin");
		if(localStorage.getItem("filmMax"))
			max=localStorage.getItem("filmMax");
	}
	else if (Modernizr.sessionStorage)
	{
		if(sessionStorage.getItem("filmMin"))
			min=sessionStorage.getItem("filmMin");
		if(sessionStorage.getItem("filmMax"))
			max=sessionStorage.getItem("filmMax");
	}
	else
	{
		if ($.cookie("filmMin"))
			min=$.cookie("filmMin");
		if ($.cookie("filmMax"))
			max=$.cookie("filmMax");
	}
	
	$('#m').val(min).attr("aria-valuenow",min);
	$('#x').val(max).attr("aria-valuenow",max);
	var rangeSlider = $('<div></div>').slider({min: 0,max: 45,step: 5,values:[min, max],range: true,animate: true,
		slide: function(e,ui) {
			$('#m').val(ui.values[0]).attr({"aria-valuenow":ui.values[0],"aria-valuetext":ui.values[0]});
			$('#x').val(ui.values[1]).attr({"aria-valuenow":ui.values[1],"aria-valuetext":ui.values[1]});
			$("#forMin").html(ui.values[0]);
			$("#forMax").html(ui.values[1]);
		}
	}).attr({ "role": "slider", "aria-orientation": "vertical"}).before('<br /><p>Süreye göre filtrele(<output id="forMin" onforminput="value=min.value">'+min+'</output>-<output id="forMax" onforminput="value=max.value">'+max+'</output>):</p>');
	$('#uzunluk-range').after(rangeSlider).hide();
	
	$("#rcnt table tr th a,#pager a").bind("click",function(){ 
		min=$('#m').val();
		max=$('#x').val();

		if (db)
		{
			db.transaction(function (tx) {tx.executeSql("REPLACE INTO itsphp (sayfa, veri) VALUES(?, ?)", ["filmMin", min]);});
			db.transaction(function (tx) {tx.executeSql("REPLACE INTO itsphp (sayfa, veri) VALUES(?, ?)", ["filmMax", max]);});
		}
		else if (Modernizr.localstorage)
		{
			localStorage.setItem("filmMin",min);
			localStorage.setItem("filmMax",max);
		}
		else if (Modernizr.sessionStorage)
		{
			sessionStorage.setItem("filmMin",min);
			sessionStorage.setItem("filmMax",max);
		}
		else
		{
			$.cookie("filmMin", min, cookieOptions);
			$.cookie("filmMax", max, cookieOptions);
		}
		location.href=$(this).attr("href")+"?m="+min+"&x="+max;
		return false;
	});
	$("#rcnt table tr td a").bind("click",function(){ 
		var ifid=$(this).attr("id");
		if(Modernizr.history)
			window.history.pushState({ifid: ifid}, ifid);
		filmGetir(ifid); 
		return false; 
	});
	
	var mn=$('#q');
	mn.autocomplete({minLength: 5,source: '/main/index/ajax'});
	
	$('#sf').submit(function(){
		var mv=mn.val();
		mn.val("");
		if(movVal.length)
			$.ajax({
			data: 'fkay='+mv,
			success: function(cevap){
					addNotice("<p>"+mv+ " isteğiniz değerlendirilecektir. İlginiz için teşekkür ederiz.</p>");
				}
			});
		return false;
	});
});

function filmGetir(filmID)
{
	if(aj) aj.abort();
	ctx.clearRect(0,0,timeline.width,timeline.height);
	ctx.beginPath();
	frameCount = 0
	stopTimeline();
	addNotice("<p>Film getiriliyor!<br />Bekleyin!</p>");
	var film_div=$("#filmDiv");
	film_div.hide("drop", { direction: "down" }, 5000);
	_gaq.push(['_trackEvent', 'Film', filmID]);
	temizle();
	aj=$.ajax({
	    data: 'fid='+filmID,
		dataType :"json",
	    	success: function(cevap){
			if(cevap.durum=="ok")
			{
				var p=film_div.find(".uyari"),mp4=cevap.mp4,ogg=cevap.ogg,poster=cevap.poster,fad=cevap.ad;
				var video=film_div.find("video").clone(true),tubeSrc="http://www.youtube.com/v/"+cevap.tube+"?version=3";
				film_div.find("video").remove();
				video.find("source").eq(0).attr("src",mp4).next().attr("src",cevap.webm).next().attr("src",ogg).next().attr("src",cevap.ac).next().attr("src",cevap.chap).next().attr("src",cevap.en).next().attr("src",cevap.tr).next().attr("src",cevap.meta).next().find("embed").attr("src",tubeSrc).end().find("param").eq(0).attr("val",tubeSrc);
				p.find("a:first").attr("href",mp4).next().attr("href",ogg).next().attr("href",cevap.webm);
				p.siblings("a").attr({ title: fad, href: cevap.url}).find("img").attr({ src: poster, alt: fad});
				film_div.find("h3").html(fad).next().next().html("<b>Dil:</b>"+cevap.dil).next().find("time").html(cevap.released).end().next().html(cevap.view);
				$(".value").html(cevap.rating)
				film_div.prepend(video).show("drop", { direction: "up" }, 5000);
				deleteNotice();
			}
			else	addNotice("<p>"+filmID+" bilgileri alınamadı!</p>");
		}
	});
}
