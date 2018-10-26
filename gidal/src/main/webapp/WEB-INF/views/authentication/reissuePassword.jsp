<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

<script>

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
			<h1>비밀번호 재발급</h1>

			<hr class="my-4">

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form action = "reissuePassword" method = "post" onsubmit="return ruleCheck();">
					<p>
						<label class="col-form-label" for="inputDefault">휴대폰번호 (-포함)</label>
						<input type="text" name="ReissuePassword_phoneNum" class="form-control" id="phone" placeholder="휴대폰번호 (-포함)" maxlength="13" />

						<label class="col-form-label" for="inputDefault">이메일</label>
						<input type="email" class="form-control" name="ReissuePassword_email" placeholder="이메일" id="checkaa">
						
						<label class="col-form-label" for="inputDefault">이름</label>
						<input type="text" class="form-control" name="ReissuePassword_name" placeholder="이름" id="inputDefault">
	 				</p>
					<p>
						<button type="submit" class="btn btn-primary btn-lg btn-block">비밀번호 재발급</button>
					</p>
					<p>
						<button type="button" class="btn btn-primary btn-lg btn-block" onclick = "history.back()">뒤로 가기</button>
					</p>
				</form>
			</div>

		</div>

	</div>

</body>
</html>