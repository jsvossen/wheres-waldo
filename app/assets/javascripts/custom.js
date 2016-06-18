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
			  url: '/find',
			  data: { cid: $(this).attr('data-cid'), x: clickX, y: clickY },
			  dataType: 'json'
			}).done(function(result){
			  	if (result == false) {
			  		showMessage("Nope! Try again.");
			  	} else {
			  		showMessage("You found "+result.c.name+"!");
			  		flagAsFound(result.c);
			  		if (result.score) showScore(result.score);
			  	}
			  	$('.select').hide();
			 });
		});
	}

	function showSelect() {
		var boxX = ( (clickX + $('.select').width()) > $('#board').width() ) ? ($('#board').width()-$('.select').width()) : clickX;
		var boxY = ( (clickY + $('.select').height()) > $('#board').height() ) ? ($('#board').height()-$('.select').height()) : clickY;
		$('.select').css({top: boxY, left: boxX }).show();
		$('.msg').hide();
	}

	function flagAsFound(result) {
		$('[data-cid='+result.cid+']').addClass('found');
		var position = 'top: '+result.y+'px; left: '+result.x+'px; width: '+result.width+'px; height: '+result.height+'px;';
		$('#board').prepend('<div class="flag" style="'+position+'"></div>');
	}

	function showMessage(message) {
		$('.msg span').text(message);
		$('.msg').css({top: clickY+50, left: clickX }).fadeIn('fast');
	}

	function showScore(score) {
		$('.popup').hide();
		$('<div id="score"></div>').prependTo('#board').hide().fadeIn('fast');
		var pid = window.location.pathname.split("/").pop()
		$.get({
			url: '/post_score',
			data: { id: pid },
			dataType: 'script'
		});
	}

	return {
		initListeners: initListeners
	}

})(jQuery)

$(puzzle.initListeners)