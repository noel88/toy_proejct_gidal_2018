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
			<h1>이벤트 수정</h1>

			<hr class="my-4">

			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form action = "eventModifyExcute" method = "post" enctype = "multipart/form-data">
					<p>
						<input type = "hidden" name = "state" value = "${state}" />
						<input type = "hidden" name = "event_no" value = "${eventVO.event_no}" />

						<label class="col-form-label" for="inputDefault">이벤트 제목</label>
						<input type="text" class="form-control" name = "event_title" placeholder="이벤트 제목" id="inputDefault" value = "${eventVO.event_title}" required = "required" />

						<label class="col-form-label" for="inputDefault">이벤트 시작일</label>
						<input type="date" class="form-control" name = "event_startDate" placeholder="이벤트 시작일" id="inputDefault" value="${eventVO.event_startDate}" required = "required" />

						<label class="col-form-label" for="inputDefault">이벤트 종료일</label>
						<input type="date" class="form-control" name = "event_endDate" placeholder="이벤트 종료일" id="inputDefault" value="${eventVO.event_endDate}" required = "required" />

						<label class="col-form-label" for="inputDefault">이벤트 이미지</label>
						<input type="file" class="form-control-file" name = "event_file" id="exampleInputFile" aria-describedby="fileHelp">

						<% pageContext.setAttribute("newLineChar", "\r\n"); %>
						<label class="col-form-label" for="inputDefault">이벤트 내용</label>
						<textarea class="form-control" name = "event_content" placeholder="이벤트 내용" id="inputDefault" rows = "10" style="resize: none;">${fn:replace(eventVO.event_content, "<br />", newLineChar)}</textarea>
					</p>

					<p>
						<button type="submit" class="btn btn-primary btn-lg btn-block">이벤트 수정</button>
					</p>
					<p>
						<button type="button" class="btn btn-primary btn-lg btn-block" onclick="history.back()">뒤로가기</button>
					</p>
				</form>
			</div>
		</div>

	</div>

</body>
</html>