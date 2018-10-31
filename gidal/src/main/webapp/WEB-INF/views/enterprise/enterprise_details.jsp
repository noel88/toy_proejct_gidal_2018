<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import= "org.gidal.enterprise.domain.EnterpriseVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>



<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=yglvoY5wuWlYxRRuFuXP&submodules=geocoder"></script>
<!-- <script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script> -->

	<!-- Fuentes de Google -->
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
	<!-- Iconos -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>


	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">

			<table class="table" style = " margin-top : 50px; margin-left: auto; margin-right: auto;">


			<tr>
				<td colspan="3" style="text-align: center;"><h2><small class="text-muted">[${enterpriseVO.enterprise_sectors}]</small> ${enterpriseVO.enterprise_businessName}</h2>
				총 예약 ${total_reserve_cnt}건 웨이팅 ${total_waiting_cnt}건 리뷰 ${total_review_cnt}건</td>
			</tr>
			<tr>
				<td style="width: 20%; height: 10px;">별점</td>
				<td style="width: 30%;">${enterpriseVO.aver}점</td>
				<td rowspan="6"><img class="d-block w-100" src = "<spring:url value ='/image/${enterpriseVO.enterprise_mainImg}'/>" style=" vertical-align: middle"></td>
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

		<div style=" margin-left : auto; margin-right : auto;">
			<ul class="nav nav-tabs">
				<li class="nav-item">
				<a class="nav-link active show" data-toggle="tab" href="#map">지도</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#review">리뷰</a>
				</li>
			</ul>

				<div id="myTabContent" class="tab-content">

					<div class="tab-pane fade active show" id="map">
						<div id="map" style="width:100%;height:400px;"></div>
					</div>

					<div class="tab-pane fade show" id="review">

					<c:if test ="${review == null}">

						<h5 style="text-align: center; margin-top: 30px;">등록된 리뷰가 없습니다.</h5>
					</c:if>


					<table class="table" style = " margin-top : 50px; margin-left: auto; margin-right: auto;">
					<c:forEach items="${review}" var="re">
						<tr>
							<td colspan="2">
								<div class="comment-main-level">
									<!-- Contenedor del Comentario -->
									<div class="comment-box">
										<div class="comment-head">
											<h6>${re.user_email} <small class="text-muted">[별점${re.review_scope}점]</small></h6>
										</div>
										<div class="comment-content">
											${re.review_text}
										</div>
									</div>
								</div>
							</td>
						</tr>

					<c:if test ="${fn:length(re.enterprise_text) != 0}">
						<tr>
							<td>
								&nbsp;&nbsp;&nbsp;
							</td>
							<td>

								<!-- Respuestas de los comentarios -->
								<ul class="comments-list reply-list">
									<li>
										<!-- Contenedor del Comentario -->
										<div class="comment-box">
											<div class="comment-head">
												<h6>${enterpriseVO.enterprise_businessName}</h6>
											</div>
											<div class="comment-content">
												${re.enterprise_text}
											</div>
										</div>
									</li>
										</ul>

							</td>
						</tr>
						</c:if>
					</c:forEach>
					</table>

			</div>
		</div>
	</div>
</div>
</div>

<script>


					var map = new naver.maps.Map("map", {
					    center: new naver.maps.LatLng(37.3595316, 127.1052133),
					    zoom: 10,
					    mapTypeControl: true
					});

					var infoWindow = new naver.maps.InfoWindow({
					    anchorSkew: true
					});

					map.setCursor('pointer');

					// search by tm128 coordinate
					function searchCoordinateToAddress(latlng) {
					    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

					    infoWindow.close();

					    naver.maps.Service.reverseGeocode({
					        location: tm128,
					        coordType: naver.maps.Service.CoordType.TM128
					    }, function(status, response) {
					        if (status === naver.maps.Service.Status.ERROR) {
					            return alert('Something Wrong!');
					        }

					        var items = response.result.items,
					            htmlAddresses = [];

					        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
					            item = items[i];
					            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

					            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
					        }

					        infoWindow.setContent([
					                '<div style="padding:10px;min-width:200px;line-height:150%;">',
					                '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
					                htmlAddresses.join('<br />'),
					                '</div>'
					            ].join('\n'));

					        infoWindow.open(map, latlng);
					    });
					}

					// result by latlng coordinate
					function searchAddressToCoordinate(address) {
					    naver.maps.Service.geocode({
					        address: address
					    }, function(status, response) {
					        if (status === naver.maps.Service.Status.ERROR) {
					            return alert('Something Wrong!');
					        }

					        var item = response.result.items[0],
					            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
					            point = new naver.maps.Point(item.point.x, item.point.y);

					        infoWindow.setContent([
					                '<div style="padding:10px;min-width:200px;line-height:150%;">',
					                '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
					                addrType +' '+ item.address +'<br />',
					                '</div>'
					            ].join('\n'));


					        map.setCenter(point);
					        infoWindow.open(map, point);
					    });
					}

					function initGeocoder() {
					    map.addListener('click', function(e) {
					        searchCoordinateToAddress(e.coord);
					    });

					    $('#address').on('keydown', function(e) {
					        var keyCode = e.which;

					        if (keyCode === 13) { // Enter Key
					            searchAddressToCoordinate($('#address').val());
					        }
					    });

					    $('#submit').on('click', function(e) {
					        e.preventDefault();

					        searchAddressToCoordinate($('#address').val());
					    });
					    <c:set var="tempName" value="${enterpriseVO.enterprise_add2} / ${enterpriseVO.enterprise_add3}" />
					    searchAddressToCoordinate('${enterpriseVO.enterprise_add2}');
					}

					naver.maps.onJSContentLoaded = initGeocoder;
					</script>





</body>
</html>

