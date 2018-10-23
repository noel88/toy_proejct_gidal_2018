<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	
<script type="text/javascript">
	function delete_enterprise() {
		alert('탈퇴가 완료되었습니다.')
	}
</script>

	<div style="width: 50%; margin-right: auto; margin-left: auto;">
		
			<form action="userDelete" method = "post">
			
			<input type="hidden"  name="user_email" value="${LOGIN}" >
			정말 탈퇴하시겠습니까?<br />
			<p>탈퇴하시려면 패스워드 입력후 탈퇴하기 버튼을 눌러주세요</p>
			<input type="password" class="form-control pass" name="enterprise_password" placeholder="Password" oninput="checkPwd()">
			<br>
			<button type="submit" class="form-control btn btn-primary" onclick="delete_enterprise();">탈퇴하기</button>
			</form>
			
			
			
		
	</div>


</html>