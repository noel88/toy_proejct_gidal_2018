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
			<h1>로그인</h1>

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

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form action = "#" method = "post">
					<p>
						<label class="col-form-label" for="inputDefault">이메일</label>
						<input type="email" class="form-control" placeholder="이메일" id="inputDefault">
						<label class="col-form-label" for="inputDefault">패스워드</label>
						<input type="text" class="form-control"	placeholder="패스워드" id="inputDefault">
					</p>
					<p>
						<button type="button" class="btn btn-primary btn-lg btn-block">로그인</button>
					</p>
					<p>
						<button type="button" class="btn btn-primary btn-lg btn-block">비밀번호 재발급</button>
					</p>
				</form>
			</div>

		</div>

	</div>

</body>
</html>