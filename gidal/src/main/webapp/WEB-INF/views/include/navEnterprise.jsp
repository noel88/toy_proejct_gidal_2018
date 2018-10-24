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
				</ul>
				<div>
					<div>
						<c:set var = "at" value = "${ fn:indexOf(LOGIN, '@') }"></c:set>
						<c:set var = "name" value = "${ fn:substring(LOGIN, 0, at)}"></c:set>
	
						<ul class="navbar-nav mr-auto">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
									${ name }님
								</a>
								<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
									<a class="dropdown-item" href="/enterprise/enter_page">마이페이지</a>
									<a class="dropdown-item" href="/authentication/logout">로그아웃</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>
