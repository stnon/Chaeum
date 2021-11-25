<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<link rel="stylesheet" href="resources/reservation/reservationForm.css">
  
    
<div class="content-wrapper" align="center">

	<h2>${branch.branch_id }</h2>
	
	<c:forEach var="studyroom" items="${studyroomList_Bid }">
		<h3>${studyroom.studyroom_name }</h3>
	</c:forEach>





	<div class="row" style="width: 75%">
		<div class="col-md-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">

					<!-- 카드바디안 부킹 폼 -->
					<div class="booking-form">
						<div class="form-header">
							<h1>${branch.branch_name } 스터디룸 예약</h1>
						</div>
						<form>
							<div class="form-group">
								<input class="form-control" type="text"
									placeholder="Country, ZIP, city..."> <span
									class="form-label">Destination</span>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input class="form-control" type="date" required> <span
											class="form-label">Check In</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input class="form-control" type="date" required> <span
											class="form-label">Check out</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<select class="form-control" required>
											<option value="" selected hidden>스터디룸 선택</option>
											<option>a</option>
											<option>b</option>
											<option>c</option>
											<option>d</option>
											<option>e</option>
										</select> <span class="select-arrow"></span> <span class="form-label">Rooms</span>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<select class="form-control" required>
											<option value="" selected hidden>사용시간</option>
											<option>09:00 - 10:00</option>
											<option>10:00 - 11:00</option>
											<option>11:00 - 12:00</option>
											<option>12:00 - 13:00</option>
											<option>13:00 - 14:00</option>
											<option>14:00 - 15:00</option>
											<option>15:00 - 16:00</option>
											<option>16:00 - 17:00</option>
										</select> <span class="select-arrow"></span> <span class="form-label">Adults</span>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<select class="form-control" required>
											<option value="" selected hidden>no of children</option>
											<option>0</option>
											<option>1</option>
											<option>2</option>
										</select> <span class="select-arrow"></span> <span class="form-label">Children</span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input class="form-control" type="email"
											placeholder="Enter your Email"> <span
											class="form-label">Email</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input class="form-control" type="tel"
											placeholder="Enter you Phone"> <span
											class="form-label">Phone</span>
									</div>
								</div>
							</div>
							<div class="form-btn">
								<button class="submit-btn">예약하기</button>
							</div>
						</form>
					</div>






				</div>
			</div>
		</div>
	</div>





</div>