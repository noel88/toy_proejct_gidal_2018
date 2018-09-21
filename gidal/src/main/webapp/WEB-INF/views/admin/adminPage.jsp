<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<script>
	var result = '${msg}';
	
	if(result == 'eventRegistSuccess') {
		alert("이벤트가 추가되었습니다.");
	} else if(result == 'userRemoveSuccess') {
		alert("일반사용자 삭제를 완료하였습니다.");
	} else if(result == 'enterpriseRemoveSuccess') {
		alert("기업사용자 삭제를 완료하였습니다.");
	}
	
	function userCheckAll(theForm) {
		if(theForm.remove.length == undefined) {
			theForm.remove.checked = theForm.userAllCheck.checked;
		} else {
			for(var i = 0; i < theForm.remove.length; i++) {
				theForm.remove[i].checked = theForm.userAllCheck.checked;
			}
		}
	}

	function enterpriseCheckAll(theForm) {
		if(theForm.remove.length == undefined) {
			theForm.remove.checked = theForm.enterpriseAllCheck.checked;
		} else {
			for(var i = 0; i < theForm.remove.length; i++) {
				theForm.remove[i].checked = theForm.enterpriseAllCheck.checked;
			}
		}
	}
	
</script>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>관리자 페이지</h1>

			<hr class="my-4">
			<h4>회원 목록</h4>
			
			<div class="row" style="margin : 0 auto;">
				<div class="form-group" style="max-width: 400px; margin: 0 auto;">
					<p>일반회원</p>
					<form method = "post">
						<input type = "hidden" name = "levelCheck" value = "1" />
						<table class="table table-hover" style="text-align: center;">
							<thead>
								<tr>
									<th scope="col" style="width : 56px;">
										<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="userAllCheck" onclick = "userCheckAll(this.form);" />
												<label class="custom-control-label" for="userAllCheck">&nbsp;</label>
										</div>
									</th>
									<th scope="col" style = "width : 357px;">이메일</th>
								</tr>
							</thead>
							<tbody>
								<c:set var = "i" value = "1"></c:set>
								<c:forEach items="${userList}" var="userVO">
									<tr>
										<td>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="userCheck${ i }"
												 name = "remove" value = "${ userVO.user_email }" />
												<label class="custom-control-label" for="userCheck${ i }">&nbsp;</label>
											</div>
										</td>
										<td style="text-align: left;">
											<small>${userVO.user_email}</small>
											<%-- <small><a href="/event/detailEvent?event_no=${eventVO.event_no}">${userVO.user_email}</a></small> --%>
										</td>
									</tr>
									<c:set var = "i" value = "${ i + 1 }"></c:set>
								</c:forEach>
							</tbody>
						</table>
						<p>
							<button type="submit" class="btn btn-primary btn-sm btn-block" formaction = "removeCheck">삭제</button>
						</p>
					</form>
					
					<div style = "width : 100%;">
						<ul class="pagination" style = "width : 60%; margin : auto;">
							<c:choose>
								<c:when test="${ (userPageInfo.page - 1) == 0 }">
									<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/admin/adminPage?userPage=${ userPageInfo.page - 1 }">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var = "userPage" begin = "${ userPageInfo.startPage }" end = "${ userPageInfo.endPage }" step = "1">
								<c:choose>
									<c:when test="${ userPageInfo.page == userPage }">
										<li class="page-item active"><a class="page-link" href="/admin/adminPage?userPage=${ userPage }">${ userPage }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="/admin/adminPage?userPage=${ userPage }">${ userPage }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${ userPageInfo.page == userPageInfo.maxPage }">
									<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/admin/adminPage?userPage=${ userPageInfo.page + 1 }">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>

				<div class="form-group" style="max-width: 400px; margin: 0 auto;">
					<p>기업회원</p>
					<form method = "post">
						<input type = "hidden" name = "levelCheck" value = "2" />
						<table class="table table-hover" style="text-align: center;">
							<thead>
								<tr>
									<th scope="col" style="width : 56px;">
										<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="enterpriseAllCheck" onclick = "enterpriseCheckAll(this.form);" />
												<label class="custom-control-label" for="enterpriseAllCheck">&nbsp;</label>
										</div>
									</th>
									<th scope="col" style = "width : 357px;">이메일</th>
								</tr>
							</thead>
							<tbody>
								<c:set var = "i" value = "1"></c:set>
								<c:forEach items="${enterpriseList}" var="enterpriseVO">
									<tr>
										<td>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="enterpriseCheck${ i }"
												 name = "remove" value = "${ enterpriseVO.enterprise_email }" />
												<label class="custom-control-label" for="enterpriseCheck${ i }">&nbsp;</label>
											</div>
										</td>
										<td style="text-align: left;">
											<small>${enterpriseVO.enterprise_email}</small>
											<%-- <small><a href="/event/detailEvent?event_no=${eventVO.event_no}">${enterpriseVO.enterprise_email}</a></small> --%>
										</td>
									</tr>
									<c:set var = "i" value = "${ i + 1 }"></c:set>
								</c:forEach>
							</tbody>
						</table>
						<p>
							<button type="submit" class="btn btn-primary btn-sm btn-block" formaction = "removeCheck">삭제</button>
						</p>
					</form>
					
					<div style = "width : 100%;">
						<ul class="pagination" style = "width : 60%; margin : auto;">
							<c:choose>
								<c:when test="${ (enterprisePageInfo.page - 1) == 0 }">
									<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/admin/adminPage?enterprisePage=${ enterprisePageInfo.page - 1 }">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var = "enterprisePage" begin = "${ enterprisePageInfo.startPage }" end = "${ enterprisePageInfo.endPage }" step = "1">
								<c:choose>
									<c:when test="${ enterprisePageInfo.page == enterprisePage }">
										<li class="page-item active"><a class="page-link" href="/admin/adminPage?enterprisePage=${ enterprisePage }">${ enterprisePage }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="/admin/adminPage?enterprisePage=${ enterprisePage }">${ enterprisePage }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${ enterprisePageInfo.page == enterprisePageInfo.maxPage }">
									<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/admin/adminPage?enterprisePage=${ enterprisePageInfo.page + 1 }">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				
			</div>
			
			<hr class="my-4">
			<h4>이벤트 추가</h4>
			<div class="form-group" style = "max-width : 400px; margin : auto;">
				<form action = "eventRegist" method = "post" enctype = "multipart/form-data">
					<p>
						<label class="col-form-label" for="inputDefault">이벤트 제목</label>
						<input type="text" class="form-control" name = "event_title" placeholder="이벤트 제목" id="inputDefault" required = "required" />

						<label class="col-form-label" for="inputDefault">이벤트 시작일</label>
						<input type="date" class="form-control" name = "event_startDate" placeholder="이벤트 시작일" id="inputDefault" required = "required" />
					
						<label class="col-form-label" for="inputDefault">이벤트 종료일</label>
						<input type="date" class="form-control" name = "event_endDate" placeholder="이벤트 종료일" id="inputDefault" required = "required" />
						
						<label class="col-form-label" for="inputDefault">이벤트 이미지</label>
						<input type="file" class="form-control-file" name = "event_file" id="exampleInputFile" aria-describedby="fileHelp">
							
						<label class="col-form-label" for="inputDefault">이벤트 내용</label>
						<textarea class="form-control" name = "event_content" placeholder="이벤트 내용" id="inputDefault" rows = "10" style="resize: none;"></textarea>
					</p>
					
					<p>
						<button type="submit" class="btn btn-primary btn-lg btn-block">이벤트 등록</button>
					</p>
				</form>
			</div>
		</div>
	</div>

</body>
</html>