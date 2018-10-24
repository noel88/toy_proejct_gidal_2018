enter_page.jsp<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/resources/js/addressapi.js"></script>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);


           $("[name=enterprise_add1]").val(data.zonecode);
           $("[name=enterprise_add2]").val(fullRoadAddr);

           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}



</script>




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