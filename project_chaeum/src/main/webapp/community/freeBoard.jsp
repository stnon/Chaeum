<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
table {
	border-collapse: collapse;
}

li {
	list-style: none;
	float: left;
	padding: 6px;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
}

th {
	background-color: #B4B4DC
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

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
		border: 1px solid #dcdcdc;
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
<title>글목록</title>
<script>
$(function(){
    $('#searchBtn').click(function() {
      location.href = "getFreeBoardList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("#searchType").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
    });
  });   	
</script>
</head>
<div class="content-wrapper" align="center">
	<div class="row" style="width: 75%">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card position-relative">

				<div class="card-body">
					<h1 class="h1">자유게시판</h1>

					<br> <br>

					<!-- 검색을 위한 폼 -->
					
					<div class="search">
					<form role="form" method="get">
						<select name="searchType" id="searchType" >
							
							<option value="t">제목</option>
							<option value="c">내용</option>
							<option value="w">작성자</option>
							<option value="tc">제목+내용</option>
						</select> 
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />

						<button id="searchBtn" type="button">검색</button>
					</form>
					</div>
				
					<br>

					<div class="table-responsive pt-3">
						<table class="table table-bordered" >
							<thead>
								<tr align="center">
								
									<th width=10%;>번호</th>
									<th width=40%;>제목</th>
									<th width=20%;>작성자</th>
									<th width=20%;>작성일</th>
									<th width=10%;>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty boardList }">
									<c:forEach var="board" items="${boardList }">
										
											<tr align="center">
												<td class="center">${board.board_id}</td>
												<td><a href="getBoard.do?board_id=${board.board_id }">${board.title }</a>
												</td>
												<td>${board.nickname }</td>
												<td>${board.b_regdate }</td>
												<td>${board.count }</td>
											</tr>
										
									</c:forEach>

								</c:if>
								<c:if test="${empty boardList }">
									<tr>
										<td colspan="5" class="center">데이터가 없습니다</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<br>

						<div style="position: absolute; left: 25%;">
							<ul class="paging">
								<c:if test="${pageMaker.prev}">
									<li><a
										href="getFreeBoardList.do${pageMaker.makeSearch(pageMaker.pageStart - 1)}">이전</a></li>
								</c:if>
	
								<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="idx">
									<li><a
										href="getFreeBoardList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>
	
								<c:if test="${pageMaker.next && pageMaker.pageEnd > 0}">
									<li><a
										href="getFreeBoardList.do${pageMaker.makeSearch(pageMaker.pageEnd + 1)}">다음</a></li>
								</c:if>
							</ul>
							<br>
						</div>	
						<br>
						<br>
						<br>
						<br>
						
						<c:if test="${sessionScope.user != null}">
							<p>
								<button type="button" class= "btn btn-outline-primary" onclick="location.href='index.jsp?contentPage=community/insertBoard.jsp'">새글등록</button>
							</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>