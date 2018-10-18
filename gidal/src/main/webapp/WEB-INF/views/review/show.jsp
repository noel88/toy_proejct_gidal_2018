<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "/WEB-INF/views/include/head.jsp" %>
</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>



<div style="width: 50%; margin-right: auto; margin-left: auto;">
<h2>리뷰</h2>
<form action = "userReview" onsubmit="return tocheckpw2()" data-ajax="false" method = "post" onsubmit="return join();">
    <textarea rows="5" cols="50" name="review_text"></textarea>
    <br/>
    <input type="hidden"  name="user_email" value="${LOGIN}" >
    <input type="hidden"  name="enterprise_code" value="${code}" >
     <!-- 평점 선택창 -->
    <label >평점: </label>
    <select name="review_scope">
        <option value="0">☆☆☆☆☆</option>
        <option value="1">★☆☆☆☆</option>
        <option value="2">★★☆☆☆</option>
        <option value="3">★★★☆☆</option>
        <option value="4">★★★★☆</option>
        <option value="5">★★★★★</option>
    </select>

    <button class="form-control btn btn-primary" type="submit">리뷰 등록</button>

</form>
</div>
</body>
</html>