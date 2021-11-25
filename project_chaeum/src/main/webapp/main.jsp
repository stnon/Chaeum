<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%!  // 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "chaeum";
	String pwd = "chpw";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "SELECT S.BOARD_ID, S.TITLE, S.COUNT, to_char(S.B_REGDATE,'YYYY-MM-DD') AS b_regdate," 
			+ " S.NICKNAME, S.BOARDTYPE, S.B_CONTENTS FROM " 
			+ "(SELECT B.BOARD_ID, B.TITLE, B.COUNT, B.B_REGDATE, M.NICKNAME," 
			+ " B.BOARDTYPE, B.B_CONTENTS, ROW_NUMBER() OVER(ORDER BY B.BOARD_ID DESC)" 
			+ " AS RNUM FROM BOARD B, MEMBER M WHERE B.EMAIL = M.EMAIL AND BOARDTYPE = '공지사항' AND B_USEABLE = '사용') S" 
			+ " WHERE 1=1 AND RNUM BETWEEN 1 AND 10";
	
	String sql2 = "SELECT S.BOARD_ID, S.TITLE, S.COUNT, to_char(S.B_REGDATE,'YYYY-MM-DD') AS b_regdate," 
			+ " S.NICKNAME, S.BOARDTYPE, S.B_CONTENTS FROM " 
			+ "(SELECT B.BOARD_ID, B.TITLE, B.COUNT, B.B_REGDATE, M.NICKNAME," 
			+ " B.BOARDTYPE, B.B_CONTENTS, ROW_NUMBER() OVER(ORDER BY B.BOARD_ID DESC)" 
			+ " AS RNUM FROM BOARD B, MEMBER M WHERE B.EMAIL = M.EMAIL AND BOARDTYPE = '자유게시판' AND B_USEABLE = '사용') S" 
			+ " WHERE 1=1 AND RNUM BETWEEN 1 AND 10";
	
%>


<style>
	.imagewrap {
		position: relative;
	}
	
	.images img {
		width: 100%
	}
	
	.textwrap {
		position: absolute; 
		top: 50%; 
		left: 50%; 
		transform: translate( -50%, -50% ); 
		text-align: center;
		font-family: 휴먼둥근헤드라인;
		width: 100%;
	}
	
	.textwrap button {
		margin-top: 10%; 
		color: white; 
		background-color: orange; 
		width: 300px; 
		height: 50px; 
		border-radius: 15px; 
		box-shadow: none; 
	}
	
	.mainboardtitle {
		width: 100%; 
		margin-bottom: 20px; 
		font-family: MALGUN; 
		font-size: 1.2rem; 
		font: bold; 
		font-family: 휴먼둥근헤드라인;
	}
	
	.mainboardtitle a {
		margin-right: 2%; 
		float: right; 
		font-family: 굴림;
		color: gray;
		font-size: 1rem;
	}
	
	.td-ellipsis{
		overflow:hidden; 
		white-space:nowrap; 
		text-overflow:ellipsis;
	}
	
	.td-70 {
		width: 70px;
		text-align: center;
	}
	
	.td-100 {
		width: 100px;
	}
</style>

<div class="content-wrapper" style="background-color: white;">
          

  
	<div class="row">
		<!-- 여백 처리 -->
		<div class="col-lg-1 grid-margin">
		</div>
		<!-- 여백 처리 끝 -->
		<!-- 대문 이미지 -->
		<div class="col-lg-10 grid-margin">
			<div class="imagewrap">
				<div class="images">
					<img src="resources/images/home/studyroom2.jpg" alt="대문이미지">
					<div class="textwrap">
						<h1 style="color: #bbbbdd;">Welcome to Chaeum Study Cafe!</h1>
						<h3 style="color: #ffffdd;">국내 최초 온라인 스터디룸 카페 브랜드!</h3>
						<h3 style="color: skyblue;">지식을 채우다 : 채움</h3>
						<button>Reservation(예약하기)</button>
					</div>
					
				</div>
			</div>
		</div>
		<!-- 여백 처리 -->
		<div class="col-lg-1 grid-margin">
		</div>
		<!-- 여백 처리 끝 -->
		
		<!-- 여백 처리 -->
		<div class="col-lg-1 grid-margin">
		</div>
		<!-- 여백 처리 끝 -->
		<div class="col-lg-5 grid-margin">
			<div class="mainboardtitle">
				공지사항
				<a href="#" style="">더보기&nbsp;&gt;</a>
			</div>
			<div class="">
					<%
						try {
						// 데이터베이스를 접속하기 위한 드라이버 SW 로드
						Class.forName("oracle.jdbc.driver.OracleDriver");
						// 데이터베이스에 연결하는 작업 수행
						conn = DriverManager.getConnection(url, uid, pwd);
						// 쿼리를 생성gkf 객체 생성
						stmt = conn.createStatement();
						// 쿼리 생성
						rs = stmt.executeQuery(sql);
					%>
				<table class="table">
					<thead>
						<tr>
							<th class="td-70">번호</th>
							<th>제목</th>
							<th class="td-100">작성자</th>
							<th>작성일</th>
							<th class="td-70">조회수</th>		
						</tr>
					</thead>
					<tbody>
						<%
							while (rs.next()) {
						%>
						<tr>
							<td class="td-70"><%=rs.getString("board_id")%></td>
							<td class="td-ellipsis"><a href="getBoard.do?board_id=<%=rs.getString("board_id")%>"><%=rs.getString("title")%></a></td>
							<td class="td-ellipsis" style="width: 100px;"><%=rs.getString("nickname")%></td>
							<td class="td-ellipsis"><%=rs.getString("b_regdate")%></td>
							<td class="td-70"><%=rs.getString("count")%></td>
						</tr>
						<%
								}
							} catch (Exception e) {
							e.printStackTrace();
							} finally {
							try {
							if (rs != null) {
								rs.close();
							}
							if (stmt != null) {
								stmt.close();
							}
							if (conn != null) {
								conn.close();
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-lg-5 grid-margin">
			<div class="mainboardtitle">
				자유게시판
				<a href="#" style="">더보기&nbsp;&gt;</a>
			</div>
			<div class="">
					<%
						try {
						// 데이터베이스를 접속하기 위한 드라이버 SW 로드
						Class.forName("oracle.jdbc.driver.OracleDriver");
						// 데이터베이스에 연결하는 작업 수행
						conn = DriverManager.getConnection(url, uid, pwd);
						// 쿼리를 생성gkf 객체 생성
						stmt = conn.createStatement();
						// 쿼리 생성
						rs = stmt.executeQuery(sql2);
					%>
				<table class="table" style="width: 100%; table-layout:fixed;">
					<thead>
						<tr>
							<th class="td-70">번호</th>
							<th>제목</th>
							<th class="td-100">작성자</th>
							<th>작성일</th>
							<th class="td-70">조회수</th>		
						</tr>
					</thead>
					<tbody>
						<%
							while (rs.next()) {
						%>
						<tr>
							<td class="td-70"><%=rs.getString("board_id")%></td>
							<td class="td-ellipsis"><a href="getBoard.do?board_id=<%=rs.getString("board_id")%>"><%=rs.getString("title")%></a></td>
							<td class="td-ellipsis" style="width: 100px;"><%=rs.getString("nickname")%></td>
							<td class="td-ellipsis"><%=rs.getString("b_regdate")%></td>
							<td class="td-70"><%=rs.getString("count")%></td>
						</tr>
						<%
								}
							} catch (Exception e) {
							e.printStackTrace();
							} finally {
							try {
							if (rs != null) {
								rs.close();
							}
							if (stmt != null) {
								stmt.close();
							}
							if (conn != null) {
								conn.close();
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 여백 처리 -->
		<div class="col-lg-1 grid-margin">
		</div>
		<!-- 여백 처리 끝 -->
	</div>
</div>


