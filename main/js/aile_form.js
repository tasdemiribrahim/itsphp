var iv;
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
			ybad: "Kişinin adını girin!<br>",
			ybe: "Bir ebeveyn seçin!<br>",
			ybd:{required:"Doğum gününü girin!<br>",date:"Doğum günü tarih olmalı!<br>"},
			ybt:"Öz geçmişe bişeyler yazın!<br>",
			ybmail:"E-Mail formatını kontrol et!<br>",
			ybtel:"Telefon sadece sayılardan oluşabilir!<br>"
		},
		submitHandler: function(form) {
			addNotice("<p>İsteğiniz alındı.Lütfen bekleyin!</p>");
			$.ajax({
				dataType:"json",	
				data: $("#yabf").serialize(),
				success: function(cevap){
					//window.log(cevap);
					if(parseInt(cevap)>0)
						window.location = getSiteName()+"main/aile";
					else
						addNotice("<p>Bir hata oluştu.</p>");
				}
			});
			$('#yabf input:not(type="submit"):not(type="hidden"),#yabf textarea').val("");
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
