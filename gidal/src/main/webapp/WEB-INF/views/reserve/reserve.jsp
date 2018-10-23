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
 <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">



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
					<label for="exampleSelect1">인원</label> <select class="form-control" id="exampleSelect1" name="reserve_personnel">
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
								<label class="control-label" for="date">날짜</label>
                                  <div class="input-group date" id="dp3" data-date="12-02-2017" data-date-format="mm-dd-yyyy">
                                  <input name="date" id = datepicker class="form-control" type="text" value="24-10-2018">
                                  <span class="input-group-addon btn"><i class="glyphicon glyphicon-calendar" id="butt"></i></span>
                                </div>
                                  </div>
                                  </div>
                                  </div>
</td>
<td>
                              <div class="form-group">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">시간</label> <input id="start" name="start" type="text" required="required" placeholder="00:00 AM" class="form-control start" />
								</div>
							</div>
                      
							</div>
							
						
			          
			
</td>
<script type="text/javascript">
$('#start').timepicker({'minTime':'${enterpriseVO.enterprise_operatingOpenTime}',
	'maxTime': '${enterpriseVO.enterprise_operatingCloseTime}'});
</script>


       
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	var date_input=$('.date'); //our date input has the name "date"
	var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	date_input.datepicker({
		format: 'dd/mm/yyyy',
		container: container,
		todayHighlight: true,
		minDate: 0, // 오늘 이후 날짜 선택 불가
		autoclose: true,
		//regional: "ko",
		beforeShowDay: function(date){
			var day = date.getDay();
			return [(day != 0 && day != 1 && day != 3 && day != 4 && day != 6)];
		}

        
	});
});
</script>

<tr>
	<td colspan="3" style="text-align: center;">0000년 00월 00일 00:00 0명</td>
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
<p>*21시 이후의 예약 건은 다음날 오전 마이페이지에서 확인가능합니다.</p>
<p>*예약 취소는 예약 시간 30분 전까지만 가능합니다.</p>
<p>*No-Show(노쇼:예약을 하고 나타나지 않은 행위)는 외식업계를 아프게합니다.</p>
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

