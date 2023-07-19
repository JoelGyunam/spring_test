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
				<div class="display-5 p-2">우리동네 가게</div>
			</div>
			<c:forEach var="reviewStores" items="${reviewStoresMd}" varStatus="status">
				<div style = "cursor:pointer" onclick = "location.href='/baemin/list/review?storeid=${reviewStores.id}';" class="baemin-border p-2 mb-2">
					<h5>${reviewStores.name}</h5>
					<div>전화번호 : ${reviewStores.phoneNumber}</div>
					<div>주소 : ${reviewStores.address}</div>
				</div>
			</c:forEach>
		</div>
	</section>

	<jsp:include page="global/footer.jsp"/>


</div>

</body>
</html>