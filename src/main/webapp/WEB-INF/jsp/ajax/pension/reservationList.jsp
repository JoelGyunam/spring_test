<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>예약 목록 보기</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link rel="stylesheet" href="/pension/css/style.css" type="text/css">
    </head>

    <body>
        <div id="wrap" >

			<jsp:include page="global/headerNav.jsp"/>
			
			<div class="container">
			
				<h3 class="text-center p-3">예약 목록 보기</h3>
				
				<table class = "table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var = "reservationLine" items="${reservationListMd }">
						<tr>
							<td>${reservationLine.name }</td>
							<td><fmt:formatDate value="${reservationLine.date }" pattern="yyyy년M월d일"/></td>
							<td>${reservationLine.day }</td>
							<td>${reservationLine.headcount }</td>
							<td>${reservationLine.phoneNumber }</td>
							
							<c:choose>
								<c:when test = "${reservationLine.state eq '확정' }" ><td class="text-success">${reservationLine.state }</td></c:when>
								<c:when test = "${reservationLine.state eq '대기중' }" ><td class="text-warning">${reservationLine.state }</td></c:when>
								<c:when test = "${reservationLine.state eq '취소' }" ><td class="text-danger">${reservationLine.state }</td></c:when>
								<c:otherwise><td>${reservationLine.state }</td></c:otherwise>
							</c:choose>
							
							<td><button class = "btn btn-danger text-white small delete-btn" data-name = "${reservationLine.name}" data-id = "${reservationLine.id}">삭제</button></td>
						</tr>
						</c:forEach>
					</tbody>
				
				</table>
			</div>
		</div>
	<jsp:include page="global/footer.jsp"/>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script>
		$(document).ready(function(){
			$(".delete-btn").on("click",function(){
				let name = $(this).data("name");
				let id = $(this).data("id");
				if (confirm(name + "님의 예약을 삭제하시겠습니까?")){
					$.ajax({
						type:"get"
						,url:"/pension/reservation/delete"
						,data:{"id":id}
						,success:function(data){
							if(data.result == "success"){
								alert("성공적으로 삭제되었습니다.");
								location.reload();
							}else alert("삭제에 실패했습니다.");
						}
						,error:function(){
							alert("오류가 발생되었습니다.")
						}
					});
				}
			})
		})
	</script>
	</body>