<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

</head>
<body>

<%@ include file = "/WEB-INF/views/include/enter_page_nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">

	<c:choose>
		<c:when test="${enterpriseVO == null}">
			<h4>사장님 식당 정보를 등록해주세요!</h4>
		</c:when>
		<c:otherwise>
	<p style="text-align: center; float: right;">확인해야할 예약 사항 ${reserve_listCheck_cnt}건</p>
	<div style= "width:100%; auto; margin-left: auto;">


	<table class="table" style = " margin-top : 10px; margin-left: auto; margin-right: auto;">

	<tr>
		<td colspan="3" style="text-align: center;"><h2><small class="text-muted">[${enterpriseVO.enterprise_sectors}]</small> ${enterpriseVO.enterprise_businessName}</h2>
		총 예약 ${total_reserve_cnt}건 웨이팅 ${total_waiting_cnt}건 리뷰 ${total_review_cnt}건</td>
	</tr>
	<tr>
		<td style="width: 20%; height: 10px;">별점</td>
		<td style="width: 30%;">${enterpriseVO.review_scope}점</td>
		<td rowspan="6"><img class="d-block w-100" src = "<spring:url value ='/image/${enterpriseVO.enterprise_mainImg}'/>" style="height : 350px;"></td>
	</tr>
	<tr>
		<td style="height: 10px;">전화번호</td>
		<td>${enterpriseVO.enterprise_phone}</td>
	</tr>
	<tr>
		<td style="height: 10px;">주소</td>
		<td>${enterpriseVO.enterprise_add2}, ${enterpriseVO.enterprise_add3}</td>
	</tr>
	<tr>
		<td style="height: 10px;">영업시간</td>
		<td>${enterpriseVO.enterprise_operatingOpenTime} ~ ${enterpriseVO.enterprise_operatingCloseTime}</td>
	</tr>


	</table>


			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col" colspan="5">금일 예약자 목록</th>
					</tr>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">인원수</th>
						<th scope="col">예약날짜</th>
						<th scope="col">예약시간</th>


					</tr>
				</thead>
				<tbody>
					<c:forEach var='ReserveVO' items='${reserveNowList}'>
						<tr>
							<td>${ReserveVO.user_name}</td>
							<td>${ReserveVO.user_phoneNum}</td>
							<td>${ReserveVO.reserve_personnel}</td>
							<td>${ReserveVO.reserve_date}</td>
							<td>${ReserveVO.reserve_time}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col" colspan="4">현재 대기 목록</th>
					</tr>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">인원수</th>
						<th scope="col">시간</th>


					</tr>
				</thead>
				<tbody>
					<c:forEach items="${waitingList}" var="w">
						<tr>
							<td>${w.user_name}</td>
							<td>${w.user_phoneNum}</td>
							<td>${w.waiting_personnel}</td>
							<td><c:out value='${fn:substring(w.waiting_now, 10, 19)}'/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

</div>
		</c:otherwise>
	</c:choose>


	</div>
	</div>




</body>
</html>