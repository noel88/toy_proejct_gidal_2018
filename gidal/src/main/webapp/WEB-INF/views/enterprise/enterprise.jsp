<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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



	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>기업 회원가입</h1>

			<hr class="my-4">


			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form name = "form" action = "join" method = "post" enctype="multipart/form-data">
					<p>
						<label class="col-form-label" for="inputDefault">이메일</label>
						<input type="email" class="form-control" name = "enterprise_email" placeholder="이메일" id="inputDefault">

						<label class="col-form-label" for="inputDefault">패스워드</label>
						<input type="password" class="form-control" name = "enterprise_password" placeholder="패스워드" id="inputDefault">

						<label class="col-form-label" for="inputDefault">패스워드확인</label>
						<input type="password" class="form-control"name = "enterprise_passwordCheck" placeholder="패스워드확인" id="inputDefault">

						<label class="col-form-label" for="inputDefault">이름</label>
						<input type="text" class="form-control" name = "enterprise_name" placeholder="이름" id="inputDefault">


					</p>

					<hr class="my-4">

					 <p>
						<label class="col-form-label" for="inputDefault">매장명</label>
						<input type="text" class="form-control" name = "enterprise_businessName" placeholder="매장명" id="inputDefault">

						<label class="col-form-label" for="inputDefault">매장 전화번호</label>
						<input type="text" class="form-control" name = "enterprise_phone" placeholder="매장전화번호" id="inputDefault">



						<label class="col-form-label" for="inputDefault">매장 주소</label>
						<div class="form-group">
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="enterprise_add1" id="add1" type="text" readonly="readonly" >
						    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
						</div>
						<div class="form-group">
						    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="enterprise_add2" id="add2" type="text" readonly="readonly" />
						</div>
						<div class="form-group">
						    <input class="form-control" placeholder="상세주소" name="enterprise_add3" id="add3" type="text"  />
						</div>



						<label class="col-form-label" for="inputDefault">영업시작시간</label>
						<select class="custom-select" name = "enterprise_operatingOpenTime" id="exampleSelect1">
							<%@ include file = "/WEB-INF/views/include/time.jsp" %>
						</select>


						<label class="col-form-label" for="inputDefault" >영업종료시간</label>
						<select class="custom-select"  name = "enterprise_operatingCloseTime" id="exampleSelect1">
							<%@ include file = "/WEB-INF/views/include/time.jsp" %>
						</select>

						<label class="col-form-label" for="inputDefault">브레이크타임시작시간 </label>

						<select class="custom-select"  name = "enterprise_breakStartTime" id="exampleSelect1">
							<%@ include file = "/WEB-INF/views/include/time.jsp" %>
						</select>

						<label class="col-form-label" for="inputDefault">브레이크타임종료시간 </label>
						<select class="custom-select" name = "enterprise_breakCloseTime" id="exampleSelect1">
							<%@ include file = "/WEB-INF/views/include/time.jsp" %>
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




						<label class="col-form-label" for="inputDefault">업종</label>
						<select class="custom-select" name = "enterprise_sectors" id="exampleSelect1">
							<option value = "0" selected>선택해주세요</option>
							<option value = "default">음식전체</option>
							<option value = "한식">한식</option>
							<option value = "양식">양식</option>
							<option value = "중식">중식</option>
							<option value = "일식">일식</option>
							<option value = "아시아식">아시아식</option>
							<option value = "컨템퍼러리">컨템퍼러리</option>
							<option value = "붸페">뷔페</option>
							<option value = "구이">구이</option>
							<option value = "술집">술집</option>
							<option value = "카페/베이커리">카페/베이커리</option>
						</select>

						 <label class="col-form-label" for="inputDefault">서비스</label>
						<select class="custom-select" name = "enterprise_service" id="exampleSelect1">
							<option value = "0" selected>선택해주세요</option>
							<option value = "1">웨이팅 서비스</option>
							<option value = "2">예약 서비스</option>
							<option value = "3">웨이팅 + 예약 서비스</option>
						</select>


						 <label class="col-form-label" for="inputDefault">대표이미지 및 기타 이미지 첨부</label>
					   	<input type="file" class="form-control-file" name = "enterprise_mainImg" id="exampleInputFile" aria-describedby="fileHelp">
					   	<input type="file" class="form-control-file" name = "enterprise_img1" id="exampleInputFile" aria-describedby="fileHelp">
					   	<input type="file" class="form-control-file" name = "enterprise_img2" id="exampleInputFile" aria-describedby="fileHelp">
					   	<input type="file" class="form-control-file" name = "enterprise_img3" id="exampleInputFile" aria-describedby="fileHelp">
					   	<input type="file" class="form-control-file" name = "enterprise_img4" id="exampleInputFile" aria-describedby="fileHelp">


					</p>
					<p>
						<button type="submit" class="btn btn-primary btn-lg btn-block">회원가입</button>
					</p>
				</form>

			</div>

		</div>

	</div>

</body>
</html>