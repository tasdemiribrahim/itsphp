$.fn.infiniteCarousel = function () {
    function repeat(str, num) {
        return new Array( num + 1 ).join( str );
    }
    return this.each(function () {
        var $wrapper = $('> div', this).css('overflow', 'hidden'),
            $slider = $wrapper.find('> ul'),
            $items = $slider.find('> li'),
            $single = $items.filter(':first'),
            singleWidth = $single.outerWidth(), 
            visible = Math.ceil($wrapper.innerWidth() / singleWidth),
            currentPage = 1,
            pages = Math.ceil($items.length / visible);            
        if (($items.length % visible) != 0) {
            $slider.append(repeat('<li class="empty" />', visible - ($items.length % visible)));
            $items = $slider.find('> li');
        }
        $items.filter(':first').before($items.slice(- visible).clone().addClass('cloned'));
        $items.filter(':last').after($items.slice(0, visible).clone().addClass('cloned'));
        $items = $slider.find('> li');
        $wrapper.scrollLeft(singleWidth * visible);
        function gotoPage(page) {
            var dir = page < currentPage ? -1 : 1,
                n = Math.abs(currentPage - page),
                left = singleWidth * dir * visible * n;
            $wrapper.filter(':not(:animated)').animate({
                scrollLeft : '+=' + left
            }, 1000, function () {
                if (page == 0) {
                    $wrapper.scrollLeft(singleWidth * visible * pages);
                    page = pages;
                } else if (page > pages) {
                    $wrapper.scrollLeft(singleWidth * visible);
                    page = 1;
                } 
                currentPage = page;
            });    
            return false;
        }
        $wrapper.after('<a class="infiniteArrow back prevArrow">&lt;</a><a class="infiniteArrow forward nextArrow">&gt;</a>');
        $('a.back', this).bind("click",function () {
            return gotoPage(currentPage - 1);
        });
        $('a.forward', this).bind("click",function () {
            return gotoPage(currentPage + 1);
        });
        $(this).bind('goto', function (event, page) {
            gotoPage(page);
        }).bind('next', function () {
	    return gotoPage(currentPage + 1);
	});
    });  
};

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

	var auto= true;
	$('.infiniteCarousel').infiniteCarousel().mouseover(function(){ auto=false; }).mouseout(function(){ auto=true; });
	setInterval(function(){if(auto){ $('.infiniteCarousel').trigger('next') }},10000);
	 $.getScript("http://ufd.googlecode.com/svn-history/r111/trunk/examples/js/jquery.bgiframe.min.js", function () {
		$('#dialog').dialog({
			autoOpen: false,
			height: 280,
			modal: true,
			resizable: true,
			bgiframe: true
		}).removeClass("sakla");
	});
	
	$('.infiniteCarousel').bind("click",function(e) {
		var figure=$(e.target).closest('figure');
		$("#ui-dialog-title-dialog").html(figure.children("figcaption").html());
		$('#dialog img').attr("src",figure.children("img").attr("src")).parent().dialog('open');
	});

	var videoDevice = document.getElementsByTagName("device")[0];
	if(videoDevice.data)
	{
		var video = document.getElementById("mediaVid"),button = document.getElementById("mediaButton"),recording = false,videoStream;
		$("#mediaVid,#mediaButton").removeClass("sakla");

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
