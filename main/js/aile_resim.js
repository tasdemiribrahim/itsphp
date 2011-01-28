$(document).ready(function() {	

	activateMain();
	
	var d = new Date();
	$.ajaxSetup({
		type: 'GET',
		timeout: 20000,    
		async: true,
		cache: false,
		url: '/main/ajax/hotspot?_='+d.getTime(),
		beforeSend: function(){	$(".progress").show();	},
		complete:function(){	$(".progress").fadeOut();	},
		error: function(xhr, status) { $(".progress").fadeOut(); }
	});
	
	getScript("js/aile_extra.js");

	var targetX, targetY,jasimage=$("#arji"),tagCounter = 0;
	
	jasimage.wrap('<div id="artw"></div>');
	 $("#artw").css("width", jasimage.outerWidth());
	 $("#artw").append('<div id="artt"></div><div id="arti"><label for="artn">Kişinin Adı:</label><input id="artn"><input type="submit" value="Kaydet" /><input type="reset" value="Çık" /></div>');

	 jasimage.click(function(e){
		 mouseX = e.pageX - $("#artw").offset().left;
		 mouseY = e.pageY - $("#artw").offset().top;
		 targetWidth = $("#artt").outerWidth();
		 targetHeight = $("#artt").outerHeight();
		 targetX = mouseX-targetWidth/2;
		 targetY = mouseY-targetHeight/2;
		 if(targetY<0)
			inputY=targetY+targetHeight;
		 else	
			inputY = mouseY-targetHeight/2;
		 if(mouseX+targetWidth+$("#arti").outerWidth()>jasimage.outerWidth()) 
			inputX=targetX-$("#arti").outerWidth();
		else if(targetY<0 && targetX>0)
			inputX=targetX;
		else
			inputX = mouseX+targetWidth/2;
		 if($("#artt").css("display")=="block")
		 {
			 $("#artt").animate({left: targetX, top: targetY}, 500);
			 $("#arti").animate({left: inputX, top: inputY}, 500);
		 } 
		 else 
		 {
			 $("#artt").css({left: targetX, top: targetY}).fadeIn();
			 $("#arti").css({left: inputX, top: inputY}).fadeIn();
		 }

		 $("#artn").focus();
	 });

	 $('#arti input[type="reset"]').click(function(){closeTagInput();	return false; });
	 $("#artn").keyup(function(e) {if(e.keyCode == 13) submitTag(); });
	 $('#arti input[type="submit"]').click(function(){	submitTag();	return false; });
	 
	 $(".arhi").live("mouseover",function(){ 
		var id=$(this).attr("id");
		matches=id.match(/^arhi-([0-9]+)$/); 
		$("#h-"+matches[1]).addClass("arhh");
	});
	
	 $(".arhi").live("mouseout",function(){ 
		var id=$(this).attr("id");
		matches=id.match(/^arhi-([0-9]+)$/); 
		$("#h-"+matches[1]).removeClass("arhh");
	});	
	
	$(".arr").live("click",function () {
		var id=$(this).parent().attr("id");
		console.log(id);
		matches=id.match(/^arhi-([0-9]+)$/); 
		console.log(matches);
		answer= confirm ($(this).parent().text() + " emin misiniz?");
		if(!answer) return false;
		/* $.ajax({	
			data: "arr="+jasimage.attr("src")+"&id="+matches[1],
			success:function(cevap){
				if(cevap==1)
				{
					 $("#arhi-"+matches[1]).remove();
					 $("#h-"+matches[1]).remove();
				}
				else	addNotice("<p>Etiket silinemedi!</p>");
			}
		});*/
		 return false;
	 });
	
	 function submitTag()
	 {
		tagValue = $("#artn").val();
		$.ajax({	
			dataType:"json",
			data: "arh="+jasimage.attr("src")+"&id="+tagCounter+"&val="+tagValue+"&x="+targetX+"&y="+targetY,
			success:function(cevap)
			{
				if(cevap>0)
				{
					hotSpotImg(tagValue);
					tagCounter++;
				}
				else addNotice("<p>Etiket kaydedilemedi!</p>");
			}		
		});
		closeTagInput();
	 }
	 
	 function hotSpotImg(tagValue)
	 {
		$("#artw").after('<span class="arhi pointed" id="arhi-' + tagCounter + '"> ' + tagValue + ' <a class="arr">(Sil)</a></span>');
		$("#artw").append('<div id="h-' + tagCounter + '" class="arh" style="left:' + targetX + 'px; top:' + targetY + 'px;"><span>' + tagValue + '</span></div>');
	 }

	 function closeTagInput()
	 {
		 $("#artt").fadeOut();
		 $("#arti").fadeOut();
		 $("#artn").val("");
	 }
	 
	 function changeImage()
	 {
		closeTagInput();
		tagCounter=0;
		$(".arh,.arhi").remove();
		$.ajax({	
			data: "get="+jasimage.attr("src"),
			dataType :"json",
			success:function(cevap){
				var i=cevap.length;
				while(i--)
				{
					tagCounter=cevap[i].spot;
					targetX=cevap[i].x;
					targetY=cevap[i].y;
					hotSpotImg(cevap[i].val);
				}
				if(cevap.length!=0) tagCounter++;
			}
		});
	 }

	var JaS = {
		imagePath : "http://farm5.static.flickr.com/",
		images : [
			["4082/4758467508_3510ce683e.jpg", "", "Ömer Taşdemir,Şakir Taşdemir"],
			["4101/4758467154_444e462948.jpg", "", "Sevde Ceren Taşdemir"],
			["4123/4757828915_e5b4d52b38.jpg", "", "Ömer Taşdemir,Rafet Taşdemir"],
			["4117/4757829253_33f88d8741.jpg", "", "Fatma Taşdemir,Güldeste"],
			["4081/4758469310_26019c9dc5.jpg", "", "Fatma Taşdemir"],
			["4134/4758470002_7b965b99e0.jpg", "", "Fatma Taşdemir,Ömer Taşdemir"],
			["4117/4758470604_04eb343f5c.jpg", "", "Fatma Taşdemir,Saliha Taşdemir,Mehmet Ali Taşdemir"], 
			["4120/4757831973_d52b3e8337.jpg", "", "Akgül Murat"],
			["4078/4757832605_8e6fd38ab8.jpg", "", "Gamze"],
			["4134/4758472722_6d69259c01.jpg", "", "Gamze,Güldeste"],
			["4139/4757833827_7e4ccfbb8d.jpg", "", "Hümeyra Çiftçi"],
			["4081/4758473486_1b726f546f.jpg", "", "Hümeyra Çiftçi,Fatma Taşdemir,Ömer Taşdemir"],
			["4075/4757834939_9cd8722959.jpg", "", "Furkan Çiftçi,Rabia Çiftçi,Aytekin Çiftçi"],
			["4138/4758474300_f683d28e24.jpg", "", "Furkan Çiftçi"],
			["4080/4758474954_801bd14a38.jpg", "", "Hümeyra Çiftçi"],
			["4099/4757835811_78162f2c05.jpg", "", "Hümeyra Çiftçi,Rabia Çiftçi"],
			["4118/4757836515_bae11d3f60.jpg", "", "Hümeyra Çiftçi,Rabia Çiftçi,Furkan Çiftçi"],
			["4116/4757837669_972c9ca791.jpg", "", "Hümeyra Çiftçi,Ömer Taşdemir,Furkan Çiftçi"]
		],
		fadeContainerId : "arjc",
		imageContainerId : "arji",
		imageTextContainerId : "arjit",
		previousLinkId : "arpi",
		nextLinkId : "arni",
		imageCounterId : "aric",
		startSlideShowId : "arsss",
		stopSlideShowId : "arstop",
		thumbnailContainerId: "arjt",
		tagsContainerId: $("#jas-nav"),
		tagsSelectAllId: "arjsat",
		useImageText : true,
		useThumbnails : true,
		useTags : true,
		useKeyboardShortcuts : false,
		useFadingIn : true,
		useFadingOut : true,
		useFadeWhenNotSlideshow : false,
		useFadeForSlideshow : true,
		useFadeAtInitialLoad : false,
		fadeIncrement : 0.1,
		fadeInterval : 100, // Milliseconds
		timeForSlideInSlideshow : 1500, // Milliseconds

		// JaS function parameters
		allImages : null,
		currentImages : null,
		fadeContainer : null,
		imageContainer : null,
		imageTextContainer : null,
		previousLink : null,
		nextLink : null,
		imageCounter : null,
		startSlideShowLink : null,
		stopSlideShowLink : null,
		thumbnailContainer : null,
		thumbnailCollection : [],
		currentThumbnailSelected : null,
		tagsContainer : null,
		tagsSelectAll : null,
		tagsList : null,
		tags : [],
		tagsCheckboxes : [],
		selectAllTags : true,
		imageText : null,
		imageText : "",
		imageSource : "",
		imageIndex : 0,
		fadingIn : true,
		fadeLevel : 0,
		fadeEndLevel : 1,
		fadeTimer : null,
		hasOpacitySupport : false,
		useMSFilter : false,
		useMSCurrentStyle : false,
		slideshowIsSupported : false,
		slideshowIsPlaying : false,
		functionAfterFade : null,
		isInitialLoad : false,

		init : function (){
			window.log("aile_agac slide");
			if(document.getElementById){
				this.fadeContainer = document.getElementById(this.fadeContainerId);
				this.imageContainer = document.getElementById(this.imageContainerId);
				this.slideshowIsSupported = this.fadeContainer && this.imageContainer;
				if(this.slideshowIsSupported)
				{
					this.allImages = this.images;
					this.currentImages = this.images;
					if(this.useImageText)
					{
						this.imageTextContainer = document.getElementById(this.imageTextContainerId);
						if(!this.imageTextContainer)
							this.useImageText = false;
					}
					this.hasOpacitySupport = typeof this.fadeContainer.style.filter != "undefined" || typeof this.fadeContainer.style.opacity != "undefined";
					this.useMSFilter = typeof this.fadeContainer.style.filter != "undefined";
					this.useMSCurrentStyle = typeof this.fadeContainer.currentStyle != "undefined";

					this.previousLink = document.getElementById(this.previousLinkId);
					this.previousLink.onclick = function(oEvent){
						var oEvent = (typeof oEvent != "undefined")? oEvent : event;
						JaS.preventDefaultEventBehavior(oEvent);
						JaS.previousImage();
					};
					this.nextLink = document.getElementById(this.nextLinkId);
					this.nextLink.onclick = function(oEvent){
						var oEvent = (typeof oEvent != "undefined")? oEvent : event;
						JaS.preventDefaultEventBehavior(oEvent);
						JaS.nextImage();
					};
					this.imageCounter = document.getElementById(this.imageCounterId);
					this.startSlideShowLink = document.getElementById(this.startSlideShowId);
					if(this.startSlideShowLink){
						this.startSlideShowLink.style.display = "inline";
					}
					this.startSlideShowLink.onclick = function(oEvent){
						var oEvent = (typeof oEvent != "undefined")? oEvent : event;
						JaS.preventDefaultEventBehavior(oEvent);
						JaS.startSlideshow();
					};
					this.stopSlideShowLink = document.getElementById(this.stopSlideShowId);
					if(this.stopSlideShowLink)
						this.stopSlideShowLink.style.display = "none";
					this.stopSlideShowLink.onclick = function(oEvent){
						var oEvent = (typeof oEvent != "undefined")? oEvent : event;
						JaS.preventDefaultEventBehavior(oEvent);
						JaS.stopSlideshow();
					};
					if(this.useKeyboardShortcuts){
						document.onkeydown = function(oEvent){
							var oEvent = (typeof oEvent != "undefined")? oEvent : event;
							JaS.applyKeyboardNavigation(oEvent);
						};
					}
					this.thumbnailContainer = document.getElementById(this.thumbnailContainerId);
					if(this.useThumbnails && this.thumbnailContainer)
						this.createThumbnails();
					this.tagsContainer = this.tagsContainerId;
					if(this.useTags && this.tagsContainer){
						this.tagsSelectAll = document.getElementById(this.tagsSelectAllId);
						if(this.tagsSelectAll){
							this.tagsSelectAll.onclick = function (oEvent){
								JaS.tagsSelectAll = this.checked;
								JaS.markAllTags();
							};
							this.createTagList();
						}
					}
					this.isInitialLoad = true;
					this.setImage();
					this.isInitialLoad = false;
				}
			}
		},

		setImage : function (){
			if(this.currentImages.length > 0){
				this.imageContainer.style.visibility = "visible";
				this.imageSource = this.currentImages[this.imageIndex][0];
				this.imageText = this.currentImages[this.imageIndex][1];
				if(this.useFadingOut && (this.slideshowIsPlaying && this.useFadeForSlideshow) || (!this.slideshowIsPlaying && this.useFadeWhenNotSlideshow) && (this.useFadeAtInitialLoad && this.isInitialLoad || !this.isInitialLoad))
					this.fadeOut();
				else
				{
					this.displayImageCount();
					this.imageContainer.setAttribute("src", (this.imagePath + this.imageSource));
					this.setImageText();
					this.previousLink.style.visibility = (this.imageIndex > 0)? "visible" : "hidden";
					this.nextLink.style.visibility = (this.imageIndex < (this.currentImages.length - 1))? "visible" : "hidden";
					if((this.useFadeAtInitialLoad && this.isInitialLoad || !this.isInitialLoad) && ((this.slideshowIsPlaying && this.useFadeForSlideshow) || (!this.slideshowIsPlaying && this.useFadeWhenNotSlideshow)))
						this.fadeIn();
				}
				changeImage();
				if(this.useThumbnails)
					this.markCurrentThumbnail();
			}
			else
			{
				this.imageSource = "";
				this.imageText = "";
				this.displayImageCount();
				this.imageContainer.style.visibility = "hidden";
				this.setImageText();
			}
		},

		displayImageCount : function (){
			if(this.imageCounter)
				this.imageCounter.innerHTML = (((this.currentImages.length > 0)? this.imageIndex : -1) + 1) + " / " + this.currentImages.length;
		},

		nextImage : function (){
			if(this.imageIndex < (this.currentImages.length - 1)){
				++this.imageIndex;
				this.setImage();
			}
			else if(this.slideshowIsPlaying){
				this.stopSlideshow();
				this.imageIndex = 0;
				this.setImage();
			}
		},

		previousImage : function (){
			if(this.imageIndex > 0){
				--this.imageIndex;
				this.setImage();
			}
		},

		setImageText : function (){
			this.imageTextContainer.setAttribute("alt", this.imageText);
			if(this.useImageText && typeof this.imageText == "string")
				this.imageTextContainer.innerHTML = this.imageText;
		},

		startSlideshow : function (){
			if(this.currentImages.length > 0){
				this.startSlideShowLink.style.display = "none";
				this.stopSlideShowLink.style.display = "inline";
				this.slideshowIsPlaying = true;
				this.fadeTimer = setTimeout("JaS.nextImage()", JaS.timeForSlideInSlideshow);
			}
		},

		stopSlideshow : function (){
			if(this.currentImages.length > 0){
				this.startSlideShowLink.style.display = "inline";
				this.stopSlideShowLink.style.display = "none";
				this.slideshowIsPlaying = false;
				this.setFadeParams(false, 1, 0);
				this.setFade();
				clearTimeout(this.fadeTimer);
			}
		},

		fadeIn : function (){
			this.setFadeParams(true, 0, 1);
			this.functionAfterFade = null;
			this.fade();
			if(this.slideshowIsPlaying)
				this.functionAfterFade = "this.startSlideshow()";
		},

		fadeOut : function (){
			this.setFadeParams(false, 1, 0);
			this.functionAfterFade = "this.fadeOutDone()";
			this.fade();
		},

		fadeOutDone : function (){
			this.displayImageCount();
			this.imageContainer.setAttribute("src", (this.imagePath + this.imageSource));
			changeImage();
			this.setImageText();
			if(this.useFadingIn)
				this.fadeIn();
			else{
				this.fadeLevel = 1;
				this.setFade();
			}
		},

		fade : function (){
			if((this.fadingIn && this.fadeLevel < this.fadeEndLevel) || !this.fadingIn && this.fadeLevel > this.fadeEndLevel){
				this.fadeLevel = (this.fadingIn)? this.fadeLevel + this.fadeIncrement : this.fadeLevel - this.fadeIncrement;
				// This line is b/c of a floating point bug in JavaScript
				this.fadeLevel = Math.round(this.fadeLevel * 10) / 10;
				this.setFade();
				this.fadeTimer = setTimeout("JaS.fade()", this.fadeInterval);
			}
			else
			{
				clearTimeout(this.fadeTimer);
				if(this.functionAfterFade)
					eval(this.functionAfterFade);
			}
		},

		setFade : function (){
			if(this.useMSFilter)
				this.fadeContainer.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity=" + (this.fadeLevel * 100) + ")";
			else
				this.fadeContainer.style.opacity = this.fadeLevel;
		},

		setFadeParams : function (bFadingIn, intStartLevel, intEndLevel){
			this.fadingIn = bFadingIn;
			this.fadeLevel = intStartLevel;
			this.fadeEndLevel = intEndLevel;
		},

		createThumbnails : function (){
			this.thumbnailContainer.innerHTML = "";
			this.thumbnailCollection = [];
			var oThumbnailsList = document.createElement("ul");
			var oListItem;
			var oThumbnail;
			var oCurrentImage;
			for(var i=0; i<this.currentImages.length; i++){
				oCurrentImage = this.currentImages[i];
				oListItem = document.createElement("li");
				oThumbnail = document.createElement("img");
				oThumbnail.setAttribute("id", ("jas-thumbnail-" + i));
				oThumbnail.setAttribute("src", (this.imagePath + oCurrentImage[0]));
				oThumbnail.setAttribute("alt", oCurrentImage[1]);
				oThumbnail.setAttribute("title", oCurrentImage[1]);
				oThumbnail.onclick = function (oEvent){
					JaS.imageIndex = parseInt(this.getAttribute("id").replace(/\D*(\d+)$/, "$1"), 10);
					JaS.setImage();
				};
				this.thumbnailCollection.push(oThumbnail);
				oListItem.appendChild(oThumbnail);
				oThumbnailsList.appendChild(oListItem);
			}
			this.thumbnailContainer.appendChild(oThumbnailsList);
			if(this.thumbnailCollection.length > 0){
				this.markCurrentThumbnail();
			}
			if(this.slideshowIsPlaying){
				this.stopSlideshow();
			}
		},

		markCurrentThumbnail : function (){
			if(this.currentThumbnailSelected){
				this.currentThumbnailSelected.className = "";
				// Sometimes, in IE, the image loses its reference to its parent
				if(this.currentThumbnailSelected.parentNode)
					this.currentThumbnailSelected.parentNode.className = "";
			}
			this.currentThumbnailSelected = this.thumbnailCollection[this.imageIndex];
			this.currentThumbnailSelected.className = "selected";
			this.currentThumbnailSelected.parentNode.className = "arjsp";
		},

		createTagList : function (){
			var strCurrentTag;
			var arrCurrentTag;
			var oRegExp;
			for(var i=0; i<this.images.length; i++){
				arrCurrentTag = this.images[i][2].replace(/\s*(,)\s*/,  "$1").split(",");
				for(var j=0; j<arrCurrentTag.length; j++)
				{
					strCurrentTag = arrCurrentTag[j];
					oRegExp = new RegExp(strCurrentTag, "i");
					if(this.tags.toString().search(oRegExp) == -1)
						this.tags.push(strCurrentTag);
				}
			}
			this.tagsList = document.createElement("ul");
			var oListItem;
			var oTagCheckbox;
			var oLabel;
			for(var k=0; k<this.tags.length; k++){
				oTag = this.tags[k];
				oListItem = document.createElement("li");
				oTagCheckbox = document.createElement("input");
				oTagCheckbox.setAttribute("type", "checkbox");
				oTagCheckbox.setAttribute("id", ("jas-" + oTag));
				oTagCheckbox.setAttribute("value", oTag);
				oTagCheckbox.checked = true;
				oTagCheckbox.onclick = function (oEvent){
					JaS.applyTagFilter();
				};
				oLabel = document.createElement("label");
				oLabel.setAttribute("for", ("jas-" + oTag));
				oLabel.innerHTML = oTag;
				this.tagsCheckboxes.push(oTagCheckbox);
				oListItem.appendChild(oTagCheckbox);
				oListItem.appendChild(oLabel);
				this.tagsList.appendChild(oListItem);
			}
			this.tagsContainer.append(this.tagsList);
			// This loop is necessary since IE can only mark checkboxes as checked after they've been added to the document
			for(var l=0; l<this.tagsCheckboxes.length; l++){
				this.tagsCheckboxes[l].checked = true;
			}
		},

		applyTagFilter : function (){
			this.currentImages = [];
			var arrCurrentTags = [];
			var oCheckbox;
			for(var i=0; i<this.tagsCheckboxes.length; i++){
				oCheckbox = this.tagsCheckboxes[i];
				if(oCheckbox.checked){
					arrCurrentTags.push(oCheckbox.value);
				}
			}
			var oRegExp;
			var oImage;
			for(var j=0; j<this.images.length; j++){
				oImage = this.images[j];
				for(var k=0; k<arrCurrentTags.length; k++){
					oRegExp = new RegExp(arrCurrentTags[k], "i");
					if(oImage[2].search(oRegExp) != -1){
						this.currentImages.push(oImage);
						break;
					}
				}
			}

			if(this.useThumbnails)
				this.createThumbnails();
			this.imageIndex = 0;
			this.setImage();
		},

		markAllTags : function (){
			for(var i=0; i<this.tagsCheckboxes.length; i++)
				this.tagsCheckboxes[i].checked = this.tagsSelectAll;
			this.applyTagFilter();
		},

		closeSession : function (oEvent){	JaS = null; delete JaS;	},

		applyKeyboardNavigation : function (oEvent){
			var intKeyCode = oEvent.keyCode;
			if(!oEvent.altKey){
				switch(intKeyCode){
					case 32:
						this.slideshowIsPlaying = (this.slideshowIsPlaying)? false : true;
						if(this.slideshowIsPlaying)
							this.startSlideshow();
						else
							this.stopSlideshow();
						this.preventDefaultEventBehavior(oEvent);
						break;
					case 37:
					case 38:
						this.previousImage();
						this.preventDefaultEventBehavior(oEvent);
						break;
					case 39:
					case 40:
						this.nextImage();
						this.preventDefaultEventBehavior(oEvent);
						break;
				}
			}
		},

		preventDefaultEventBehavior : function (oEvent){
			if(oEvent){
				oEvent.returnValue = false;
				if(oEvent.preventDefault)
					oEvent.preventDefault();
			}
		}
	};
	JaS.init();
	
	addEvent(window, "unload", function(){JaS.closeSession();}, false);
	
	function addEvent(oObject, strEvent, oFunction, bCapture)
	{
		if(oObject){
			if(oObject.addEventListener)
				oObject.addEventListener(strEvent, oFunction, bCapture);
			else if(window.attachEvent)
				oObject.attachEvent(("on" + strEvent), oFunction);
		}
	}
	
	if(typeof Array.prototype.push != "function"){
		Array.prototype.push = ArrayPush;
		function ArrayPush(value){
			this[this.length] = value;
		}
	}
});
