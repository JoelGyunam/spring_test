<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt 라이브러리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<div class="container">
	<h2 class="m-3"> 1. 후보자 득표율</h2>
	
	<table class="table text-center">
		<thead class="bg-primary text-white">
			<tr>
				<th>기호</th>
				<th>득표 수</th>
				<th>득표 율</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "candi" items="${candi }" varStatus="status">
			<tr>
				<td>${status.count }</td>			
				<td><fmt:formatNumber value = "${candi }"/></td>			
				<td><fmt:formatNumber type="percent" value="${candi / 1000000 }"/></td>			
			</tr>
			</c:forEach>
			<tr><td colspan="${candi.size()}" class="bg-dark text-white">끝</td></tr>
		</tbody>
	</table>
</div>

<hr>

<div class="container">
	<h2 class="m-3">2. 카드 명세서</h2>
	<table class="table text-center">
		<thead class="bg-primary text-white">
			<tr>
				<th>사용처</th>
				<th>가격</th>
				<th>사용 날짜</th>
				<th>할부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bill" items="${bill }">
			<tr>
				<td>${bill.store}</td>
				<td>
					<fmt:formatNumber type="currency" currencySymbol="₩" value = "${bill.pay}"/>
				</td>
				<td>
					<fmt:parseDate value = "${bill.date}" pattern="yyyy-MM-dd" var="parseDate" />
					<fmt:formatDate pattern="yyyy년 M월 d일" value = "${parseDate }" />
				</td>
				<td>${bill.installment}</td>
			</tr>
			</c:forEach>
			<tr><td colspan="${bill[0].size()}" class="bg-dark text-white">끝</td></tr>
		</tbody>
	</table>
</div>

</body>
</html>