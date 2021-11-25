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
		<h1>관리자 권한 정보 수정</h1>
	</div>
	<!-- 관리자 목록 시작 -->
	<div class="row">
		<div class="col-lg-3 grid-margin stretch-card" style="margin-left: 37%">
			<div class="card position-relative">
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 30px;">권한 정보 수정</h4>
					<form action="adminedit.do" method="get">
						<table class="table-vertical">
							<tr>
								<th>이메일</th>
								<td colspan="2">${oneadmin.email }</td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td colspan="2">${oneadmin.nickname }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td colspan="2">${oneadmin.phone }</td>
							</tr>
							<tr>
								<th>생성일자</th>
								<td colspan="2">${oneadmin.m_regdate }</td>
							</tr>
							<tr>
								<th>현재 권한</th>
								<td colspan="2">
									${oneadmin.rank }
								</td>
							</tr>
							<tr>
								<th>권한 변경</th>
								<td colspan="2">
									<input type="radio" name="editrank" value="관리자" id="a">&nbsp;&nbsp;<label for="a">관리자</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="editrank" value="일반회원" id="b">&nbsp;&nbsp;<label for="b">일반회원</label>
								</td>
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