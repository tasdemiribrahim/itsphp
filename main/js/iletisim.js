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
	        url: '/main/iletisim/ajax?_='+d.getTime(),
			beforeSend: function(){	$(".progress").show();	},
			complete:function(){	$(".progress").fadeOut();	},
			error: function(xhr, status) { $(".progress").fadeOut(); }
	    });
		
	var csvURL = 'https://spreadsheets.google.com/pub?key=0AkE3rN_o8MSWdG43WXBId2JxR0R4MzV5SF85SjJITHc&authkey=CLrXk80K&hl=en&single=true&gid=0&output=csv',
		yqlURL ="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20csv%20where%20url%3D'"+encodeURIComponent(csvURL)+"'%20and%20columns%3D'question%2Canswer'&format=json&callback=?";
	$.getJSON(yqlURL,function(msg){
		var dl = $('<dl>');
		$.each(msg.query.results.row,function(){			
			var answer = this.answer.replace(/""/g,'"').replace(/^"|"$/g,''),question = this.question.replace(/""/g,'"').replace(/^"|"$/g,'');			
			dl.append('<dt><span></span>'+question+'</dt><dd>'+answer+'</dd>');
		});
		$('#sssPage').find('dt').live('click',function(){
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
	
	$("#search_form .sakla").removeClass("sakla");
	$(".page").hide("fold", {}, 2000);
	$("#mailPage").show("fold", {}, 2000);
	
	$("#phoneCarousel a").bind("click",function(){
		var page=$($(this).attr("href"));
		$(".page").not(':hidden').hide("fold", {}, 2000,function(){ page.show("fold", {}, 2000); });
		
	});
	
	var ul = $('#oneriPage ul');
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
		$.ajax({ data: "action=vote&vote="+v+"&id="+id });
		return false;
	});

	$('#oneriPage form').submit(function(){
		var form = $(this),textField = $('#suggestionText');
		if(textField.val().length<3)
			return false;
		value=textField.val();
		textField.val('');
		$.ajax({ data: "action=submit&content="+value,
		success: function(cevap){
			if(cevap)
			{
				cevaplar=cevap.split("|");
				$('<li id="s'+cevaplar[0]+'"><div class="vote active"><a class="up" rev="vote-for" href="#">Evet</a><a class="down" rev="vote-against" href="#">Hayır</a></div><div class="text">'+cevaplar[1]+'</div><div class="rating">0</div></li>').hide().appendTo(ul).show("puff", {}, 1000);
			}
		}});
		return false;
	});
		
	$("#mailPage form").validate({
		debug: false,
		errorLabelContainer: $("#uyari"),
		rules: {
			kimdenTextBox: { required: true, email: true },
			kimeTextBox: { required: true, email: true },
			konuTextBox: "required"
		},
		messages: {
			kimdenTextBox: {required:'Kendi mail adresinizi girin!', email:'Mail formatını kontrol edin'},
			kimeTextBox: {required:'Hedef mail adresinizi girin!', email:'Mail formatını kontrol edin'},
			konuTextBox: "Bir konu girin!"
		},
		submitHandler: function(form) {
			addNotice("<p>Mesajınız gönderildi!</p>");
			_gaq.push(['_trackEvent', 'Mail', "From="+$('#kimdenTextBox').val()+"-To"+$('#kimeTextBox').val()]);
			$('#mailPage form input[type="submit"]').hide();
			fromJS=$('#kimdenTextBox').val();
			toJS=$('#kimeTextBox').val();
			konuJS=$('#konuTextBox').val();
			mesajJS=$("#cleditor").val();
			$('#kimdenTextBox').val("");
			$('#konuTextBox').val("");
			$(".cleditorMain iframe").html("");
			 $.ajax({
					data: 'kimden='+fromJS+'&kime='+toJS+'&konu='+konuJS+'&mesaj='+mesajJS+'&formKeyJS='+$('#formKey').val()
			  });
			$('#mailPage form input[type="submit"]').show();
			return false;
		}
	});
	
	var config = {
		siteURL		: getSiteName(),
		searchSite	: true,
		type		: 'web',
		append		: false,
		perPage		: 8,
		page		: 0
	}
	var arrow = $('<span>',{className:'aramaArrow'}).appendTo('ol.searchIcons');
	$('ol.searchIcons li').bind("click",function(){
		var el = $(this);
		if(el.hasClass('active'))
			return false;
		el.siblings().removeClass('active');
		el.addClass('active');
		arrow.stop().animate({ left : el.position().left, marginLeft	: (el.width()/2)-4	});
		config.type = el.attr('data-searchType');
		$('#more').fadeOut();
	});
	$('#searchSite').click();	
	$('li.web').click(); 
	$('#search_form').submit(function(){  googleSearch();	return false;	});
	$('#searchSite,#searchWeb').change(function(){	config.searchSite = this.id == 'searchSite';	});
	
	function googleSearch(settings)
	{
		settings = $.extend({},config,settings);
		settings.term = settings.term || $('#q').val();
		if(settings.searchSite)
			settings.term = 'site:'+settings.siteURL+' '+settings.term;
		var apiURL = 'http://ajax.googleapis.com/ajax/services/search/'+settings.type+'?v=1.0&callback=?',resultsDiv = $('#resultsDiv');
		$.getJSON(apiURL,{q:settings.term,rsz:settings.perPage,start:settings.page*settings.perPage},function(r){
			var results = r.responseData.results;
			$('#more').remove();
			if(results.length)
			{
				var pageContainer = $('<div>',{className:'pageContainer'});
				for(var i=0;i<results.length;i++)	pageContainer.append(new result(results[i]) + '');
				if(!settings.append)	resultsDiv.empty();
				pageContainer.append('<div class="clear"></div>').hide().appendTo(resultsDiv).slideDown("slow");
				var cursor = r.responseData.cursor;
				if( +cursor.estimatedResultCount > (settings.page+1)*settings.perPage)
					$('<div>',{id:'more',className:'bonBonButton xs oval pink glossy',html:'>>>>!'}).appendTo(resultsDiv).bind("click",function(){
						googleSearch({append:true,page:settings.page+1});
						$(this).fadeOut();
					});
			}
			else 
			{
				resultsDiv.empty();
				$('<p>',{className:'notFound',html:'Sonuç Bulunamadı!'}).hide().appendTo(resultsDiv).effect("highlight", {"color":"#c80000"}, 3000);
			}
		});
	}
	
	function result(r)
	{
		var arr = [];
		switch(r.GsearchResultClass)
		{
			case 'GwebSearch':
				arr = [
					'<div class="webResult">',
					'<h4><a href="',r.url,'" target="_blank">',r.title,'</a></h4>',
					'<p>',r.content,'</p>',
					'</div>'
				];
			break;
			case 'GimageSearch':
				arr = [
					'<div class="imageResult">',
					'<a target="_blank" href="',r.url,'" title="',r.titleNoFormatting,'" class="pic">',
					'<img src="',r.tbUrl,'" /></a>',
					'<br class="clear" />','<a href="',r.originalContextUrl,'" target="_blank">',r.visibleUrl,'</a>',
					'</div>','<br class="clear" />'
				];
			break;
			case 'GvideoSearch':
				arr = [
					'<div class="imageResult">',
					'<a target="_blank" href="',r.url,'" title="',r.titleNoFormatting,'" class="pic">',
					'<img src="',r.tbUrl,'" /></a>',
					'<br class="clear" />','<a href="',r.originalContextUrl,'" target="_blank">',r.publisher,'</a>',
					'</div>','<br class="clear" />'
				];
			break;
			case 'GnewsSearch':
				arr = [
					'<div class="webResult">',
					'<h4><a href="',r.unescapedUrl,'" target="_blank">',r.publisher,' - ',r.title,'</a></h4>',
					'<p>',r.content,'</p>',
					'</div>'
				];
			break;
		}
		this.toString = function(){	return arr.join('');	}
	}
	
});
