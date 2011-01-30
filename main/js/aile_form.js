var iv,aj;
$(document).ready(function() {
	activateMain();
	$.ajaxSetup({
		type: 'GET',
		cache: true,
		url: '/main/ajax/aile',
		beforeSend: function(){	$(".progress").show();	},
		complete:function(){	$(".progress").fadeOut();	},
		error: function(xhr, status) { $(".progress").fadeOut(); }
	});
	
	getScript("/main/js/aile_extra.js");
	
	iv=setInterval ( "courusel()", 5000 );	
	
	$("#yabf").validate({
		debug: false,
		rules: {
			ybad: "required",
			ybe: "required",
			ybd:{required:true,date:true},
			ybt:"required",
			ybmail:"email",
			ybtel:"number"
		},
		messages: {
			ybad: "Kişinin adını girin!",
			ybe: "Bir ebeveyn seçin!",
			ybd:{required:"Doğum gününü girin!",date:"Doğum günü tarih olmalı!"},
			ybt:"Öz geçmişe bişeyler yazın!",
			ybmail:"E-Mail formatını kontrol et!",
			ybtel:"Telefon sadece sayılardan oluşabilir!"
		},
		submitHandler: function(form) {
			if(aj) aj.abort();
			addNotice("<p>İsteğiniz alındı.Lütfen bekleyin!</p>");
			aj=$.ajax({
				dataType:"json",	
				data: $("#yabf").serialize(),
				success: function(cevap){
					window.log(cevap);
					if(cevap.durum=="ok")
						window.location = getSiteName()+"main/aile";
					else if(cevap.durum=="error1")
						addNotice("<p>Kişinin adını girin!</p>");
					else if(cevap.durum=="error2")
						addNotice("<p>Bir ebeveyn seçin!</p>");
					else if(cevap.durum=="error3")
						addNotice("<p>Öz geçmişe bişeyler yazın!</p>");
					else if(cevap.durum=="error4")
						addNotice("<p>Doğum gününü girin!</p>");
					else if(cevap.durum=="error5")
						addNotice("<p>Bağlantı hatası!</p>");
					else if(cevap.durum=="error6")
						addNotice("<p>Bilinmeyen bir hata meydana geldi!</p>");
					else if(cevap.durum=="error7")
						addNotice("<p>Bireyin kaydı bulunamadı!</p>");
					else
						addNotice("<p>Hata bilnimiyor!</p>");
				}
			});
			$('#yabf input:not(type="submit"):not(type="hidden"),#yabf textarea').val("");
			return false;
		}
	});

	/*
	function cancelEvent() { return false; }

	var drop = $("#ybe");
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
