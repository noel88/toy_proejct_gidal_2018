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
			<h1>로그인 실패</h1>

			<hr class="my-4">

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<p class="lead">이메일 또는 비밀번호를 확인해주세요.</p>
				<a href = "/authentication/signIn" style = "text-decoration : none;">
					<button type="button" class="btn btn-primary btn-lg btn-block">
						로그인 페이지로 돌아가기
						
					</button>
				</a>
			</div>
		</div>
	</div>

</body>
</html>