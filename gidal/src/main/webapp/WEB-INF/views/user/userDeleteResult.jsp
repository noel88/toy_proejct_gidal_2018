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
			<h1>탈퇴 완료</h1>

			<hr class="my-4">

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<p>탈퇴가 완료되었습니다.</p>
				<p>이용해주셔서 감사합니다.</p>
				<a href = "/" style = "text-decoration : none;">
					<button type="button" class="btn btn-primary btn-lg btn-block">
						메인페이지로 가기
						
					</button>
				</a>
			</div>

		</div>

	</div>

</body>
</html>