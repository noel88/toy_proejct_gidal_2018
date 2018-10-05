<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<script>

	function goList() {
		var url = "/event/" + "${state}" + "Event?page=" + "${page}";
		location.href = url;
	}

</script>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<c:choose>
				<c:when test = "${ state eq 'closed' }">
					<h1>종료된 이벤트</h1>
				</c:when>
				<c:when test = "${ state eq 'current' }">
					<h1>진행 중인 이벤트</h1>
				</c:when>
				<c:when test = "${ state eq 'upcoming' }">
					<h1>진행 예정 이벤트</h1>
				</c:when>
			</c:choose>
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
							src="/upload/event/${eventVO.event_image}" alt="Card image">
					</c:if>
					<div class="card-body">
						<p class="card-text">${eventVO.event_content}</p>
					</div>
					<div class="card-footer text-muted" align="center">
						<c:choose>
							<c:when test = "${ LEVEL eq 'admin' }">
								<div class="btn-group" role="group" aria-label="Basic example">
									<button type="submit" class="btn btn-secondary btn-lg" formaction = "eventModify">수&nbsp;&nbsp;정</button>
									<button type="button" class="btn btn-secondary btn-lg" onclick="goList();">목&nbsp;&nbsp;록</button>
									<button type="submit" class="btn btn-secondary btn-lg" formaction = "eventDelete">삭&nbsp;&nbsp;제</button>
								</div>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-secondary btn-lg" onclick="goList();" style = "width : 50%">목&nbsp;&nbsp;록</button>
							</c:otherwise>
						</c:choose>
					</div>
				</form>
			</div>
		</div>

	</div>
	
</body>
</html>