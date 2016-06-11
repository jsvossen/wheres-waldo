$(document).ready(function(){

	var clickX;
	var clickY;

	$('a.close').click(function(e){
		e.preventDefault();
		$(this).closest(".popup").fadeOut('fast');
	});

	$('#board > img').click(function(e) {
		clickX = e.pageX - $(this).offset().left;
	    clickY = e.pageY - $(this).offset().top;
	    showSelect();
	});

	function showSelect() {
		var boxX = ( (clickX + $('.select').width()) > $('#board').width() ) ? ($('#board').width()-$('.select').width()) : clickX;
		var boxY = ( (clickY + $('.select').height()) > $('#board').height() ) ? ($('#board').height()-$('.select').height()) : clickY;
		$('.select').css({top: boxY, left: boxX }).fadeIn('fast');
	}

});