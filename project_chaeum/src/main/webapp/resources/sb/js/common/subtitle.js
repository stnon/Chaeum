
		var path = window.location.pathname;
		alert(path);
		path = path.substring(path.indexOf("/")+1, path.lastIndexOf("/"));
		alert(path);
		$(".subtap li").each(function() {
			if(path.match($(this).attr("class"))) {
				$(this).addClass("tapon");
				$(this).children().css("color", "#fff");
			}
		});	