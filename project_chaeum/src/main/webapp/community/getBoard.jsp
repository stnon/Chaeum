<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세</title>
<style>

</style>
<script>
$(document).ready(function(){
	getReplyList();
});

function getReplyList() { 	
	$.ajax({
		url: "replyList.do",
		type: "get",
		dataType:"json",
		async:true,
		data:{
			board_id:"${board.board_id}"
		}, success: function(data){

				var tbody ="";

				$.each(data, function(index, reply){
					tbody += "<tr align='center'  data-r_id='" + this.r_id+ "'data-board_id='" + this.board_id+"' ' >";
					tbody += "<td width=15%;>" + this.nickname + "</td>";
					tbody += "<td width=60%;>" + this.r_content + "</td>";
					tbody += "<td width=15%;>" + this.r_regdate + "</td>";
					if(this.r_writer == "${sessionScope.user.email}") {
					tbody += "<td width=5%;><input type='button' class='modifyReply' id='modifyReply'  value='수정'></td>"
					tbody += "<td width=5%;><input type='button' class='deleteBtn' id='deleteReply' value='삭제'></td>"
					}
					tbody += "</tr>";
					
				});
				$("#tbody").html(tbody);
				
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				
			}
	});
}
	
 // Ajax 댓글작성
	function writerReply() { 
		
		if($("#r_content").val() == "") {
			 alert("내용을 입력해주세요");
			 return;
		 } 
	 
	$.ajax({
		url: "writerReply.do",
		type: "post",
		data:{
			r_content:$("#r_content").val(),
            board_id:"${board.board_id}",
            r_writer:"${sessionScope.user.email}"
		}, success: function(data){
			$("#r_content").val("");
			getReplyList(data);
		}
	});
 }	

 // 댓글 삭제
$(document).on("click", ".deleteBtn", function() {
	if(confirm("댓글을 삭제하시겠습니까?")) {
		var r_id = $(this).parent().parent().data("r_id");
		var board_id = $(this).parent().parent().data("board_id");
		
		$.ajax({
            url : 'deleteReply.do?r_id='+r_id+'&board_id='+board_id,
            type : 'GET',
            dataType : 'json',
            success : function(data) { 
            	alert("삭제가 완료되었습니다");
            	getReplyList(data);
            }       
      }); 
	}
});

// 댓글 수정 버튼 클릭 -> 폼 변경 -> 데이터 담기
$(document).on("click", ".modifyReply", function() {
	$("#modifyForm").hide();
   if(confirm("댓글을 수정하시겠습니까?")) {
   		var r_id = $(this).parent().parent().data("r_id");
	   
   $.ajax({
        url : 'getReply.do?r_id='+r_id, 
        type : 'get',
        contentType : 'application/json;charset=UTF-8',
        dataType : 'json',
        success : function(data) {
           ModifyReplyForm(data);
        }  
  }); 
 }
});

// 댓글 폼 만들기
function ModifyReplyForm(reply) {
	
	var output = "";
      output += '   <div class="media-body" id="modifyForm" style="align: center; width: 80%;>';
      output += '     <h6><b>' + reply.nickname +'</b></h6>';
      output += '     <div style="float:left" data-r_id="' + reply.r_id + '" data-board_id="' + reply.board_id + '">';
      output += '        <textarea id="modifiedContent" class="form-control" rows="4">' + reply.r_content +'</textarea>';      
      output += '        <button id= "modifyComplete" class="btn btn-default" style="background-color: #BBDEFB;" >수정</button>';
      output += '        <button id= "modifyCancel" class="btn btn-default" style="background-color: #BBDEFB;" >취소 </button><br><br>';
      output += '     </div>';
      output += '   </div>';
   $("#modi").append(output);   
   
}


// 댓글 수정완료버튼

 $(document).on("click", "#modifyComplete", function() {
	
      var r_content = $("#modifiedContent").val();
      var board_id = $(this).parent().data("board_id");
      var r_id  = $(this).parent().data("r_id");

       if(r_content.trim().length != 0) {
         $.ajax({
            url : 'modifyOk.do?r_id='+r_id+'&board_id='+board_id+'&r_content='+r_content,
            type : 'post',
            contentType : 'application/json;charset=UTF-8',
            dataType : 'json',
            success : function() {
            	alert("수정이 완료되었습니다.");
            	$("#modifyForm").hide();
      	       getReplyList();
            }
         });
      } 
      
   });
   
 $(document).on("click", "#modifyCancel", function() {
	 $("#modifyForm").hide();
 });
</script>
</head>
<body>
	<div class="content-wrapper" align="center">
		<div class="row" style="width: 75%">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card position-relative">
					<br> <br> <br>
					
					<div id="container">
						<h1 class ="display-1">${board.title }</h1>
						<br>
						
						
						<form action="updateBoard.do" method="get">
							<input type="hidden" name="board_id" value="${board.board_id }">
						<br>
						
							<div style="position: absolute; left: 75%;">
								<div>작성자 by ${board.nickname }</div>
								<div>${board.b_regdate } / 조회수${board.count }</div>
							
							</div>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<div class ="display-4">${board.b_contents }</div>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<div style="width: 10%; float:right; margin-right: 5%;">
							<span>
							<c:if test="${sessionScope.user.nickname == board.nickname}">
								<input type="submit" value="글 수정" class="btn btn-inverse-primary btn-block">
									<td><button type="button" class="btn btn-inverse-primary btn-block" onclick="location.href='deleteBoard.do?board_id=${board.board_id }'">
									글삭제</button>
								
							</c:if>
							<button type="button" class="btn btn-inverse-primary btn-block" onclick="location.href='getFreeBoardList.do'">
									글목록</button><br><br>
									
						</span>	
						</div>
						</form>

					<br>
					</div>
					<hr>
					<br>
					
					
					<h4 align="center">댓글</h4>
					<ul id="replyList">
					</ul>
					<div>
					<table class='table table-striped table-bordered' style="align: center; width: 80%; ">
						<tbody id="tbody">

						</tbody>
						<tfoot>
						<tfoot>
					</table>
					<br>
					</div>
					<!-- 댓글 라인 -->
					<div class="input-group" role="group" aria-label="...">
						<div id="showComment" style="text-align: center; width: 80%;"></div>
					</div>
				

					<!-- 댓글 작성창 -->
					<div id="modi" class="modi"></div>

					<c:if test="${sessionScope.user.nickname ne null}">
						<div>
						<textarea class="form-control" rows="3" id="r_content"
							placeholder="댓글을 입력하세요." style="width: 80%;"></textarea>
					
						<input type="button" class="btn btn-inverse-info btn-block" value="댓글 쓰기"
							id="replyWrite" onclick="writerReply()"
							style="background-color: #BBDEFB; width: 80%;">
						</div>
					</c:if>
					<br> <br> <br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>