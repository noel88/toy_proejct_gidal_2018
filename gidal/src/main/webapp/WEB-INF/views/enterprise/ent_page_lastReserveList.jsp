<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%@ include file = "/WEB-INF/views/include/enter_page_nav.jsp" %>
</head>
<body>
<div style="max-width: 1000px; margin-right: auto; margin-left: auto; margin-top: 50px;">
<div class="jumbotron">
		<h1>지난 예약목록</h1>

			<hr class="my-4">
	<div style= "width:100%; auto; margin-left: auto;">



			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">인원수</th>
						<th scope="col">예약날짜</th>
						<th scope="col">예약확인</th>
						<th scope="col">예약현황</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var='ReserveVO' items='${lastReserveList}'>
						<tr>
							<td>${ReserveVO.user_name}</td>
							<td>${ReserveVO.user_phoneNum}</td>
							<td>${ReserveVO.reserve_personnel}</td>
							<td>${ReserveVO.reserve_datetime}</td>
							<td>${ReserveVO.reserve_comfirmation}</td>
							<td>${ReserveVO.reserve_yn}</td>



						</tr>
					</c:forEach>
				</tbody>
			</table>




</div>
</div>
</div>






</body>
</html>