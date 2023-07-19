<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/baemin/css/style.css" type = "text/css">
</head>
<body>


<div id="wrap" class="container">

	<jsp:include page="global/header.jsp"/>

	<section>
		<div>
			<div>
				<div class="display-5 p-2">${selectStoreMd.name }-리뷰</div>
			</div>
			<c:choose>
				<c:when test="${not empty reviewByStoreMd[0] }">
					<c:forEach var="reviewByStore" items="${reviewByStoreMd }">
						<div class="baemin-border p-2 mb-2">
							<div class="d-flex">
								<div class="fw-bold m-1">${reviewByStore.userName }</div>
								<div class="d-flex m-1">
									<c:forEach var = "i" begin = "1" end="${reviewByStore.point/1}" step="1"><img height = "15" src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png"></c:forEach>
									<c:forEach var = "i" begin = "1" end="${(reviewByStore.point%1)/0.5}" step="1"><img height = "15" src="http://marondal.com/material/images/dulumary/web/jstl/star_half.png"></c:forEach>
									<c:forEach var = "i" begin = "1" end="${5-(reviewByStore.point/1)}" step="1"><img height = "15" src="http://marondal.com/material/images/dulumary/web/jstl/star_empty.png"></c:forEach>
								</div>
							</div>
							<div class = "text-gray text-small"><fmt:formatDate value = "${reviewByStore.createdAt }" pattern = "yyyy년 M월 d일"/></div>
							<div>${reviewByStore.review }</div>
							<div id="menu-small-box" class="p-1 text-small">${reviewByStore.menu }</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h3 class="text-center p-3 m-3">작성된 리뷰가 없습니다.</h3>
				</c:otherwise>
			</c:choose>
		</div>
	</section>

	<jsp:include page="global/footer.jsp"/>

</div>

</body>
</html>
