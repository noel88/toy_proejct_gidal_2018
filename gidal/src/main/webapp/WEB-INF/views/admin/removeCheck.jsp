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
			<h1>관리자 페이지</h1>

			<hr class="my-4">
			<h4>삭제 확인</h4>
			<div class="row" style="margin : 0 auto;">
					<form method = "post" style = "margin : auto;">
						<table class="table table-hover" style="text-align: center;">
							<thead>
								<tr>
									<th scope="col" style="width : 56px;">번호</th>
									<th scope="col" style = "width : 357px;">이메일</th>
								</tr>
							</thead>
							<tbody>
								<c:set var = "i" value = "1"></c:set>
								<c:forEach items="${remove}" var="remove">
									<tr>
										<td>${ i }</td>
										<td style="text-align: left;">
											<small>${remove}</small>
											<input type = "hidden" name = "remove" value = "${ remove }" />
										</td>
									</tr>
									<c:set var = "i" value = "${ i + 1 }"></c:set>
								</c:forEach>
							</tbody>
						</table>
						<p>
							<label class="col-form-label" for="inputDefault">삭제하시려면 관리자 패스워드 입력</label>
							<input type="password" class="form-control"	name = "password" placeholder="관리자 패스워드" id="inputDefault">
						</p>
						<p>
							<c:choose>
								<c:when test="${ levelCheck eq '1' }">
									<button type="submit" class="btn btn-primary btn-sm btn-block" formaction = "userRemove">삭제</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="btn btn-primary btn-sm btn-block" formaction = "enterpriseRemove">삭제</button>
								</c:otherwise>
							</c:choose>
						</p>
							<button type="button" class="btn btn-primary btn-sm btn-block" onclick="history.back()">뒤로가기</button>
						
						<p>
						
						</p>
					</form>
			</div>
			

		</div>
	</div>

</body>
</html>