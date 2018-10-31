<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div style = "background-color : #EB6864;">
<!-- <div style = "background-color : #EB6864; position : fixed; width : 100%; z-index : 1;"> -->
<!-- 각 JSP파일 수정 시 상단바 고정됨 <div style="max-width: 1000px; padding-top : 60px; margin-right: auto; margin-left: auto;"> -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style = "max-width : 1050px; margin-right : auto; margin-left : auto;">
		<a class="navbar-brand" href="/">
			<img src="/resources/img/logo/GiDal.png" style="margin : auto; height : 30px; width : auto;">
		</a>
		<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse collapse" id="navbarColor01" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						소개
					</a>
					<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
						<a class="dropdown-item" href="/info/whatIs">기달이란</a>
						<a class="dropdown-item" href="/info/wayToCome">오시는길</a>
				</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						이벤트
					</a>
					<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
						<a class="dropdown-item" href="/event/currentEvent">진행 중인 이벤트</a>
						<a class="dropdown-item" href="/event/closedEvent">종료된 이벤트</a>
						<a class="dropdown-item" href="/event/upcomingEvent">진행 예정 이벤트</a>
					</div>
				</li>
				<c:if test = "${ LEVEL ne 'admin' }">
					<li class="nav-item">
	       				<a class="nav-link" href="/enterprise/view">지역별 업체<span class="sr-only">(current)</span></a>
	     			</li>
				</c:if>
				<c:if test = "${ LEVEL eq 'user' }">
					<li class="nav-item">
	       				<a class="nav-link" href="/user/reserveWaitList">기달목록<span class="sr-only">(current)</span></a>
	     			</li>
				</c:if>
			</ul>
			<div>
			<form class="form-inline my-2 my-lg-0" action = "/search/search" method = "get">


				<script>
				$(function() {
				  var availableTags = [

				<c:forEach items = "${lists}" var = "enterprise">
					"${enterprise.enterprise_businessName}",

				</c:forEach>


				  ];
				  $( "#tags" ).autocomplete({
				    source: availableTags
				  });
				} );
				</script>



				<input class="form-control mr-sm-2" id = "tags" name = "search" type="text" placeholder="업체검색">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>&nbsp;&nbsp;
			</form>
			</div>

			<div>
				<c:choose>
					<c:when test = "${ empty LOGIN }">
						<span class="navbar-text">
							<a href="/authentication/signIn" class="navbar-link" style = "color : #F5B4B2; text-decoration : none;">로그인</a>
							 or
							<a href="/authentication/signUp" class="navbar-link" style = "color : #F5B4B2; text-decoration : none;">회원가입</a>
						</span>
					</c:when>
					<c:otherwise>
						<c:set var = "at" value = "${ fn:indexOf(LOGIN, '@') }"></c:set>
						<c:set var = "name" value = "${ fn:substring(LOGIN, 0, at)}"></c:set>

						<ul class="navbar-nav mr-auto">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
									${ name }님
								</a>
								<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
									<c:choose>
										<c:when test = "${ LEVEL eq 'user' }">
											<a class="dropdown-item" href="/user/userpage">정보수정</a>
											<a class="dropdown-item" href="/authentication/logout">로그아웃</a>
										</c:when>
										<c:when test = "${ LEVEL eq 'enterprise' }">
											<a class="dropdown-item" href="/enterprise/enter_page">마이페이지</a>
											<a class="dropdown-item" href="/authentication/logout">로그아웃</a>
										</c:when>
										<c:when test = "${ LEVEL eq 'admin' }">
											<a class="dropdown-item" href="/admin/adminPage">마이페이지</a>
											<a class="dropdown-item" href="/authentication/logout">로그아웃</a>
										</c:when>
									</c:choose>
								</div>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>

<!-- Button trigger modal By Ved Prakash Gupta -->
<c:if test = "${ LEVEL eq 'user' }">
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  <!-- <i class="far fa-bell"></i> -->
알림
</button>
</c:if>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">예약 및 웨이팅 현황 알림</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
          <div class="modal-body" align="center">
           <p> <h3>예약</h3> </p>
           <c:forEach items = "${reserve_alert}" var = "re">
          <c:choose>
          <c:when test = "${re.reserve_comfirmation eq 'N'}">
           <p>[${re.enterprise_businessName}] ${re.reserve_date} 예약대기</p>
           </c:when>
            <c:when test = "${re.reserve_comfirmation eq 'Y'}">
           <p>[${re.enterprise_businessName}] ${re.reserve_date} 예약확정</p>
           </c:when>
            <c:when test = "${re.reserve_comfirmation eq 'C'}">
           <p>[${re.enterprise_businessName}] ${re.reserve_date} 예약취소됨</p>
           </c:when>
          </c:choose>
           </c:forEach>
           <hr>
            <p> <h3>웨이팅</h3> </p>
             <c:forEach items = "${waiting_alert}" var = "waiting">
            <c:choose>
            <c:when test = "${waiting.waiting_yn eq 'N'}">
           <p>[${waiting.enterprise_businessName}]  웨이팅 대기중</p>
           </c:when>
           <c:when test = "${waiting.waiting_yn eq 'A'}">
           <p>[식당명] 입장하세요</p>
           </c:when>
           </c:choose>
           </c:forEach>
           <hr>
           <c:forEach items = "${reserve_alert_now}" var = "now_list">
           <p class="text-primary">오늘은 [${now_list.enterprise_businessName}] 예약일입니다</p>
           </c:forEach>

          </div>
        </div>
          </div>
  </div>
</div>




		</div>
	</nav>
</div>





