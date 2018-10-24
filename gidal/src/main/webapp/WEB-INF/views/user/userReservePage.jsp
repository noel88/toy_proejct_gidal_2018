<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
			${UserPageVO.reserveAndWaiting_code}
	<div style="max-width: 1000px; margin-right: auto; margin-left: auto;">
		<table class="table table-hover"  style = "text-align : center;">
			<thead>
				<tr>
					<th scope="col" style = "min-width : 100px;">식당</th>
					<th scope="col" style = "min-width : 56px;">인원</th>
					<th scope="col" style = "min-width : 90px;">날짜</th>
					<th scope="col" style = "min-width : 90px;">예약자</th>
					<th scope="col" style = "min-width : 80px;">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach items="${list}" var="UserPageVO">
						<tr>
							<td><small>${UserPageVO.enterprise_businessName}</small></td>
							<td><small>${UserPageVO.reserve_personnel}</small></td>
							<td><small>${UserPageVO.reserve_date}${UserPageVO.reserve_time}</small></td>
							<td><small>${UserPageVO.user_name}</small></td>
							<td>
							
							<c:choose>
									<c:when test="${ UserPageVO.reserve_yn eq 'Y' && UserPageVO.reserve_comfirmation eq 'Y' }">
										<button type="button" class="btn btn-primary btn-sm disabled">리뷰쓰기</button>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${ empty UserPageVO.reserveAndWaiting_code }">
												<button type="button" class="btn btn-primary btn-sm" onclick="window.open('/review/write?rwDiv=R&code=${ UserPageVO.reserve_code }','','width=600,height=400,top=250,left=350,location=no,status=no,scrollbars=no');">
													리뷰쓰기
												</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-secondary btn-sm" onclick="window.open('/review/view?rwDiv=R&code=${ UserPageVO.reserve_code }&rcode=${ UserPageVO.reserveAndWaiting_code }','','width=600,height=400,top=250,left=350,location=no,status=no,scrollbars=no');">
													리뷰보기
												</button>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
</html>