<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>
<link href="<c:url value="/resources/css/fullcalendar.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/fullcalendar.print.css" />" rel="stylesheet" media='print'>
<script src="<c:url value="/resources/js/moment.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/fullcalendar.min.js" />"></script>

<style>

body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
}



</style>


</head>
<body>



	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			

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

			<div class="form-group" style = "width:100%; auto; margin-left: auto;">
			
			
			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col" style = "min-width : 100px;">식당</th>
						<th scope="col" style = "min-width : 56px;">인원</th>
						<th scope="col" style = "min-width : 90px;">날짜</th>
						<th scope="col" style = "min-width : 90px;">예약자</th>
						<th scope="col" style = "min-width : 80px;">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="UserPageVO">
						<tr>
							<td><small>${UserPageVO.enterprise_businessName}</small></td>
							<td><small>${UserPageVO.reserve_personnel}</small></td>
							<td><small><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${UserPageVO.reserve_datetime}" /></small></td>
							<td><small>${UserPageVO.user_name}</small></td>
							
						<td><a href="/review/show"><button type="button" class="btn btn-primary">리뷰쓰기</button></a></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div style = "width : 100%;">
				<ul class="pagination" style = "width : 30%; ">
					<c:choose>
						<c:when test="${ (pageInfo.page - 1) == 0 }">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/user/userReservePage?page=${ pageInfo.page - 1 }">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var = "page" begin = "${ pageInfo.startPage }" end = "${ pageInfo.endPage }" step = "1">
						<c:choose>
							<c:when test="${ pageInfo.page == page }">
								<li class="page-item active"><a class="page-link" href="/user/userReservePage?page=${ page }">${ page }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="/user/userReservePage?page=${ page }">${ page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${ pageInfo.page == pageInfo.endPage }">
							<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="//user/userReservePage?page=${ pageInfo.page + 1 }">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>	
				
			</div>
			
		</div>
		 

	</div>

</body>
</html>