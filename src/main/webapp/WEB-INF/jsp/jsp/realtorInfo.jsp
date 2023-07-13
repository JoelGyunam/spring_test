<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<div class="container">

	<h3>공인중개사 정보</h3>
	
	<table class="table table-sm text-center mt-3">
	
		<tr>
			<th>ID</th>
			<td>${realtor.id}</td>
		</tr>
		<tr>
			<th>상호명</th>
			<td>${realtor.office}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${realtor.phoneNumber}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${realtor.address}</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>${realtor.grade}</td>
		</tr>
	
	</table>


</div>

</body>
</html>