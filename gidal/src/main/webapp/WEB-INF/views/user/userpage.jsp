<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

<style>
 .table td {
 	padding : 0.65rem;
 	vertical-align : middle;
 }
</style>

</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">

			<h1 style="margin-top: 30px;">유저페이지</h1>

			<div style="margin-left: auto; margin-right: auto;">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active show" data-toggle="tab" href="#update">비밀번호변경</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#delete">유저탈퇴</a>
					</li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<!-- 유저정보 수정 페이지 -->
					<div class="tab-pane fade active show" id="update">

						<%@ include file="/WEB-INF/views/user/userRevise.jsp"%>

						<hr class="my-4">
					</div>

					<!-- 유저 탈퇴 페이지 -->
					<div class="tab-pane fade show" id="delete">

						<%@ include file="/WEB-INF/views/user/userDelete.jsp"%>
						<hr class="my-4">
					</div>

				</div>
			</div>



		</div>
	</div>

</body>
</html>