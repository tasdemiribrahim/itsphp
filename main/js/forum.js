
$(document).ready(function() {	
	activateMain();
	var d = new Date();
	 $.ajaxSetup({
	        type: 'GET',
	        timeout: 20000,  
	        cache: false,
	        url: '/main/iletisim/ajax?_='+d.getTime(),
			beforeSend: function(){	$(".progress").show();	},
			complete:function(){	$(".progress").fadeOut();	},
			error: function(xhr, status) { $('#forumPage').show("slide", { direction: "right" }, 2000);  $(".progress").fadeOut(); }
	    });
		
	$(".captcha_wrap").removeClass("sakla");
	$("form ul").sortable().disableSelection().shuffle();
	
	getScript("js/iletisim_extra.js");

	$('#resultsDiv a').bind('click',function(){
		var thread=$(this).parent().next(),id=$(this).attr("id"),forumPage=$('#forumPage');
		forumPage.hide("slide", { direction: "right" }, 2000);
		dateVal=thread.html();
		yazarVal=thread.next().html();
		titleVal=$(this).html();
		$('#permalink').val(id);
		forumPage.find('section table tbody').html("");
		$.ajax({
			data: "forumMesajGetir="+id,
			success: function(cevap){
				var mesaj="";
				cevaplar=cevap.split("|");
				forumPage.find("header h3").html(titleVal).next().html(cevaplar[0]);
				var i=cevaplar.length-2;
				for(;i>0;i=i-3)
					mesaj +='<tr><td>'+cevaplar[i-2]+'</td><td>'+cevaplar[i-1]+'</td><td>'+cevaplar[i]+'</td></tr>\n';
				forumPage.find('section table tbody').html(mesaj).end().show("slide", { direction: "left" }, 2000);
		}});
		return false;
	});
		
	$('#forumPage section form').validate({
		debug: false,
		errorLabelContainer: $("#uyari"),
		rules: {
			permalink:"required",
			author: "required",
			mesaj: "required"
		},
		messages: {
			permalink: "Mesaj yazmak için konu seçmelisiniz!",
			author: "Takma ad girin!",
			mesaj: "Bir mesaj girin!"
		},
		submitHandler: function(form) {
			var sec=$('#forumPage section');
			var ul=sec.find('form ul');
			if(ul.formValidate())
			{
				var mesajVal=$('#mesaj').val(),authorVal=$('#author').val(),permalinkVal=$('#permalink').val();
				$("#mesaj").val("");
				$("#author").val("");
				ul.shuffle();
				$('#permalink').val(permalinkVal);
				$.ajax({ data: "mesaj="+mesajVal+"&author="+authorVal+"&permalink="+permalinkVal,
				success: function(cevap){
					if(cevap)
						sec.find('table tbody').append('<tr><td>'+mesajVal+'</td><td>'+cevap+'</td><td>'+authorVal+'</td></tr>').effect("shake", { times:3 }, 2000);
					else addNotice("<p>Veri tabanı hatası.Daha sonra tekrar deneyin!</p>");	
				}});
			}
			else alert("Sıralamayı kontrol edin!");
			ul.shuffle();
			return false;
		}
	});	
	
	$("#rcnt form").validate({
		debug: false,
		errorLabelContainer: $("#uyari"),
		rules: {
			input_title: "required",
			input_author: "required",
			input_mesaj: "required"
		},
		messages: {
			input_title: "Bir başlık girin!",
			input_author: "Takma ad girin!",
			input_mesaj: "Bir mesaj girin!"
		},
		submitHandler: function(form) {
			var ul=$('#rcnt form ul');
			if(ul.formValidate())
			{
				var mesajVal=$('#input_mesaj').val(),authorVal=$('#input_author').val(),titleVal=$('#input_title').val();
				$("#input_mesaj").val("");
				$("#input_author").val("");
				$("#input_title").val("");
				ul.shuffle();
				$.ajax({ data: "konuPHP="+mesajVal+"&authorKonu="+authorVal+"&titleKonu="+titleVal,
				success: function(cevap){
					if(cevap=="0")
						addNotice("<p>Veri tabanı hatası.Daha sonra tekrar deneyin!</p>");
					else if(cevap=="error 1")
						addNotice("<p>Takma ad  girin!</p>");
					else if(cevap=="error 2")
						addNotice("<p>Bu başlık var!</p>");
					else
					{
						cevaplar=cevap.split("|");
						$('#resultsDiv').append('<p><a href="?id='+cevaplar[0]+'" id="'+cevaplar[0]+'">'+cevaplar[1]+'</a></p><time pubdate>'+cevaplar[2]+'</time><span class="forum_author">'+authorVal+'</span><br class="clear" />').effect("pulsate", { times:3 }, 2000);	
					}
				}});
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
