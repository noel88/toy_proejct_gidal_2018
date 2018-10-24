<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>

.dropdown-item:active { 
	color: white; background-color: black; 
}

</style>
<div style = "background-color : #000;">
<!-- <div style = "background-color : #EB6864; position : fixed; width : 100%; z-index : 1;"> -->
<!-- 각 JSP파일 수정 시 상단바 고정됨 <div style="max-width: 1000px; padding-top : 60px; margin-right: auto; margin-left: auto;"> -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style = "max-width : 1050px; margin-right : auto; margin-left : auto;">
		<div class="container-fluid">
		<a class="navbar-brand" href="/enterprise/enter_page">
			<img src="/resources/img/logo/GiDalEnterprise.png" style="margin : auto; height : 30px; width : auto;">
		</a>
		 <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
		<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse collapse" id="navbarColor02" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
       				<a class="nav-link">금일 남은 예약 : ${ reserve_count }건</a>
     			</li>
				<li class="nav-item">
					<a class="nav-link">현재 대기 : ${ waiting_count }팀</a>
				</li>
				<!-- <li class="nav-item">
       				<a class="nav-link" href="/enterprise/view">지역별 업체<span class="sr-only">(current)</span></a>
     			</li> -->
			</ul>
			<div>
			<!-- <form class="form-inline my-2 my-lg-0" action = "/search/search" method = "get">


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
			</div> -->

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
											<a class="dropdown-item" href="/user/userpage">마이페이지</a>
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
</div>
</div>
		</div>
	</nav>
</div>
