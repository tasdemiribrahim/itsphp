
$(document).ready(function() {	
	activateMain();
	var d = new Date(),sfp=$('#sfp'),$form=sfp.find('section form'),$form_cevap=$("#rcnt form"),$tbody=sfp.find('section table tbody');

	 $.ajaxSetup({
	        type: 'GET',
	        timeout: 20000,  
	        cache: false,
		async: true,
	        url: '/main/sosyal/ajax?_='+d.getTime(),
			beforeSend: function(){	$(".progress").show();	},
			complete:function(){	$(".progress").fadeOut();	},
			error: function(xhr, status) { sfp.show("slide", { direction: "right" }, 2000);  $(".progress").fadeOut(); }
	    });
		
	$(".sfcw").removeClass("sakla");
	$("form ul").sortable().disableSelection().shuffle();
	
	getScript("/main/js/sosyal_extra.js");

	$('#sfrd a').bind('click',function(){
		var $this=$(this);
		sfp.hide("slide", { direction: "right" }, 2000);
		$('#id').val($this.attr("id"));
		$.ajax({
			data: "fid="+$this.attr("id"),
			success: function(cevap){
				var mesaj="";
				cevaplar=cevap.split("|");
				sfp.find("header h3").html($this.html()).next().html(cevaplar[0]);
				var i=cevaplar.length-2;
				for(;i>0;i=i-3)
					mesaj +='<tr><td>'+cevaplar[i-2]+'</td><td>'+cevaplar[i-1]+'</td><td>'+cevaplar[i]+'</td></tr>\n';
				$tbody.html(mesaj).end().show("slide", { direction: "left" }, 2000);
		}});
		return false;
	});
		
	$form.validate({
		debug: false,
		rules: {
			id:"required",
			y: "required",
			i: "required"
		},
		messages: {
			id: "Mesaj yazmak için konu seçmelisiniz!",
			y: "Takma ad girin!",
			i: "Bir mesaj girin!"
		},
		submitHandler: function(form) {
			var ul=$form.find('ul');
			if(ul.formValidate())
			{
				$.ajax({ 
				dataType: "json",
				data: $form.serialize(),
				success: function(cevap){
					if(cevap.durum=="ok")
						$tbody.append('<tr><td>'+$("#i").val()+'</td><td>'+cevap.date+'</td><td>'+$("#y").val()+'</td></tr>').effect("shake", { times:3 }, 2000);
					else if(cevap.durum=="error") addNotice("<p>Veri tabanı hatası.Daha sonra tekrar deneyin!</p>");	
					else addNotice("<p>Bilinmeyen bir hata meydana geldi.Daha sonra tekrar deneyin!</p>");	
				}});
				$("#i").val("");
				$("#y").val("");
			}
			else alert("Sıralamayı kontrol edin!");
			ul.shuffle();
			return false;
		}
	});	
	
	$form_cevap.validate({
		debug: false,
		rules: {
			yb: "required",
			yy: "required",
			yi: "required"
		},
		messages: {
			yb: "Bir başlık girin!",
			yy: "Takma ad girin!",
			yi: "Bir mesaj girin!"
		},
		submitHandler: function(form) {
			var ul=$form_cevap.find('ul');
			if(ul.formValidate())
			{
				$.ajax({ 
				dataType: "json",
				data: $form_cevap.serialize(),
				success: function(cevap){
					if(cevap.durum=="error")
						addNotice("<p>Bu başlık var!</p>");
					else if(cevap.durum=="ok")
					{
						$('#sfrd').append('<p><a href="?id='+cevap.id+'" id="'+cevap.id+'">'+cevap.b+'</a></p><time pubdate>'+cevap.dt+'</time><span>'+cevap.y+'</span><br class="clear" />').effect("pulsate", { times:3 }, 2000);	
					}
					else addNotice("<p>Veri tabanı hatası.Daha sonra tekrar deneyin!</p>");
				}});
				$form_cevap.find('input:not(type="submit"):not(type="hidden"),textarea').val("");
			}
			else alert("Sıralamayı kontrol edin!");
			ul.shuffle();
			return false;
		}
	});		
});

(function($){
	$.fn.shuffle = function() {
		return this.each(function(){
			var items = $(this).children();
			return (items.length)  ? $(this).html($.shuffle(items,$(this))) : this;
		});
	}
	$.fn.formValidate = function() {
		var res = false;
		this.each(function(){
			var arr = $(this).children();
			res =  ((arr[0].innerHTML=="1") && (arr[1].innerHTML=="2") && (arr[2].innerHTML=="3") && (arr[3].innerHTML=="4") && (arr[4].innerHTML=="5") && (arr[5].innerHTML=="6"));
		});
		return res;
	}
	$.shuffle = function(arr,obj) {
		for( var j, x, i = arr.length; i; j = parseInt(Math.random() * i),x = arr[--i], arr[i] = arr[j], arr[j] = x);
		if(arr[0].innerHTML=="1") obj.html($.shuffle(arr,obj))
		else return arr;
	}
})(jQuery);
