<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	// Ajax 요청처리에 의해 데이터 가져와서 화면 표시
	function getJsonBranchListData() {
		alert("getJsonBranchListData() 실행~~~");
		$.ajax("getJsonBranchList.do", {
			type: "get",
			dataType: "json",
			success: function(data){
				alert("성공~~~");
				console.log(data);
				
				let dispHtml = "<ul>";
				$.each(data, function(index, obj){
					dispHtml += "<li>";
					dispHtml += this["branch_id"] + ", ";
					dispHtml += this["branch_name"] + ", ";
					dispHtml += this["branch_tel"] + ", ";
					dispHtml += "</li>";
				});
				dispHtml += "</ul>";
				$("#listDisp").html(dispHtml);
			},
			error: function(){
				alert("실패~~~");
			}
		});
	}
</script>
</head>
<body>

<div id="container">
	<h1>게시판 프로그램</h1>
	<hr>
	<p>
		<a href="login.do">로그인 페이지로 이동(GET)</a>
	</p>
	<hr><hr>
	
	<h2>Ajax 요청 처리</h2>
	<p><a href="javascript:getJsonBranchListData()">JSON 데이터 가져오기(BoardList)</a></p>
	<p><a href="javascript:getJsonBranchData()">JSON 데이터 가져오기(Board)</a></p>
	
	<hr>
	<div id="listDisp">
		<ul>
			<li>데이터 가져와서 출력하기</li>
		</ul>
	</div>
</div>

<script>
	function getJsonBranchData() {
		alert("getJsonBranchData() 실행~~");
		//let vo = {seq: 1};
		let vo = {};
		vo.branch_id = 2;
		console.log(vo);
		console.log(JSON.stringify(vo));
		
		$.ajax("getJsonBranch.do", {
			type: "post",
			data: JSON.stringify(vo), //'{"seq": 1}' //서버로 전달할 데이터(JSON문자열)
			//data: "seq=1", // key-value 형태
			dataType: "json", //서버로 부터 응답받을 데이터 형식
			contentType: "application/json", //서버로 전달하는 컨텐츠유형(JSON형식일때)
			success: function(data) {
				alert("성공~~~");
				console.log(data);
				let dispHtml = "<ul><li>";
				dispHtml += data.branch_id + ", ";
				dispHtml += data.branch_name + ", ";
				dispHtml += data.branch_tel + ", ";
				dispHtml += "</li></ul>";
				$("#listDisp").html(dispHtml);
			},
			error: function(){
				alert("실패~~");
			}
		});
	}
</script>

</body>