<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:400,900,700,600,500,300,200,100,800);

section{
    padding:60px 0px;
    font-family: 'Raleway', sans-serif;
}

h2 {
    color: #4C4C4C;
    word-spacing: 5px;
    font-size: 30px;
    font-weight: 700;
    margin-bottom:30px;
    font-family: 'Raleway', sans-serif;
}

.ion-minus{
    padding:0px 10px;
}

.blog{
	/* background-color:#f6f6f6; */
}

.blog .card {
    background-color: #FFF;
    border: 1px solid #eceaea;
    margin: 20px 0px;
}

.blog .card-block {
    padding: 15px;
}

.btn.btn-default {
    background-color: #EB6864;
    color: #fff;
    border-radius: 0;
    border: none;
    padding: 13px 20px;
    font-size: 13px;
    font-weight: 600;
    margin-top: 10px;
}
</style>
<style>
	#eventImage {
		height : 350px;
	}
</style>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<c:choose>
		<c:when test="${ LEVEL eq 'enterprise' }">
			<%@ include file="/WEB-INF/views/include/navEnterprise.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/include/nav.jsp"%>
		</c:otherwise>
	</c:choose>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
<c:if test = "${ LEVEL eq 'user' }">
<div class="alert alert-dismissible alert-warning">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <h4 class="alert-heading">잠깐!</h4>
  <p class="mb-0">예약현황과 웨이팅 순서를 기다리시는 분들은 상단 우측 메뉴 '알림' 을 확인해주세요</p>
</div>
</c:if>

			<h1>이벤트</h1>

			<hr class="my-4">

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

			<br />
			<h1>인기업체</h1>

			<hr class="my-4">
			<div class="blog">
		      <div class="container">

		           <div class="row" style="clear: both;">
						<c:forEach items = "${ent}" var = "EnterpriseVO">

							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" data-aos="fade-right">
								 <div class="card text-center">
			                        <a href = "/enterprise/enterprise_details?enterprise_code=${EnterpriseVO.enterprise_code}"><img class="card-img-top" src="<spring:url value ='/image/${EnterpriseVO.enterprise_mainImg}'/>" alt="" height="200px;" width="100%"></a>
			                        <div class="card-block">
			                            <p class="card-text"><small class="text-muted" style="float: left"><b>[${EnterpriseVO.enterprise_sectors}]</b></small>
			                            <small class="text-muted" style="float: right"><b>별점 ${EnterpriseVO.aver}점</b></small>
			                            </p>
			                            <h5 class="card-title" style = "clear: both;">${EnterpriseVO.enterprise_businessName}</h5>
			                            <p class="card-text"><small class="text-muted"><c:out value='${fn:substring(EnterpriseVO.enterprise_add2,0, 15)}' /></small></p>
			                            <c:choose>
										<c:when test = "${ LEVEL eq 'user' }">
			                             <button class="btn btn-default" <c:if test = "${EnterpriseVO.enterprise_service == '1'}"> disabled = 'disabled' </c:if> onclick="window.open('/reserve/reserve?enterprise_code=${EnterpriseVO.enterprise_code}','','width=600,height=400,top=250,left=350,location=no,status=no,scrollbars=no');">예약하기</button>
			                             <button class="btn btn-default" <c:if test = "${EnterpriseVO.enterprise_service == '2'}"> disabled = 'disabled' </c:if> onclick="window.open('/waiting/waiting?enterprise_code=${EnterpriseVO.enterprise_code}','','width=600,height=400,top=250,left=350,location=no,status=no,scrollbars=no');">웨이팅하기</button>
										</c:when>
			                        	</c:choose>


			                        </div>
			                     </div>
			                </div>
						</c:forEach>
					</div>
				</div>



			</div>
		</div>

	</div>

</body>
</html>