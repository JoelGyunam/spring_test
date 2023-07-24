<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>예약 하기</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/pension/css/style.css" type="text/css">
    </head>

    <body>
        <div id="wrap" >

			<jsp:include page="global/headerNav.jsp"/>
			
			<div class = "container col-7">
			
				<h3 class="text-center p-3">예약 하기</h3>
				
				<div class = m-2>
					<label>이름</label>
					<input id = "name" type="text" class="form-control">
				</div>
				<div class = m-2>
					<label>예약날자</label>
					<input id = "datepicker" type="text" class="form-control">
				</div>
				<div class = m-2>
					<label>숙박일수</label>
					<input id = "day" type="text" class="form-control">
				</div>
				<div class = m-2>
					<label>숙박인원</label>
					<input id = "headcount" type="text" class="form-control">
				</div>
				<div class = m-2>
					<label>전화번호</label>
					<input id = "phoneNumber" type="text" class="form-control">
				</div>
				<div class = m-2>
					<button id = "submitBtn" class="btn btn-warning form-control">예약하기</button>
				</div>
				
			</div>
		</div>
	<jsp:include page="global/footer.jsp"/>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function(){
			$("#datepicker").datepicker({
				dateFormat: 'yy-M-dd'
			   ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
			   ,monthNamesShort: ['01','02','03','04','05','06','07','08','09','10','11','12'] //달력의 월 부분 텍스트
			   ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
			   ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
			   ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
			});
		});
	</script>
	
	<script>
		$(function(){
			$("#day").on("blur",function(){
				let dayValue = $(this).val();
				if(!$(this).val().includes("일")&&$(this).val()>=1){
					$(this).val(dayValue + "일");
				}
			})
		});	
		
		$(function(){
			$("#day").on("focus",function(){
				if($(this).val().endsWith("일")){
					$(this).val($(this).val().slice(0,-1));
				}
			})
		});
		
		$(function(){
			$("#headcount").on("blur",function(){
				let dayValue = $(this).val();
				if(!$(this).val().includes("명")&&$(this).val()>=1){
					$(this).val(dayValue + "명");
				}
			})
		});	
		
		$(function(){
			$("#headcount").on("focus",function(){
				if($(this).val().endsWith("명")){
					$(this).val($(this).val().slice(0,-1));
				}
			})
		});
	</script>
	
	<script>
		$(function() {
			$("#phoneNumber").keyup(function(){
				var val = $(this).val().replace(/[^0-9]/g, '');
				if(val.length > 3 && val.length < 6){
					var tmp = val.substring(0,2)
					if(tmp == "02"){
						$(this).val(val.substring(0,2) + "-" + val.substring(2));
					} else {
						$(this).val(val.substring(0,3) + "-" + val.substring(3));
					}
				}else if (val.length > 6){
					var tmp = val.substring(0,2)
					var tmp2 = val.substring(0,4)
					if(tmp == "02"){
						if(val.length == "10"){
							$(this).val(val.substring(0,2) + "-" + val.substring(2, 6) + "-" + val.substring(6));
						} else {
							$(this).val(val.substring(0,2) + "-" + val.substring(2, 5) + "-" + val.substring(5));
						}
					} else if(tmp2 == "0505"){
						if(val.length == "12"){
							$(this).val(val.substring(0,4) + "-" + val.substring(4, 8) + "-" + val.substring(8));
						} else {
							$(this).val(val.substring(0,4) + "-" + val.substring(4, 7) + "-" + val.substring(7));
						}
					} else {
						if(val.length == "11"){
							$(this).val(val.substring(0,3) + "-" + val.substring(3, 7) + "-" + val.substring(7));
						} else {
							$(this).val(val.substring(0,3) + "-" + val.substring(3, 6) + "-" + val.substring(6));
						}
					}
				}
			});
		});
	</script>
	
	
	<script>
		$(document).ready(function(){
			
			$("#submitBtn").on("click",function(){
				
				let name = $("#name").val().trim();
				let date = $("#datepicker").val().trim();
				let dayInput = $("#day").val().trim();
				let day = dayInput.slice(0, -1);
				let headcountInput = $("#headcount").val().trim();
				let headcount = headcountInput.slice(0, -1);
				let phoneNumber = $("#phoneNumber").val().trim();
				
				
				if(name == ""){
					alert("이름을 입력해 주세요");
					return;
				}
				if(datepicker == ""){
					alert("날짜를 입력해 주세요");
					return;
				}
				if(day == ""){
					alert("숙박일수를 입력해 주세요");
					return;
				}
				if(headcount == ""){
					alert("숙박인원을 입력해 주세요");
					return;
				}
				if(phoneNumber == ""){
					alert("전화번호를 입력해 주세요");
					return;
				}
				if(isNaN(day)){
					alert("숙박일수가 잘못 입력되었습니다.");
					return;
				}
				if(isNaN(headcount.slice(0,-1))){
					alert("숙박인원이 잘못 입력되었습니다.");
					return;
				}
				if(!/^20\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[1-2]\d|3[0-1])$/.test(date)){
					alert("날짜가 잘못 입력되었습니다.");
					return;
				}
		
				if(confirm("아래 내용으로 예약하시겠습니까?" + "\n\n"
						+ "예약자 명 : " + name + " (" + phoneNumber + ")" + "\n" 
						+ "예약 날짜 : " + date + "\n" 
						+ "숙박 일수 : " + day  + "\n"
						+ "숙박 인원 : " + headcount + "명" + "\n" )){
					$.ajax({
						type:"get"
						,url:"/pension/reservation/add"
						,data:{
							"name":name
							,"date":date
							,"day":day
							,"headcount":headcount
							,"ph":phoneNumber
						}
						,success:function(data){
							if(data.result == "success"){
								alert("예약이 완료되었습니다.");
								location.href="/pension/reservation_list"
							} else alert("예약에 실패했습니다. \n 다시시도해주세요.");
						}
						,error:function(){
							alert("오류가 발생했습니다.");
						}
					})
				}
				})
		});
	</script>
	</body>