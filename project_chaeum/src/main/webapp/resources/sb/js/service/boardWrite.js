//summernote
$("#contents").summernote({
	height: 400,		
	minHeight: null,	
	maxHeight: null,
	placeholder : "내용을 입력해주세요",
	toolbar : [
		// [groupName, [list of button]]
		['fontname', ['fontname']],
		['fontsize', ['fontsize']],
		['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
		['color', ['forecolor', 'color']],
		['table', ['table']],
		['para', ['ul', 'ol', 'paragraph']],
		['height', ['height']],
		['insert', ['picture', 'link', 'video']],
		['view', ['fullscreen', 'help']]
	],
	fontNames : ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Impact', 'Tahoma', 'Times New Roman', 'Verdana', '맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	fontSizes : ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
});


if($("#writer").val() != "") {
	$("#writer").attr("readonly", "readonly");
} else {
	$("#writer").attr("readonly", false);
}