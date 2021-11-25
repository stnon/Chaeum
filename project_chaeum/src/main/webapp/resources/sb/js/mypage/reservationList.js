
$(".price").text(function() {
	var price = $(this).not(".blind").text();
	$(this).text(addComma(price));
});

$(".date").text(function() {
	var day = searchDayOfWeek($(this).text());
	$(this).next().text(day);
});
function addComma(value) {
	value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return value;
}

function searchDayOfWeek(date) {
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var dayOfWeek = new Date(date);
	dayOfWeek = week[dayOfWeek.getDay()];
	
	return dayOfWeek;
}