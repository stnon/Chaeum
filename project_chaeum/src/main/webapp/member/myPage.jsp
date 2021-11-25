<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var pwd = "0";
	
	<!-- 회원탈퇴 -->
	function signout() {
		var m_pass = $("#m_pass3").val();
		var email = "${sessionScope.user.email}";
	
		if(pwd == "0") {
			$("#m_pass3").val("");
			$("#m_pass4").val("");
			$("#passCheck2").html('<h6 style="color:red;">같은 비밀번호를 입력해주세요</h6>');
			
		} else if (pwd == "1" ){
			
			$.ajax({
				url: "passChk.do" ,
				type: "POST",
				data:{ email : email,
					   m_pass : m_pass },
				success:function(rs) {
					if (rs == "1") {
						location.href="signout.do?email="+ email;
						alert("회원탈퇴 완료");
					} else if (rs == "0") {
						$("#passCheck2").html('<h6 style="color:red;">비밀번호가 일치하지 않습니다</h6>');
					}
				}
			});
		}
	}
	
	<!-- 회원수정 -->
	function update() {
		var m_pass = $("#m_pass9").val();
		var email = "${sessionScope.user.email}";
	
		if(pwd == "0") {
			$("#m_pass9").val("");
			$("#m_pass0").val("");
			$("#passCheck3").html('<h6 style="color:red;">같은 비밀번호를 입력해주세요</h6>');
			
		} else if (pwd == "1" ){
			
			$.ajax({
				url: "passChk.do" ,
				type: "POST",
				data:{ email : email,
					   m_pass : m_pass },
				success:function(rs) {
					if (rs == "1") {
						document.update_frm.submit();
						alert("회원수정 완료");
					} else if (rs == "0") {
						$("#passCheck2").html('<h6 style="color:red;">비밀번호가 일치하지 않습니다</h6>');
					}
				}
			});
		}
	}
	
	<!-- 비밀번호 확인-->
	function passCheck() {
		var pass1 = $("#m_pass3").val();
		var pass2 = $("#m_pass4").val();
		var pass3 = $("#m_pass9").val();
		var pass4 = $("#m_pass0").val();
	
		
		if ( pass1 != pass2 ) {
			$("#passCheck2").html('<h6 style="color:red;">같은 비밀번호를 입력해주세요</h6>');
			pwd = "0";
			
		} else if ( pass1 == pass2 ){
			$("#passCheck2").html('<h6 style="color:green;">같은 비밀번호입니다</h6>');
			pwd = "1";
			
		}
		
		if ( pass3 != pass4 ) {
			$("#passCheck3").html('<h6 style="color:red;">같은 비밀번호를 입력해주세요</h6>');
			pwd = "0";
			
		} else if ( pass3 == pass4 ){
			$("#passCheck3").html('<h6 style="color:green;">같은 비밀번호입니다</h6>');
			pwd = "1";
			
		}
	}
	
	<!-- 닉네임 중복확인 Ajax -->
	function checkName() {
		var inputName = $("#nickname1").val(); 
		var checkName= RegExp(/^[가-힣]{2,8}$/);
		$.ajax({
			url: "checkName.do?nickname=" + inputName,
			type: "POST",
			success:function(rs){
				if(rs == "0") { // 0일경우는 사용 가능한 아이디
					if(!checkName.test(inputName)){
						$("#checkN1").html('<h6 style="color:red;">(2~8자)한글만 사용가능합니다</h6>');
					} else {
						$("#checkN1").html('<h6 style="color:green;">사용가능한 닉네임입니다</h6>');
					}
				} else { // 아이디가 존재할 경우
					$("#checkN1").html('<h6 style="color:red;">이미 사용중인 닉네임입니다</h6>');
				}
				
			},
			error:function(){
				
			}
		
		});
	}
</script>
</head>
<body>

	<div class="content-wrapper" align="center">
		<div class="row" style="width: 75%">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card position-relative">
	
					<div class="content-wrapper">
						<div class="row">
							
							<div class="col-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body" style="padding: 1.25rem 15.25rem;">
										<br>
										<br>
										<br>
										<h2 class="h2">회원정보</h2>
										<br>
										<br>
											<br>
										<form class="forms-sample" name = "update_frm" id ="update_frm" action="userUpdate.do" >
											<div class="form-group">
											<input type="hidden" name= "email" value ="${sessionScope.user.email}">
												<label for="exampleInputEmail3">이메일</label> <input
													type="email" class="form-control" id="exampleInputEmail3" 
													placeholder="${sessionScope.user.email}" disabled>
											</div>
											<div class="form-group">
												<label for="exampleInputName1" >닉네임</label> <input
													type="text" class="form-control" id="nickname1"
													placeholder="${sessionScope.user.nickname}" name="nickname"  oninput="checkName()">
											</div>
											<div id="checkN1"></div>
											<br>
											<div class="form-group">
												<label for="exampleInputPassword4">변경 할 비밀번호</label> <input
													type="password" class="form-control"
													id="exampleInputPassword4" name="m_pass">
											</div>
											<div class="form-group">
												<label for="exampleInputPassword4">변경 할 비밀번호 확인</label> <input
													type="password" class="form-control"
													id="exampleInputPassword5" >
											</div>
											
											
											<div class="form-group">
												<label for="exampleInputCity1">휴대폰번호</label> <input
													type="text" class="form-control" id="exampleInputCity1"
													placeholder="${sessionScope.user.phone}" name="phone">
											</div>
											
											<div class="form-group">
												<label for="exampleInputCity1">생년월일</label> <input
													type="text" class="form-control" id="exampleInputCity1"
													placeholder="${sessionScope.user.birth}" name="birth">
											</div>
											
											<div class="form-group">
												<label for="exampleInputCity1">회원등급</label> <input
													type="text" class="form-control" id="exampleInputCity1"
													placeholder="${sessionScope.user.rank}" disabled>
											</div>
											<!--  
											<div class="form-group">
												<label for="exampleInputCity1">마일리지</label> <input
													type="text" class="form-control" id="exampleInputCity1"
													placeholder="" disabled><button>충전</button>
											</div>
											-->
											<br>
											<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#update">회원수정</button> 
									
											
										</form>
										<br>
										<button type="button" class="btn btn-light" data-toggle="modal" data-target="#signout">회원탈퇴</button> 
									</div>
								</div>
							</div>
							<div class="col-md-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">예약내역</h4>
										<br><br>
										<div class="row">
											<div class="col-12">
												<div class="table-responsive">
													<table id="order-listing" class="table">
														<thead>
															<tr>
																<th>예약번호</th>
																<th>사용 예정일</th>
																<th>사용자 닉네임</th>
																<th>예약 금액</th>
																<th>Status</th>
																<th>상세보기</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="reservation" items="${RevList }">
																<tr>
																	<td>${reservation.reservation_id }</td>
																	<td>${reservation.reservation_date }</td>
																	<td>${user.nickname }</td>
																	<td>${reservation.reservation_price }원</td>
																	<td><label class="badge badge-danger">결제완료</label>
																	</td>
																	<td>
																		<button class="btn btn-outline-primary"
																			onclick="location.href='getReservation.do?reservation_id=${reservation.reservation_id }'">View</button>
																	</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">내가 쓴 글</h4>

										<!-- =========================== 내가 쓴 글 데이터 가져오기 ====================================== -->

										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th style="width: 70%">제목</th>
													<th style="width: 20%">작성일</th>
													<th style="width: 10%">상세보기</th>

												</tr>
											</thead>

											<tbody>
												<c:if test="${not empty boardList }">
													<c:forEach var="board" items="${boardList }">
														<c:if test="${board.email == sessionScope.user.email}">
															<tr align="center">
															
																<td>${board.title }</td>
																<td>${board.b_regdate }</td>
																<td><a
																	href="getBoard.do?board_id=${board.board_id }">보러가기</a></td>
															</tr>
														</c:if>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

									</div>
								</div>
							</div>
							<div class="col-md-6 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">내가 쓴 댓글</h4>

										<!-- =========================== 내가 쓴 댓글 데이터 가져오기 ====================================== -->

										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th style="width: 70%">댓글내용</th>
													<th style="width: 20%">작성일</th>
													<th style="width: 10%">상세보기</th>

												</tr>
											</thead>

											<tbody>
												<c:if test="${not empty rlist }">
													<c:forEach var="reply" items="${rlist }">
														<c:if test="${reply.r_writer == sessionScope.user.email}">
															<tr align="center">
																
																<td>${reply.r_content }</td>
																
																<td>${reply.r_regdate }</td>
																<td><a
																	href="getBoard.do?board_id=${reply.board_id }">보러가기</a></td>
															</tr>
														</c:if>
													</c:forEach>
												</c:if>

											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  회원탈퇴부분 -->
	<div class="modal" id="signout">
		    <div class="modal-dialog">
		      <div class="modal-content">
	      
	        
	        <!-- Modal body -->
			<div class="modal-body">
				<div class="card align-middle"
					style="width: 100%;">
					<div class="card-title" style="margin-top: 30px;">
						<h2 class="card-title text-center" style="color: #113366;">비밀번호 확인</h2>
					</div>
					<div class="card-body">
						<form id = "form-signout" class="form-signout" method="post" >
							<label
								for="inputPassword" class="sr-only" >비밀번호</label> 
							<input
								type="password" id="m_pass3" class="form-control" oninput="passCheck();"
								placeholder="비밀번호" name="m_pass1" required style="display: block;">
								<br>
							<label
								for="inputPassword" class="sr-only" >비밀번호확인</label> 
							<input
								type="password" id="m_pass4" class="form-control" oninput="passCheck();"
								placeholder="비밀번호 확인" name="m_pass2" required style="display: block;">	
								<br>
								<div class="passCheck2" id="passCheck2"></div>
								<br>
								
							<div>	
							<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
								type="button" onclick="signout()">탈퇴</button>
							
							</div>	
						</form>
		
					</div>
				</div>
			</div>
	</div>
	</div>
	</div>
	
	<!--  회원수정부분 -->
	<div class="modal" id="update">
		    <div class="modal-dialog">
		      <div class="modal-content">
	      
	        
	        <!-- Modal body -->
			<div class="modal-body">
				<div class="card align-middle"
					style="width: 100%;">
					<div class="card-title" style="margin-top: 30px;">
						<h2 class="card-title text-center" style="color: #113366;">기존 비밀번호 확인</h2>
					</div>
					<div class="card-body">
						<form id = "form-signout" class="form-signout" method="post" >
							<label
								for="inputPassword" class="sr-only" >기존 비밀번호</label> 
							<input
								type="password" id="m_pass9" class="form-control" oninput="passCheck();"
								placeholder="비밀번호" name="m_pass9" required style="display: block;">
								<br>
							<label
								for="inputPassword" class="sr-only" >기존 비밀번호 확인</label> 
							<input
								type="password" id="m_pass0" class="form-control" oninput="passCheck();"
								placeholder="비밀번호 확인" name="m_pass0" required style="display: block;">	
								<br>
								<div class="passCheck3" id="passCheck3"></div>
								<br>
								
							<div>	
							<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
								type="button" onclick="update()">수정</button>
							
							</div>	
						</form>
		
					</div>
				</div>
			</div>
	</div>
	</div>
	</div>

</body>
</html>