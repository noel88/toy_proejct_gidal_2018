<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page-header">
    <h2>리뷰</h2>
</div>

<form action = "userReview" onsubmit="return tocheckpw2()" data-ajax="false" method = "post" onsubmit="return join();">
    <textarea rows="5" cols="50" name="review_text"></textarea>
    
    <input type="hidden"  name="user_email" value="${LOGIN}" >
    <button class="btn btn-block btn-primary" type="submit">리뷰 등록</button>
</form>
</body>
</html>