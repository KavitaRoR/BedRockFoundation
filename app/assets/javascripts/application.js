$(document).ready(function() {
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
	
	$("table.tablesorter").tablesorter({debug: false, widgets: ['zebra'], sortList: [[0,0], [1,0]]}).tablesorterFilter({filterContainer: $("#filter-box"), filterClearContainer: $("#filter-clear-button"), filterCaseSensitive: false}).tablesorterPager({container: $(".pager"), positionFixed: false});

	$("a.button").click(function(){
	   this.blur();
	});
	$("a.button").wrapInner("<span></span>")
	
	$("input[name*='phone']").mask("(999) 999-9999");
	$("input[name*='_at']").mask("99/99/9999 99:99");
  $("input[name*='_on']").mask("99/99/9999");
  $("input[name*='zip']").mask("99999");
	$('input[@title]').example(function() {
		return $(this).attr('title');
	});
})
