<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

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
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="<%= request.getContextPath() %>/resources/img/event/event1.png" alt="첫번째 슬라이드">
						<div class="carousel-caption d-none d-md-block">
							<h3 style="color: black;">첫번째 캡션</h3>
							<p style="color: black;">두번째 캡션</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="<%= request.getContextPath() %>/resources/img/event/event2.png" alt="두번째 슬라이드">
						<div class="carousel-caption d-none d-md-block">
							<h3 style="color: black;">첫번째 캡션</h3>
							<p style="color: black;">두번째 캡션</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="<%= request.getContextPath() %>/resources/img/event/event3.png" alt="세번째 슬라이드">
						<div class="carousel-caption d-none d-md-block">
							<h3 style="color: black;">첫번째 캡션</h3>
							<p style="color: black;">두번째 캡션</p>
						</div>
					</div>
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



			<div class="row" style="margin : auto;">
				<div class="card mb-3" style="width: 300px; margin: 10px 5px;">
					<h3 class="card-header">우설화</h3>
					<div class="card-body">
						<h5 class="card-title">평점 : 10.0</h5>
						<h6 class="card-subtitle text-muted">경기도 수원시 영통구</h6>
					</div>
					<img style="height: 200px; width: 100%; display: block;"
						src="<%= request.getContextPath() %>/resources/img/company/USeolhwa.jpg"
						alt="Card image">
					<div class="card-body" style = "text-align : center;">
						<a class="btn btn-primary btn-lg" href="#" role="button">예약</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-lg" href="#" role="button">웨이팅</a>
					</div>
				</div>

				<div class="card mb-3" style="width: 300px; margin: 10px 5px;">
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
			</div>
		</div>

	</div>

</body>
</html>