<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1>진행 예정 이벤트</h1>

			<hr class="my-4">
			
			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col" style = "min-width : 56px;">번호</th>
						<th scope="col">제목</th>
						<th scope="col" style = "min-width : 90px;">시작일</th>
						<th scope="col" style = "min-width : 90px;">종료일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="eventVO">
						<tr>
							<td><small>${eventVO.event_no}</small></td>
							<td style = "text-align : left; width : 50%;">
								<small><a href="/event/detailEvent?event_no=${eventVO.event_no}">${eventVO.event_title}</a></small>
							</td>
							<td><small><fmt:formatDate pattern="yyyy-MM-dd" value="${eventVO.event_startDate}" /></small></td>
							<td><small><fmt:formatDate pattern="yyyy-MM-dd" value="${eventVO.event_endDate}" /></small></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div style = "width : 100%;">
				<ul class="pagination" style = "width : 30%; margin : auto;">
					<c:choose>
						<c:when test="${ (pageInfo.page - 1) == 0 }">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/event/closedEvent?page=${ pageInfo.page - 1 }">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var = "page" begin = "${ pageInfo.startPage }" end = "${ pageInfo.endPage }" step = "1">
						<c:choose>
							<c:when test="${ pageInfo.page == page }">
								<li class="page-item active"><a class="page-link" href="/event/closedEvent?page=${ page }">${ page }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="/event/closedEvent?page=${ page }">${ page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${ pageInfo.page == pageInfo.endPage }">
							<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/event/closedEvent?page=${ pageInfo.page + 1 }">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>				
		</div>

	</div>
	
</body>
</html>