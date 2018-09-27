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
			<h1>이벤트 삭제</h1>

			<hr class="my-4">

			<div class="card mb-3">
				<form method = "post">
					<input type = "hidden" name = "state" value = "${ state }" />
					<input type = "hidden" name = "event_no" value = "${ eventVO.event_no }" />
					<h3 class="card-header">${eventVO.event_title}</h3>
					<div class="card-body">
						<h5 class="card-title">이벤트기간</h5>
						<h6 class="card-subtitle text-muted">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${eventVO.event_startDate}" />
							&nbsp;-&nbsp;
							<fmt:formatDate pattern="yyyy-MM-dd" value="${eventVO.event_endDate}" />
						</h6>
					</div>
					<c:if test = "${eventVO.event_image != null}">
						<img style="height: auto; width: 100%; display: block;"
							src="/upload/${eventVO.event_image}" alt="Card image">
					</c:if>
					<div class="card-body">
						<p class="card-text">${eventVO.event_content}</p>
					</div>
					<div class="card-footer text-muted" align="center">
						<p>
							<label class="col-form-label" for="inputDefault">삭제하시려면 관리자 패스워드 입력</label>
							<input type="password" class="form-control"	name = "password" placeholder="관리자 패스워드" id="inputDefault">
						</p>
						<p>
							<button type="submit" class="btn btn-primary btn-lg btn-block" formaction = "eventDeleteExcute">이벤트 삭제</button>
						</p>
						<p>
							<button type="button" class="btn btn-primary btn-lg btn-block" onclick="history.back()">뒤로가기</button>
						</p>
					</div>
				</form>
			</div>
		</div>

	</div>
	
</body>
</html>