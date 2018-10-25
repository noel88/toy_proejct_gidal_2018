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

	<form action = "delete" method = "post">
		<input type = "hidden" name = "rcode" value = "${ review_content.reserveAndWaiting_code }"/>
		<div class="card mb-3">
			<h3 class="card-header">
				<c:choose>
					<c:when test="${ rwDiv eq 'R' }">
						예약리뷰 보기
					</c:when>
					<c:otherwise>
						웨이팅리뷰 보기
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
					<c:choose>
						<c:when test="${review_content.review_scope eq 0}">
							평점 : ☆☆☆☆☆
						</c:when>
						<c:when test="${review_content.review_scope eq 1}">
							평점 : ★☆☆☆☆
						</c:when>
						<c:when test="${review_content.review_scope eq 2}">
							평점 : ★★☆☆☆
						</c:when>
						<c:when test="${review_content.review_scope eq 3}">
							평점 : ★★★☆☆
						</c:when>
						<c:when test="${review_content.review_scope eq 4}">
							평점 : ★★★★☆
						</c:when>
						<c:when test="${review_content.review_scope eq 5}">
							평점 : ★★★★★
						</c:when>
					</c:choose>
				</p>
				<p>
					<p class="card-text">${review_content.review_text}</p>
				</p>
			</div>
			<c:if test="${ !empty review_content.enterprise_text }">
				<ul class="list-group list-group-flush">
				    <li class="list-group-item" style="background-color : #EB6864;color: white;">
				    	<p><b>사장님 답변</b></p>
				    	<p>${ review_content.enterprise_text }</p>
				    </li>
	  			</ul>
			</c:if>
			<div class="card-footer text-muted">
				<p>
					<button type="submit" class="form-control btn btn-primary">리뷰 삭제</button>
				</p>
				<p>
					<button type="button" class="form-control btn btn-primary" onClick="window.close();" >리뷰 닫기</button>
				</p>
			</div>
		</div>
	</form>

</body>
</html>