<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>

<div class="container">

	<h3>즐겨찾기 목록</h3>

	<div>
		<table class="table text-center">
			<thead>
				<tr>
					<th>no.</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="getBookmarkLine" items="${getBookmarkMd}" varStatus = "status">
				<tr>
					<td>${getBookmarkLine.id }</td>
					<td>${getBookmarkLine.name }</td>
					<td>${getBookmarkLine.url }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>