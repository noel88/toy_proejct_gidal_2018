<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="org.gidal.enterprise.domain.EnterpriseVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!--  <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script> -->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style type="text/css">
.mdl-button--raised {
    background: rgba(159, 159, 159, 0.9) none repeat scroll 0 0;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
    color: #fff;
}
.mdl-button {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border: medium none;
    border-radius: 2px;
    color: #000;
    cursor: pointer;
    display: inline-block;
    font-size: 14px;
    font-weight: 500;
    height: 36px;
    letter-spacing: 0;
    line-height: 36px;
    min-width: 64px;
    outline: 0 none;
    overflow: hidden;
    padding: 0 8px;
    position: relative;
    text-align: center;
    transition: box-shadow 0.2s cubic-bezier(0.4, 0, 1, 1) 0s, background-color 0.2s cubic-bezier(0.4, 0, 0.2, 1) 0s, color 0.2s cubic-bezier(0.4, 0, 0.2, 1) 0s;
    will-change: box-shadow, transform;
}

.mdl-button--raised.addtoca {background: rgb(9, 133, 216);border-radius: 2px;box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);color: #fff;font-size: 13px;height: 38px; line-height: 38px;width: 100%;}
</style>
</head>
<body>
<div style="margin-left: auto; margin-right: auto; text-align:center; width: 550px; margin-top: 10px; margin-bottom: 10px;">


	<h2><p class="mb-0">${enterpriseVO.enterprise_businessName}<small class="text-muted"><b> [${enterpriseVO.enterprise_sectors}]</b></small></p></h2>

</div>

<table class="table table-hover" style="margin: 30px; margin-left:auto; margin-right: auto; width: 550px;">
	<form action="reserve_insert">
		<script type="text/javascript">
	function reserve() {
		document.opener.name = "reserve_insert"
		document.updatefrm.submit();
	}

</script>


	<tr>
	<td>
				<input type="hidden" name="enterprise_code"
					value="${enterpriseVO.enterprise_code}">


				<div class="form-group">
					<label for="exampleSelect1">인원</label> <select class="form-control count" id="personnel" name="reserve_personnel">
						<option value="1">1</option>
						<option value="2" selected>2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10명이상</option>
					</select>
				</div>
</td>
<td>
				<div class="form-group">
						<div class="row">
							<div class = "col-md-12">

								<label class="control-label">날짜</label><input type="text" class="form-control date"  id="datepicker">
                                  </div>
                                  </div>
                                  </div>

                                  <script>

                                      $(function() {
                                          //input을 datepicker로 선언
                                          $("#datepicker").datepicker({
                                              dateFormat: 'yy-mm-dd' //Input Display Format 변경
                                                  ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                                                  ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                                                  ,changeYear: true //콤보박스에서 년 선택 가능
                                                  ,changeMonth: true //콤보박스에서 월 선택 가능
                                                  //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
                                                  ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
                                                  ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                                                  ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                                                  ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                                                  ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                                                  ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                                                  ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                                             	  ,maxDate: "+2Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
                                           /*     ,onSelect: function(date) {
                                             		   var dt = new Date(date);
                                             		   var w = dt.getDay();
                                             		   if(w == 6 || w == 0) {
                                             			   alert('예약할수 없는 날짜입니다');
                                             		   }
                                             	   } */

                                             	 <c:if test = "${fn:length(closed) != 0}">
                                             	  ,beforeShowDay: function(date){
												  var day = date.getDay();

												 return [(
														${closed}
												 )];
											     }
                                            	  </c:if>
                                          });

                                          //초기값을 오늘 날짜로 설정
                                          $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                                      });

								</script>

</td>
<td>
                              <div class="form-group">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">시간</label> <input id="start" name="reserve_time" type="text" required="required" placeholder="00:00 AM" class="form-control start" />
								</div>
							</div>

							</div>



							<script type="text/javascript">
							$('#start').timepicker({'minTime':'${enterpriseVO.enterprise_operatingOpenTime}',
								'maxTime': '${enterpriseVO.enterprise_operatingCloseTime}'});
							</script>

</td>


</tr>
<tr>

	<td colspan="3" style="text-align: center;"><div><span id = "date">&nbsp;</span><span id = "time">&nbsp;</span><span id = "per"></span></div></td>

	<script type="text/javascript">

	function displayVals() {
	var count = $("#personnel").val();
	$("#per").html(" 인원 : " + count + "명" );}
	$("select").change(displayVals);
	displayVals();

	$("input").keyup(function () {
		var date = "예약날짜 : " + $("#datepicker").val();
		$("#date").text(date); }).keyup();

	$("input").keyup(function () {
		var time = " 예약시간 : " +  $("#start").val();
		$("#time").text(time); }).keyup();



	</script>
</tr>

<tr>
<td>
				<div class="form-group">
					<label for="exampleInputEmail1">이름</label> <input type="text"
						class="form-control" id="exampleInputEmail1" name="user_name"
						readonly="readonly" value="${sessionScope.user.user_name}">

				</div>
</td>
<td colspan="2">
				<div class="form-group">
					<label for="exampleInputEmail1">휴대폰번호</label> <input type="text"
						class="form-control" id="exampleInputEmail1" name="user_phoneNum"
						readonly="readonly" value="${sessionScope.user.user_phoneNum}">

				</div>
</td>
</tr>
<tr>
<td colspan="3">
<p class= "sss">*21시 이후의 예약 건은 다음날 오전 마이페이지에서 확인가능합니다.</p>
<p class= "sss">*예약 취소는 예약 시간 30분 전까지만 가능합니다.</p>
<p class= "sss">*No-Show(노쇼:예약을 하고 나타나지 않은 행위)는 외식업계를 아프게합니다.</p>
	</td>
</tr>
<tr>
<td colspan="3">
				<button type="submit" class="btn btn-primary" style="width:550px;" onclick="javascript:reserve();">예약하기</button>
	</td>
</tr>



	</form>
</table>

</body>
</html>

