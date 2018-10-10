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
			
			<h1 style = "text-align : center;">웨이팅</h1>
			<div class="form-group" style = "max-width : 400px; margin : auto;">
				
					<hr class="my-4">

			<hr class="my-4">

			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col" style = "min-width : 56px;">식당</th>
						<th scope="col" style = "min-width : 56px;">인원</th>
						<th scope="col" style = "min-width : 90px;">날짜</th>
						<th scope="col" style = "min-width : 90px;">예약자</th>
						<th scope="col" style = "min-width : 80px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list1}" var="UserPageWaitingVO">
						<tr>
							<td><small>${UserPageWaitingVO.enterprise_businessName}</small></td>
							<td><small>${UserPageWaitingVO.waiting_personnel}</small></td>
							<td><small><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${UserPageWaitingVO.waiting_now}" /></small></td>
							<td><small>${UserPageWaitingVO.user_name}</small></td>
							<td><button type="submit"><a href="/review/show">리뷰쓰기</a></button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div style = "width : 100%;">
				<ul class="pagination" style = "width : 30%; ">
					<c:choose>
						<c:when test="${ (pageInfo1.page - 1) == 0 }">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/user/userWaitingPage?page=${ pageInfo1.page - 1 }">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var = "page" begin = "${ pageInfo1.startPage }" end = "${ pageInfo1.endPage }" step = "1">
						<c:choose>
							<c:when test="${ pageInfo1.page == page }">
								<li class="page-item active"><a class="page-link" href="/user/userWaitingPage?page=${ page }">${ page }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="/user/userWaitingPage?page=${ page }">${ page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${ pageInfo1.page == pageInfo1.endPage }">
							<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/user/uuserWaitingPage?page=${ pageInfo1.page + 1 }">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>	
				
			</div>
		</div>
		 

	</div>

</body>
</html>