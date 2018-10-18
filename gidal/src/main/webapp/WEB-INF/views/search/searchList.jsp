<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>검색결과</h1>

			<hr class="my-4">

			<div style = "max-width: 780px;	margin: 0 auto;	text-align: center;	padding-bottom: 50px;">
				<c:if test="${ fn:length(list) == 0 }">
					<p class="lead">검색결과가 없습니다.</p>
				</c:if>
				<c:forEach items="${list}" var="EnterpriseVO">
					<table class="lists__item js-load" style="margin-top: 50px; margin-left: auto; margin-right: auto;">
						<tr>
							<td rowspan="5">
								<img src="../upload/${EnterpriseVO.enterprise_mainImg}" style="margin: auto; height: 200px; width: 350px;">
							</td>
							<!-- 메인이미지  -->
							<td rowspan="5">&nbsp;&nbsp;</td>
							<!-- 메인이미지  -->
						</tr>
						<tr>
							<td colspan="2">
								<h5 style="text-align: left;">
									Restaurant Name <small class="text-muted">${EnterpriseVO.enterprise_businessName}</small>
								</h5>
							</td>
							<!--  식당명 -->
						</tr>

						<tr>
							<td colspan="2">
								<h5 style="text-align: left;">
									Restaurant Address <small class="text-muted">${EnterpriseVO.enterprise_add2}</small>
								</h5>
							</td>
							<!-- 도로명주소  -->
						</tr>
						<tr>
							<td colspan="2">
								<h5 style="text-align: left;">
									Restaurant Sectors <small class="text-muted">${EnterpriseVO.enterprise_sectors}</small>
								</h5>
							</td>
							<!-- 업종  -->
						</tr>

						<!-- 식당정보를 가지고 넘어가야함. Details페이지 개념  -->

						<c:choose>
							<c:when test="${EnterpriseVO.enterprise_service == '1'}">
								<tr>
									<td colspan="2" style="float: left;">&nbsp;&nbsp;&nbsp;
										<a href="/waiting/waiting?enterprise_code=${EnterpriseVO.enterprise_code}">
											<button type="button" class="btn btn-primary">웨이팅</button>
										</a>
									</td>
								<tr>
							</c:when>
							<c:when test="${EnterpriseVO.enterprise_service == '2'}">
								<tr>
									<td colspan="2" style="float: left;">&nbsp;&nbsp;&nbsp;
										<a href="/reserve/reserve?enterprise_code=${EnterpriseVO.enterprise_code}">
											<button type="button" class="btn btn-primary">예약</button>
										</a>
									</td>
								</tr>
							</c:when>

							<c:otherwise>
								<tr>
									<td colspan="2">&nbsp;&nbsp;&nbsp;
										<a href="/waiting/waiting?enterprise_code=${EnterpriseVO.enterprise_code}">
											<button type="button" class="btn btn-primary">웨이팅</button>
										</a>
										<a href="/reserve/reserve?enterprise_code=${EnterpriseVO.enterprise_code}">
											<button type="button" class="btn btn-primary">예약</button>
										</a>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>