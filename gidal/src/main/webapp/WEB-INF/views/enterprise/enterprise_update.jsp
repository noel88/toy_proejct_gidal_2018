<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

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


    var pwdCheck = 0;


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
            if(pwdCheck == 1) {
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


  function update() {
	  alert('정보수정이 완료되었습니다.');
  }


</script>


	<br>


<div style="width: 50%; margin-right: auto; margin-left: auto;">
				<form name = "form" action = "update" method = "post" enctype="multipart/form-data" onsubmit="return update();">



					<p>
						<input type = "hidden" name = "enterprise_code" value="${list.enterprise_code}">

						<label class="col-form-label" for="inputDefault">패스워드</label>
                        <input type="password" class="form-control pass" name="enterprise_password" placeholder="Password" oninput="checkPwd()">

						<label class="col-form-label" for="inputDefault">패스워드확인</label>
                        <input type="password" class="form-control pass" name="enterprise_passwordCheck" placeholder="Confirm Password" id="repwd" oninput="checkPwd()">


					</p>

					<hr class="my-4">

					 <p>
						<label class="col-form-label" for="inputDefault">매장명</label>
						<input type="text" class="form-control" name = "enterprise_businessName" value = "${list.enterprise_businessName}">

						<label class="col-form-label" for="inputDefault">매장 전화번호</label>
						<input type="text" class="form-control" name = "enterprise_phone" value = "${list.enterprise_phone}">



						<label class="col-form-label" for="inputDefault">매장 주소</label>
						<div class="form-group">
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="enterprise_add1" id="add1" type="text"  value = "${list.enterprise_add1}" readonly="readonly" >
						    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
						</div>
						<div class="form-group">
						    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="enterprise_add2" id="add2"  value = "${list.enterprise_add2}" type="text" readonly="readonly" />
						</div>
						<div class="form-group">
						    <input class="form-control" placeholder="상세주소" name="enterprise_add3"  value = "${list.enterprise_add3}" id="add3" type="text"  />
						</div>



						<label class="col-form-label" for="inputDefault">영업시작시간</label>
						<select class="custom-select" name = "enterprise_operatingOpenTime" >
							<option value = "00:00" <c:if test = "${list.enterprise_operatingOpenTime eq '00:00'}" > selected = "selected" </c:if>>00:00</option>
							<option value = "00:30" <c:if test = "${list.enterprise_operatingOpenTime eq '00:30'}" > selected = "selected" </c:if>>00:30</option>
							<option value = "01:00" <c:if test = "${list.enterprise_operatingOpenTime eq '01:00'}" > selected = "selected" </c:if>>01:00</option>
							<option value = "01:30" <c:if test = "${list.enterprise_operatingOpenTime eq '01:30'}" > selected = "selected" </c:if>>01:30</option>
							<option value = "02:00" <c:if test = "${list.enterprise_operatingOpenTime eq '02:00'}" > selected = "selected" </c:if>>02:00</option>
							<option value = "02:30" <c:if test = "${list.enterprise_operatingOpenTime eq '02:30'}" > selected = "selected" </c:if>>02:30</option>
							<option value = "03:00" <c:if test = "${list.enterprise_operatingOpenTime eq '03:00'}" > selected = "selected" </c:if>>03:00</option>
							<option value = "03:30" <c:if test = "${list.enterprise_operatingOpenTime eq '03:30'}" > selected = "selected" </c:if>>03:30</option>
							<option value = "04:00" <c:if test = "${list.enterprise_operatingOpenTime eq '04:00'}" > selected = "selected" </c:if>>04:00</option>
							<option value = "04:30" <c:if test = "${list.enterprise_operatingOpenTime eq '04:30'}" > selected = "selected" </c:if>>04:30</option>
							<option value = "05:00" <c:if test = "${list.enterprise_operatingOpenTime eq '05:00'}" > selected = "selected" </c:if>>05:00</option>
							<option value = "05:30" <c:if test = "${list.enterprise_operatingOpenTime eq '05:30'}" > selected = "selected" </c:if>>05:30</option>
							<option value = "06:00" <c:if test = "${list.enterprise_operatingOpenTime eq '06:00'}" > selected = "selected" </c:if>>06:00</option>
							<option value = "06:30" <c:if test = "${list.enterprise_operatingOpenTime eq '06:30'}" > selected = "selected" </c:if>>06:30</option>
							<option value = "07:00" <c:if test = "${list.enterprise_operatingOpenTime eq '07:00'}" > selected = "selected" </c:if>>07:00</option>
							<option value = "07:30" <c:if test = "${list.enterprise_operatingOpenTime eq '07:30'}" > selected = "selected" </c:if>>07:30</option>
							<option value = "08:00" <c:if test = "${list.enterprise_operatingOpenTime eq '08:00'}" > selected = "selected" </c:if>>08:00</option>
							<option value = "08:30" <c:if test = "${list.enterprise_operatingOpenTime eq '08:30'}" > selected = "selected" </c:if>>08:30</option>
							<option value = "09:00" <c:if test = "${list.enterprise_operatingOpenTime eq '09:00'}" > selected = "selected" </c:if>>09:00</option>
							<option value = "09:30" <c:if test = "${list.enterprise_operatingOpenTime eq '09:30'}" > selected = "selected" </c:if>>09:30</option>
							<option value = "10:00" <c:if test = "${list.enterprise_operatingOpenTime eq '10:00'}" > selected = "selected" </c:if>>10:00</option>
							<option value = "10:30" <c:if test = "${list.enterprise_operatingOpenTime eq '10:30'}" > selected = "selected" </c:if>>10:30</option>
							<option value = "11:00" <c:if test = "${list.enterprise_operatingOpenTime eq '11:00'}" > selected = "selected" </c:if>>11:00</option>
							<option value = "11:30" <c:if test = "${list.enterprise_operatingOpenTime eq '11:30'}" > selected = "selected" </c:if>>11:30</option>
							<option value = "12:00" <c:if test = "${list.enterprise_operatingOpenTime eq '12:00'}" > selected = "selected" </c:if>>12:00</option>
							<option value = "12:30" <c:if test = "${list.enterprise_operatingOpenTime eq '12:30'}" > selected = "selected" </c:if>>12:30</option>
							<option value = "13:00" <c:if test = "${list.enterprise_operatingOpenTime eq '13:00'}" > selected = "selected" </c:if>>13:00</option>
							<option value = "13:30" <c:if test = "${list.enterprise_operatingOpenTime eq '13:30'}" > selected = "selected" </c:if>>13:30</option>
							<option value = "14:00" <c:if test = "${list.enterprise_operatingOpenTime eq '14:00'}" > selected = "selected" </c:if>>14:00</option>
							<option value = "14:30" <c:if test = "${list.enterprise_operatingOpenTime eq '14:30'}" > selected = "selected" </c:if>>14:30</option>
							<option value = "15:00" <c:if test = "${list.enterprise_operatingOpenTime eq '15:00'}" > selected = "selected" </c:if>>15:00</option>
							<option value = "15:30" <c:if test = "${list.enterprise_operatingOpenTime eq '15:30'}" > selected = "selected" </c:if>>15:30</option>
							<option value = "16:00" <c:if test = "${list.enterprise_operatingOpenTime eq '16:00'}" > selected = "selected" </c:if>>16:00</option>
							<option value = "16:30" <c:if test = "${list.enterprise_operatingOpenTime eq '16:30'}" > selected = "selected" </c:if>>16:30</option>
							<option value = "17:00" <c:if test = "${list.enterprise_operatingOpenTime eq '17:00'}" > selected = "selected" </c:if>>17:00</option>
							<option value = "17:30" <c:if test = "${list.enterprise_operatingOpenTime eq '17:30'}" > selected = "selected" </c:if>>17:30</option>
							<option value = "18:00" <c:if test = "${list.enterprise_operatingOpenTime eq '18:00'}" > selected = "selected" </c:if>>18:00</option>
							<option value = "18:30" <c:if test = "${list.enterprise_operatingOpenTime eq '18:30'}" > selected = "selected" </c:if>>18:30</option>
							<option value = "19:00" <c:if test = "${list.enterprise_operatingOpenTime eq '19:00'}" > selected = "selected" </c:if>>19:00</option>
							<option value = "19:30" <c:if test = "${list.enterprise_operatingOpenTime eq '19:30'}" > selected = "selected" </c:if>>19:30</option>
							<option value = "20:00" <c:if test = "${list.enterprise_operatingOpenTime eq '20:00'}" > selected = "selected" </c:if>>20:00</option>
							<option value = "20:30" <c:if test = "${list.enterprise_operatingOpenTime eq '20:30'}" > selected = "selected" </c:if>>20:30</option>
							<option value = "21:00" <c:if test = "${list.enterprise_operatingOpenTime eq '21:00'}" > selected = "selected" </c:if>>21:00</option>
							<option value = "21:30" <c:if test = "${list.enterprise_operatingOpenTime eq '21:30'}" > selected = "selected" </c:if>>21:30</option>
							<option value = "22:00" <c:if test = "${list.enterprise_operatingOpenTime eq '22:00'}" > selected = "selected" </c:if>>22:00</option>
							<option value = "22:30" <c:if test = "${list.enterprise_operatingOpenTime eq '22:30'}" > selected = "selected" </c:if>>22:30</option>
							<option value = "23:00" <c:if test = "${list.enterprise_operatingOpenTime eq '23:00'}" > selected = "selected" </c:if>>23:00</option>
							<option value = "23:30" <c:if test = "${list.enterprise_operatingOpenTime eq '23:30'}" > selected = "selected" </c:if>>23:30</option>
							<option value = "24:00" <c:if test = "${list.enterprise_operatingOpenTime eq '24:00'}" > selected = "selected" </c:if>>24:00</option>
						</select>


						<label class="col-form-label" for="inputDefault" >영업종료시간</label>
						<select class="custom-select"  name = "enterprise_operatingCloseTime">
							<option value = "00:00" <c:if test = "${list.enterprise_operatingCloseTime eq '00:00'}" > selected = "selected" </c:if>>00:00</option>
							<option value = "00:30" <c:if test = "${list.enterprise_operatingCloseTime eq '00:30'}" > selected = "selected" </c:if>>00:30</option>
							<option value = "01:00" <c:if test = "${list.enterprise_operatingCloseTime eq '01:00'}" > selected = "selected" </c:if>>01:00</option>
							<option value = "01:30" <c:if test = "${list.enterprise_operatingCloseTime eq '01:30'}" > selected = "selected" </c:if>>01:30</option>
							<option value = "02:00" <c:if test = "${list.enterprise_operatingCloseTime eq '02:00'}" > selected = "selected" </c:if>>02:00</option>
							<option value = "02:30" <c:if test = "${list.enterprise_operatingCloseTime eq '02:30'}" > selected = "selected" </c:if>>02:30</option>
							<option value = "03:00" <c:if test = "${list.enterprise_operatingCloseTime eq '03:00'}" > selected = "selected" </c:if>>03:00</option>
							<option value = "03:30" <c:if test = "${list.enterprise_operatingCloseTime eq '03:30'}" > selected = "selected" </c:if>>03:30</option>
							<option value = "04:00" <c:if test = "${list.enterprise_operatingCloseTime eq '04:00'}" > selected = "selected" </c:if>>04:00</option>
							<option value = "04:30" <c:if test = "${list.enterprise_operatingCloseTime eq '04:30'}" > selected = "selected" </c:if>>04:30</option>
							<option value = "05:00" <c:if test = "${list.enterprise_operatingCloseTime eq '05:00'}" > selected = "selected" </c:if>>05:00</option>
							<option value = "05:30" <c:if test = "${list.enterprise_operatingCloseTime eq '05:30'}" > selected = "selected" </c:if>>05:30</option>
							<option value = "06:00" <c:if test = "${list.enterprise_operatingCloseTime eq '06:00'}" > selected = "selected" </c:if>>06:00</option>
							<option value = "06:30" <c:if test = "${list.enterprise_operatingCloseTime eq '06:30'}" > selected = "selected" </c:if>>06:30</option>
							<option value = "07:00" <c:if test = "${list.enterprise_operatingCloseTime eq '07:00'}" > selected = "selected" </c:if>>07:00</option>
							<option value = "07:30" <c:if test = "${list.enterprise_operatingCloseTime eq '07:30'}" > selected = "selected" </c:if>>07:30</option>
							<option value = "08:00" <c:if test = "${list.enterprise_operatingCloseTime eq '08:00'}" > selected = "selected" </c:if>>08:00</option>
							<option value = "08:30" <c:if test = "${list.enterprise_operatingCloseTime eq '08:30'}" > selected = "selected" </c:if>>08:30</option>
							<option value = "09:00" <c:if test = "${list.enterprise_operatingCloseTime eq '09:00'}" > selected = "selected" </c:if>>09:00</option>
							<option value = "09:30" <c:if test = "${list.enterprise_operatingCloseTime eq '09:30'}" > selected = "selected" </c:if>>09:30</option>
							<option value = "10:00" <c:if test = "${list.enterprise_operatingCloseTime eq '10:00'}" > selected = "selected" </c:if>>10:00</option>
							<option value = "10:30" <c:if test = "${list.enterprise_operatingCloseTime eq '10:30'}" > selected = "selected" </c:if>>10:30</option>
							<option value = "11:00" <c:if test = "${list.enterprise_operatingCloseTime eq '11:00'}" > selected = "selected" </c:if>>11:00</option>
							<option value = "11:30" <c:if test = "${list.enterprise_operatingCloseTime eq '11:30'}" > selected = "selected" </c:if>>11:30</option>
							<option value = "12:00" <c:if test = "${list.enterprise_operatingCloseTime eq '12:00'}" > selected = "selected" </c:if>>12:00</option>
							<option value = "12:30" <c:if test = "${list.enterprise_operatingCloseTime eq '12:30'}" > selected = "selected" </c:if>>12:30</option>
							<option value = "13:00" <c:if test = "${list.enterprise_operatingCloseTime eq '13:00'}" > selected = "selected" </c:if>>13:00</option>
							<option value = "13:30" <c:if test = "${list.enterprise_operatingCloseTime eq '13:30'}" > selected = "selected" </c:if>>13:30</option>
							<option value = "14:00" <c:if test = "${list.enterprise_operatingCloseTime eq '14:00'}" > selected = "selected" </c:if>>14:00</option>
							<option value = "14:30" <c:if test = "${list.enterprise_operatingCloseTime eq '14:30'}" > selected = "selected" </c:if>>14:30</option>
							<option value = "15:00" <c:if test = "${list.enterprise_operatingCloseTime eq '15:00'}" > selected = "selected" </c:if>>15:00</option>
							<option value = "15:30" <c:if test = "${list.enterprise_operatingCloseTime eq '15:30'}" > selected = "selected" </c:if>>15:30</option>
							<option value = "16:00" <c:if test = "${list.enterprise_operatingCloseTime eq '16:00'}" > selected = "selected" </c:if>>16:00</option>
							<option value = "16:30" <c:if test = "${list.enterprise_operatingCloseTime eq '16:30'}" > selected = "selected" </c:if>>16:30</option>
							<option value = "17:00" <c:if test = "${list.enterprise_operatingCloseTime eq '17:00'}" > selected = "selected" </c:if>>17:00</option>
							<option value = "17:30" <c:if test = "${list.enterprise_operatingCloseTime eq '17:30'}" > selected = "selected" </c:if>>17:30</option>
							<option value = "18:00" <c:if test = "${list.enterprise_operatingCloseTime eq '18:00'}" > selected = "selected" </c:if>>18:00</option>
							<option value = "18:30" <c:if test = "${list.enterprise_operatingCloseTime eq '18:30'}" > selected = "selected" </c:if>>18:30</option>
							<option value = "19:00" <c:if test = "${list.enterprise_operatingCloseTime eq '19:00'}" > selected = "selected" </c:if>>19:00</option>
							<option value = "19:30" <c:if test = "${list.enterprise_operatingCloseTime eq '19:30'}" > selected = "selected" </c:if>>19:30</option>
							<option value = "20:00" <c:if test = "${list.enterprise_operatingCloseTime eq '20:00'}" > selected = "selected" </c:if>>20:00</option>
							<option value = "20:30" <c:if test = "${list.enterprise_operatingCloseTime eq '20:30'}" > selected = "selected" </c:if>>20:30</option>
							<option value = "21:00" <c:if test = "${list.enterprise_operatingCloseTime eq '21:00'}" > selected = "selected" </c:if>>21:00</option>
							<option value = "21:30" <c:if test = "${list.enterprise_operatingCloseTime eq '21:30'}" > selected = "selected" </c:if>>21:30</option>
							<option value = "22:00" <c:if test = "${list.enterprise_operatingCloseTime eq '22:00'}" > selected = "selected" </c:if>>22:00</option>
							<option value = "22:30" <c:if test = "${list.enterprise_operatingCloseTime eq '22:30'}" > selected = "selected" </c:if>>22:30</option>
							<option value = "23:00" <c:if test = "${list.enterprise_operatingCloseTime eq '23:00'}" > selected = "selected" </c:if>>23:00</option>
							<option value = "23:30" <c:if test = "${list.enterprise_operatingCloseTime eq '23:30'}" > selected = "selected" </c:if>>23:30</option>
							<option value = "24:00" <c:if test = "${list.enterprise_operatingCloseTime eq '24:00'}" > selected = "selected" </c:if>>24:00</option>
						</select>

						<label class="col-form-label" for="inputDefault">브레이크타임시작시간 </label>

						<select class="custom-select"  name = "enterprise_breakStartTime">
							<option value = "00:00" <c:if test = "${list.enterprise_breakStartTime eq '00:00'}" > selected = "selected" </c:if>>00:00</option>
							<option value = "00:30" <c:if test = "${list.enterprise_breakStartTime eq '00:30'}" > selected = "selected" </c:if>>00:30</option>
							<option value = "01:00" <c:if test = "${list.enterprise_breakStartTime eq '01:00'}" > selected = "selected" </c:if>>01:00</option>
							<option value = "01:30" <c:if test = "${list.enterprise_breakStartTime eq '01:30'}" > selected = "selected" </c:if>>01:30</option>
							<option value = "02:00" <c:if test = "${list.enterprise_breakStartTime eq '02:00'}" > selected = "selected" </c:if>>02:00</option>
							<option value = "02:30" <c:if test = "${list.enterprise_breakStartTime eq '02:30'}" > selected = "selected" </c:if>>02:30</option>
							<option value = "03:00" <c:if test = "${list.enterprise_breakStartTime eq '03:00'}" > selected = "selected" </c:if>>03:00</option>
							<option value = "03:30" <c:if test = "${list.enterprise_breakStartTime eq '03:30'}" > selected = "selected" </c:if>>03:30</option>
							<option value = "04:00" <c:if test = "${list.enterprise_breakStartTime eq '04:00'}" > selected = "selected" </c:if>>04:00</option>
							<option value = "04:30" <c:if test = "${list.enterprise_breakStartTime eq '04:30'}" > selected = "selected" </c:if>>04:30</option>
							<option value = "05:00" <c:if test = "${list.enterprise_breakStartTime eq '05:00'}" > selected = "selected" </c:if>>05:00</option>
							<option value = "05:30" <c:if test = "${list.enterprise_breakStartTime eq '05:30'}" > selected = "selected" </c:if>>05:30</option>
							<option value = "06:00" <c:if test = "${list.enterprise_breakStartTime eq '06:00'}" > selected = "selected" </c:if>>06:00</option>
							<option value = "06:30" <c:if test = "${list.enterprise_breakStartTime eq '06:30'}" > selected = "selected" </c:if>>06:30</option>
							<option value = "07:00" <c:if test = "${list.enterprise_breakStartTime eq '07:00'}" > selected = "selected" </c:if>>07:00</option>
							<option value = "07:30" <c:if test = "${list.enterprise_breakStartTime eq '07:30'}" > selected = "selected" </c:if>>07:30</option>
							<option value = "08:00" <c:if test = "${list.enterprise_breakStartTime eq '08:00'}" > selected = "selected" </c:if>>08:00</option>
							<option value = "08:30" <c:if test = "${list.enterprise_breakStartTime eq '08:30'}" > selected = "selected" </c:if>>08:30</option>
							<option value = "09:00" <c:if test = "${list.enterprise_breakStartTime eq '09:00'}" > selected = "selected" </c:if>>09:00</option>
							<option value = "09:30" <c:if test = "${list.enterprise_breakStartTime eq '09:30'}" > selected = "selected" </c:if>>09:30</option>
							<option value = "10:00" <c:if test = "${list.enterprise_breakStartTime eq '10:00'}" > selected = "selected" </c:if>>10:00</option>
							<option value = "10:30" <c:if test = "${list.enterprise_breakStartTime eq '10:30'}" > selected = "selected" </c:if>>10:30</option>
							<option value = "11:00" <c:if test = "${list.enterprise_breakStartTime eq '11:00'}" > selected = "selected" </c:if>>11:00</option>
							<option value = "11:30" <c:if test = "${list.enterprise_breakStartTime eq '11:30'}" > selected = "selected" </c:if>>11:30</option>
							<option value = "12:00" <c:if test = "${list.enterprise_breakStartTime eq '12:00'}" > selected = "selected" </c:if>>12:00</option>
							<option value = "12:30" <c:if test = "${list.enterprise_breakStartTime eq '12:30'}" > selected = "selected" </c:if>>12:30</option>
							<option value = "13:00" <c:if test = "${list.enterprise_breakStartTime eq '13:00'}" > selected = "selected" </c:if>>13:00</option>
							<option value = "13:30" <c:if test = "${list.enterprise_breakStartTime eq '13:30'}" > selected = "selected" </c:if>>13:30</option>
							<option value = "14:00" <c:if test = "${list.enterprise_breakStartTime eq '14:00'}" > selected = "selected" </c:if>>14:00</option>
							<option value = "14:30" <c:if test = "${list.enterprise_breakStartTime eq '14:30'}" > selected = "selected" </c:if>>14:30</option>
							<option value = "15:00" <c:if test = "${list.enterprise_breakStartTime eq '15:00'}" > selected = "selected" </c:if>>15:00</option>
							<option value = "15:30" <c:if test = "${list.enterprise_breakStartTime eq '15:30'}" > selected = "selected" </c:if>>15:30</option>
							<option value = "16:00" <c:if test = "${list.enterprise_breakStartTime eq '16:00'}" > selected = "selected" </c:if>>16:00</option>
							<option value = "16:30" <c:if test = "${list.enterprise_breakStartTime eq '16:30'}" > selected = "selected" </c:if>>16:30</option>
							<option value = "17:00" <c:if test = "${list.enterprise_breakStartTime eq '17:00'}" > selected = "selected" </c:if>>17:00</option>
							<option value = "17:30" <c:if test = "${list.enterprise_breakStartTime eq '17:30'}" > selected = "selected" </c:if>>17:30</option>
							<option value = "18:00" <c:if test = "${list.enterprise_breakStartTime eq '18:00'}" > selected = "selected" </c:if>>18:00</option>
							<option value = "18:30" <c:if test = "${list.enterprise_breakStartTime eq '18:30'}" > selected = "selected" </c:if>>18:30</option>
							<option value = "19:00" <c:if test = "${list.enterprise_breakStartTime eq '19:00'}" > selected = "selected" </c:if>>19:00</option>
							<option value = "19:30" <c:if test = "${list.enterprise_breakStartTime eq '19:30'}" > selected = "selected" </c:if>>19:30</option>
							<option value = "20:00" <c:if test = "${list.enterprise_breakStartTime eq '20:00'}" > selected = "selected" </c:if>>20:00</option>
							<option value = "20:30" <c:if test = "${list.enterprise_breakStartTime eq '20:30'}" > selected = "selected" </c:if>>20:30</option>
							<option value = "21:00" <c:if test = "${list.enterprise_breakStartTime eq '21:00'}" > selected = "selected" </c:if>>21:00</option>
							<option value = "21:30" <c:if test = "${list.enterprise_breakStartTime eq '21:30'}" > selected = "selected" </c:if>>21:30</option>
							<option value = "22:00" <c:if test = "${list.enterprise_breakStartTime eq '22:00'}" > selected = "selected" </c:if>>22:00</option>
							<option value = "22:30" <c:if test = "${list.enterprise_breakStartTime eq '22:30'}" > selected = "selected" </c:if>>22:30</option>
							<option value = "23:00" <c:if test = "${list.enterprise_breakStartTime eq '23:00'}" > selected = "selected" </c:if>>23:00</option>
							<option value = "23:30" <c:if test = "${list.enterprise_breakStartTime eq '23:30'}" > selected = "selected" </c:if>>23:30</option>
							<option value = "24:00" <c:if test = "${list.enterprise_breakStartTime eq '24:00'}" > selected = "selected" </c:if>>24:00</option>
						</select>

						<label class="col-form-label" for="inputDefault">브레이크타임종료시간 </label>
						<select class="custom-select" name = "enterprise_breakCloseTime">
							<option value = "00:00" <c:if test = "${list.enterprise_breakCloseTime eq '00:00'}" > selected = "selected" </c:if>>00:00</option>
							<option value = "00:30" <c:if test = "${list.enterprise_breakCloseTime eq '00:30'}" > selected = "selected" </c:if>>00:30</option>
							<option value = "01:00" <c:if test = "${list.enterprise_breakCloseTime eq '01:00'}" > selected = "selected" </c:if>>01:00</option>
							<option value = "01:30" <c:if test = "${list.enterprise_breakCloseTime eq '01:30'}" > selected = "selected" </c:if>>01:30</option>
							<option value = "02:00" <c:if test = "${list.enterprise_breakCloseTime eq '02:00'}" > selected = "selected" </c:if>>02:00</option>
							<option value = "02:30" <c:if test = "${list.enterprise_breakCloseTime eq '02:30'}" > selected = "selected" </c:if>>02:30</option>
							<option value = "03:00" <c:if test = "${list.enterprise_breakCloseTime eq '03:00'}" > selected = "selected" </c:if>>03:00</option>
							<option value = "03:30" <c:if test = "${list.enterprise_breakCloseTime eq '03:30'}" > selected = "selected" </c:if>>03:30</option>
							<option value = "04:00" <c:if test = "${list.enterprise_breakCloseTime eq '04:00'}" > selected = "selected" </c:if>>04:00</option>
							<option value = "04:30" <c:if test = "${list.enterprise_breakCloseTime eq '04:30'}" > selected = "selected" </c:if>>04:30</option>
							<option value = "05:00" <c:if test = "${list.enterprise_breakCloseTime eq '05:00'}" > selected = "selected" </c:if>>05:00</option>
							<option value = "05:30" <c:if test = "${list.enterprise_breakCloseTime eq '05:30'}" > selected = "selected" </c:if>>05:30</option>
							<option value = "06:00" <c:if test = "${list.enterprise_breakCloseTime eq '06:00'}" > selected = "selected" </c:if>>06:00</option>
							<option value = "06:30" <c:if test = "${list.enterprise_breakCloseTime eq '06:30'}" > selected = "selected" </c:if>>06:30</option>
							<option value = "07:00" <c:if test = "${list.enterprise_breakCloseTime eq '07:00'}" > selected = "selected" </c:if>>07:00</option>
							<option value = "07:30" <c:if test = "${list.enterprise_breakCloseTime eq '07:30'}" > selected = "selected" </c:if>>07:30</option>
							<option value = "08:00" <c:if test = "${list.enterprise_breakCloseTime eq '08:00'}" > selected = "selected" </c:if>>08:00</option>
							<option value = "08:30" <c:if test = "${list.enterprise_breakCloseTime eq '08:30'}" > selected = "selected" </c:if>>08:30</option>
							<option value = "09:00" <c:if test = "${list.enterprise_breakCloseTime eq '09:00'}" > selected = "selected" </c:if>>09:00</option>
							<option value = "09:30" <c:if test = "${list.enterprise_breakCloseTime eq '09:30'}" > selected = "selected" </c:if>>09:30</option>
							<option value = "10:00" <c:if test = "${list.enterprise_breakCloseTime eq '10:00'}" > selected = "selected" </c:if>>10:00</option>
							<option value = "10:30" <c:if test = "${list.enterprise_breakCloseTime eq '10:30'}" > selected = "selected" </c:if>>10:30</option>
							<option value = "11:00" <c:if test = "${list.enterprise_breakCloseTime eq '11:00'}" > selected = "selected" </c:if>>11:00</option>
							<option value = "11:30" <c:if test = "${list.enterprise_breakCloseTime eq '11:30'}" > selected = "selected" </c:if>>11:30</option>
							<option value = "12:00" <c:if test = "${list.enterprise_breakCloseTime eq '12:00'}" > selected = "selected" </c:if>>12:00</option>
							<option value = "12:30" <c:if test = "${list.enterprise_breakCloseTime eq '12:30'}" > selected = "selected" </c:if>>12:30</option>
							<option value = "13:00" <c:if test = "${list.enterprise_breakCloseTime eq '13:00'}" > selected = "selected" </c:if>>13:00</option>
							<option value = "13:30" <c:if test = "${list.enterprise_breakCloseTime eq '13:30'}" > selected = "selected" </c:if>>13:30</option>
							<option value = "14:00" <c:if test = "${list.enterprise_breakCloseTime eq '14:00'}" > selected = "selected" </c:if>>14:00</option>
							<option value = "14:30" <c:if test = "${list.enterprise_breakCloseTime eq '14:30'}" > selected = "selected" </c:if>>14:30</option>
							<option value = "15:00" <c:if test = "${list.enterprise_breakCloseTime eq '15:00'}" > selected = "selected" </c:if>>15:00</option>
							<option value = "15:30" <c:if test = "${list.enterprise_breakCloseTime eq '15:30'}" > selected = "selected" </c:if>>15:30</option>
							<option value = "16:00" <c:if test = "${list.enterprise_breakCloseTime eq '16:00'}" > selected = "selected" </c:if>>16:00</option>
							<option value = "16:30" <c:if test = "${list.enterprise_breakCloseTime eq '16:30'}" > selected = "selected" </c:if>>16:30</option>
							<option value = "17:00" <c:if test = "${list.enterprise_breakCloseTime eq '17:00'}" > selected = "selected" </c:if>>17:00</option>
							<option value = "17:30" <c:if test = "${list.enterprise_breakCloseTime eq '17:30'}" > selected = "selected" </c:if>>17:30</option>
							<option value = "18:00" <c:if test = "${list.enterprise_breakCloseTime eq '18:00'}" > selected = "selected" </c:if>>18:00</option>
							<option value = "18:30" <c:if test = "${list.enterprise_breakCloseTime eq '18:30'}" > selected = "selected" </c:if>>18:30</option>
							<option value = "19:00" <c:if test = "${list.enterprise_breakCloseTime eq '19:00'}" > selected = "selected" </c:if>>19:00</option>
							<option value = "19:30" <c:if test = "${list.enterprise_breakCloseTime eq '19:30'}" > selected = "selected" </c:if>>19:30</option>
							<option value = "20:00" <c:if test = "${list.enterprise_breakCloseTime eq '20:00'}" > selected = "selected" </c:if>>20:00</option>
							<option value = "20:30" <c:if test = "${list.enterprise_breakCloseTime eq '20:30'}" > selected = "selected" </c:if>>20:30</option>
							<option value = "21:00" <c:if test = "${list.enterprise_breakCloseTime eq '21:00'}" > selected = "selected" </c:if>>21:00</option>
							<option value = "21:30" <c:if test = "${list.enterprise_breakCloseTime eq '21:30'}" > selected = "selected" </c:if>>21:30</option>
							<option value = "22:00" <c:if test = "${list.enterprise_breakCloseTime eq '22:00'}" > selected = "selected" </c:if>>22:00</option>
							<option value = "22:30" <c:if test = "${list.enterprise_breakCloseTime eq '22:30'}" > selected = "selected" </c:if>>22:30</option>
							<option value = "23:00" <c:if test = "${list.enterprise_breakCloseTime eq '23:00'}" > selected = "selected" </c:if>>23:00</option>
							<option value = "23:30" <c:if test = "${list.enterprise_breakCloseTime eq '23:30'}" > selected = "selected" </c:if>>23:30</option>
							<option value = "24:00" <c:if test = "${list.enterprise_breakCloseTime eq '24:00'}" > selected = "selected" </c:if>>24:00</option>
						</select>



						<script>

						function itemSum(frm)
						{
						   var sum = "";
						   var count = frm.chkbox.length;

						   for(var i=0; i < count; i++ ){
						       if( frm.chkbox[i].checked == true ){
							    sum += frm.chkbox[i].value + ",";
						       }
						   }
						   frm.enterprise_closed.value = sum;
						}

						</script>



				 		<label class="col-form-label" for="inputDefault">영업일 체크</label>
						<div class="form-group">
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '1'>월요일
						 	<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '2'>화요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '3'>수요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '4'>목요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '5'>금요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '6'>토요일
							<input type = "checkbox" name = "chkbox" onClick="itemSum(this.form);" value = '0'>일요일
							<input type = "hidden" name = "enterprise_closed">

						</div>


						<label class="col-form-label" for="sectors_select">업종</label>
						<select class="custom-select" name = "enterprise_sectors" id="sectors_select" >

							<option value = "0" <c:if test = "${list.enterprise_sectors eq '0'}" > selected = "selected" </c:if>>선택해주세요</option>
							<option value = "default" <c:if test = "${list.enterprise_sectors eq 'default'}" > selected = "selected" </c:if>>음식전체</option>
							<option value = "한식" <c:if test = "${list.enterprise_sectors eq '한식'}" > selected = "selected" </c:if>>한식</option>
							<option value = "양식" <c:if test = "${list.enterprise_sectors eq '양식'}" > selected = "selected" </c:if>>양식</option>
							<option value = "중식" <c:if test = "${list.enterprise_sectors eq '중식'}" > selected = "selected" </c:if>>중식</option>
							<option value = "일식" <c:if test = "${list.enterprise_sectors eq '일식'}" > selected = "selected" </c:if>>일식</option>
							<option value = "아시아식" <c:if test = "${list.enterprise_sectors eq '아시아식'}" > selected = "selected" </c:if>>아시아식</option>
							<option value = "컨템퍼러리" <c:if test = "${list.enterprise_sectors eq '컨템퍼러리'}" > selected = "selected" </c:if>>컨템퍼러리</option>
							<option value = "뷔페" <c:if test = "${list.enterprise_sectors eq '뷔페'}" > selected = "selected" </c:if>>뷔페</option>
							<option value = "구이" <c:if test = "${list.enterprise_sectors eq '구이'}" > selected = "selected" </c:if>>구이</option>
							<option value = "술집" <c:if test = "${list.enterprise_sectors eq '술집'}" > selected = "selected" </c:if>>술집</option>
							<option value = "카페/베이커리" <c:if test = "${list.enterprise_sectors eq '카페/베이커리'}" > selected = "selected" </c:if>>카페/베이커리</option>
						</select>

						 <label class="col-form-label" for="inputDefault">서비스</label>
						<select class="custom-select" name = "enterprise_service" id="exampleSelect1">
							<option value = "0" <c:if test = "${list.enterprise_service eq '0'}" > selected = "selected" </c:if>>선택해주세요</option>
							<option value = "1" <c:if test = "${list.enterprise_service eq '1'}" > selected = "selected" </c:if>>웨이팅 서비스</option>
							<option value = "2" <c:if test = "${list.enterprise_service eq '2'}" > selected = "selected" </c:if>>예약 서비스</option>
							<option value = "3" <c:if test = "${list.enterprise_service eq '3'}" > selected = "selected" </c:if>>웨이팅 + 예약 서비스</option>
						</select>


						 <label class="col-form-label" for="inputDefault">대표이미지 및 기타 이미지 첨부</label>
					   	<input type="file" class="form-control-file" name = "enterprise_mainImg" id="exampleInputFile" aria-describedby="fileHelp">
					   	<input type="file" class="form-control-file" name = "enterprise_img1" id="exampleInputFile" aria-describedby="fileHelp">
					   	<input type="file" class="form-control-file" name = "enterprise_img2" id="exampleInputFile" aria-describedby="fileHelp">
					   	<input type="file" class="form-control-file" name = "enterprise_img3" id="exampleInputFile" aria-describedby="fileHelp">
					   	<input type="file" class="form-control-file" name = "enterprise_img4" id="exampleInputFile" aria-describedby="fileHelp">


					</p>
					<p>
						<button type="submit" class="form-control btn btn-primary signupbtn"  disabled="disabled">정보수정</button>
					</p>
				</form>
</div>



</html>