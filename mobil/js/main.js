/*
 * 
 * Find more about this plugin by visiting
 * http://miniapps.co.uk/
 *
 * Copyright (c) 2010 Alex Gibson, http://miniapps.co.uk/
 * Released under MIT license 
 * http://miniapps.co.uk/license/
 * 
 * Version 0.1 - Last updated: November 23 2010
 * 
 */

function WKShake(threshold) {

	this.threshold = 18, //velocity threshold for shake to register
	this.lastTime = new Date(); //since no event timestamp property is available, must use date to prevent multiple shakes firing
	
	//user defined threshold option
	if (typeof threshold == 'object') {
		this.threshold = threshold;
	}
}

//event handler
WKShake.prototype.handleEvent = function(e) {
    switch (e.type) {
        case 'devicemotion': this.onDeviceMotion(e); break;
    }
};

//start listening for devicemotion
WKShake.prototype.start = function() {
	this.lastTime = new Date(),
	this.lastX = null,
	this.lastY = null,
	this.lastZ = null;
	if (('ondevicemotion' in window)) {
		window.addEventListener('devicemotion', this, false);
	}
};

//stop listening for devicemotion
WKShake.prototype.stop = function() {
	if (('ondevicemotion' in window)) {
		window.removeEventListener('devicemotion', this, false);
	}
	this.lastTime = new Date(),
	this.lastX = null,
	this.lastY = null,
	this.lastZ = null;
};

//calculates if shake did occur
WKShake.prototype.onDeviceMotion = function(e) {

	var current = e.accelerationIncludingGravity;

	if((this.lastX !== null) || (this.lastY !== null) || (this.lastZ !== null)) {

		var deltaX = Math.abs(this.lastX - current.x),
			deltaY = Math.abs(this.lastY - current.y),
			deltaZ = Math.abs(this.lastZ - current.z);	
		
		if(((deltaX > this.threshold) && (deltaY > this.threshold)) || 
		   ((deltaX > this.threshold) && (deltaZ > this.threshold)) || 
		   ((deltaY > this.threshold) && (deltaZ > this.threshold))) {
		
			//calculate time in milliseconds since last shake registered
			var currentTime = new Date(),
				timeDifference = currentTime.getTime() - this.lastTime.getTime();
			
			if (timeDifference > 200) {
				this.shakeEventDidOccur();	
				this.lastTime = new Date();		
			}
		}
	}
	this.lastX = current.x;
	this.lastY = current.y;
	this.lastZ = current.z;	
};

//custom method for when shake event occurs
WKShake.prototype.shakeEventDidOccur = function() {


};


/*
 * 
 * Find more about this plugin by visiting
 * http://miniapps.co.uk/
 *
 * Copyright (c) 2010 Alex Gibson, http://miniapps.co.uk/
 * Released under MIT license 
 * http://miniapps.co.uk/license/
 * 
 * Version 1.1 - Last updated: July 22 2010
 * 
 */

function WKTouch(node, options) {

	this.node = typeof node == 'object' ? node : document.getElementById(node);

	this.options = {
		dragable : true,
		scalable : true,
		rotatable : true,
		opacity : true
	}
    
	// User defined options
	if (typeof options == 'object') {
		for (var i in options) {
			this.options[i] = options[i];
		}
	}
}

//static property to store the zIndex for an element
WKTouch.zIndexCount = 1;
        
//touch event handler
WKTouch.prototype.handleEvent = function (e) {
    switch (e.type) {
        case 'touchstart': this.onTouchStart(e); break;
        case 'touchmove': this.onTouchMove(e); break;
        case 'touchend': this.onTouchEnd(e); break;
        case 'touchcancel': this.onTouchCancel(e); break;
    }
};

WKTouch.prototype.init = function () {          
    this.startX = 0; //starting X coordinate
    this.startY = 0; //starting Y coordinate
    this.curX = 0; //current X coordinate
    this.curY = 0; //current Y coordinate
    this.elementPosX = 0; //offset left coordinate
    this.elementPosY = 0; //offset top coordinate
    this.rotation = 0; //default rotation in degrees
    this.scale = 1.0; //default scale value
    this.gesture = false; //gesture flag
    this.node.addEventListener('touchstart', this, false);
};

WKTouch.prototype.onTouchStart = function (e) {
    e.preventDefault();
    //bring item to the front
    this.node.style.zIndex = WKTouch.zIndexCount++;
    //drag event
    if ((e.targetTouches.length === 1) && (this.options.dragable)) { 
        //get starting coordinates
        this.startX = e.targetTouches[0].pageX;
        this.startY = e.targetTouches[0].pageY;
        //get offset coordinates
        this.elementPosX = this.node.offsetLeft;
        this.elementPosY = this.node.offsetTop; 
    }        
    //add touchmove and touchend event listeners
    this.node.addEventListener('touchmove', this, false);
    this.node.addEventListener('touchend', this, false);
    this.node.addEventListener('touchcancel', this, false);
    //set opacity
    if (this.options.opacity) {
        this.node.style.opacity = '0.5';
    }
};
        
WKTouch.prototype.onTouchMove = function (e) {
    e.preventDefault();
    //drag event
    if ((e.targetTouches.length === 1) && (this.options.dragable)) {
        //calculate distance
        this.curX = e.targetTouches[0].pageX - this.startX;
        this.curY = e.targetTouches[0].pageY - this.startY;
        //set position
        this.node.style.left = (this.elementPosX + this.curX) + "px";
        this.node.style.top = (this.elementPosY + this.curY) + "px";
    }
    else if ((e.targetTouches.length === 2) && ((this.options.scalable) || (this.options.rotatable))) {
        //gesture event
        this.gesture = true;
        var myTransform = "";
        //scale and rotate
        if (this.options.scalable) {
            myTransform += "scale(" + (this.scale * e.scale) + ")";
        } 
        if (this.options.rotatable) {
            myTransform += "rotate(" + ((this.rotation + e.rotation) % 360) + "deg)";
        }
        this.node.style.webkitTransform = myTransform;
    }
};
        
WKTouch.prototype.onTouchEnd = function (e) {
    e.preventDefault(); 
    //remove event listeners
    this.node.removeEventListener('touchmove', this, false);
    this.node.removeEventListener('touchend', this, false);
    this.node.removeEventListener('touchcancel', this, false);
    //gesture event
    if (this.gesture) {
        //store scale and rotate values
        this.scale *= e.scale;
        this.rotation = (this.rotation + e.rotation) % 360;
        this.gesture = false;
    }
    this.startX = 0;
    this.startY = 0;
    this.elementPosX = 0;
    this.elementPosY = 0;
    //set opacity
    if (this.options.opacity) {
        this.node.style.opacity = '1';
    }   
};

WKTouch.prototype.onTouchCancel = function (e) {
    e.preventDefault();
    //remove event listeners
    this.node.removeEventListener('touchmove', this, false);
    this.node.removeEventListener('touchend', this, false);
    this.node.removeEventListener('touchcancel', this, false);
    //gesture event
    if (this.gesture) {
        //store scale and rotate values
        this.scale *= e.scale;
        this.rotation = (this.rotation + e.rotation) % 360;
        this.gesture = false;
    }
    this.startX = 0;
    this.startY = 0;
    this.elementPosX = 0;
    this.elementPosY = 0;
    //set opacity
    if (this.options.opacity) {
        element.style.opacity = '1';
    }   
};



/*$(document).live("mobileinit", function(){
  $.mobile.ajaxLinksEnabled = false;
});*/



$(document).ready(function() {	
	var Firefox = /firefox/i.test(navigator.userAgent);
	var Opera = /opera/i.test(navigator.userAgent);
	if (!Modernizr.cssgradients) 
	{
		var link = document.createElement("link");
		link.setAttribute("rel", "stylesheet");
		link.setAttribute("href", "css/popup-svg.css");
		document.getElementsByTagName("head")[0].appendChild(link);
	}

	$("footer .tus").bind("tap",function (){ 
		$.mobile.pageLoading(); 
		$.mobile.changePage($(this).attr("href"), "slideup"); 
		$.mobile.pageLoading( true ); 
	});
	$("footer .tus").bind("click",function (){ 
		location = $(this).attr("href"); 
	});

	setupPopup = function (opts) {
	    if (opts.selector) {
		var selector = opts.selector;
	    } else {
		return false;
	    }

	    // Default title for popup:
	    var title = "Alert!";
	    if (opts.title) {
		var title = opts.title;
	    }

	    // Initialize message:
	    var message = "";
	    if (opts.message) {
		var message = opts.message;
	    }

	    // Setup default Cancel button:
	    var cancelButton = "Cancel";
	    if (opts.cancelButton) {
		cancelButton = opts.cancelButton;
	    }

	    // Setup default Continue button:
	    var continueButton = "Continue";
	    if (opts.continueButton) {
		continueButton = opts.continueButton;
	    }

	    $(selector).append('<div class="screenCover hidden"></div><section class="popup hidden" id="popup"><div><header><h6>' + title + '</h6></header><p>' + message + '</p><footer><div class="tus cancel">' + cancelButton + '</div><div class="tus continue">' + continueButton + '</div></footer></div></section>');

	    var element1 = new WKTouch('popup').init();   

		$(selector + " .tus").bind("click", function () {
		    $(selector + " .screenCover").addClass("hidden");
		    $(selector + " .popup").addClass("hidden");
		});

	    if (opts.callback) {
		$(selector + " .popup .continue").bind("click", function () {
		    opts.callback();
		});
	    }

	};

	setupPopup({
			selector: "#bannerSection",
			title: 'Dikkatle Duyurulur!',
			message: 'Bu sayfa mobil cihazlar için jQuery Mobile Alpha 2 kullanılarak hazırlanmıştır. Büyük ekranlı cihazlar için ana sayfamıza gidebilirsiniz. Henüz yapım aşamasında olduğu için hatalar olabilir.',
			cancelButton: 'Kapat',
			continueButton: 'Olsun',
			callback: function () {
			    var popupMessageTarget = $('#popupMessageTarget');
			    popupMessageTarget.html('Anlayışınız için teşekkür ederiz.');
			    popupMessageTarget.removeClass("animatePopupMessage");
			    popupMessageTarget.addClass("animatePopupMessage");
			    if ((/Internet Explorer/i.test(navigator.appName) && /9/.test(navigator.appVersion)) || Firefox || Opera) {
				popupMessageTarget.style.opacity = 1;
				setTimeout(function () {
				    popupMessageTarget.style.opacity = 0;
				}, 2000);
		    }
		}
	});

	// This is just an animation for popup callback. Not part of popup functionality.
	$("#popupMessageTarget").bind("webkitAnimationEnd", function () {
	    $(this).removeClass("animatePopupMessage");
	    this.empty();
	});

	// Function to show the popup. It also creates the screen cover:
	showPopup = function (selector) {
	    var screenCover = $(selector + " .screenCover");
	    /* Make the screen cover extend the entire width of the document, even if it extends beyond the viewport. We do this by getting the window's pageYOffset.
	    */
	    screenCover.height(window.innerHeight + window.pageYOffset);
	    var popup = $(selector + " .popup");

	    /* Center the popup to the scroll view, not the viewport. This will center it to where a user is in a long document. */
	    $(selector + " .popup").css("top", ((window.innerHeight / 2) + window.pageYOffset) - (popup.clientHeight / 2) + "px");
	    $(selector + " .popup").css("left", (window.innerWidth / 2) - (popup.clientWidth / 2) + "px");

	    // Show screen cover and popup:
	    $(selector + " .screenCover").removeClass("hidden");
	    $(selector + " .popup").removeClass("hidden");
	};

	$(".openPopup").bind("click", function () { showPopup("#bannerSection"); });
	$(".tus").bind("touchstart", function (){  button.addClass("touched"); }).bind("touchend", function () { button.removeClass("touched"); });

	var myShakeEvent = new WKShake();
	myShakeEvent.start();
	myShakeEvent.shakeEventDidOccur = function() {
		if (confirm("Sayfa tazelensin mi?"))
			location.reload(true);
	}
});
