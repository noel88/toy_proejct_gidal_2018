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


	<h2><p class="mb-0">리뷰보기</p></h2>

<script type="text/javascript">
	function reply() {
		document.opener.name = "replyEnt"
		document.updatefrm.submit();
	}

</script>
</div>
<table class="table" style="margin: 30px; margin-left:auto; margin-right: auto; width: 550px;">

<form action="replyEnt" name = "updatefrm">
<tr>
	<td>${reviewReply.review_text}</td>
</tr>
<tr>

	<td><textarea style="resize: none; width: 100%; height: 100px;" name = "enterprise_text" <c:if test = "${reviewReply.enterprise_text != null}"> readOnly </c:if>>${reviewReply.enterprise_text}</textarea>
	<input type = "hidden" name = "review_code" value = "${reviewReply.review_code}"></td>
</tr>
<tr>
	<td>
		<button class="btn btn-default" <c:if test = "${reviewReply.enterprise_text != null}"> disabled = 'disabled' </c:if> onclick ="javascript:reply();" type = "submit">댓글등록하기</button>
</form>
		<button class="btn btn-default" <c:if test = "${reviewReply.enterprise_text == null}"> disabled = 'disabled' </c:if> onclick="window.open('delReply?review_code=${reviewReply.review_code}','','','width=200','height=200');">댓글삭제하기</button>
	</td>
</tr>
</table>

</body>
</html>

