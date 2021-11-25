<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  
	<script type="text/javascript">
		function changeView(value){
			if(value == "21") // 관리자패널
			{
				location.href="adminhome.do";
				// 최종적으로 컨트롤러를 만들어서 
				// jsp 안에 .do를 통해 post, get을 해서 사용
			}else if(value == "22")	// 회원관리 - 사용자 목록
			{	
				location.href="memberList.do";
			}else if(value == "23")	// 회원관리 - 메세지보내기
			{	
				location.href="index.jsp?contentPage=admin/manageMember/sendMessage.jsp";
			}else if(value == "24")	// 회원관리 - 자동메일설정
			{	
				location.href="index.jsp?contentPage=admin/manageMember/autoMail.jsp";
			}else if(value == "25")	// 통계조회
			{	
				location.href="index.jsp?contentPage=admin/statisticsLookup.jsp";
			}else if(value == "26")	// 매출통계
			{	
				location.href="Saletotal.do";
			}else if(value == "27")	// 회원통계
			{	
				location.href="Usertotal.do";
			}
		}
	</script>
-->



<!-- partial:partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar" style="background-color: #bbbbdd;">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="#" onclick="location.href='adminhome.do'"><i class="icon-grid menu-icon"></i><span
				class="menu-title">관리자 패널</span>
		</a></li>




		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="icon-head menu-icon"></i><span class="menu-title">회원관리</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="location.href='memberList.do'">사용자 목록</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						href="#" onclick="location.href='message_list.do'">메세지 보내기</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#admin-total" aria-expanded="false" aria-controls="admin-total">
				<i class="icon-bar-graph menu-icon"></i><span class="menu-title">통계조회</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="admin-total">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="location.href='Saletotal.do'">매출통계</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="location.href='Usertotal.do'">회원통계</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse"
			href="#board-control" aria-expanded="false" aria-controls="board-control">
				<i class="icon-clipboard menu-icon"></i><span class="menu-title">게시판 관리</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="board-control">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="location.href='adminboard.do'">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="location.href='adminfreeboard.do'">자유게시판</a></li>
				</ul>
			</div>
		</li>
		<!-- 
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="changeView(26)">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">매출통계</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="changeView(27)">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">회원통계</span>
            </a>
          </li>          
           -->

	</ul>
</nav>
<!-- partial -->


