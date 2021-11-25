<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


<!-- 이메일 인증 -->
function emailCheck() {
	var email = $("#email11").val();

		
	$.ajax({
		type: "GET",
		url: "emailCheck.do?email=" + email,
		success:function(data) {
			
			var html_text = '<br><input type="text" class="form-control" placeholder="인증코드 6자리 입력" id="checkCode" >&nbsp&nbsp';
			var html_btn = '<button type="button" onclick="checkBtn();" class="btn btn-lg btn-inverse-primary btn-block" >인증확인</button><div id="check"></div>';
			var html_div = html_text + html_btn;
			$("#emailCheck11").html(html_div);
			
			code = data;
			//alert("인증번호 : " + code);
			
		}
	});
}

<!-- 메일인증코드 확인-->

function checkBtn() {
	var inputCode = $("#checkCode").val();
	var checkMsg = '<br><h6 style="color:red;" >올바른 인증 코드가 아닙니다.</h6>';
	var checkMsg2 = '<br><h6 style="color:green;"> 인증번호가 일치합니다. </h6>';
	if(inputCode != code) {
		$("#check").html(checkMsg);
		
	} else {
		ok = "1";
		$("#check").html(checkMsg2);
		$("#checkCode").prop("disabled",true);
		$("#check").prop("disabled",true);
		$("#emailOk").prop("disabled",true);
		var email = $("#email11").val();;

		var html_update = '<form action="passFind.do" method="get" id="passForm" name="passForm"><input type="hidden" name= "email" value="aa"  >'
		var html_pass = '<br><input type="password" placeholder="패스워드를 입력해주세요" id="m_pass" name="m_pass" class="form-control" >&nbsp&nbsp';
		var html_pass2 = '<br><input type="password" placeholder="패스워드 확인" id="m_pass2" name="m_pass2" class="form-control" >&nbsp&nbsp';		
		var html_ok = '<br><br> <button type="button" class="btn btn-lg btn-inverse-danger btn-block" id="okok" >변경</button><div id="check"></div></form>';
		
		var html_div = html_update + html_pass + html_pass2 + html_ok;
		$("#emailCheck11").html(html_div);
		
		document.passForm.email.value = email;
		
	}
	$("#okok").on("click",function(){

		$("#passForm").submit();

	});
}

</script>
</head>
<body>

	<div class="content-wrapper" align="center">
		<div class="row" style="width: 75%">
			<div class="col-md-12 grid-margin stretch-card" >
				<div class="card position-relative" align="center" style="display:block; width: 70%">
					
						<div class="form-group" style="width: 50%;" >
						<br>
						<br>
							<label
								for="exampleInputEmail3">가입한 이메일 주소를 입력해주세요.
								</label> 
								<input type="email"  class="form-control" id="email11" name="email" placeholder="이메일" style="text-align:center;">
						</div>
						<div style="width: 50%;">
						<input type="button"  id="emailOk" class="btn btn-lg btn-inverse-primary btn-block" value="이메일 인증코드 받기" onclick="emailCheck();" >
						</div>
						<br>
						<br>
						<div id="emailCheck11" class="form-group" style="width: 50%;">
						
						</div>
						<br>
						<br>
					
				</div>
			</div>
		</div>
	</div>





</body>
</html>