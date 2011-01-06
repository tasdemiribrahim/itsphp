var iv;
$(document).ready(function() {
	activateMain();
	var kayGun="";
	$.ajaxSetup({
		type: 'GET',
		cache: true,
		url: '/main/ajax/aile',
		beforeSend: function(){	$(".progress").show();	},
		complete:function(){	$(".progress").fadeOut();	},
		error: function(xhr, status) { $(".progress").fadeOut(); }
	});
	
	if(IE6)	
		$('#aileBireyOlum').val("");
	
	iv=setInterval ( "courusel()", 5000 );	

	$("#rssTakip").append('<a href="http://feeds.feedburner.com/aile-itsphp" target="_blank" rel="alternate" type="application/rss+xml" title="Aile RSS Haberleri"><img src="http://www.feedburner.com/fb/images/pub/feed-icon32x32.png" alt="Aile-ITSPHP" /></a>');
	
	$("#yeniAileBireyForm").validate({
		debug: false,
		errorLabelContainer: $("#uyari"),
		rules: {
			aileBireyAd: "required",
			aileBireyEbeveyn: "required",
			aileBireyDogum:{required:true,date:true},
			aileBireyTanim:"required",
			aileBireyMSN:"email",
			aileBireyMail:"email",
			aileBireyTel:"number"
		},
		messages: {
			aileBireyAd: "Kişinin adını girin!<br>",
			aileBireyEbeveyn: "Bir ebeveyn seçin!<br>",
			aileBireyDogum:{required:"Doğum gününü girin!<br>",date:"Doğum günü tarih olmalı!<br>"},
			aileBireyTanim:"Öz geçmişe bişeyler yazın!<br>",
			aileBireyMSN:"MSN formatını kontrol et!<br>",
			aileBireyMail:"E-Mail formatını kontrol et!<br>",
			aileBireyTel:"Telefon sadece sayılardan oluşabilir!<br>"
		},
		submitHandler: function(form) {
		addNotice("<p>İsteğiniz alındı.Lütfen bekleyin!</p>");
		var mesaj=['&aileBireyEbeveynPHP=',$("#aileBireyEbeveyn option:selected").attr("id"),'&aileBireyDogumPHP=',$('#aileBireyDogum').val(),'&aileBireyEsPHP=',$('#aileBireyEs').val(),'&aileBireyOlumPHP=',$('#aileBireyOlum').val(),'&aileBireyTanimPHP=',$('#aileBireyTanim').val(),'&aileBireyAdresPHP=',$('#aileBireyAdres').val(),'&aileBireyMailPHP=',$('#aileBireyMail').val(),'&aileBireyTelPHP=',$('#aileBireyTel').val(),'&aileBireyMSNPHP=',$('#aileBireyMSN').val(),'&aileBireyTwitterPHP=',$('#aileBireyTwitter').val(),'&aileBireyFlickrPHP=',$('#aileBireyFlickr').val()];
		if(kayGun=="aileBireyKaydet")
			{
				$.ajax({data: 'aileBireyAdEkle='+$("#aileBireyAd").val()+mesaj.join(""),
				success: function(cevap){
				//window.log(cevap);
					if(parseInt(cevap)>0)
						window.location = getSiteName()+"main/aile";
					else
						addNotice("<p>Bir hata oluştu.</p>");
				}
				});
			}
			else if(kayGun=="aileBireyGuncelle")
			{
				$.ajax({data: 'aileBireyGuncelleIDPHP='+$("#aileBireyIDHidden").val()+mesaj.join(""),
				success: function(cevap){
				//window.log(cevap);
					if(parseInt(cevap)>0)
						window.location = getSiteName()+"main/aile";
					else
						addNotice("<p>Herhangi bir güncelleme yapılmadı!</p>");
				}
				});	
			}
		}
	});
	$('#yeniAileBireyForm .aileKayGun').bind("click",function(){
		if($('#fax').val()=="")
		{	
			$.clickDisabled = '#'+$(this).attr("id");
			kayGun=$(this).attr("id");
			//window.log("aileBireyKaydet click event.");
			$("#yeniAileBireyForm").submit();
			$.clickDisabled = "";
			return false;
		}
	});

	/*
	function cancelEvent() { return false; }

	var drop = $("#aileBireyEbeveyn");
	drop.drop(function (e) {
		event = e || window.e;
		$(this).val(e.dataTransfer.getData("Text"));
		e.cancelBubble = true;
		return false;
	});

	$("img").each(function(){
		this.ondragstart = function (e) {
			e = e || window.e;
			e.dataTransfer.setData("Text", this.getAttribute("alt").split("-")[0]);
		};
	});

	drop.ondragenter = cancelEvent;
	drop.ondragover = cancelEvent;
*/
});

function courusel()
{
	$.getScript("/main/js/jquery/jquery.carouFredSel-2.5.2-packed.js", function () {
		$("#foo").carouFredSel({auto : false,direction   : "up",prev : { button	: "#foo_prev",	key : "left"},next : { button: "#foo_next",key : "right"},items:{visible:3},pagination :{ container:"#FS_controls"}});
		clearInterval(iv);
	});
}
