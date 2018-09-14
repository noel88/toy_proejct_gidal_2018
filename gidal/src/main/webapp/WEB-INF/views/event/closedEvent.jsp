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
			<h1>종료된 이벤트</h1>

			<hr class="my-4">
			
			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">시작일</th>
						<th scope="col">종료일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="eventVO">
						<tr>
							<td>${eventVO.event_no}</td>
							<td style = "text-align : left; width : 50%;">
								<a href="/event/detailEvent?event_no=${eventVO.event_no}">${eventVO.event_title}</a>
							</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${eventVO.event_startDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${eventVO.event_endDate}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>

	</div>
	
</body>
</html>