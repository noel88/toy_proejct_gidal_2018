<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기달</title>
<%@ include file = "/WEB-INF/views/include/head.jsp" %>
</head>
<body>

	<form action = "userReview" method = "post">
		<input type="hidden"  name="enterprise_code" value="${ content.enterprise_code}" >
		<div class="card mb-3">
			<h3 class="card-header">
				<c:choose>
					<c:when test="${ rwDiv eq 'R' }">
						예약리뷰 등록				
						<input type="hidden"  name="reserveAndWaiting_code" value="${ rwDiv}_${ content.reserve_code }" >
					</c:when>
					<c:otherwise>
						웨이팅리뷰 등록
						<input type="hidden"  name="reserveAndWaiting_code" value="${ rwDiv }_${ content.waiting_code }" >
					</c:otherwise>
				</c:choose>
			</h3>
			<div class="card-body">
				<h5 class="card-title">업체명 : ${ enterprise_businessName }</h5>
				<c:choose>
					<c:when test="${ rwDiv eq 'R' }">
						<h6 class="card-subtitle text-muted">예약시간 : ${ content.reserve_date }/${ content.reserve_time }</h6>
						<p />
						<h6 class="card-subtitle text-muted">예약인원 : ${ content.reserve_personnel }명</h6>
					</c:when>
					<c:otherwise>
						<c:set var = "dot" value = "${ fn:indexOf(content.waiting_now, '.') }"></c:set>
						<c:set var = "time" value = "${ fn:substring(content.waiting_now, 0, dot)}"></c:set>
						<h6 class="card-subtitle text-muted">웨이팅시간 : ${ time }</h6>
						<p />
						<h6 class="card-subtitle text-muted">웨이팅인원 : ${ content.waiting_personnel }명</h6>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="card-body">
				<p class="card-text">
					<select class="custom-select" name = "review_scope">
						<option value="0">☆☆☆☆☆</option>
						<option value="1">★☆☆☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="3">★★★☆☆</option>
						<option value="4">★★★★☆</option>
						<option value="5">★★★★★</option>
					</select>
				</p>
				<p>
					<textarea class="form-control" name = "review_text" placeholder="리뷰 내용" id="inputDefault" rows = "5" style="resize: none;"></textarea>
				</p>
			</div>
			<div class="card-footer text-muted">
				<button type="submit" class="form-control btn btn-primary">리뷰 등록</button>
			</div>
		</div>
	</form>

</body>
</html>