<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type = "text/javascript" src = "https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!--  
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="420459432464-hifqp7ruvbpkvj56i3mmvd5ib6n2li7k.apps.googleusercontent.com">
-->
<!-- 기능부분 -->	
<script>
var code = "";
var ok = "";
var pwd = "";


<!-- 이메일칸 직접입력폼 -->
$(function(){
	$("#direct").hide();
	
	
	$("#email1").change(function() {
		
	});
});

<!-- 유효성 검사, 빈칸체크 -->
function signup() {
	
	var checkMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); 
	var checkId= RegExp(/^[a-zA-Z0-9]{4,12}$/); 
	<!-- 생년월일 체크 
	var birthdayCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
	-->
	var email1 = $("#email1").val();
	var email2 = $("#email2").val();
	var pass1 = $("#m_pass1").val();
	var pass2 = $("#m_pass2").val();
	var nickname = $("#nickname").val();
	var email = email1 + "@" + email2
	
	if(email1 == null || email1 == "") {
		$("#sEmail").css({color:"red"});
		$("#checkE").html('<br><h6 style="color:red;">필수 입력 항목입니다.</h6>');
		$("#email1").focus();
		return;
	} 
	
	if (email2 == null || email2 == "") {
		$("#email2").focus();
		return;
	} 
	
	if(pass1 == null || pass1 == "") {
		$("#sPass").css({color:"red"});
		$("#passCheck").html('<br><h6 style="color:red;">필수 입력 항목입니다.</h6>');
		$("#pass1").focus();
		return;
	} 
	
	if(pass2 == null || pass2 == "") {
		$("#sPass2").css({color:"red"});
		$("#passCheck").html('<br><h6 style="color:red;">필수 입력 항목입니다.</h6>');
		$("#pass2").focus();
		return;
	} 
	
	
	if(nickname == null || nickname == "") {
		$("#sName").css({color:"red"});
		$("#checkN").html('<br><h6 style="color:red;">필수 입력 항목입니다.</h6>');
		$("#nickname").focus();
		return;
	}		

	if(pwd =! "1") {
		alert("비밀번호가 다릅니다. 다시 입력해주세요");
		$("#pass1").val("");
		$("#pass2").val("");
		$("#pass1").focus();
		
		return;
	}
	
	if(ok =! "1") {
		alert("이메일 인증을 해주세요");
		
		return;
	}
	
	
	$("#signupForm").submit();
	alert("회원가입완료");
	
}	

<!-- p1 p2 체크, 유효성 검사 -->
function passCheck() {
	var pass1 = $("#m_pass1").val();
	var pass2 = $("#m_pass2").val();
	var checkPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	
	if(!checkPass.test(pass2)) {
		$("#passCheck").html('<h6 style="color:red;">영문, 숫자, 특수문자를 포함하여 8자이상 가능합니다</h6>');
	} else {
		$("#passCheck").html('<h6 style="color:green;">사용가능합니다.</h6>');
	}
	
	
	if ( pass1 != pass2 ) {
		$("#passCheck").html('<h6 style="color:red;">비밀번호가 일치하지 않습니다</h6>');
		pwd = "0";
	} else {
		$("#passCheck").html('<h6 style="color:green;">사용가능합니다</h6>');
		pwd = "1";
	}
}

function passVal() {
	var checkPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	var pass1 = $("#m_pass1").val();
	
	if(!checkPass.test(pass1)) {
		$("#passCheck").html('<h6 style="color:red;">영문, 숫자, 특수문자를 포함하여 8자이상 가능합니다</h6>');
	} else {
		$("#passCheck").html('<h6 style="color:green;">사용가능합니다.</h6>');
	}
}

<!-- 이메일 인증 -->
function emailCheck() {
	var email1 = $("#email1").val();
	var email2 = $("#email2").val();
	
	if(email1 == null || email1 == "") {
		$("#sEmail").css({color:"red"});
		$("#checkE").html('<h6 style="color:red;">이메일을 입력해주세요.</h6>');
		$("#email1").focus();
		return;
	} 
	
	if (email2 == null || email2 == "") {
		$("#email2").focus();
		return;
	} 
	
	if(email2 == "direct") {
		email2 = $("#direct").val();
	}
	
	var email = email1 + "@" + email2;
	
	
	$.ajax({
		type: "GET",
		url: "emailCheck.do?email=" + email,
		success:function(data) {
			
			var html_text = '<br><input class="form-control" type="text" placeholder="인증코드 6자리 입력" id="checkCode" style="width: 50%;" >&nbsp&nbsp';
			var html_btn = '<button type= "button" class="btn btn-sm btn-inverse-success btn-block" onclick="checkBtn();">인증확인</button style="width: 40%;">';
			var html_div = html_text + html_btn; 
			$("#emailCheck").html(html_div);
			
			code = data;
			//alert("인증번호 : " + code);
			
		}
	});
}

<!-- 메일인증코드 확인-->
function checkBtn() {
	var inputCode = $("#checkCode").val();
	var checkMsg = '<h6 style="color:red"; >올바른 인증 코드가 아닙니다.</h6>';
	var checkMsg2 = '<h6 style="color:green";> 인증번호가 일치합니다. </h6>';
	
	if(inputCode != code) {
		$("#checkOk").html(checkMsg);

	} else {
		ok = "1";
		$("#checkOk").html(checkMsg2);
		$("#checkCode").prop("disabled",true);

		$("#emailOk").prop("disabled",true);
		
	}
}

<!-- 닉네임 중복확인 Ajax -->
function checkName() {
	var inputName = $("#nickname").val(); 
	var checkName= RegExp(/^[가-힣]{2,8}$/);
	$.ajax({
		url: "checkName.do?nickname=" + inputName,
		type: "POST",
		success:function(rs){
			if(rs == "0") { // 0일경우는 사용 가능한 아이디
				if(!checkName.test(inputName)){
					$("#checkN").html('<h6 style="color:red;">(2~8자)한글만 사용가능합니다</h6>');
				} else {
					$("#checkN").html('<h6 style="color:green;">사용가능한 닉네임입니다</h6>');
				}
			} else { // 아이디가 존재할 경우
				$("#checkN").html('<h6 style="color:red;">이미 사용중인 닉네임입니다</h6>');
			}
			
		},
		error:function(){
			
		}
	
	});
}

<!-- 이메일 중복확인 Ajax 및 유효성 검사 -->
function checkEmail() {
	var inputEmail1 = $("#email1").val();
	var inputEmail2 = $("#email2").val();
	var email = inputEmail1 + "@" + inputEmail2;
	var checkMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

	if($("#email2").val() == "direct") {
		$("#email2").hide();
		$("#direct").show();
	} else {
		$("#direct").hide();
	}
	
	$.ajax({
		url: "checkEmail.do?email=" + email,
		type: "POST",
		success:function(rs){
			if(rs == "0") { // 0일경우는 사용 가능한 아이디
				
				if(!checkMail.test(email)){
					$("#checkE").html('<br><h6 style="color:red;">이메일 형식이 올바르지 않습니다.</h6>');
				} else {
					$("#checkE").html('<br><h6 style="color:green;">사용가능한 이메일입니다</h6>');
				}
				
			} else { // 아이디가 존재할 경우
				$("#checkE").html('<br><h6 style="color:red;">이미 사용중인 이메일입니다</h6>');
			}
			
		},
		error:function(){
			alert("실패!!")
		}
	
	});
}	

<!-- 비밀번호 찾기(재설정) -->

function passFind() {
	location.href="passFindPage.do";	
}

<!-- 로그인 부분 Ajax 처리 -->

function signin() {
	
	var email = $("#email").val();
	var m_pass = $("#m_pass").val();
	
	if(email == null || email == "") {
		var html_check = '<h6 style="color:red;">이메일을 입력해주세요</h6>';
		$("#checkMsg").html(html_check);
	}
	
	if(m_pass == null || m_pass == "") {
		var html_check = '<h6 style="color:red;">이메일을 입력해주세요</h6>';
		$("#checkMsg").html(html_check);
	}

	$.ajax({
		url: "singinCheck.do" ,
		type: "POST",
		data:{ email : email,
			   m_pass : m_pass },
		success:function(rs){
			if (rs == "2") {
				var html_check = '<h6 style="color:red;">비밀번호가 일치하지 않습니다</h6>';
				$("#checkMsg").html(html_check);
				$("#m_pass").focus();
				$("#m_pass").val("");
			} else if (rs == "3") {
				$("#form-signin").submit();
				
			}
		},
		error:function(rs){
			var html_check = '<h6 style="color:red;">유효한 이메일을 입력해주세요</h6>';
			$("#checkMsg").html(html_check);
			$("#email").focus();
		}
	});
	
}


<!-- 카카오 로그인 -->
window.Kakao.init("0b2e84d3ad16b57f5760b7d695780fb3");
	
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope:'profile_nickname,account_email,birthday',
			success: function(authObj){
				//console.log(authObj);
				window.Kakao.API.request({
					url: '/v2/user/me',
					success: res => {
						const email = res.kakao_account.email;
						const name = res.properties.nickname;
						const birth = res.kakao_account.birthday;
						
						
						console.log(email);
						console.log(name);
						console.log(birth);
						
						$('#kakaoemail').val(email);
						$('#kakaoname').val(name);
						$('#kakaobirth').val(birth);
						
						document.login_frm.submit();
					}
				});
				
			}
		});
	}
	<!-- 로그아웃 -->
	function logout(){
		
		if (window.Kakao.Auth.getAccessToken()) {
		
			console.log("카카오 인증 엑세스 토큰 존재", window.Kakao.Auth.getAccessToken());
			window.Kakao.Auth.logout(() => {
				console.log("카카오 로그아웃 완료", window.Kakao.Auth.getAccessToken());
			});
		}
		 if (Kakao.Auth.getAccessToken()) {
			
		      //토큰이 있으면
		      Kakao.API.request({
		        //로그아웃하고
		        url: '/v1/user/unlink',
		        success: function (response) {
		          //console.log(response)
		        	
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      //토큰도 삭제
		   
		      Kakao.Auth.setAccessToken(undefined)
		    }
		 location.href = "logout.do";	
		  }
	
	
	<!-- 네이버 로그인 -->
		
	function naverLogin(){
		var naver_id_login = new naver_id_login("cKrCvUqAPtSpV8XYfq48", "http://localhost:8282/chaeum/index.jsp");
		// Client ID, CallBack URL 삽입
           // 단 'localhost'가 포함된 CallBack URL
		var state = naver_id_login.getUniqState();
		
		naver_id_login.setButton("white", 4, 40);
		naver_id_login.setDomain("naverLogin.do");    //  URL
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	}		
		
	<!-- 구글 로그인 
	function onSignIn() {
		var auth2 = gapi.auth2.getAuthInstance();
	    	var profile = googleUser.getBasicProfile();
	    	var id_token = googleUser.getAuthResponse().id_token;
		  	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  	  console.log('ID토큰: ' + id_token);
		  	  console.log('Name: ' + profile.getName());
		  	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			  alert(profile.getEmail() + " ddd "  + profile.getName())	
	  }
	-->
	
</script>	




<style>

#email1 {
  width: 40%;
  float: left;
}
#email3 {
  text-align: center;
  margin: 0 auto;
}
#email2 {
  width: 50%;
  float: right;
}
</style>



<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" >
<!--  초반 빨간색 로고
	<div
		class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
		<a class="navbar-brand brand-logo mr-5" href="index.jsp"><img
			src="resources/images/logo_chaeum.PNG" class="mr-2" alt="logo" /></a> <a
			class="navbar-brand brand-logo-mini" href="index.jsp"><img
			src="resources/images/logo-mini.svg" alt="logo" /></a>
	</div>
-->	
	
	<div
		class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
		<a class="navbar-brand brand-logo mr-5" href="index.jsp">CHAEUM</a></div>	
	<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end" >
		<c:set var="URL" value="${pageContext.request.requestURL}" />
	
			<div class="dropdown">
 				<button class="btn dropdown-toggle" type="button" id="dropdownMenuSizeButton2" 
                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소개	</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton5">
					<a class="dropdown-item" href="index.jsp#about">소개</a>
					<a class="dropdown-item" href="index.jsp#features">이용안내</a>
					<a class="dropdown-item" href="index.jsp#portfolio">시설안내</a>
                </div>
            </div>
		
 				<button type="button" class="btn btn-inverse-light btn-fw" href="#" onclick="changeView(8)">온라인 예약</button>
 				<!--  	<div class="dropdown">
				<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton5">
					<a class="dropdown-item" href="#" onclick="changeView(8)">미팅룸 예약</a>
                </div>
            </div>  
            -->          
            <!--  
			<div class="dropdown">
 				<button class="btn dropdown-toggle" type="button" id="dropdownMenuSizeButton2" 
                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">이용안내	</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton5">
					<a class="dropdown-item" href="#" onclick="changeView(10)">이용안내</a>
                    <a class="dropdown-item" href="#" onclick="changeView(11)">스터디홀</a>
                    <a class="dropdown-item" href="#" onclick="changeView(12)">스터디룸</a>
                </div>
            </div>
            -->        
			<div class="dropdown">
 				<button class="btn dropdown-toggle" type="button" id="dropdownMenuSizeButton2" 
                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티	</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton5">
					<a class="dropdown-item" href="#" onclick="location.href='getNoticeBoardList.do'">공지사항</a>
                    <a class="dropdown-item" href="#" onclick="location.href='getFreeBoardList.do'">자유게시판</a>
                    <a class="dropdown-item" href="#" onclick="location.href='message_list.do'">채움 Talk</a>
                    <!--  
                    <a class="dropdown-item" href="#" onclick="changeView(15)">질문게시판</a>
                    
                    <a class="dropdown-item" href="#">1:1 문의</a>
                    -->
                </div>
            </div> 

		

		<ul class="navbar-nav navbar-nav-right">

		<c:if test="${sessionScope.user == null}">
       		<button type="button" class="btn btn-inverse-light btn-fw" data-toggle="modal" data-target="#login">로그인</button> 
       		<button type="button" class="btn btn-inverse-light btn-fw" data-toggle="modal" data-target="#signup">회원가입</button>
        </c:if>			
	
		
		<c:if test="${sessionScope.user.email != null}"> 
			
				
			<li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown" aria-expanded="false">
          ${sessionScope.user.nickname}님　　 〓
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href='mypage.do'>
                <i class="ti-settings text-primary"></i>
                마이페이지
              </a>
              <a class="dropdown-item"  href="javascript:logout();">
                <i class="ti-power-off text-primary" ></i>
                로그아웃
              </a>
            </div>
          </li>
			
			</c:if>
		</ul>
		<button
			class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
			type="button" data-toggle="offcanvas">
			<span class="icon-menu"></span>
		</button>
			
	</div>
</nav>

	<!-- 로그인 폼 The Modal -->
	  <div class="modal" id="login">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header" style="border-bottom: 0px;">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
			<div class="modal-body">
				<div class="card align-middle"
					style="width: 100%;">
					<div class="card-title" style="margin-top: 30px;">
						<h2 class="card-title text-center" style="color: #113366;">CHAEUM</h2>
					</div>
					<div class="card-body">
						<form action="login.do" id = "form-signin" class="form-signin" method="post" >
							<label for="inputEmail" class="sr-only"  >이메일</label> 
							<input
								type="email" id="email" class="form-control" value="${cookie.rememberEmail.value}"
								placeholder="이메일" name="email" required autofocus
								style="display: block;"><BR> 
							<label
								for="inputPassword" class="sr-only" >비밀번호</label> 
							<input
								type="password" id="m_pass" class="form-control"
								placeholder="비밀번호" name="m_pass" required style="display: block;">
								<br>
							<div class="checkMsg" id= "checkMsg"></div>
							<div class="checkbox">
							<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
							<c:if test="${not empty cookie.rememberEmail}">
								<c:set value="checked" var="checked"/>
							</c:if>
								<label> <input type="checkbox" id="remember_us" name="rememberEmail" ${checked}> 
									기억하기
								</label>
							</div>
							<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
								type="button" onclick="signin()">로 그 인</button>
						</form>
		
					</div>
				</div>
			</div>
			
						<!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" onclick="passFind()">비밀번호재설정</button>
	          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#signup">회원가입</button>
	          <br>
			 <div class="g-signin2" data-onsuccess="onSignIn"></div>
			  <div>
	            <form method="post" class="form-horizontal" name="login_frm" action="kakaologin.do">
					<div class="form-group row" id="kakaologin">
						<div class="kakaobtn">
							<input type="hidden" name="email" id="kakaoemail" /> 
							<input type="hidden" name="nickname" id="kakaoname" /> 
							<input type="hidden" name="birth" id="kakaobirth" /> 
							<a href="javascript:kakaoLogin();"> 
							<img src="resources/images/kakao_login_medium_narrow.png" />
							</a>
						</div>
					</div>
				</form>
				</div>	
			</div>
	        
	      </div>
	    </div>
	  </div>
		  
 <!--  회원가입 -->

	  <div class="modal" id="signup">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header 
	        <div class="modal-header">
	          
	        </div>
	         -->
	        <!-- Modal body -->
			<div class="modal-body" >
				<div class="card align-middle"
					style="width: 100%; ">
					<div class="card-title" style="margin-top: 30px;">
						<h1 class="card-title text-center" style="color: #113366;">회원가입</h1>
					</div>
					<div class="card-body">
						<form action="signup.do"  method="post" id="signupForm">
							<h6 id="sEmail" class="form-signup-heading">* 이메일</h6>	
						
								<span>
								<input
									type="text" name="email1" class="form-control" id="email1"
									placeholder="이메일" required autofocus onchange="checkEmail();" >
								</span>	
								<div id="email3"style="float: left;  padding:10px;" >
								 @
								</div>
								<span >
								<select class="form-control" id="email2" name="email2" onchange="checkEmail();" >
									  <option disabled selected>선택해주세요</option>
		                              <option value="gmail.com">gmail.com</option>
		                              <option value="naver.com">naver.com</option>
		                              <option value="hanmail.net">hanmail.net</option>
		                              <option value="outlook.con">outlook.com</option>
		                              <option value="direct">직접입력</option>
		                        </select>
		                       
								<input type="text" class="form-control" id="direct" name="direct" placeholder="직접입력" onchange="checkEmail();">									
								</span>
						
							<br>
							<br>
							<div id="checkE"></div>
							<br>             
			
							<input type="button"  id="emailOk" class="btn btn-lg btn-inverse-primary btn-block" value="이메일 인증확인" onclick="emailCheck();" >
							<div id="emailCheck">
							</div>
							
							
							<div id="checkOk" class="checkOk"></div>
							<br>
							
							<h6 id="sPass" class="form-signup-heading">* 비밀번호</h6>
							<input
								type="password" id="m_pass1" class="form-control" onkeyup="passVal();"
								placeholder="비밀번호" name="m_pass" required style="display: block;">
								<br>
							<h6 id="sPass2" class="form-signup-heading">* 비밀번호 확인</h6>
							<input
								type="password" id="m_pass2" class="form-control" onkeyup="passCheck();"
								placeholder="비밀번호확인" name="m_pass2" required style="display: block;">
								<br>
							<div id="passCheck" >
							</div>
							<br> 		
							<h6 id="sName" class="form-signup-heading">* 닉네임</h6>
							<input
								type="text"  class="form-control" id="nickname"  oninput="checkName();"
								placeholder="8글자이내" name="nickname" required style="display: block;">
								<br>
								<div id="checkN"></div>
								<br>	
							<h6 class="form-signup-heading">휴대폰번호</h6>
							<input
								type="text"  class="form-control"
								placeholder="'-'생략" name="phone" required style="display: block;">
								<br>
							<h6 class="form-signup-heading">생년월일</h6>
							<input
								type="text"  class="form-control"
								placeholder="생년월일 6글자" name="birth" required style="display: block;">
								<br>			
							<div class="checkbox">
								
							<br>
							</div>
							 <div style="display: inline-block; float: right;">
							 <button type="button" class="btn btn-inverse-danger btn-block" onclick="signup()" >가입</button>
							 </div>
						</form>
	
					</div>
				</div>
			</div>
	
						<!-- Modal footer -->
	        
	      </div>
	    </div>
	</div>



	<script type="text/javascript">
		function changeView(value){
			if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
			{
				location.href="mainView.jsp?contentPage=book/connectionBook.jsp";
			}
			else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
			{	
				location.href="index.jsp?contentPage=login/login.jsp";
			}
			else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
			{	
				location.href="index.jsp?contentPage=login/signup.jsp";
			}
			else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
			{
				//location.href="index?type=logout";
			}else if(value == "4") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="memberController?type=memberInfo";
			}
			else if(value == "5")	// 소개
			{
				location.href="index.jsp?contentPage=reservation/test.jsp";
			}
			else if(value == "6")	// 시설안내
			{
				location.href="index.jsp?contentPage=reservation/test1.jsp";
			}
			else if(value == "7")	// 위치안내
			{	
				location.href="index.jsp?contentPage=reservation/reservation_test.jsp";
			}
			else if(value == "8")	// 미팅룸 예약
			{	
				//location.href="index.jsp?contentPage=reservation/choiceBranch.jsp";
				location.href="getBranchList.do";
			}
			else if(value == "9")	// 스터디룸 예약
			{	
				location.href="";
			}
			else if(value == "10")	// 이용안내
			{	
				location.href="index.jsp?contentPage=infoUse/infoUse.jsp";
			}
			else if(value == "11")	// 스터디홀
			{	
				location.href="index.jsp?contentPage=infoUse/infoStudyhall.jsp";
			}
			else if(value == "12")	// 스터디룸
			{	
				location.href="index.jsp?contentPage=infoUse/infoStudyroom.jsp";
			}
			else if(value == "13")	// 공지사항
			{	
				location.href="index.jsp?contentPage=community/noticeBoard.jsp";
			}
			else if(value == "14")	// 자유게시판
			{	
				location.href="index.jsp?contentPage=community/freeBoard.jsp";
			}
			else if(value == "15")	// 질문게시판
			{	
				location.href="index.jsp?contentPage=community/questionBoard.jsp";
			}
			else if(value == "16")	// 1:1 문의
			{	
				location.href="mainView.jsp?contentPage=book/connectionBook.jsp";
			}
			else if(value == "17")	// 로그아웃
			{	
				location.href="logout.do";
			}
			
		}
			
		
	</script>	
	
	