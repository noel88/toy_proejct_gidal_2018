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



  //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
    function checkPwd() {
        var inputed = $('.pass').val();
        var reinputed = $('#repwd').val();
        console.log(inputed);
        console.log(reinputed);
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {
            $("#repwd").css("background-color", "#fcfadb");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {
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
	  alert('회원정보수정이 완료되었습니다');
  }


</script>
</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>






	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>개인 정보 수정</h1>

			<hr class="my-4">
			<!-- <p class="lead">This is a simple hero unit, a simple
			jumbotron-style component for calling extra attention to featured
			content or information.</p>
		<p>It uses utility classes for typography and spacing to space
			content out within the larger container.</p>
		<p class="lead">
			<a class="btn btn-primary btn-lg" href="#" role="button">Learn
				more</a>
		</p> -->

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form action = "userRevise" onsubmit="return tocheckpw2()" data-ajax="false" method = "post" onsubmit="return join();">
					<p>

						<label class="col-form-label" for="inputDefault">휴대폰번호</label>
						<input type="text" name="user_phoneNum" class="form-control" id="phone" placeholder="휴대폰번호" maxlength="13"  />

						
						<input type="hidden"  name="user_email" value="${LOGIN}" >


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
						<button type="submit" class="btn btn-primary btn-lg btn-block "  >정보수정</button>
					</p>
				</form>
			</div>

		</div>

	</div>

</body>
</html>