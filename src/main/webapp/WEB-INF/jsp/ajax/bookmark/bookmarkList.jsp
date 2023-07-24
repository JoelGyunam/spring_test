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
					<td><button id="bookmark_del" class="btn-danger text-white form-control delete-btn" data-bookmark-id="${getBookmarkLine.id }">삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		
		$(".delete-btn").on("click",function(){
			let getId = $(this).data("bookmark-id");
		
		$.ajax({
			type:"get"
			,url:"/bookmark/delete_id"
			,data:{"id":getId}
			,success:function(data){
				if(data.result==="success"){
					alert("성공적으로 삭제됬습니다.");
					document.location.reload();
				} else{
					alert("삭제에 실패했습니다.")
				}
			}
			,error:function(){
				alert("실패했습니다.")
			}
			
			
		})
		
		})

	});


</script>
</body>
</html>