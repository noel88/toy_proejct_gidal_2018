<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
			<div style= "width:100%; auto; margin-left: auto;">



			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">인원수</th>
						<th scope="col">웨이팅 시간</th>
						<th scope="col">웨이팅 현황</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${waiting}" var="WaitingVO">
						<tr>
							<td>${WaitingVO.user_name}</td>
							<td>${WaitingVO.user_phoneNum}</td>
							<td>${WaitingVO.waiting_personnel}</td>
							<td><c:out value='${fn:substring(WaitingVO.waiting_now, 10, 19)}'/></td>
							<td><a href ="/enterprise/update_yn?waiting_code=${WaitingVO.waiting_code}"><button type="button" class="btn btn-secondary">${WaitingVO.waiting_yn}</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>




</div>


</html>