<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<div class = "container">

	<h3 class="p-3">회원 정보 리스트</h3>
	
	<table class="table text-center m-3">
		<thead>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>전화 번호</th>
				<th>국적</th>
				<th>이메일</th>
				<th>자기소개</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "i" items="${membersMd }" varStatus = "status">
			<tr>
				<td>${status.count }</td>
				<td>${i.name}</td>
				<td>
					<c:choose>
						<c:when test= "${fn:startsWith(i.phoneNumber,'010') }">${i.phoneNumber }</c:when>
						<c:otherwise>유효하지 않은 전화번호</c:otherwise>
					</c:choose>
				</td>
				<td>${fn:replace (i.nationality,"시대"," -" )}</td>
				<td><span class = "fw-bold">${fn:split(i.email,"@")[0]}</span>@${fn:split(i.email,"@")[1]}</td>
				<td>
					<c:choose>
						<c:when test = "${fn:length(i.introduce) > 15 }">
							${fn:substring(i.introduce,0,14)}...
						</c:when>
						<c:otherwise>${i.introduce }</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


</body>
</html>