<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<meta charset="UTF-8">
<title>예약 확정  | StudyRoom Booking</title>
<link href="resources/sb/css/common/subtitle.css" rel="stylesheet" type="text/css">
<link href="resources/sb/css/res/resConfirm.css" rel="stylesheet" type="text/css">

</head>
<div class="content-wrapper" align="center">
	<div class="row" style="width: 75%">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">
				<h1 align="center">예약내역</h1>
				<br><br><br>
	
	<!-- 예약 확정 페이지 start -->
	<div class="contentbox"  align="left">
		<div class="heading"><h3>예약 공간</h3>
			<span class="option"><strong class="price">${Reservation.reservation_price }</strong>
			<em class="unit">원</em>
			</span>
		</div>
			<div class="reserve-info">
		
				<p class="reserve-date">지점 이름
					<span class="details">${branch.branch_name}</span>
				</p>
				<p class="reserve-date">지점 번호
					<span class="details">${branch.branch_tel }</span>
				</p>
				<p class="reserve-date">지점 주소
					<span class="details">${branch.branch_addr }</span>
				</p>
			</div>	
		<br><br>	
		<article>
			<div class="heading"><h3>예약 정보</h3></div>
			<div class="reserve-info">
		
				<p class="reserve-date">예약 번호
				<span class="details"> ${Reservation.reservation_id }</span>
				</p>
					<!-- 
								<p class="reserve-date">예약 인원
					<span class="details"> ${resInfo.roomUser} 인</span>
				</p>
				 -->
				<p class="reserve-date">예약 날짜
				<span class="details"> ${Reservation.reservation_date}  (${Reservation.reservation_checkin}시부터 ~ ${Reservation.reservation_checkout}시까지)</span>
				</p>

			</div>
		</article>
		<br><br>
		<article id="user_info">
			<div class="heading"><h3>예약자 정보</h3>
			
			</div>
			<div class="user-wrap" style="height: 200px;">
				<dl class="flex_box">
					<dt class="flex tit">
						<label for="name">닉네임</label>
					</dt>
					<dd class="flex">
						<input type="text" id="name" value="${user.nickname}" readonly="readonly" style = "text-align:right;">	
					</dd>
				</dl>
				<dl class="flex_box">
					<dt class="flex tit">
						<label for="phone">연락처</label>
					</dt>
					<dd class="flex">
						<input type="text" id="phone" value="${user.phone}" readonly="readonly" style = "text-align:right;">	
					</dd>
				</dl>
				<dl class="flex_box">
					<dt class="flex tit">
						<label for="email">이메일</label>
					</dt>
					<dd class="flex">
						<input type="text" id="email" value="${user.email }" readonly="readonly" style = "text-align:right;">	
					</dd>
				</dl>
			</div>
		</article>
		
		<!-- 결제 정보 start -->
			<article>
			<div class="heading"><h3>결제 정보</h3></div>
			<div class="reserve-info">
				<p class="reserve-date">결제 번호
				<span class="details"> ${Payment.merchant_uid}</span>
				</p>
				<p class="reserve-date">결제 완료 금액
				<span class="details"> ${Payment.payment_price} 원</span>
				</p>
				<p class="reserve-date">결제 날짜
					<span class="details"> ${Payment.payment_date}</span>
				</p>
			</div>
		</article>
		
		<!-- 결제정보 end -->
		
		
			<div class="confirm">	
				<button type="button" class="btn btn-inverse-light btn-fw" onclick="location.href='index.jsp'">확인</button>
			</div>
	</div> <!--  contentsbox 끝> -->
	
	
</div></div></div></div></div>