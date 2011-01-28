$(document).ready(function(){
	$('#testimonials li').hide().eq(0).show();
	(function showNextTestimonial(){
		$('#testimonials li:visible').delay(7500).fadeOut('slow',function(){
			$(this).appendTo('#testimonials ul');
			$('#testimonials li:first').fadeIn('slow',function(){
				showNextTestimonial();
			});
		});
	})();
});
