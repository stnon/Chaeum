<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
	//매출 통계 페이지 외 다른 페이지 이동 시 매출통계 세션 객체 삭제
	session.removeAttribute("changedate"); 
	session.removeAttribute("changebranch");
%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	// Ajax 요청처리에 의해 데이터 가져와서 화면 표시
	function getAdminFreeBoardList(pageNo) {
		//alert("getAdminFreeBoardList() 실행~~~");
	
		let cPage = pageNo;
		console.log(cPage);
		$.ajax("getAdminFreeBoardList.do", { //post 방식일때 JSON.stringify(vo)로 json 문자열 형태로 변환, contentType: "application/json" 컨텐츠 타입 json 형태로 지정하고 데이터 전달, 
			type: "get",				//현재는 cPage 변수 하나만 필요 하므로 get방식 요청 처리
			//data: JSON.stringify(vo),
			//contentType: "application/json",
			data: "cPage=" + cPage,
			dataType: "json",
			success: function(data){
				//alert("성공~~~");
				console.log(data);
				console.log(data.list);
				console.log(data.page.begin);
				let no = data.page.begin;
				
				//게시판 목록 부분 html형태로 작성 후 dispatch
				let dispHtml = "<tr>";
				$.each(data.list, function(index, obj){
					dispHtml += "<td>";
					dispHtml += no;
					dispHtml += "</td>";
					dispHtml += "<td>";
					dispHtml += this.title;
					dispHtml += "</td>";
					dispHtml += "<td>";
					dispHtml += this.nickname;
					dispHtml += "</td>";
					dispHtml += "<td>";
					dispHtml += obj["b_regdate"];
					dispHtml += "</td>";
					dispHtml += '<td style="text-align: center;"><a href="adminfreeboardedithome.do?boardid=' + this.board_id + '">수정</a></td>';
					dispHtml += '<td style="text-align: center;"><a href="adminfreeboardedit.do?boardid=' + this.board_id + '&doit=삭제">삭제</a></td>';
					dispHtml += "</tr>";
					no++;
				});
				$("#adminfreeboardlist").html(dispHtml);
				
				$.each(data, function(page, page){
					//html 작성할 변수
					let dispHtml2 = "";
					
					//게시판 페이징 부분 html형태로 작성 후 dispatch
					dispHtml2 += "<tr>";
					dispHtml2 += '<td colspan="6">';
					dispHtml2 += '<ol class="paging">';
					
					let beginpage = parseInt(this.beginPage);
					beginpage = beginpage - 5;
					
					if(beginpage < 1){
						beginpage = 1;
					}
					console.log("beginpage = " + beginpage);
					
					if(this.beginPage == 1){
						dispHtml2 += '<li class="disable">이전으로</li>';
					} else {
						dispHtml2 += "<li>";
						dispHtml2 += '<a href="javascript:getAdminFreeBoardList(' + beginpage + ')">이전으로</a>';
						dispHtml2 += "</li>";
					}
					for(var i = this.beginPage; i <= this.endPage; i++){
						if(i == this.nowPage){
							dispHtml2 += '<li class="now">' + i + "</li>";
						} else {
							dispHtml2 += '<li><a href="javascript:getAdminFreeBoardList(' + i + ')">' + i + '</a></li>';
						}
					}
					
					let endPage = parseInt(this.endPage);
					endPage = endPage + 1;
					
					if(this.endPage < this.totalPage){
						dispHtml2 += '<li><a href="javascript:getAdminFreeBoardList(' + endPage + ')">다음으로</a></li>';
					} else if (this.endPage >= this.totalPage){
						dispHtml2 += '<li class="disable">다음으로</li>';
					}
					dispHtml2 += "</ol>";
					dispHtml2 += "</td>";
					dispHtml2 += "</tr>";
					
					console.log(dispHtml2);
					
					$("#adminfreeboardpaging").html(dispHtml2);
					return false;
				});
			},
			error: function(){
				//alert("실패~~~");
			}
		});
	}
</script>
<style>
	
	.paging { 
		list-style: none;
		text-align: center;
	 }
	.paging li {
		display: inline-block;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	
</style>
<div class="content-wrapper">
	<div style="text-align: center; width: 100%; margin-bottom: 50px; font-family: MALGUN; ">
		<h2>자유게시판 관리</h2>
	</div>
	<!-- 관리자 공지사항 목록 시작 -->
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 30px;">자유게시판 목록</h4>
					<div class="table-responsive"> 
						<table class="table">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성 날짜</th>
									<th colspan="2" style="text-align: center;">관리</th>
								</tr>
							</thead>
							<tbody id="adminfreeboardlist">
								<c:set var="no" value="${page.begin }"/>
								<c:forEach var="freeboardlist" items="${adminfreeboardlist }">
									<c:if test="${freeboardlist.boardtype == '자유게시판' && no <= page.end}">
										<fmt:formatDate var="resultRegDt" value="${freeboardlist.b_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
										<tr>
											<td>${no}</td>
											<td>${freeboardlist.title}</td>
											<td>${freeboardlist.nickname}</td>
											<td>${resultRegDt}</td>
											<td style="text-align: center;"><a href="adminfreeboardedithome.do?boardid=${freeboardlist.board_id }">수정</a></td>
											<td style="text-align: center;"><a href="adminfreeboardedit.do?boardid=${freeboardlist.board_id }&doit=삭제">삭제</a></td>
										</tr>
										<c:set var="no" value="${no + 1 }"/>
									</c:if>
								</c:forEach>
							</tbody>
							<tfoot id="adminfreeboardpaging">
								<tr>
									<td colspan="6">
										<ol class="paging">
										<c:choose><%--[이전으로]에 대한 사용여부 처리 --%>
										<c:when test="${page.beginPage == 1 }">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="javascript:getAdminFreeBoardList(${page.beginPage - 1 })">이전으로</a>
											</li>
										</c:otherwise>
										</c:choose>	
										
										<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
										<c:forEach var="pageNo" begin="${page.beginPage }" end="${page.endPage }">
										<c:choose>
										<c:when test="${pageNo == page.nowPage }">
											<li class="now">${pageNo }</li>
										</c:when>
										<c:otherwise>
											<li><a href="javascript:getAdminFreeBoardList(${pageNo })">${pageNo }</a></li>
										</c:otherwise>	
										</c:choose>
										</c:forEach>
										
										
										<%--[다음으로]에 대한 사용여부 처리 --%>	
										<c:if test="${page.endPage < page.totalPage }">					
											<li><a href="javascript:getAdminFreeBoardList(${page.endPage + 1 })">다음으로</a></li>
										</c:if>
										<c:if test="${page.endPage >= page.totalPage }">					
											<li class="disable">다음으로</li>
										</c:if>
										</ol>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 관리자 자유게시판 목록 끝 -->
</div>



