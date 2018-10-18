<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<style>
	#eventImage {
		height : 350px;
	}
</style>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>홈화면</h1>

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

			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<c:forEach var = "list" begin = "0" end = "${ eventList.size() - 1 }" step = "1">
						<c:choose>
							<c:when test="${ list eq 0 }">
								<li data-target="#carouselExampleIndicators" data-slide-to="${ list }" class="active"></li>
							</c:when>
							<c:otherwise>
								<li data-target="#carouselExampleIndicators" data-slide-to="${ list }"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ol>

				<c:set var = "i" value = "1"></c:set>
				<div class="carousel-inner">
					<c:forEach items="${eventList}" var="eventVO">
						<c:choose>
							<c:when test="${ i eq 1 }">
								<div class="carousel-item active">
									<c:choose>
										<c:when test="${ eventVO.event_image eq null }">
											<a href="/event/detailEvent?event_no=${eventVO.event_no}&state=current&page=1">
												<img id = "eventImage" class="d-block w-100" src="/resources/img/event/noimage.png" alt="${ i }번째 슬라이드">
											</a>
										</c:when>
										<c:otherwise>
											<a href="/event/detailEvent?event_no=${eventVO.event_no}&state=current&page=1">
												<img id = "eventImage" class="d-block w-100" src="/upload/event/${ eventVO.event_image }" alt="${ i }번째 슬라이드">
											</a>
										</c:otherwise>
									</c:choose>
									<%-- <div class="carousel-caption d-none d-md-block">
										<h3 style="color: black;">${ eventVO.event_title }</h3>
										<p style="color: black;">${ eventVO.event_startDate }&nbsp;-&nbsp;${ eventVO.event_endDate }</p>
									</div> --%>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item">
									<c:choose>
										<c:when test="${ eventVO.event_image eq null }">
											<a href="/event/detailEvent?event_no=${eventVO.event_no}&state=current&page=1">
												<img id = "eventImage" class="d-block w-100" src="/resources/img/event/noimage.png" alt="${ i }번째 슬라이드">
											</a>
										</c:when>
										<c:otherwise>
											<a href="/event/detailEvent?event_no=${eventVO.event_no}&state=current&page=1">
												<img id = "eventImage" class="d-block w-100" src="/upload/event/${ eventVO.event_image }" alt="${ i }번째 슬라이드">
											</a>
										</c:otherwise>
									</c:choose>
									<%-- <div class="carousel-caption d-none d-md-block">
										<h3 style="color: black;">${ eventVO.event_title }</h3>
										<p style="color: black;">${ eventVO.event_startDate }&nbsp;-&nbsp;${ eventVO.event_endDate }</p>
									</div> --%>
								</div>
							</c:otherwise>
						</c:choose>
						<c:set var = "i" value = "${ i + 1 }"></c:set>
					</c:forEach>
				</div>



				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">이전</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">다음</span>
				</a>
			</div>
			<div class="row" style="margin : 0 auto;">
<c:forEach items="${ent}" var = "enterprise">
				<div class="card mb-3" style="width: 300px; margin: 10px 5px;">
					<h3 class="card-header">${enterprise.enterprise_businessName}</h3>
					<div class="card-body">
						<h5 class="card-title">${enterprise.sum}</h5>
						<h6 class="card-subtitle text-muted">${enterprise.enterprise_add2}</h6>
					</div>
					<img style="height: 200px; width: 100%; display: block;"
						src="<spring:url value ='/image/${enterprise.enterprise_mainImg}'/>"
						alt="Card image">
					<div class="card-body" style = "text-align : center;">
					<c:choose>
				<c:when test = "${enterprise.enterprise_service == '1'}">
			      &nbsp;&nbsp;&nbsp;<a href = "/waiting/waiting?enterprise_code=${enterprise.enterprise_code}"  class="btn btn-primary btn-lg" role="button">웨이팅</a>
			    </c:when>
			    <c:when test = "${enterprise.enterprise_service == '2'}">
			      &nbsp;&nbsp;&nbsp;<a href = "/reserve/reserve?enterprise_code=${enterprise.enterprise_code}" class="btn btn-primary btn-lg" role="button">예약</a>
			    </c:when>

	 		     <c:otherwise>
	    		  <tr>
			      <td colspan="2">&nbsp;<a href = "/waiting/waiting?enterprise_code=${enterprise.enterprise_code}" class="btn btn-primary btn-lg" role="button">웨이팅</a>
			       <a href = "/reserve/reserve?enterprise_code=${enterprise.enterprise_code}" class="btn btn-primary btn-lg" role="button">예약</a>
	     	  	</tr>
	     		  </c:otherwise>
					</c:choose>


					</div>
				</div>
</c:forEach>

			<%-- 	<div class="card mb-3" style="width: 300px; margin: 10px 5px;">
					<h3 class="card-header">긴자</h3>
					<div class="card-body">
						<h5 class="card-title">평점 : 9.5</h5>
						<h6 class="card-subtitle text-muted">경기도 수원시 영통구</h6>
					</div>
					<img style="height: 200px; width: 100%; display: block;"
						src="<%= request.getContextPath() %>/resources/img/company/GinJa.jpg"
						alt="Card image">
					<div class="card-body" style = "text-align : center;">
						<a class="btn btn-primary btn-lg" href="#" role="button">예약</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-lg" href="#" role="button">웨이팅</a>
					</div>
				</div>

				<div class="card mb-3" style="width: 300px; margin: 10px 5px;">
					<h3 class="card-header">천지연</h3>
					<div class="card-body">
						<h5 class="card-title">평점 : 9.0</h5>
						<h6 class="card-subtitle text-muted">경기도 수원시 영통구</h6>
					</div>
					<img style="height: 200px; width: 100%; display: block;"
						src="<%= request.getContextPath() %>/resources/img/company/CheonJiyeon.jpg"
						alt="Card image">
					<div class="card-body" style = "text-align : center;">
						<a class="btn btn-primary btn-lg" href="#" role="button">예약</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-lg" href="#" role="button">웨이팅</a>
					</div>
				</div>
			</div> --%>
		</div>

	</div>

</body>
</html>