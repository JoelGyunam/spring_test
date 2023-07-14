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

<h3 class="p-2">1. JSTL forEach</h3><hr>

	
	<div class="container">
		<h2>HOT 5</h2>
		<table class = "table text-center">
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
	
<h3 class="p-2">2. JSTL 응용하기</h3><hr>
	
	<div class="container">
		<h2>멤버십</h2>
		<table class = "table text-center">
			<thead>
				<tr>
					<th>이릅</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "member" items="${membership }">
						<c:choose>
							<c:when test="${member.grade eq 'VIP'}">
								<c:set var="gradeColor" value="text-danger" />
							</c:when>
							<c:when test="${member.getgrade eq 'GOLD'}">
							<c:set var="gradeColor" value="text-warning" />
							</c:when>
							<c:otherwise>
								<c:set var="gradeColor" value="text-black" />
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${member.point >= 5000 }">
								<c:set var="pointColor" value="text-primary" />
							</c:when>
							<c:otherwise>
								<c:set var = "pointColor" value="text-black" />
							</c:otherwise>
						</c:choose>
						
						<tr>
							<td> ${member.name} </td>
							<td> ${member.phoneNumber} </td>
							<td class = "${gradeColor}"> ${member.grade} </td>
							<td class = "${pointColor}"> ${member.point}P </td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	

</body>
</html>