<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<% 
	//매출 통계 페이지 외 다른 페이지 이동 시 매출통계 세션 객체 삭제
	session.removeAttribute("changedate"); 
	session.removeAttribute("changebranch");
%>

<div class="content-wrapper">
	<div style="text-align: center; width: 100%; margin-bottom: 50px; font-family: MALGUN; ">
		<h2>관리자 패널</h2>
	</div>
	<!-- 관리자 목록 시작 -->
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 30px;">관리자 목록</h4>
					<div class="table-responsive"> 
						<table class="table">
							<thead>
								<tr>
									<th>No</th>
									<th>관리자 아이디</th>
									<th>이름</th>
									<th>생성 날짜</th>
									<th colspan="2" style="text-align: center;">권한여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${user.rank == '마스터 관리자' }">
									<c:set var="no" value="1" />
									<c:forEach var="adminlist" items="${adminlist }" varStatus="status">
										<c:if test="${adminlist.rank != '일반회원' && adminlist.m_useable == '사용' && adminlist.rank != '마스터 관리자'}">
											<tr>
												<td>${no}</td>
												<td>${adminlist.email }</td>
												<td>${adminlist.nickname }</td>
												<td>${adminlist.m_regdate }</td>
												<td style="text-align: center;"><a href="adminedithome.do?email=${adminlist.email }">수정</a></td>
												<td style="text-align: center;"><a href="adminedit.do?email=${adminlist.email }&doit=삭제">삭제</a></td>
											</tr>
											<c:set var="no" value="${no + 1}" />
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${user.rank == '관리자' }">
									<c:set var="no" value="1" />
									<c:forEach var="adminlist" items="${adminlist }" varStatus="status">
										<c:if test="${adminlist.rank != '일반회원' && adminlist.m_useable == '사용' && adminlist.rank != '마스터 관리자'}">
											<tr>
												<td>${no}</td>
												<td>${adminlist.email }</td>
												<td>${adminlist.nickname }</td>
												<td>${adminlist.m_regdate }</td>
												<td colspan="2" style="text-align: center;">${adminlist.rank }</td>
											</tr>
											<c:set var="no" value="${no + 1}" />
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 관리자 목록 끝 -->
		
		<!-- 요약 통계 시작 -->
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${visitcnt.month }월 전체 지점 매출통계</h4>
					<div style="float: left; margin-top: 30px; width: 70%">
						<h2>￦${Monthsale }원</h2>
					</div>
					<div style="float: left; margin-top: 30px; text-align: right; width: 30%">
						<c:if test="${Monthsale > lastMonthsale}">
							<h5 style="color: blue; font: bold;">전월대비 매출액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▲</h5>
						</c:if>
						<c:if test="${Monthsale == lastMonthsale}">
							<h5 style="color: gray; font: bold;">전월대비 매출액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;━</h5>
						</c:if>	
						<c:if test="${Monthsale < lastMonthsale}">
							<h5 style="color: red; font: bold;">전월대비 매출액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</h5>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${visitcnt.month }월 방문자 통계</h4>
					<div style="float: left; margin-top: 30px; width: 70%">
						<h2>총 ${visitcnt.visitcnt }명</h2>
					</div>
					<div style="float: left; margin-top: 30px; text-align: right; width: 30%">
						<c:if test="${visitcnt.visitcnt > lastMonth_visitcnt.visitcnt}">
							<h5 style="color: blue; font: bold;">전월대비 방문자 수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▲</h5>
						</c:if>
						<c:if test="${visitcnt.visitcnt == lastMonth_visitcnt.visitcnt}">
							<h5 style="color: gray; font: bold;">전월대비 방문자 수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;━</h5>
						</c:if>	
						<c:if test="${visitcnt.visitcnt < lastMonth_visitcnt.visitcnt}">
							<h5 style="color: red; font: bold;">전월대비 방문자 수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</h5>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 요약 통계 끝 -->
	
	<!-- 전체 지점 매출 순위 시작 -->
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 50px;">전체 지점 매출 순위</h4>
					<canvas id="allbranch_salerank" style="display: block; width: 718px; height: 359px;" class="chartjs-render-monitor"></canvas>
				</div>
			</div>
		</div>
	</div>
	<!-- 전체 지점 매출 순위 끝 -->
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<!-- 전체 월 매출 차트 -->
<script>

// 우선 컨텍스트를 가져옵니다. 
var ctx1 = document.getElementById("allbranch_salerank").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
	var allbranch_salerank = new Chart(ctx1, {
	    type: 'pie',
	    data: {
	        labels: ["${Monthrank[0].branchname}", "${Monthrank[1].branchname}",
	        	"${Monthrank[2].branchname}", "${Monthrank[3].branchname}",
	        	"${Monthrank[4].branchname}", "${Monthrank[5].branchname}"],
	        datasets: [{
	        	label: "",
	            data: [ ${Monthrank[0].monthsale}, ${Monthrank[1].monthsale},
	            	${Monthrank[2].monthsale}, ${Monthrank[3].monthsale},
	            	${Monthrank[4].monthsale}, ${Monthrank[5].monthsale}
	            ],
	            backgroundColor: [
	                '#ffdddd',
	                '#ddffff',
	                '#ddffdd',
	                '#ddbbdd',
	                '#ddbbc3',
	                '#eeddcc'
	                
	            ],
	            hoverOffset: 4
	        }]
	    },
	    options: {
	    	responsive: true,
	    	legend: {
	    		position: 'left' 
	    	},
	    	animation:{
	    		animateScale: true,
	    		animateRotate: true
	    	}
	    }
	});
	

</script>