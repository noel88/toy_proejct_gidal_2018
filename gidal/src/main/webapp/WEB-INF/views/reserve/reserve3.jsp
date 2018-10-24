<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import= "org.gidal.enterprise.domain.EnterpriseVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>

</head>
<body>

<form action="reserve_insert">
<script type="text/javascript">
	function reserve() {
		document.opener.name = "reserve_insert"
		document.updatefrm.submit();
	}

</script>

  <fieldset>
    <legend>예약하기</legend>

	<input type = "hidden" name = "enterprise_code" value = "${enterpriseVO.enterprise_code}">


    <div class="form-group">
      <label for="exampleSelect1">인원수</label>
      <select class="form-control" id="exampleSelect1" name = "reserve_personnel">
        <option value = "1">1</option>
        <option value= "2" selected>2</option>
        <option value = "3">3</option>
        <option value = "4">4</option>
        <option value = "5">5</option>
        <option value = "6">6</option>
        <option value = "7">7</option>
        <option value = "8">8</option>
        <option value = "9">9</option>
        <option value = "10">10명이상</option>
      </select>
    </div>
 	<script>

 	$(function(){
 	    $('.datetimepicker').appendDtpicker({'locale':'ko' ,"futureOnly": true,"minTime":"${enterpriseVO.enterprise_operatingOpenTime}", "maxTime":"${enterpriseVO.enterprise_operatingCloseTime}",
 	    	"inline": true, "allowWdays": [${enterpriseVO.enterprise_closed}] });
 	});
	</script>




    <div class="form-group">
      <label for="exampleInputEmail1">예약날짜 및 시간</label>

          <p><input type="text" name="reserve_datetime" id="text1" class="datetimepicker" /></p>


    </div>

    <div class="form-group">
      <label for="exampleInputEmail1">이름</label>
      <input type="text" class="form-control" id="exampleInputEmail1" name = "user_name" readonly="readonly" value = "${sessionScope.user.user_name}">

    </div>

    <div class="form-group">
      <label for="exampleInputEmail1">휴대폰번호</label>
      <input type="text" class="form-control" id="exampleInputEmail1" name = "user_phoneNum" readonly="readonly" value = "${sessionScope.user.user_phoneNum}">

    </div>


    <button type="submit" class="btn btn-primary" onclick ="javascript:reserve();">예약하기</button>
  </fieldset>

</form>





</body>
</html>

