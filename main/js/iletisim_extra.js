$("#search_form .sakla").removeClass("sakla");
$("#search_form").after('<div id="resultsDiv"></div>');

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
