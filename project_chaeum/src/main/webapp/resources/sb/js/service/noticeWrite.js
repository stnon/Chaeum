

$("form").on("submit", function(event) {
	var title = $(this).find('[name=title]').val();
	var writer = $(this).find('[name=writer]').val();
	
	if(title.trim() == "") {
		$("input[name=title]").next().text("필수입력항목입니다.");
		$("input[name=title]").focus();
		event.preventDefault();
	} else {
		$("input[name=title]").next().text("");
	}
	
	if(writer.trim() == "") {
		$("input[name=writer]").next().text("필수입력항목입니다.");
		$("input[name=writer]").focus();
		event.preventDefault();
	} else {
		$("input[name=writer]").next().text("");
	}
});		
