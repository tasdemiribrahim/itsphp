$(document).ready(function() {	
	$("body").addClass("hataSayfa");
	function animSteam(){
		$('<span>',{
			className:'steam'+Math.floor(Math.random()*2 + 1),
			css:{marginLeft	: -10 + Math.floor(Math.random()*20)}
		}).appendTo('#rocket').animate({	left:'-=58',	bottom:'-=100'}, 120,function(){
			$(this).remove();
			setTimeout(animSteam,10);
		});
	}
	function moveRocket(){
		$('#rocket').animate({'left':'+=100'},5000).delay(1000).animate({'left':'-=100'},5000,function(){	setTimeout(moveRocket,1000);	});
	}
	moveRocket();
	animSteam();
});
