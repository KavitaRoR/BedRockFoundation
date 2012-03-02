$(function(){
	// BUTTONS
	$('.fg-button').hover(
		function(){ $(this).removeClass('ui-state-default').addClass('ui-state-focus'); },
		function(){ $(this).removeClass('ui-state-focus').addClass('ui-state-default'); }
	);
	// $('#hierarchy').hide();
	$('#hierarchy').click(function() {
		return false;
	})
	// or from an external source
	$.get('/dashboard/navigation', function(data){ // grab content from another page
		$('#hierarchy').menu({ content: data, showSpeed: 400 });
		$('#hierarchy').removeClass("hidden")
	});
	

});
