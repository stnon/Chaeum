
$(".pager li.page-btn").click(function() {
	alert($(this).hasClass("on"));
	if(!$(this).hasClass("on")) {
		$(".pager .btn-page.on").removeClass("on");
		$(this).addClass("on");
		alert($(this).hasClass("on"));
	}
});