onmessage = function(event) {
	$.ajax({
		type: 'GET',
		timeout: 20000,    
		async: true,
		cache: true,
		url: '/main/ajax/aile',
		data: event.data,
		success: function(cevap){ postMessage(cevap); }
	});
};

