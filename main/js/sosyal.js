if(Modernizr.history)
{
	window.onpopstate = function(event) 
	{
		if(event.state)
		{
			var sid = (event.state["sid"]);
			pageShow(sid);
		}
	};
}
function pageShow(page){ $(".page").not(':hidden').hide("fold", {}, 2000,function(){ $(page).show("fold", {}, 2000); }); }
$(document).ready(function() {	
	activateMain();
	$.getScript("/main/js/jquery/jquery.cleditor.min.js", function () {
		$("#cleditor").cleditor();
	});
	var d = new Date();
	 $.ajaxSetup({
	        type: 'GET',
	        timeout: 20000,  
	        cache: false,
	        url: '/main/sosyal/ajax?_='+d.getTime(),
			beforeSend: function(){	$(".progress").show();	},
			complete:function(){	$(".progress").fadeOut();	},
			error: function(xhr, status) { $(".progress").fadeOut(); }
	    });
		
	getScript("/main/js/sosyal_extra.js");

	var csvURL = 'https://spreadsheets.google.com/pub?key=0AkE3rN_o8MSWdG43WXBId2JxR0R4MzV5SF85SjJITHc&authkey=CLrXk80K&hl=en&single=true&gid=0&output=csv',yqlURL ="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20csv%20where%20url%3D'"+encodeURIComponent(csvURL)+"'%20and%20columns%3D'question%2Canswer'&format=json&callback=?";
	$.getJSON(yqlURL,function(msg){
		var dl = $('<dl>');
		$.each(msg.query.results.row,function(){			
			var answer = this.answer.replace(/""/g,'"').replace(/^"|"$/g,''),question = this.question.replace(/""/g,'"').replace(/^"|"$/g,'');			
			dl.append('<dt><span></span>'+question+'</dt><dd>'+answer+'</dd>');
		});
		$('#ssp').find('dt').live('click',function(){
			var dd = $(this).next();
			if(!dd.is(':animated')){
				dd.slideToggle();
				$(this).toggleClass('opened');
			}
		}).end().find('div').append(dl).find('a').bind("click",function(){
			if($(this).hasClass('collapse'))
				$('dt.opened').click();
			else $('dt:not(.opened)').click();
			$(this).toggleClass('expand collapse');
			return false;
		});
	});
	
	$("#spc a").bind("click",function(){
		var page=$(this).attr("href");
		if(Modernizr.history)
			window.history.pushState({sid: page},page);
		pageShow(page);
		return false;
	}).eq(0).click();
	
	var ul = $('#sop ul');
	$('div.vote a').bind('click',function(){
		var elem = $(this),parent = elem.parent(),li = elem.closest('li'),ratingDiv = li.find('.rating'),id = li.attr('id').replace('s',''),v = 1;
		if(parent.hasClass('inactive'))	return false;
		parent.removeClass('active').addClass('inactive');
		if(elem.hasClass('down')) v = -1;
		ratingDiv.text(v + +ratingDiv.text());
		var arr = $.makeArray(ul.find('li')).sort(function(l,r){
			return +$('.rating',r).text() - +$('.rating',l).text();
		});
		ul.html(arr);
		$.ajax({ dataType:"json",data: "action=vote&vote="+v+"&id="+id });
		return false;
	});

	$('#sop form').submit(function(){
		var value = $('#s').val();
		$('#s').val('');
		if(value.length<3)
			return false;
		$.ajax({
		data: "action=submit&content="+value,
		dataType:"json",
		success: function(cevap){
			if(cevap.durum=="ok")
				$('<li id="s'+cevap.id+'"><div class="vote active"><a class="up" rev="vote-for" href="#">Evet</a><a class="down" rev="vote-against" href="#">Hayır</a></div><div class="text">'+cevap.content+'</div><div class="rating">0</div></li>').hide().appendTo(ul).show("puff", {}, 1000);
		}});
		return false;
	});
		
	$("#smp form").validate({
		debug: false,
		rules: {
			f: { required: true, email: true },
			t: { required: true, email: true },
			h: "required"
		},
		messages: {
			f: {required:'Kendi mail adresinizi girin!', email:'Mail formatını kontrol edin'},
			t: {required:'Hedef mail adresinizi girin!', email:'Mail formatını kontrol edin'},
			h: "Bir konu girin!"
		},
		submitHandler: function(form) {
			addNotice("<p>Mesajınız gönderildi!</p>");
			$.ajax({ data: $("#mailPage form").serialize() });
			$("#smp form input").val("");
			$(".cleditorMain iframe").html("");
			return false;
		}
	});
	
});
