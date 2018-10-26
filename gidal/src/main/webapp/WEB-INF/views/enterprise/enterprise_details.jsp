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

<style class="cp-pen-styles">/**
 * Oscuro: #283035
 * Azul: #03658c
 * Detalle: #c7cacb
 * Fondo: #dee1e3
 ----------------------------------*/
 * {
 	margin: 0;
 	padding: 0;
 	-webkit-box-sizing: border-box;
 	-moz-box-sizing: border-box;
 	box-sizing: border-box;
 }

 a {
 	color: #03658c;
 	text-decoration: none;
 }

ul {
	list-style-type: none;
}

body {
	font-family: 'Roboto', Arial, Helvetica, Sans-serif, Verdana;
	background: #dee1e3;
}

/** ====================
 * Lista de Comentarios
 =======================*/
.comments-container {
	margin: 60px auto 15px;
	width: 768px;
}

.comments-container h1 {
	font-size: 36px;
	color: #283035;
	font-weight: 400;
}

.comments-container h1 a {
	font-size: 18px;
	font-weight: 700;
}

.comments-list {
	margin-top: 30px;
	position: relative;
}

/**
 * Lineas / Detalles
 -----------------------*/
.comments-list:before {
	content: '';
	width: 2px;
	height: 100%;
	background: #c7cacb;
	position: absolute;
	left: 32px;
	top: 0;
}

.comments-list:after {
	content: '';
	position: absolute;
	background: #c7cacb;
	bottom: 0;
	left: 27px;
	width: 7px;
	height: 7px;
	border: 3px solid #dee1e3;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
}

.reply-list:before, .reply-list:after {display: none;}
.reply-list li:before {
	content: '';
	width: 60px;
	height: 2px;
	background: #c7cacb;
	position: absolute;
	top: 25px;
	left: -55px;
}


.comments-list li {
	margin-bottom: 15px;
	display: block;
	position: relative;
}

.comments-list li:after {
	content: '';
	display: block;
	clear: both;
	height: 0;
	width: 0;
}

.reply-list {
	padding-left: 88px;
	clear: both;
	margin-top: 15px;
}
/**
 * Avatar
 ---------------------------*/
.comments-list .comment-avatar {
	width: 65px;
	height: 65px;
	position: relative;
	z-index: 99;
	float: left;
	border: 3px solid #FFF;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	overflow: hidden;
}


.reply-list .comment-avatar {
	width: 50px;
	height: 50px;
}

.comment-main-level:after {
	content: '';
	width: 0;
	height: 0;
	display: block;
	clear: both;
}
/**
 * Caja del Comentario
 ---------------------------*/
.comments-list .comment-box {
	width: 680px;
	float: right;
	position: relative;
	-webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	-moz-box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	box-shadow: 0 1px 1px rgba(0,0,0,0.15);
}

.comments-list .comment-box:before, .comments-list .comment-box:after {
	content: '';
	height: 0;
	width: 0;
	position: absolute;
	display: block;
 	border-width: 10px 12px 10px 0;
	border-style: solid;
	border-color: transparent #FCFCFC;
	top: 8px;
	left: -11px;
}

.comments-list .comment-box:before {
	border-width: 11px 13px 11px 0;
	border-color: transparent rgba(0,0,0,0.05);
	left: -12px;
}

.reply-list .comment-box {
	width: 600px;
}
.comment-box .comment-head {
	background: #FCFCFC;
	padding: 10px 12px;
	border-bottom: 1px solid #E5E5E5;
	overflow: hidden;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
}

.comment-box .comment-head i {
	float: right;
	margin-left: 14px;
	position: relative;
	top: 2px;
	color: #A6A6A6;
	cursor: pointer;
	-webkit-transition: color 0.3s ease;
	-o-transition: color 0.3s ease;
	transition: color 0.3s ease;
}

.comment-box .comment-head i:hover {
	color: #03658c;
}

.comment-box .comment-name {
	color: #283035;
	font-size: 14px;
	font-weight: 700;
	float: left;
	margin-right: 10px;
}

.comment-box .comment-name a {
	color: #283035;
}

.comment-box .comment-head span {
	float: left;
	color: #999;
	font-size: 13px;
	position: relative;
	top: 1px;
}

.comment-box .comment-content {
	background: #FFF;
	padding: 12px;
	font-size: 15px;
	color: #595959;
	-webkit-border-radius: 0 0 4px 4px;
	-moz-border-radius: 0 0 4px 4px;
	border-radius: 0 0 4px 4px;
}

.comment-box .comment-name.by-author, .comment-box .comment-name.by-author a {color: #03658c;}
.comment-box .comment-name.by-author:after {
	content: 'autor';
	background: #03658c;
	color: #FFF;
	font-size: 12px;
	padding: 3px 5px;
	font-weight: 700;
	margin-left: 10px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

/** =====================
 * Responsive
 ========================*/
@media only screen and (max-width: 500px) {
	.comments-container {
		 width: 30%;
	}

	.comments-list .comment-box {
		width: 50%;
	}

	.reply-list .comment-box {
		 width: 30%;
	}
}
</style>
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
				<td style="width: 30%;">${enterpriseVO.review_scope}점</td>
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
							<td>
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

