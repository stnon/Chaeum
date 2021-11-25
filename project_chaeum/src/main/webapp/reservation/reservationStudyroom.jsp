<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 예약 | StudyRoom Booking</title>
<link href="resources/sb/css/common/subtitle.css" rel="stylesheet" type="text/css">
<link href="resources/sb/css/res/calendar.css" rel="stylesheet" type="text/css">
<link href="resources/sb/css/res/roomImages.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<style type="text/css">
.swiper-container { width: 45px; height: 120px; }
ul, li {list-style: none;}
.reserve_time_wrap {overflow:hidden; background-color: #fff; }
.swiper-container {width:647px;}
.swiper-wrapper {position: relative; width:100%; height:100%; display: flex; box-sizing: content-box; margin: 0 auto;}

.time_list li {position:relative; float: left; height: 103px; width: 55px !important; padding: 47px 0 14px; }
span{vertical-align: top;}
.time.time_half {position:absolute; left:-8px; top:4px; width: auto; color: #b2b2b2; font-size: 9px; text-align: center;}
a {text-decoration: none; cursor: pointer;}
.time_box {display: table; position: relative; text-align: center; background-color: #ffd014;}
.time {position: absolute; left: -8px; top: -23px; text-align: center;}
span.price {color: #cc8c28; border:2px solid #ffc000; background-color:#ffd014; width: 45px; min-wsidth: 45px; height: 41px; padding:8px; vertical-align: middle; } 

.heading {position: relative; width:100%; padding-bottom: 8px; border-bottom: 2px solid #704de4; margin-top: 30px;}
.buttons {margin-top: 30px;}
.btn-res {background: #704de4; color:#fff; font-weight: bold;}
/* modal css*/
.modal-body {padding: 24px 26px 26px;}
.close {margin: 0 !important;}
.modal-header {padding:0;}
.modal-title {text-align:left;  padding: 20px 25px;  background: #704de4; font-size: 20px; color:#fff; box-sizing: border-box;}
.title {margin-top: 20px; font-size: 25px; line-height: 44px; color:#000; text-align: center;}
.reserve-info {margin-top:30px; border-top:2px solid #704de4;}
.reserve-info-wrap {padding: 0 20px; border-bottom: 1px;}
.reserve-info-wrap input {border:none; text-align: right; outline:none; font-weight: bold;}
.reserve-info-wrap li {position: relative; padding:20px 0 18px  100px; font-size:16px; text-align: right; border-bottom: 1px solid #ccc;}
.reserve-info-wrap .tit {position: absolute; left:0; color:#656565;}
#roomPrice {color: #704de4;}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
<div class="content-wrapper" align="center">
	<div class="row" style="width: 75%">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card position-relative">
				<div class="card-body">


<!-- subTitle 부분 시작 
	<div class="subtitle">
		<ul class="title02">
			<h2>
				<span>studyㆍmeetㆍ work</span>
				<br>
				실시간 예약
			</h2>
		</ul>
	</div> 
-->	
	<!-- subtitle end  -->
	<!-- 스터디룸 이미지 파일 출력  
	<div class="imgContainer">
		<div class="img">
			<img src="resources/sb/images/rooms/room_view01.jpg" alt="2-3인용"> 
			<input type="radio" class="room" name="room" value="1"> 최대 2-3인실
		</div>
		<div class="img">
			<img src="resources/sb/images/rooms/room_view02.jpg" alt="3-4인용"> 
			<input type="radio" class="room" name="room" value=2> 최대 3-4인실
		</div>
		<div class="img">
			<img src="resources/sb/images/rooms/room_view03.jpg" alt="6-7인용"> 
			<input type="radio" class="room" name="room" value="3"> 최대 6-7인실
		</div>
		<div class="img">
			<img src="resources/sb/images/rooms/room_view04.jpg" alt="8-9인용"> 
			<input type="radio" class="room" name="room" value="4"> 최대 8-9인실
		</div>
		-->
<div class="imgContainer">
	<c:forEach var="studyroom" items="${studyroomList_Bid }">
		<c:set var="studyroom_i" value="${studyroom_i+1 }"/>
		<div class="img">
			<img src="resources/sb/images/rooms/room_view${studyroom.studyroom_num }.jpg" alt="${studyroom.studyroom_name }인용"> 
			<input type="radio" class="room" name="room" value="${studyroom_i }">${studyroom.studyroom_name }(최대${studyroom.studyroom_num }인)
			<input type="hidden" id = "roomId${studyroom_i}" class="roomId" name="roomId" value="${studyroom.studyroom_id }" >
		</div>
	</c:forEach>
	
	</div>
	<!--  이미지 출력 end -->
	
	
	<!-- 예약 정보 start: 날짜, 시간, 인원, 총 요금 출력 -->
	<div class="container" style="margin-top: 30px;">
		<!-- 달력 -->
		<div class="heading"><h5>날짜선택</h5></div>
		<div id="calendarForm"></div>
		
		<div class="heading"><h5>시간선택</h5></div>
			<!-- Slider main container -->
			<div class="reserve_time_wrap">
    		<div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
        		<ul class="swiper-wrapper time_list" style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
            		<li class="swiper-slide able swiper-slide-active"><span class="time time_half">오전</span> 
            			<a class="time_box"><span class="time">0</span><span class="price">0 ~ 1 </span></a></li>
            		<li class="swiper-slide able swiper-slide-next">
                 		<a class="time_box"><span class="time">1</span> <span class="price">1 ~ 2</span></a>
            		</li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time" >2</span> <span class="price">2 ~ 3</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">3</span> <span class="price">3 ~ 4</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">4</span> <span class="price">4 ~ 5</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">5</span> <span class="price">5 ~ 6</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">6</span> <span class="price">6 ~ 7</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">7</span> <span class="price">7 ~ 8</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">8</span> <span class="price">8 ~ 9</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">9</span> <span class="price">9~10</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">10</span> <span class="price">10~11</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">11</span> <span class="price">11~12</span></a>
		            </li>
		            <li class="swiper-slide able"><span class="time time_half">오후</span> <a class="time_box"><span
		                        class="time">12</span> <span class="price">12~13</span></a></li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">13</span> <span class="price">13~14</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">14</span> <span class="price">14~15</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">15</span> <span class="price">15~16</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box" ><span class="time">16</span> <span class="price">16~17</span></a>
		            </li>
		            <li class="swiper-slide able">
		                <a class="time_box"><span class="time">17</span> <span class="price">17~18</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">18</span> <span class="price">18~19</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">19</span> <span class="price">19~20</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">20</span> <span class="price">20~21</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">21</span> <span class="price">21~22</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">22</span> <span class="price">22~23</span></a>
		            </li>
		            <li class="swiper-slide able">
		                 <a class="time_box"><span class="time">23</span> <span class="price">23~24</span></a>
		            </li>
		          
        	</ul><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
  	 	 </div>
	</div>

	<!-- 선택된 예약 정보 출력 -->
	<div class="heading"> <h5>예약 일시</h5> </div>
		<div class="reservation">
		<div class="reserve_info" style="font-size:20px;"></div>
		<div class="time_info" style="font-size:20px;"></div>
		</div>
		
	<!-- 사람수 
	<div class="heading" > <h5>인원 선택</h5></div>
		<div class="box_setting">
			<span class="input">
			<input type="number" id="users" name="users" value=1 min="1" max="12">
			</span>
		</div>
	-->

	<div class="heading"><h5>공간 사용료</h5></div>
		<div class="totalPrice" style="font-size:20px;"></div>
	
	
	<div class="buttons">	
		<input type="hidden" name="name" value="${user.email }" id="email">
		<input type="hidden" name="phone" value="${user.phone }" id="phone">

		<button class="btn btn-res" id="storePay" data-toggle="modal" data-target="#myModal">예약하기</button>

	</div>
	
</div> <!-- container 종료 -->

 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <p class="title">결제하시겠습니까? </p>
          <div class="reserve-info">
          <ul class="reserve-info-wrap">
          	<li><span class="tit">스터디룸 </span><input type="text" name="roomName" class= "reserveRoomName"></li>
          	<li><span class="tit">예약 날짜 </span> <input type="text" name="roomDate" class="reserveDate"></li>
          	<li><span class="tit">시작 시간 </span><input type="text" name="startTime" class="startTime"></li>
          	<li><span class="tit">종료 시간 </span><input type="text" name="endTime" class="endTime"></li>
          	<li style="border-botton:none;"><span class="tit">총 금액</span> <input type="text" name="roomPrice" id="roomPrice"></li>
          </ul>
          </div>
        </div>
        <div class="modal-footer">
        	<p>예약을 확정 하시겠습니까?</p>
        
        	<button type="button" class="btn btn-warning" id="check_module" title="바로결제">바로 결제</button>
        	<!--  
          <button type="button" class="btn btn-res" data-dismiss="modal" id="confirmRes" title="현장결제">현장결제</button>
          -->
        </div>
      
    </div>
 </div> 
 </div> 



<script>


var mySwiper = new Swiper('.swiper-container');

var branch_id = '<c:out value="${branch.branch_id}" />';
var pdate;

$("#check_module").click(function() {
	pdate = new Date().getTime();
	payment = "바로결제";
	var IMP = window.IMP; // 생략가능
	IMP.init('imp74635174');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid : 'sr_b'+ branch_id + '_' + new Date().getTime(),
		/*
		merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		나중에 포스팅 해볼게요.
		 */
		name : '스터디룸 예약',
		//결제창에서 보여질 이름
		amount : finalPrice,
		//가격
		buyer_name : nickname
		/*buyer_email : email
		
		buyer_name : nickname,
		buyer_tel : phone
		
		buyer_addr : '서울특별시 강남구 삼성동',
		buyer_postcode : '123-456',
		m_redirect_url : 'https://www.yourdomain.com/payments/complete'*/
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	 */
	}, function(rsp) {
		console.log(rsp);
		if (rsp.success) {
			/*
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.medrchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			*/
			$.ajax("Reservation.do",{
				method: "post",
				async: false,
				//headers: {"Content-Type": "application/json"},
				data: {
					//imp_uid: rsp.imp_uid,
					//revNum:revNum,
					//amount:finalPrice,
					merchant_uid: rsp.merchant_uid,
					payment_method: rsp.pay_method,
					payment_price: rsp.paid_amount,
					//apply_num: rsp.apply_num,
					//status: rsp.status,
					//pg_provider: rsp.pg_provider
					payment : payment,
					revNum : revNum,
					startTime : min,
					endTime : max,
					roomTime : revTime,
					roomPrice : finalPrice,
					roomDate : bookDate,
					roomType : sId
					
					
					},
					success: function(data) {
						console.log(data);
						//confirmRes(); 
						//여기서 예약 정보들을 예약테이블에 저장해줘야함. function호출하면될듯
						location.href = "index.jsp?contentPage=reservation/confirmRes.jsp?reservation_id=" + revNum;
					},error: function(){
						alert("바로결제 실패");
					}			
			}).done(function(data){
				alert("결제가 완료되었습니다");
				
				
			})
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
	

});




var pricePerHour;
//----------------날짜 선택용 달력 ----------------
(function () {
    calendarMaker($("#calendarForm"), new Date());
})();

var nowDate = new Date();
//-----calendarMaker 시작 --------------------------
var bookDate = 0;
function calendarMaker(target, date) {
    if (date == null || date == undefined) {
        date = new Date();
    }
    nowDate = date;
    if ($(target).length > 0) {
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
        $(target).empty().append(assembly(year, month));
    } else {
        console.error("custom_calendar Target is empty!!!");
        return;
    }

    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


    var tag = "<tr>";
    var cnt = 0;
    //빈 공백 만들어주기
    for (i = 0; i < thisMonth.getDay(); i++) {
        tag += "<td></td>";
        cnt++;
    }

    //날짜 채우기
    for (i = 1; i <= thisLastDay.getDate(); i++) {
        if (cnt % 7 == 0) { tag += "<tr>"; }

        tag += "<td>" + i + "</td>";
        cnt++;
        if (cnt % 7 == 0) {
            tag += "</tr>";
        }
    }
    $(target).find("#custom_set_date").append(tag);
    calMoveEvtFn();

    function assembly(year, month) {
        var calendar_html_code =
            "<table class='custom_calendar_table'>" +
            "<colgroup>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "</colgroup>" +
            "<thead class='cal_date'>" +
            "<th><button type='button' class='prev'><</button></th>" +
            "<th colspan='5'><p><span>" + year + "</span>년 <span>" + month + "</span>월</p></th>" +
            "<th><button type='button' class='next'>></button></th>" +
            "</thead>" +
            "<thead  class='cal_week'>" +
            "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
            "</thead>" +
            "<tbody id='custom_set_date'>" +
            "</tbody>" +
            "</table>";
        return calendar_html_code;
    }
 var selectDate= 0;
    function calMoveEvtFn() {
        //전달 클릭
        $(".custom_calendar_table").on("click", ".prev", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //다음날 클릭
        $(".custom_calendar_table").on("click", ".next", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        
     
        	
        //일자 선택 클릭
        $(".custom_calendar_table").on("click", "td", function (e) {

        	let checkToday = new Date();
        	let checkMonth = checkToday.getMonth() + 1;  // 월
            $(".custom_calendar_table .select_day").removeClass("select_day");
            selectDate = $(this).text();
            if((nowDate.getMonth() + 1) == checkMonth){
	           	if(selectDate < nowDate.getDate()){
	           		selectDate = 41;
	           	}else{
	           		$(this).removeClass("select_day").addClass("select_day");
	           	}
       	 	}else if((nowDate.getMonth() + 1) < checkMonth){
       	 		selectDate = 41;
            }else{
            	$(this).removeClass("select_day").addClass("select_day");
            }
            
			
			console.log(selectDate);
			console.log(year);
			console.log(month);
			
			if(selectDate ==41){
				bookDate = "날짜를 확인해주세요.";
			}else{
				bookDate = year+"-"+month+"-"+selectDate;
				if(month.toString().length <= 1) {
					bookDate = year+"-0"+month+"-"+selectDate;
					if(selectDate.length <= 1) {
						bookDate = year+"-0"+month+"-0"+selectDate;
					}
				}
			}
			
			
			
			
			
			
			console.log(bookDate);
			
			$(".reserve_info").text(bookDate);
			
        });
        
        
        
        
    }
}  //-----calendarMaker() 종료 --------------------------


//----------------시간 선택 시작---------------------------
//4시 클릭 후 9시 클릭하면 중간에 5-8시도 자동 클릭되게
var min = 24;
var max = -1;
var selectTime =0;
var revTime=0;
var totalPrice =0;
var user =1;

//원하는 시간 클릭 시 함수 적용 ----------------------
$(".time_list li").click(function() {	
	selectTime = parseInt($(this).children().find(".time").text());
	console.log("select : " + selectTime); //선택한 시간
	user =1;
	$("#users").val("1"); //인원수 초기화
	
	// 이미 예약된 시간은 다 막아야함
	
	
	if(!$(this).hasClass("selected")) {
		for(var i=0; i<24; i++) {
			if( selectTime > max - 1 ) { 
				max = selectTime + 1;
				$(this).addClass("selected");
				$(this).children().find(".price").css("background-color", "#704de4");
			}
			if( selectTime < min ) {
				min = selectTime;
				$(this).addClass("selected");
				$(this).children().find(".price").css("background-color","#704de4");
			}
		} //for문 종료
		css();
	} else if($(this).hasClass("selected")) {   //이미 선택된 시간이 시작시간-종료시간 사이에있는 값이면
		if (min<=selectTime<=max){
		//alert("선택된시간: "+selectTime);
			$('.time').each(function(){  //모든 시간(24h)값을 반복해서 체크, 선택된 시작시간, 종료시간 범위안의 값이라면 적용된 css없애기
  				var test = $(this).text();
					if(min<=test<selectTime || test>selectTime){
						console.log("여기까지옴");
						$(this).parents('li').removeClass("selected");
						$(this).siblings().css("background-color", "#ffd014");
						}
			});
			$(this).addClass("selected");  //위에 each로 반복되면서 선택되어야할 값도 css가 없어지므로 다시 선언해줌
			$(this).children().find(".price").css("background-color","#704de4");
			min = selectTime;
			max = selectTime + 1;
			} //if문 종료
		};  //else if 종료
		
	console.log(min + " - " + max);
	revTime = max-min;		//예약할 총 시간

		
	
	$(".time_info").text(min+":00 ~"+max+":00  "+revTime+"시간");  //html에 출력해줌
	var temp = $('input:radio[name="room"]:checked').val();
	//${studyroomList_Bid[temp].studyroom_price }
	
	
	
	
	//총 금액 계산하기
	totalPrice = roomPrice * revTime;  
	console.log("totalPrice : "+totalPrice);
	console.log("기본 인원: "+user);  //기본값 1인임.
	
	$(".totalPrice").text(totalPrice +" 원");  //선택된 시간*1인으로 먼저 html에 총금액 출력
});  //시간 선택 end!!

getUsers();  //인원수 선택 후 총금액 다시 계산해서 html에 금액 출력하는 함수!

 //공간사용료 최종 금액: 인원선택 후 계산 시작--------
var totalPrice2 =0; 
function getUsers() {
	$("#users").blur(function(){
	 user = $("#users").val();
	console.log("f안에 인원: "+user);
	console.log("total가격: "+totalPrice) //기본값1인으로 계산한 금액
	totalPrice2 = totalPrice*user; //인원수가 수정되면 수정된 인원을 곱해서 총금액 다시 계산!
	console.log("total가격2: "+totalPrice2)
	$(".totalPrice").text(totalPrice2 +" 원");  //최종금액으로 html에 출력시키기.
		})
}  //getUsers() END --------------------------
	

// //선택 시간의 최소값과 최대값 만큼 반복해서 중간에 낀 시간에 css를 자동 적용하는 함수
function css(){
for(var i=min; i<max-1; i++){  
	console.log("반복문최소:" +min)
	console.log("최대: "+ max)
			var restTime = i+1;     //중간에 낀 시간 반복문으로 알아내기 2-9시 면 3,4,5,6,7
			 //전체 시간 list중 3,4,5,6,7 과 일치하는 태그를 찾아 css를 주려고함.
			console.log("Restime"+restTime) //여기까지는 의도한대로 잘 나옴..
			
			$('.time').each(function(){
  					var test = $(this).text();
 			//	 console.log(test);
				if(restTime == test){
				$(this).parents('li').addClass("selected");
				$(this).siblings().css("background-color","#704de4");
				}
			});
		}
} //----------CSS()함수 END -------


// 스터디룸 이미지를 보고 인원수에 맞는 룸 선택(1~5 번 방)
var roomPrice;
var roomType =1;
var roomName;
var sId;
$(".room").click(function() {
	roomType= $(this).val();
	console.log("룸타입: "+roomType);
	//$("#users").attr("max", 3); 
	

	
	switch(roomType) {
    case "1": 
		$("#users").attr("max", 2); 
		roomName = '<c:out value="${studyroomList_Bid[0].studyroom_name }" />';
		sId = document.getElementById("roomId1").value;
		roomPrice = '<c:out value="${studyroomList_Bid[0].studyroom_price }" />';
		console.log("아이디: "+sId);
         break
    case "2": 
		$("#users").attr("max", 4);
		roomName = '<c:out value="${studyroomList_Bid[1].studyroom_name }" />';
		sId = document.getElementById("roomId2").value;
		roomPrice = '<c:out value="${studyroomList_Bid[1].studyroom_price }" />';
         break
    case "3": 
		$("#users").attr("max", 6);
		roomName = '<c:out value="${studyroomList_Bid[2].studyroom_name }" />';
		sId = document.getElementById("roomId3").value;
		roomPrice = '<c:out value="${studyroomList_Bid[2].studyroom_price }" />';
		break
	case "4": $("#users").attr("max", 8);
		roomName = '<c:out value="${studyroomList_Bid[3].studyroom_name }" />';
		sId = document.getElementById("roomId4").value;
		roomPrice = '<c:out value="${studyroomList_Bid[3].studyroom_price }" />';
		break
	case "5": $("#users").attr("max", 10);
		roomName = '<c:out value="${studyroomList_Bid[4].studyroom_name }" />';
		sId = document.getElementById("roomId5").value;
		roomPrice = '<c:out value="${studyroomList_Bid[4].studyroom_price }" />';
		break
	case "6": $("#users").attr("max", 10);
		roomName = '<c:out value="${studyroomList_Bid[5].studyroom_name }" />';
		sId = document.getElementById("roomId6").value;
		roomPrice = '<c:out value="${studyroomList_Bid[5].studyroom_price }" />';
	break

	default: $("#users").attr("max", 2);
     	break
	}
	
})



	

 
 //잘 나오는지 확인용

//현장결제 버튼 누르면 DB로 보내서 저장하기.
var payment;
$("#confirmRes").click(function(){
	payment=$(this).attr("title");
	console.log("결제타입:" + payment)
	//예약번호 만들기
	//var revNum= Math.floor(Math.random() * 100000);
	//id, email 정보 session 에서 받아오기
	confirmRes();
}) //현장결제 완료


$('#storePay').on('click', function(){

	revNum= Math.floor(Math.random() * 100000); //랜덤 예약번호 생성
	var startTime = $(this).data('startTime');
	console.log("모달 열림");
	/*
	var sr_index = studyroom_i -1;
	if(sr_index == 0){
		roomName='<c:out value="${studyroomList_Bid[0].studyroom_name }" />';
	}else if(sr_index == 1){
		roomName='<c:out value="${studyroomList_Bid[1].studyroom_name }" />';
	}else if(sr_index == 2){
		roomName='<c:out value="${studyroomList_Bid[2].studyroom_name }" />';
	}else if(sr_index == 3){
		roomName='<c:out value="${studyroomList_Bid[3].studyroom_name }" />';
	}else if(sr_index == 4){
		roomName='<c:out value="${studyroomList_Bid[4].studyroom_name }" />';
	}else if(sr_index == 5){
		roomName='<c:out value="${studyroomList_Bid[5].studyroom_name }" />';
	}
	*/
	
	
	$(".reserveRoom").val(roomType);
	$(".reserveRoomName").val(roomName);
	$(".reserveDate").val(bookDate);
	$(".startTime").val(min+" 시");
	$(".endTime").val(max+" 시");
	$(".reserveUser").val(user+"인");
	if(totalPrice2==0){
		$("#roomPrice").val(totalPrice+" 원");
		finalPrice= totalPrice;
	}else{
		$("#roomPrice").val(totalPrice2+" 원");
		finalPrice = totalPrice2;
	}});







</script>


</div></div></div></div></div>
</body>
</html>