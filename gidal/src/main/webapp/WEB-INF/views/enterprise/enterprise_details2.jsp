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

<link type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>


<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=yglvoY5wuWlYxRRuFuXP&submodules=geocoder"></script>

</head>
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>


	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">

<table class="table" style = " margin-top : 50px; margin-left: auto; margin-right: auto; ">

<tr>
	<td rowspan="1">
		<img class="d-block w-100" src = "<spring:url value ='/image/${enterpriseVO.enterprise_mainImg}'/>" style="height : 450px;">
	</td>
</tr>

			<tr>
		      <td>
		      	<h5><!--  식당명 -->
					  Restaurant Name <br>
					  <small class="text-muted">${enterpriseVO.enterprise_businessName}</small>
				</h5>
				</td>
		    </tr>
  			<tr>
		      <td>
		      	<h5><!-- 연락처  -->
					  Restaurant Phone <br>
					  <small class="text-muted">${enterpriseVO.enterprise_phone}</small>
				</h5>
		      </td>
		    </tr>

  			<tr>
		      <td>
		      	<h5> <!-- 엄종  -->
					  Restaurant Sectors <br>
					  <small class="text-muted">${enterpriseVO.enterprise_sectors}</small>
				</h5>
		      </td>
		    </tr>

  			<tr>
		      <td>
		      	<h5> <!-- 도로명주소(상세주소 포함)  -->
					  Restaurant Address <br>
					  <small class="text-muted">${enterpriseVO.enterprise_add2}, ${enterpriseVO.enterprise_add3}</small>
				</h5>
		      </td>
		    </tr>
  			<tr>
		      <td>
		      	<h5><!-- 영업시간  -->
					  Restaurant Time <br>
					  <small class="text-muted">${enterpriseVO.enterprise_operatingOpenTime} ~ ${enterpriseVO.enterprise_operatingCloseTime}</small>
				</h5>
		      </td>
		    </tr>




</table>

<table class="table" style = " margin-top : 50px; margin-left: auto; margin-right: auto; ">
	<tr>
		<td colspan="2" style="text-align: center;"><h5>리뷰목록</h5> </td>
	</tr>


	<c:forEach items="${review_reserve}" var="re">

	<tr>
		<td>예약자 이메일 : ${re.user_email}</td>
		<td style="float: right;"> 별점 : ${re.review_scope}</td>
	</tr>
	<tr>
		<td> 내용 :${re.review_text}</td>
	</tr>
	</c:forEach>

</table>


<div id="map" style="width:100%;height:400px;">
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

