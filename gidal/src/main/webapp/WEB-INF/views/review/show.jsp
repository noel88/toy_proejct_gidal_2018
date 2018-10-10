<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
    <br/>
    <input type="hidden"  name="user_email" value="${LOGIN}" >
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
    <button class="btn btn-block btn-primary" type="submit">리뷰 등록</button>
</form>
</body>
</html>