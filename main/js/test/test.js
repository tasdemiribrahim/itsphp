module('Module Main');  
test('Main', function() { 
    	ok(getSiteName()=="http://tasdemir.0fees.net/", '0fees site');     
	stop(1000);   
	equals( getResim(0,"aile"),getResim(0,"muzik"), 'Boş resim');
	equals( getResim(11,"aile"),"/main/images/aile/11.jpg", 'Aile resim');
	equals( getResim(101,"muzik"),"/main/images/muzik/101.jpg", 'Müzik resim');
	start();  
    	same( [1], [1], 'passes');  
});
