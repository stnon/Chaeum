<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
	.table-vertical {
		text-align: center;
	}
	
	.table-vertical th {
		border-right: 1px solid #CED4DA;
		vertical-align: middle;
		padding-top: 1.125rem;
    	padding-right: 1.375rem;
    	padding-bottom: 1.125rem;
    	padding-left: 1.375rem;
    	display: table-cell;
	}
	.table-vertical td {
		border-left: 1px solid #CED4DA;
		vertical-align: middle;
		padding-top: 1.125rem;
    	padding-right: 1.375rem;
    	padding-bottom: 1.125rem;
    	padding-left: 1.375rem;
    	line-height: 1;
    	white-space: nowrap;
	}
	#admineditbutton {
		width: 100px; 
		height: 30px; 
		border-radius: 10px; 
		box-shadow: none; 
		border: 1px solid #a3a4a5; 
		background-color: transparent;
	}
	#admineditcell {
		 border-left: 0px; 
		 border-right: 0px; 
		 border-top: 1px solid #CED4DA; 
		 padding: 0.5rem;
	}
</style>
<div class="content-wrapper">
	<div style="text-align: center; width: 100%; margin-bottom: 100px; font-family: MALGUN; ">
		<h1>공지사항 게시글 수정</h1>
	</div>
	<div class="row" align="center" style="display: block;">
		<div class="col-lg-3 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 30px;">공지사항 게시글 수정</h4>
					<form action="adminboardedit.do" method="get">
						<input type="hidden" name="board_id" value="${onenotice.board_id }">
						<table class="table-vertical" style="text-align: left;">
							<tr>
								<th>제목</th>
								<td colspan="2"><input type="text" name="title" value="${onenotice.title }"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="2">${onenotice.nickname }</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="2"><input type="text" name="b_contents" value="${onenotice.b_contents }"></td>
							</tr>
							<tr>
								<th>작성일자</th>
								<td colspan="2">${onenotice.b_regdate }</td>
							</tr>
							<tr>
								<td id="admineditcell"><button id="admineditbutton" name="doit" value="수정">수정</button></td>
								<td id="admineditcell"><button id="admineditbutton" name="doit" value="삭제">삭제</button></td>
								<td id="admineditcell"><button id="admineditbutton" name="doit" value="돌아가기">돌아가기</button></td>
							</tr>
						</table>						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>