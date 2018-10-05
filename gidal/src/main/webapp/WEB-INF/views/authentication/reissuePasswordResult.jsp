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
			<h1>비밀번호 재발급 결과</h1>

			<hr class="my-4">

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<p>
					<c:choose>
						<c:when test="${ msg eq 'reissuePasswordSuccess' }">
							<p class="lead">이메일</p>
							<p>${ email }</p>
							
							<p class="lead">비밀번호</p>
							<p>${ newPassword }</p>
						</c:when>
						<c:otherwise>
							<p class="lead">비밀번호 재발급 실패.</p>
							<p class="lead">정보를 확인해주세요.</p>
						</c:otherwise>
					</c:choose>
 				</p>
				<p>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick = "location.href='/authentication/signIn'">
						로그인 페이지로 돌아가기
					</button>
				</p>
			</div>
			
		</div>

	</div>

</body>
</html>