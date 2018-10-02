<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<br>

<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='https://fullcalendar.io/js/fullcalendar-3.0.1/fullcalendar.css' />
<link rel='stylesheet' type='text/css' href='https://fullcalendar.io/js/fullcalendar-3.0.1/fullcalendar.print.css' media='print' />
<script src='https://fullcalendar.io/js/fullcalendar-3.0.1/lib/moment.min.js'></script>
<script src='https://fullcalendar.io/js/fullcalendar-3.0.1/lib/jquery.min.js'></script>
<script src='https://fullcalendar.io/js/fullcalendar-3.0.1/fullcalendar.min.js'></script>







<style>

body {
	margin: 40px 10px;
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
			lang:'ko',
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
		     <c:set var="title" value="${ReserveVO.user_name} / ${ReserveVO.reserve_personnel}명 / ${ReserveVO.user_phoneNum}" />
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
						<th scope="col">웨이팅 시간</th>

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