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


<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=yglvoY5wuWlYxRRuFuXP&submodules=geocoder"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

</head>
<body>

<div style="margin-left: auto; margin-right: auto; text-align:center; width: 550px; margin-top: 10px; margin-bottom: 10px;">


	<h2><p class="mb-0">${enterpriseVO.enterprise_businessName}<small class="text-muted"><b> [${enterpriseVO.enterprise_sectors}]</b></small></p></h2>

</div>
<table class="table table-hover" style="margin: 30px; margin-left:auto; margin-right: auto; width: 550px;">
<form action="waiting_insert">
<script type="text/javascript">
	function waiting() {
		document.opener.name = "waiting_insert"
		document.updatefrm.submit();
	}

</script>
<tr>
<td colspan="3">
   <i class="fas fa-clock"></i>&nbsp;웨이팅 현황 [${count}명 대기중]

<div style="overflow:auto; height:150px;">
    <c:forEach items = "${list}" var = "WaitingVO">
		<c:set var= "cnt" value="${cnt + 1}"/>
		<fmt:formatNumber var="cnt" minIntegerDigits="2" value="${cnt}" type="number"/>
		[<c:out value="${cnt}"/>]<b><c:out value='${fn:substring(WaitingVO.waiting_now, 10, 19)}'/></b> ${WaitingVO.user_name} ${WaitingVO.waiting_personnel}명&nbsp;<i class="fas fa-history"></i>
	<br>
  	</c:forEach>
</div>

   </td>
</tr>

<tr>
	<td>
	<input type = "hidden" name = "enterprise_code" value = "${enterpriseVO.enterprise_code}">

    <div class="form-group">
      <label for="exampleSelect1">인원수</label>
      <select class="form-control" id="exampleSelect1" name = "waiting_personnel">
        <option value = "1">1</option>
        <option value = "2">2</option>
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

</td>
<td>
    <div class="form-group">
      <label for="exampleInputEmail1">이름</label>
      <input type="text" class="form-control" id="exampleInputEmail1" name = "user_name" readonly="readonly" value = "${sessionScope.user.user_name}">

    </div>
</td>
<td>

    <div class="form-group">
      <label for="exampleInputEmail1">휴대폰번호</label>
      <input type="text" class="form-control" id="exampleInputEmail1" name = "user_phoneNum" readonly="readonly" value = "${sessionScope.user.user_phoneNum}">

    </div>

</td>
</tr>


<tr>
	<td colspan="3">
    <button type="submit" class="btn btn-primary" style="width: 550px;" onclick ="javascript:waiting();" ><i class="fas fa-arrow-right">&nbsp;웨이팅하기</i></button>
	</td>
</tr>

</form>
</table>

</body>
</html>

