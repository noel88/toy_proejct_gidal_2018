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
			<h1>기업 회원가입</h1>

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
						<input type="password" class="form-control" placeholder="패스워드" id="inputDefault">

						<label class="col-form-label" for="inputDefault">이름</label>
						<input type="text" class="form-control" placeholder="이름" id="inputDefault">
						
						<label class="col-form-label" for="inputDefault">성별</label>
						<select class="custom-select" id="exampleSelect1">
							<option>남성</option>
							<option>여성</option>
						</select>
					</p>

					<hr class="my-4">
					
					<p>
						<label class="col-form-label" for="inputDefault">매장명</label>
						<input type="text" class="form-control" placeholder="매장명" id="inputDefault">
						
						<label class="col-form-label" for="inputDefault">연락처</label>
						<input type="tel" class="form-control" placeholder="연락처" id="inputDefault">

						<label class="col-form-label" for="inputDefault">주소</label>
						<input type="text" class="form-control" placeholder="주소" id="inputDefault">

						<label class="col-form-label" for="inputDefault">영업시작시간</label>
						<select class="custom-select" id="exampleSelect1">
							<%@ include file = "/WEB-INF/views/include/time.jsp" %>
						</select> 
			
						<label class="col-form-label" for="inputDefault">영업종료시간</label>
						<select class="custom-select" id="exampleSelect1">
							<%@ include file = "/WEB-INF/views/include/time.jsp" %>
						</select>
						
						<label class="col-form-label" for="inputDefault">업종</label>
						<input type="email" class="form-control" placeholder="이메일" id="inputDefault">
						
						<label class="col-form-label" for="inputDefault">대표이미지</label>
						<input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">

						<label class="col-form-label" for="inputDefault">서비스</label>
						<select class="custom-select" id="exampleSelect1">
							<option>웨이팅 서비스</option>
							<option>예약 서비스</option>
							<option>웨이팅 + 예약 서비스</option>
						</select>

						<label class="col-form-label" for="inputDefault">매장 이미지</label>
						<input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
						<input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
						<input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
						<input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
					</p>
					<p>
						<button type="button" class="btn btn-primary btn-lg btn-block">회원가입</button>
					</p>
				</form>
			</div>

		</div>

	</div>

</body>
</html>