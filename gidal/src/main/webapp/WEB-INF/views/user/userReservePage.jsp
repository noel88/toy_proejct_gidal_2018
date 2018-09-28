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
			<h1 style = "text-align : center;">내가 예약한 목록</h1>

			<hr class="my-4">
			<!-- <p class="lead">This is a simple hero unit, a simple
			jumbotron-style component for calling extra attention to featured
			content or information.</p>
		<p>It uses utility classes for typography and spacing to space
			content out within the larger container.</p>
		<p class="lead">
			<a class="btn btn-primary btn-lg" href="#" role="button">Learn
				more</a>
		</p> -->

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
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="UserPageVO">
						<tr>
							<td><small>${UserPageVO.enterprise_businessName}</small></td>
							<td><small>${UserPageVO.reserve_personnel}</small></td>
							<td><small><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${UserPageVO.reserve_datetime}" /></small></td>
							<td><small>${UserPageVO.user_name}</small></td>
							<form>
						<td><button type="submit">리뷰쓰기</button></td>
						</form>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div style = "width : 100%;">
				<ul class="pagination" ">
					<c:choose>
						<c:when test="${ (pageInfo.page - 1) == 0 }">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/user/userpage?page=${ pageInfo.page - 1 }">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var = "page" begin = "${ pageInfo.startPage }" end = "${ pageInfo.endPage }" step = "1">
						<c:choose>
							<c:when test="${ pageInfo.page == page }">
								<li class="page-item active"><a class="page-link" href="/user/userpage?page=${ page }">${ page }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="/user/userpage?page=${ page }">${ page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${ pageInfo.page == pageInfo.endPage }">
							<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="//user/userpage?page=${ pageInfo.page + 1 }">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>	
				
			</div>
			
		</div>
		 

	</div>

</body>
</html>