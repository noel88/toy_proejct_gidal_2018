<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">


	//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	var idCheck = 0;
	var pwdCheck = 0;
	//가입버튼 비활성화, 중복확인.

	function checkEmail() {
		var inputed = $('.email').val();
		console.log(inputed);
		$.ajax({
			data : {
				user_email : inputed
			},
			url : "emailCheck",
			success : function(data) {
				if (inputed == "" && data == '0') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#checkaa").css("background-color", "#FFCECE");
					idCheck = 0;
				} else if (data == '0') {
					$("#checkaa").css("background-color", "#fcfadb");
					idCheck = 1;
					if (idCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("background-color", "#ff7777");
					}
				} else if (data == '1') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#checkaa").css("background-color", "#FFCECE");
					idCheck = 0;
				}
			}
		});
	}

	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
	function checkPwd() {
		var inputed = $('.pass').val();
		var reinputed = $('#repwd').val();
		console.log(inputed);
		console.log(reinputed);
		if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#repwd").css("background-color", "#FFCECE");
		} else if (inputed == reinputed) {
			$("#repwd").css("background-color", "#fcfadb");
			pwdCheck = 1;
			if (idCheck == 1 && pwdCheck == 1) {
				$(".signupbtn").prop("disabled", false);
				$(".signupbtn").css("background-color", "#ff7777");
			}
		} else if (inputed != reinputed) {
			pwdCheck = 0;
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#repwd").css("background-color", "#FFCECE");

		}
	}

	function join() {
		alert('회원가입이 완료되었습니다');
	}

	function ruleCheck() {

		var email = document.getElementById("checkaa").value;
		var phone = document.getElementById("phone").value;

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z]+$/;
		var expnum = /^01[0-9]-([0-9]{3,4})-([0-9]{4})$/;

		if (exptext.test(email) == false) {

			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

			alert("이메일 형식이 올바르지 않습니다.");

			document.getElementById("checkaa").select();

			return false;

		} else if(expnum.test(phone) == false) {

			//휴대폰번호 형식이 숫자-숫자-숫자 형식이 아닐경우			

			alert("휴대폰번호 형식이 올바르지 않습니다.");

			document.getElementById("phone").select();

			return false;

		} else {
			return true;
		}
	}
	
</script>
</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>개인 회원가입</h1>

			<hr class="my-4">

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form action = "userjoin" onsubmit="return ruleCheck();" data-ajax="false" method = "post" onsubmit="return join();">
					<p>

						<label class="col-form-label" for="inputDefault">휴대폰번호 (-포함)</label>
						<input type="text" name="user_phoneNum" class="form-control" id="phone" placeholder="휴대폰번호 (-포함)" maxlength="13"  />

						<label class="col-form-label" for="inputDefault">이메일</label>
						<input type="email" class="form-control email" name="user_email" placeholder="이메일"  oninput="checkEmail()" id="checkaa" autofocus>


						<label class="col-form-label" for="inputDefault">패스워드</label>
						<input type="password" class="form-control pass" name="user_password" placeholder="패스워드" id="pw" oninput="checkPwd()">

						<label class="col-form-label" for="inputDefault">패스워드확인</label>
						<input type="password" class="form-control pass" name = "user_passwordCheck" placeholder="패스워드확인" id="repwd" oninput="checkPwd()">





						<label class="col-form-label" for="inputDefault">이름</label>
						<input type="text" class="form-control" name="user_name" placeholder="이름" id="inputDefault">

						<label class="col-form-label" for="inputDefault">성별</label>
						<select  class="custom-select" id="exampleSelect1" name="user_gender">
						 	<option value="남성">남성</option>
							<option value="여성">여성</option>
						</select>
					</p>
					<p>
						<button type="submit" class="btn btn-primary btn-lg btn-block signupbtn"  disabled="disabled">회원가입</button>
					</p>
				</form>
			</div>

		</div>

	</div>

</body>
</html>