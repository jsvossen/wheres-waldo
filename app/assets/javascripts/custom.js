var puzzle = (function(){

	var clickX;
	var clickY;

	function initListeners() {
		$('a.close').click(function(e){
			e.preventDefault();
			$(this).closest(".popup").fadeOut('fast');
		});

		$('#board > img').click(function(e) {
			clickX = e.pageX - $(this).offset().left;
		    clickY = e.pageY - $(this).offset().top;
		    showSelect();
		});

		$('.select .opt').click(function(e){
			e.preventDefault();
			$.get({
			  url: '/find.json',
			  data: { cid: $(this).attr('data-cid'), x: clickX, y: clickY },
			  dataType: 'json'
			}).done(function(data){
			  	console.log(data);
			 });
		});
	}

	function showSelect() {
		var boxX = ( (clickX + $('.select').width()) > $('#board').width() ) ? ($('#board').width()-$('.select').width()) : clickX;
		var boxY = ( (clickY + $('.select').height()) > $('#board').height() ) ? ($('#board').height()-$('.select').height()) : clickY;
		$('.select').css({top: boxY, left: boxX }).fadeIn('fast');
	}

	return {
		initListeners: initListeners
	}

})(jQuery)

$(puzzle.initListeners)