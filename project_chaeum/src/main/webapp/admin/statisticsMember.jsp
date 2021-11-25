<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<% 
	//매출 통계 페이지 외 다른 페이지 이동 시 매출통계 세션 객체 삭제
	session.removeAttribute("changedate"); 
	session.removeAttribute("changebranch");
%>

<div class="content-wrapper">
	<div style="text-align: center; width: 100%; margin-bottom: 50px;">
		<h2>${visitcnt.month }월 회원통계</h2>
	</div>
	<div class="row">
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${visitcnt.month }월 방문자 통계</h4>
					<div style="float: left; margin-top: 30px; width: 70%">
						<h2>총 ${visitcnt.visitcnt }명</h2>
					</div>
					<div style="float: left; margin-top: 30px; text-align: right; width: 30%">
						<c:if test="${visitcnt.visitcnt > lastMonth_visitcnt.visitcnt}">
							<h5 style="color: blue; font: bold;">전월대비 방문자 수   ▲</h5>
						</c:if>
						<c:if test="${visitcnt.visitcnt == lastMonth_visitcnt.visitcnt}">
							<h5 style="color: gray; font: bold;">전월대비 방문자 수   ━</h5>
						</c:if>	
						<c:if test="${visitcnt.visitcnt < lastMonth_visitcnt.visitcnt}">
							<h5 style="color: red; font: bold;">전월대비 방문자 수   ▼</h5>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${regcnt.month }월 가입자 통계</h4>
					<div style="float: left; margin-top: 30px; width: 70%">
						<h2>총 ${regcnt.regcnt }명</h2>
					</div>
					<div style="float: left; margin-top: 30px; text-align: right; width: 30%">
						<c:if test="${regcnt.regcnt > lastMonth_regcnt.regcnt}">
							<h5 style="color: blue; font: bold;">전월대비 가입자 수   ▲</h5>
						</c:if>
						<c:if test="${regcnt.regcnt == lastMonth_regcnt.regcnt}">
							<h5 style="color: gray; font: bold;">전월대비 가입자 수   ━</h5>
						</c:if>	
						<c:if test="${regcnt.regcnt < lastMonth_regcnt.regcnt}">
							<h5 style="color: red; font: bold;">전월대비 가입자 수   ▼</h5>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 50px;">연간 방문자 수 추이</h4>
					<canvas id="selectmonth_visit_chart" style="display: block; width: 718px; height: 359px;" class="chartjs-render-monitor"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<!-- 전체 월 매출 차트 -->
<script>

// 우선 컨텍스트를 가져옵니다. 
var ctx1 = document.getElementById("selectmonth_visit_chart").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
	
	var selectall_month_chart = new Chart(ctx1, {
	    type: 'line',
	    data: {
	        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	        datasets: [{
	        	label: "",
	            data: [ ${visitcntlist[0].visitcnt}, ${visitcntlist[1].visitcnt},
	            	${visitcntlist[2].visitcnt}, ${visitcntlist[3].visitcnt},
	            	${visitcntlist[4].visitcnt}, ${visitcntlist[5].visitcnt},
	            	${visitcntlist[6].visitcnt}, ${visitcntlist[7].visitcnt},
	            	${visitcntlist[8].visitcnt}, ${visitcntlist[9].visitcnt},
	            	${visitcntlist[10].visitcnt}, ${visitcntlist[11].visitcnt}
	            ],
	            backgroundColor: [
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)'
	                
	            ],
	            borderColor: [
	            	'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 206, 86, 0.2)'
	                
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true,
	                    stepSize : 100,
	                    max : 1000,
	                    fontSize: 20
	                }
	            }],
			    xAxes: [{
		            ticks: {
		            	fontSize: 20
		            }
        		}]
	        },
	    	legend: {
		        display: false
		    }
	    }
	});
</script>