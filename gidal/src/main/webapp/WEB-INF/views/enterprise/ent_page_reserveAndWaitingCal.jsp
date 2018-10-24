<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<%@ include file = "/WEB-INF/views/include/enter_page_nav.jsp" %>
<link href="<c:url value="/resources/css/fullcalendar.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/fullcalendar.print.css" />" rel="stylesheet" media='print'>
<script src="<c:url value="/resources/js/moment.min.js" />"></script>
<%-- <script src="<c:url value="/resources/js/jquery.min.js" />""></script>--%>
<script src="<c:url value="/resources/js/fullcalendar.min.js" />"></script>





<style>

body {
	/* margin: 40px 10px; */
	padding: 0;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1000px;
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
			right: 'month'
			},

		defaultDate: new Date(),
		navLinks: true, // can click day/week names to navigate views
		editable: false,
		eventLimit: false, // allow "more" link when too many events
		events: [
		     <c:forEach var='ReserveVO' items='${reserve}'>
		     <c:set var="title" value="${ReserveVO.user_name} / ${ReserveVO.reserve_personnel}명" />
             { title: '${title}', backgroundColor : "#008000", start: '${ReserveVO.reserve_datetime}'},
           	</c:forEach>
		     <c:forEach var='WaitingVO' items='${waiting}'>
		     <c:set var="title" value="${WaitingVO.user_name} / ${WaitingVO.reserve_personnel}명" />
             { title: '${title}', color : "#FF0000", start: '${WaitingVO.waiting_now}'},
           	</c:forEach>


		]

	});

});


</script>

</head>
<body>
	<div style="max-width: 1000px; margin-right: auto; margin-left: auto; margin-top: 50px;">
		<div class="jumbotron">
				<h1>전체 예약 및 웨이팅 현황</h1>

			<hr class="my-4">
			<div id='calendar'> </div>
			</div>
			</div>
</body>




</html>