<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file = "/WEB-INF/views/include/enter_page_nav.jsp" %>
</head>
<body>
<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
<div class="jumbotron">
		<h1>웨이팅한 손님 리뷰목록</h1>

			<hr class="my-4">
			<div style= "width:100%; auto; margin-left: auto;">



			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">인원수</th>
						<th scope="col">날짜</th>
						<th scope="col">별점</th>
						<th scope="col">리뷰</th>


					</tr>
				</thead>
				<tbody>
					<c:forEach items="${waitingReview}" var="wReview">
						<tr>
							<td>${wReview.user_name}</td>
							<td>${wReview.waiting_personnel}</td>
							<td><c:out value='${fn:substring(wReview.waiting_now, 0, 10)}'/></td>
							<td>${wReview.review_scope}</td>
							<td><a onclick="window.open('/enterprise/reply?review_code=${wReview.review_code}','','width=600,height=400,top=250,left=350,location=no,status=no,scrollbars=no');"><c:out value='${fn:substring(wReview.review_text, 0, 10)}'/>..</a></td>


						</tr>
					</c:forEach>
				</tbody>
			</table>




</div>
</div>
</div>
</body>



</html>