(function(a){a(".fg-button").hover(function(){a(this).removeClass("ui-state-default").addClass("ui-state-focus")},function(){a(this).removeClass("ui-state-focus").addClass("ui-state-default")}),a("#hierarchy").click(function(){return!1}),a.get("/dashboard/navigation",function(b){a("#hierarchy").menu({content:b,showSpeed:400}),a("#hierarchy").removeClass("hidden")}),a(".tablesorter").tablesorter({debug:!1,widgets:["zebra"],sortList:[[0,0],[1,0]]}).tablesorterFilter({filterContainer:a("#filter-box"),filterClearContainer:a("#filter-clear-button"),filterCaseSensitive:!1}).tablesorterPager({container:a(".pager"),positionFixed:!1}),a("a.button").click(function(){this.blur()}),a("a.button").wrapInner("<span></span>"),a("input[name*='phone']").mask("(999) 999-9999"),a("input[name*='_at']").mask("99/99/9999 99:99"),a("input[name*='_on']").mask("99/99/9999"),a("input[name*='zip']").mask("99999"),a("input[@title]").example(function(){return a(this).attr("title")})});