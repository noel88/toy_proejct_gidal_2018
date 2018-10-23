<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<script>
	
	function check() {		

		var email = document.getElementById("login_email").value;

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

		if(exptext.test(email) == false){

			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
	
			alert("이메일형식이 올바르지 않습니다.");
	
			document.getElementById("login_email").select();
	
			return false;

		} else {
			return true;
		}
	}

</script>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>로그인</h1>

			<hr class="my-4">

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form action = "loginPOST" method = "post" onsubmit = "return check();" name = "login">
					<p>
						<label class="col-form-label" for="inputDefault">이메일</label>
						<input type="email" class="form-control" name = "login_email" placeholder="이메일" id="login_email">
						<label class="col-form-label" for="inputDefault">패스워드</label>
						<input type="password" class="form-control"	name = "login_password" placeholder="패스워드" id="inputDefault">
					</p>
					<p>
						<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
					</p>
					<p>
						<button type="button" class="btn btn-primary btn-lg btn-block" onclick = "location.href='reissuePassword'">비밀번호 재발급</button>
					</p>
				</form>
			</div>

		</div>

	</div>

</body>
</html>