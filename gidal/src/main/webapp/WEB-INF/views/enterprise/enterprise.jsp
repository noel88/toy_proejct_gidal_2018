<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>
<%@ include file = "/WEB-INF/views/include/nav.jsp" %>


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
                enterprise_email : inputed
            },
            url : "emailCheck",
            success : function(data) {
                if(inputed=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $(".signupbtn").css("background-color", "#aaaaaa");
                    $("#checkaa").css("background-color", "#FFCECE");
                    idCheck = 0;
                } else if (data == '0') {
                    $("#checkaa").css("background-color", "#fcfadb");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
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
	  alert('회원가입이 완료되었습니다. 상세정보는 기업페이지에서 작성가능합니다.');
  }


</script>
</head>
<body>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>기업 회원가입</h1>

			<hr class="my-4">


			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form name = "form" action = "join" method = "post" onsubmit="return join();">


					<p>
						<label class="col-form-label" for="inputDefault">이메일</label>
						<input type="email" class="form-control email" name="enterprise_email" placeholder="Email" oninput="checkEmail()" id="checkaa" autofocus>

						<label class="col-form-label" for="inputDefault">패스워드</label>
                        <input type="password" class="form-control pass" name="enterprise_password" placeholder="Password" oninput="checkPwd()">

						<label class="col-form-label" for="inputDefault">패스워드확인</label>
                        <input type="password" class="form-control pass" name="enterprise_passwordCheck" placeholder="Confirm Password" id="repwd" oninput="checkPwd()">

						<label class="col-form-label" for="inputDefault">이름</label>
                        <input type="text" class="form-control" placeholder="이름을 입력해주세요." name="enterprise_name">
                        <input type="hidden" name="enterprise_mainImg" value = "no_image.png">


					</p>

					<p>
						<button type="submit" class="form-control btn btn-primary signupbtn"  disabled="disabled">기업회원가입</button>
					</p>
				</form>

			</div>

		</div>

	</div>

</body>
</html>