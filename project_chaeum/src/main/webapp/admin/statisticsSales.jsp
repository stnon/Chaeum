<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 


<div class="content-wrapper">
	<div style="text-align: center; width: 100%">
		<h2>${selectAll_Month[0].month }월 매출통계</h2>
	</div>
	<div style="text-align: right; width: 100%; margin-right: 10%; margin-bottom: 50px;">
		<form name="Saledate" action="changeSaledate.do" method="get">
			<input type="date" name="Saledate" />
			<input type="submit" value="변경" />
		</form>
	</div>
	<div class="row">
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${selectAll_Month[0].month }월 전체 지점 매출통계</h4><h5 style="text-align: right;">단위 : 천원</h5>
						<canvas id="selectall_month_chart" style="display: block; width: 718px; height: 359px;" class="chartjs-render-monitor">1234</canvas>
				</div>
			</div>
		</div>
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${selectAll_Month[0].month }월 ${selectAll_Day[0].day }일 전체 지점 매출통계</h4><h5 style="text-align: right;">단위 : 천원</h5>
						<canvas id="selectall_day_chart" style="display: block; width: 718px; height: 359px;" class="chartjs-render-monitor"></canvas>
				</div>
			</div>
		</div>
	</div>
	<div style="text-align: center; width: 100%; margin-top: 50px;">
		<h2>${selectAll_Month[0].month }월 지점별 매출통계</h2>
	</div>
	<div style="text-align: right; width: 100%; margin-right: 10%; margin-bottom: 50px;">
		<form name="changebranch" action="changebranch.do" method="get">
		  <select id="changebranch" name="changebranch">
		    <c:forEach var="vo" items="${selectAll_Month}">
		    	<option value="${vo.branchid}">${vo.branchname}</option>
		    </c:forEach>
		  </select>
		  <input type="submit" value="변경">
		</form>
	</div>
	<div class="row">
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${selectAll_Month[0].month }월 ${selectOne_Month.branchname } 지점 매출통계</h4>
					<div style="float: left; margin-top: 30px; width: 70%">
						<h2>￦${selectOne_Month.monthsale }원</h2>
					</div>
					<div style="float: left; margin-top: 30px; text-align: right; width: 30%">
						<c:if test="${selectOne_Month.monthsale > selectOne_lastMonth.monthsale}">
							<h5 style="color: blue; font: bold;">전월대비 매출액	▲</h5>
						</c:if>
						<c:if test="${selectOne_Month.monthsale == selectOne_lastMonth.monthsale}">
							<h5 style="color: gray; font: bold;">전월대비 매출액	━</h5>
						</c:if>	
						<c:if test="${selectOne_Month.monthsale < selectOne_lastMonth.monthsale}">
							<h5 style="color: red; font: bold;">전월대비 매출액	▼</h5>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${selectAll_Month[0].month }월 ${selectAll_Day[0].day }일  ${selectOne_Month.branchname } 지점 매출통계</h4>
					<div style="float: left; margin-top: 30px; width: 70%">
						<h2>￦${selectOne_Day.daysale}원</h2>
					</div>
					<div style="float: left; margin-top: 30px; text-align: right; width: 30%">
						<c:if test="${selectOne_Day.daysale > selectOne_lastDay.daysale}">
							<h5 style="color: blue; font: bold;">전일대비 매출액	▲</h5>
						</c:if>
						<c:if test="${selectOne_Day.daysale == selectOne_lastDay.daysale}">
							<h5 style="color: gray; font: bold;">전일대비 매출액	━</h5>
						</c:if>	
						<c:if test="${selectOne_Day.daysale < selectOne_lastDay.daysale}">
							<h5 style="color: red; font: bold;">전일대비 매출액	▼</h5>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>



<!-- 전체 월 매출 차트 -->
<script>

// 우선 컨텍스트를 가져옵니다. 
var ctx1 = document.getElementById("selectall_month_chart").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
	var selectall_month_chart = new Chart(ctx1, {
	    type: 'bar',
	    data: {
	        labels: ["${selectAll_Month[0].branchname}", "${selectAll_Month[1].branchname}", 
	        	"${selectAll_Month[2].branchname}",  "${selectAll_Month[3].branchname}",  
	        	"${selectAll_Month[4].branchname}",  "${selectAll_Month[5].branchname}"],
	        datasets: [{
	        	label: "",
	            data: [${selectAll_Month[0].monthsale / 1000}, ${selectAll_Month[1].monthsale / 1000}, 
	            	${selectAll_Month[2].monthsale / 1000}, ${selectAll_Month[3].monthsale / 1000}, 
	            	${selectAll_Month[4].monthsale / 1000}, ${selectAll_Month[5].monthsale / 1000}],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)'
	                
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)'
	                
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
	                    max : 1000
	                }
	            }]
	        },
	    	legend: {
		        display: false
		    }
	    }
	});
</script>




<!-- 전체 일 매출 차트 -->
<script>

// 우선 컨텍스트를 가져옵니다. 
var ctx2 = document.getElementById("selectall_day_chart").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
	var selectall_day_chart = new Chart(ctx2, {
	    type: 'bar',
	    data: {
	        labels: ["${selectAll_Day[0].branchname}", "${selectAll_Day[1].branchname}", 
	        	"${selectAll_Day[2].branchname}", "${selectAll_Day[3].branchname}",
	        	"${selectAll_Day[4].branchname}", "${selectAll_Day[5].branchname}"
	        	],
	        datasets: [{
	        	label: "",
	            data: [${selectAll_Day[0].daysale / 1000}, ${selectAll_Day[1].daysale / 1000}, 
	            	${selectAll_Day[2].daysale / 1000}, ${selectAll_Day[3].daysale / 1000},
	            	${selectAll_Day[4].daysale / 1000}, ${selectAll_Day[5].daysale / 1000} ],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)'
	                
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)'
	                
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
	                    max : 1000
	                }
	            }]
	        },
	    	legend: {
	        	display: false
	    	}
	    }
	});
</script>