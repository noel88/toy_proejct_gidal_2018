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
			<h1>개인 회원가입</h1>

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
				<form action = "userjoin" method = "post">
					<p>
						
						<label class="col-form-label" for="inputDefault">휴대폰번호</label>
						<input type="text" name="user_phoneNum" class="form-control" id="phone" placeholder="휴대폰번호" maxlength="13"  />

						<label class="col-form-label" for="inputDefault">이메일</label>
						<input type="email" class="form-control" name="user_email" placeholder="이메일" id="inputDefault">
						
						<label class="col-form-label" for="inputDefault">패스워드</label>
						<input type="password" class="form-control" name="user_password" placeholder="패스워드" id="inputDefault">
						
						<label class="col-form-label" for="inputDefault">이름</label>
						<input type="text" class="form-control" name="user_name" placeholder="이름" id="inputDefault">
	 
						<label class="col-form-label" for="inputDefault">성별</label>
						<select  class="custom-select" id="exampleSelect1" name="user_gender">
						 	<option value="남성">남성</option>
							<option value="여성">여성</option>
						</select> 
					</p>
					<p>
						<button type="submit" class="btn btn-primary btn-lg btn-block">회원가입</button>
					</p>
				</form>
			</div>

		</div>

	</div>

</body>
</html>