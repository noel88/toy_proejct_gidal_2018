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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

</head>
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>


	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">

<table class="table" style = " margin-top : 50px; margin-left: auto; margin-right: auto; ">



  			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="../upload/${enterpriseVO.enterprise_mainImg}" style="height : 450px;" alt="첫번째 슬라이드">
						<div class="carousel-caption d-none d-md-block">

						</div>
					</div>
		<c:choose>
				<c:when test = "${enterpriseVO.enterprise_img1 != null}">
					<div class="carousel-item">
						<img class="d-block w-100" src="../upload/${enterpriseVO.enterprise_img1}" style="height : 450px;" alt="두번째 슬라이드">
						<div class="carousel-caption d-none d-md-block">
						</div>
					</div>
  				</c:when>
			    <c:when test = "${enterpriseVO.enterprise_img2 != null}">
					<div class="carousel-item">
						<img class="d-block w-100" src="../upload/${enterpriseVO.enterprise_img2}" style="height : 450px;" alt="세번째 슬라이드">
						<div class="carousel-caption d-none d-md-block">

						</div>
					</div>

			    </c:when>

	 		   <c:when test = "${enterpriseVO.enterprise_img3 != null}">
					<div class="carousel-item">
						<img class="d-block w-100" src="../upload/${enterpriseVO.enterprise_img3}" style="height : 450px;" alt="네번째 슬라이드">
						<div class="carousel-caption d-none d-md-block">

						</div>
					</div>
				</c:when>
				<c:when test = "${enterpriseVO.enterprise_img4 != null}">
					<div class="carousel-item">
						<img class="d-block w-100" src="../upload/${enterpriseVO.enterprise_img4}" style="height : 450px;" alt="다섯번째 슬라이드">
						<div class="carousel-caption d-none d-md-block">

						</div>
					</div>
					</c:when>
					</c:choose>
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


		<tr>
			<td rowspan="8" style="width: 40%;">

<fieldset>
    <legend><i class="fas fa-clock"></i>&nbsp;웨이팅 현황 [${count}명 대기중]</legend>

<div style="overflow:auto; height:150px;">
    <c:forEach items = "${list}" var = "WaitingVO">
		<c:set var= "cnt" value="${cnt + 1}"/>
		<fmt:formatNumber var="cnt" minIntegerDigits="2" value="${cnt}" type="number"/>
		[<c:out value="${cnt}"/>]<b><c:out value='${fn:substring(WaitingVO.waiting_now, 10, 19)}'/></b> ${WaitingVO.user_name} ${WaitingVO.waiting_personnel}명&nbsp;<i class="fas fa-history"></i>
	<br>
  	</c:forEach>
</div>

    </fieldset>
<hr>


<form action="waiting_insert">
  <fieldset>
    <legend>웨이팅하기</legend>

	<input type = "hidden" name = "enterprise_code" value = "${enterpriseVO.enterprise_code}">

    <div class="form-group">
      <label for="exampleSelect1">인원수</label>
      <select class="form-control" id="exampleSelect1" name = "waiting_personnel">
        <option value = "1">1</option>
        <option value = "2">2</option>
        <option value = "3">3</option>
        <option value = "4">4</option>
        <option value = "5">5</option>
        <option value = "6">6</option>
        <option value = "7">7</option>
        <option value = "8">8</option>
        <option value = "9">9</option>
        <option value = "10">10명이상</option>
      </select>
    </div>


    <div class="form-group">
      <label for="exampleInputEmail1">이름</label>
      <input type="text" class="form-control" id="exampleInputEmail1" name = "user_name" readonly="readonly" value = "${sessionScope.user.user_name}">

    </div>

    <div class="form-group">
      <label for="exampleInputEmail1">휴대폰번호</label>
      <input type="text" class="form-control" id="exampleInputEmail1" name = "user_phoneNum" readonly="readonly" value = "${sessionScope.user.user_phoneNum}">

    </div>


    <button type="submit" class="btn btn-primary"><i class="fas fa-arrow-right">&nbsp;웨이팅하기</i></button>
  </fieldset>
</form>


			</td>

<td rowspan="8" style="width: 5%;"></td>


		</tr>
			<tr>
		      <td>
		      	<h5><!--  식당명 -->
					  <i class="fas fa-check">&nbsp;Restaurant Name</i> <br>
					  <small class="text-muted">${enterpriseVO.enterprise_businessName}</small>
				</h5>
				</td>
		    </tr>
  			<tr>
		      <td>
		      	<h5><!-- 연락처  -->
					  <i class="fas fa-check">&nbsp;Restaurant Phone</i> <br>
					  <small class="text-muted">${enterpriseVO.enterprise_phone}</small>
				</h5>
		      </td>
		    </tr>

  			<tr>
		      <td>
		      	<h5> <!-- 엄종  -->
					   <i class="fas fa-check">&nbsp;Restaurant Sectors</i> <br>

					  <small class="text-muted">${enterpriseVO.enterprise_sectors}</small>
				</h5>
		      </td>
		    </tr>

  			<tr>
		      <td>
		      	<h5> <!-- 도로명주소(상세주소 포함)  -->
					  <i class="fas fa-check">&nbsp;Restaurant Address </i><br>
					  <small class="text-muted">${enterpriseVO.enterprise_add2}, ${enterpriseVO.enterprise_add3}</small>
				</h5>
		      </td>
		    </tr>
  			<tr>
		      <td>
		      	<h5><!-- 영업시간  -->
					  <i class="fas fa-check">&nbsp;Restaurant Time </i><br>
					  <small class="text-muted">${enterpriseVO.enterprise_operatingOpenTime} ~ ${enterpriseVO.enterprise_operatingCloseTime}</small>
				</h5>
		      </td>
		    </tr>
  			 <tr>
		      <td>
		      	<h5><!-- 브레이크 타임  -->
					  <i class="fas fa-check">&nbsp;Restaurant Break Time</i> <br>
					  <small class="text-muted">${enterpriseVO.enterprise_breakStartTime} ~ ${enterpriseVO.enterprise_breakCloseTime}</small>
				</h5>
		      </td>
		    </tr>

<%--   			<tr>
		      <td>
		      	<h5> <!-- 휴무일  -->
					  Restaurant Closed <br>
					  <small class="text-muted"><c:out value="${fn:replace(enterpriseVO.enterprise_closed, ' ', ', ')}"/> 휴무</small>
				</h5>
		      </td>
		    </tr> --%>



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
					    <c:set var="address" value="${enterpriseVO.enterprise_add2} / ${enterpriseVO.enterprise_add3}"/>
					    searchAddressToCoordinate('${enterpriseVO.enterprise_add2}');
					}

					naver.maps.onJSContentLoaded = initGeocoder;
					</script>
</body>
</html>

