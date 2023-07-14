<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core Library 2 forEach</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<h3>1. JSTL forEach</h3><hr>

	
	<div class="containser">
		<h2>HOT 5</h2>
		<table class = "table">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
				</tr>
			</thead>		
			<tbody>
			<c:forEach var = "title" items="${musicRanking}" varStatus="status">
				<tr>		
					<td>${status.count}</td>
					<td>${title}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<hr>
	
<h3>2. JSTL forEach</h3><hr>
	
	<div class="container">
	
	</div>
	

</body>
</html>