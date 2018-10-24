<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:400,900,700,600,500,300,200,100,800);

section{
    padding:60px 0px;
    font-family: 'Raleway', sans-serif;
}

h2 {
    color: #4C4C4C;
    word-spacing: 5px;
    font-size: 30px;
    font-weight: 700;
    margin-bottom:30px;
    font-family: 'Raleway', sans-serif;
}

.ion-minus{
    padding:0px 10px;
}

.blog{
	/* background-color:#f6f6f6; */
}

.blog .card {
    background-color: #FFF;
    border: 1px solid #eceaea;
    margin: 20px 0px;
}

.blog .card-block {
    padding: 15px;
}

.btn.btn-default {
    background-color: #EB6864;
    color: #fff;
    border-radius: 0;
    border: none;
    padding: 13px 20px;
    font-size: 13px;
    font-weight: 600;
    margin-top: 10px;
}
</style>
</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>검색결과</h1>

			<hr class="my-4">

				<c:if test="${ fn:length(list) == 0 }">
					<p class="lead">검색결과가 없습니다.</p>
				</c:if>
		 <div class="blog">
      <div class="container">

           <div class="row" style="clear: both;">
<c:forEach items = "${list}" var = "EnterpriseVO">

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" data-aos="fade-right">
					 <div class="card text-center">
                        <a href = "/enterprise/enterprise_details?enterprise_code=${EnterpriseVO.enterprise_code}"><img class="card-img-top" src="<spring:url value ='/image/${EnterpriseVO.enterprise_mainImg}'/>" alt="" height="200px;" width="100%"></a>
                        <div class="card-block">
                            <p class="card-text"><small class="text-muted" style="float: left"><b>[${EnterpriseVO.enterprise_sectors}]</b></small>
                            <small class="text-muted" style="float: right"><b>별점 ${EnterpriseVO.review_scope}점</b></small>
                            </p>
                            <h5 class="card-title" style = "clear: both;">${EnterpriseVO.enterprise_businessName}</h5>
                            <p class="card-text"><small class="text-muted"><c:out value='${fn:substring(EnterpriseVO.enterprise_add2,0, 15)}' /></small></p>
                             <button class="btn btn-default" <c:if test = "${EnterpriseVO.enterprise_service == '1'}"> disabled = 'disabled' </c:if> onclick="window.open('/reserve/reserve?enterprise_code=${EnterpriseVO.enterprise_code}','','width=600,height=400,top=250,left=350,location=no,status=no,scrollbars=no');">예약하기</button>
                             <button class="btn btn-default" <c:if test = "${EnterpriseVO.enterprise_service == '2'}"> disabled = 'disabled' </c:if> onclick="window.open('/waiting/waiting?enterprise_code=${EnterpriseVO.enterprise_code}','','width=600,height=400,top=250,left=350,location=no,status=no,scrollbars=no');">웨이팅하기</button>
                        </div>
                     </div>
                </div>
			</c:forEach>
               </div>

</div>


</div>
			</div>
		</div>


</body>
</html>