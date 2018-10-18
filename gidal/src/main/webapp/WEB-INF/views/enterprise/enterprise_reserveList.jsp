<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<br>

<title>Insert title here</title>

<link href="<c:url value="/resources/css/fullcalendar.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/fullcalendar.print.css" />" rel="stylesheet" media='print'>
<script src="<c:url value="/resources/js/moment.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/fullcalendar.min.js" />"></script>





<style>

body {
	/* margin: 40px 10px; */
	padding: 0;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

</style>




<%-- 		<c:out value="${reserve}"/> --%>



<script type='text/javascript'>




$(document).ready(function() {


	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay,listWeek',
			},

		defaultDate: new Date(),
		navLinks: true, // can click day/week names to navigate views
		editable: false,
		eventLimit: false, // allow "more" link when too many events
		events: [
		     <c:forEach var='ReserveVO' items='${reserve}'>
		     <c:set var="title" value="${ReserveVO.user_name} / ${ReserveVO.reserve_personnel}명" />
             { title: '${title}', start: '${ReserveVO.reserve_datetime}'},
           	</c:forEach>

		]

	});

});


</script>
<div id='calendar'></div>
	<div style= "width:100%; auto; margin-left: auto;">



			<table class="table table-hover"  style = "text-align : center;">
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">인원수</th>
						<th scope="col">예약날짜</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var='ReserveVO' items='${reserve}'>
						<tr>
							<td>${ReserveVO.user_name}</td>
							<td>${ReserveVO.user_phoneNum}</td>
							<td>${ReserveVO.reserve_personnel}</td>
							<td>${ReserveVO.reserve_datetime}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>




</div>







</html>