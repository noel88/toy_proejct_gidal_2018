<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-latest.min.js"></script> 

<script type="text/javascript">
$(window).load(function() {
	$('#load').hide()
});
</script>


<style type="text/css">
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.8;
	background: white;
	z-index: 99;
	text-align: center;
}

#load > img {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}
</style>



	<script type="text/javascript">

		alert("예약이 완료되었습니다.");
		window.opener.location.reload();
		/* window.open('', '_self', ''); // 브라우저창 닫기 */
		window.close(); // 브라우저 창 닫기
		</script>

</head>
<body>
<div id="load">
	<img src="/resources/img/loading.gif" alt="loading">
</div>

</body>
</html>