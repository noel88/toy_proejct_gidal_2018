<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	
	<div class="form-group" style = "max-width : 400px; margin : auto;">
		
		<form action="userDelete" method = "post">
		
			<input type="hidden"  name="user_email" value="${LOGIN}" >
			<p>정말 탈퇴하시겠습니까?</p>
			<p>탈퇴하시려면 패스워드 입력후 탈퇴하기 버튼을 눌러주세요</p>
			<input type="password" class="form-control pass" name="user_password" placeholder="Password" oninput="checkPwd()">
			<br />
			<button type="submit" class="form-control btn btn-primary">탈퇴하기</button>
		</form>
		
	</div>


</html>