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

<h1 style="margin-top: 30px;"> 기업페이지 </h1>

<div style=" margin-left : auto; margin-right : auto;">
	<ul class="nav nav-tabs">
		<li class="nav-item">
		<a class="nav-link active show" data-toggle="tab" href="#reserve">예약목록</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#waiting">웨이팅목록</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#update">기업정보수정</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#delete">기업탈퇴</a>
		</li>

	</ul>

 <div id="myTabContent" class="tab-content">
		<!-- 예약목록확인 페이지 -->
		<div class="tab-pane fade active show" id="reserve">

		 <%@ include file = "/WEB-INF/views/enterprise/enterprise_reserveList.jsp" %>
		<hr class="my-4">
		</div>
		<!-- 웨이팅 목록 확인 페이지 -->
		<div class="tab-pane fade show" id="waiting">
			<%@ include file = "/WEB-INF/views/enterprise/enterprise_waitingList.jsp" %>

		<hr class="my-4">
		</div>
		<!-- 기업정보 수정 페이지 -->
		<div class="tab-pane fade show" id="update">

			<%@ include file = "/WEB-INF/views/enterprise/enterprise_update.jsp" %>

		<hr class="my-4">
		</div>

		<!-- 기업 탈퇴 페이지 -->
		<div class="tab-pane fade show" id="delete">

			<%@ include file = "/WEB-INF/views/enterprise/enterprise_delete.jsp" %>
		<hr class="my-4">
		</div>

	</div>
	</div>



</div>
</div>

</body>
</html>