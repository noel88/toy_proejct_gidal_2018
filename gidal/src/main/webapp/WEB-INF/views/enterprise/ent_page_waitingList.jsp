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
		<h1>현재 대기목록</h1>

			<hr class="my-4">
			<div style= "width:100%; auto; margin-left: auto;">



			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">인원수</th>
						<th scope="col">웨이팅 시간</th>
						<th scope="col">웨이팅 현황</th>
						<th scope="col">입장알림</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${waitingList}" var="WaitingVO">
						<tr>
							<td>${WaitingVO.user_name}</td>
							<td>${WaitingVO.user_phoneNum}</td>
							<td>${WaitingVO.waiting_personnel}</td>
							<td><c:out value='${fn:substring(WaitingVO.waiting_now, 10, 19)}'/></td>
							<td><a href ="/enterprise/update_yn?waiting_code=${WaitingVO.waiting_code}"><button type="button" class="btn btn-secondary">${WaitingVO.waiting_yn}</button></a></td>
							<td><a href ="/enterprise/update_Alert?waiting_code=${WaitingVO.waiting_code}"><button type="button" class="btn btn-secondary">입장</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>




</div>
</div>
</div>
</body>



</html>