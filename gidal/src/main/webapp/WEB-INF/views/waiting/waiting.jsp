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



</head>
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<form action="waiting_insert">
	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">

<table class="table" style = " margin-top : 50px; margin-left: auto; margin-right: auto; ">



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


    <button type="submit" class="btn btn-primary">웨이팅하기</button>
  </fieldset>
</form>







			</td>

<td rowspan="8" style="width: 10%;"></td>


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
  			 <tr>
		      <td>
		      	<h5><!-- 브레이크 타임  -->
					  Restaurant Break Time <br>
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
		</div>

	</div>

</body>
</html>

