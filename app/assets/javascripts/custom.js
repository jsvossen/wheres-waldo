$(document).ready(function(){

	$('a.close').click(function(e){
		e.preventDefault();
		$(this).parent().fadeOut('fast');
	});

});