<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기달</title>

<%@ include file = "/WEB-INF/views/include/head.jsp" %>

</head>
<body>

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>

	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<div class="jumbotron">
			<h1>오시는길</h1>

			<hr class="my-4">

			<div class="form-group" style = "max-width : 900px; margin : auto;">
				<!--
					* Daum 지도 - 약도서비스
					* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
					* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
				-->
				<!-- 1. 약도 노드 -->
				<div id="daumRoughmapContainer1536822872499"
					class="root_daum_roughmap root_daum_roughmap_landing" style = "width : 100%;"></div>

				<!-- 2. 설치 스크립트 -->
				<script charset="UTF-8" class="daum_roughmap_loader_script"
					src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

				<!-- 3. 실행 스크립트 -->
				<script charset="UTF-8">
					new daum.roughmap.Lander({
						"timestamp" : "1536822872499",
						"key" : "qz8g",
						"mapWidth" : "auto",
						"mapHeight" : "520"
					}).render();
				</script>
			</div>
		</div>
	</div>
	
</body>
</html>