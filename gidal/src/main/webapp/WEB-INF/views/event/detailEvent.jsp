<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>진행중인 이벤트</h1>

			<hr class="my-4">

			<div class="card mb-3">
				<h3 class="card-header">${eventVO.event_title}</h3>
				<div class="card-body">
					<h5 class="card-title">이벤트기간</h5>
					<h6 class="card-subtitle text-muted">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${eventVO.event_startDate}" />
						&nbsp;-&nbsp;
						<fmt:formatDate pattern="yyyy-MM-dd" value="${eventVO.event_endDate}" />
					</h6>
				</div>
				<c:if test = "${eventVO.event_image != null}">
					<img style="height: auto; width: 100%; display: block;"
						src="/upload/${eventVO.event_image}"
						alt="Card image">
				</c:if>
				<div class="card-body">
					<p class="card-text">${eventVO.event_content}</p>
				</div>
				<div class="card-footer text-muted" align="center">
					<button type="button" class="btn btn-secondary btn-lg" onclick="history.back()" style = "width : 50%">목&nbsp;&nbsp;록</button>
				</div>
			</div>
		</div>

	</div>
	
</body>
</html>