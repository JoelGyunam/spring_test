<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 추가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
  crossorigin="anonymous"></script>
</head>
<body>
	
	<div class = "display-5 fw-bold container">공인중개사 추가</div>
	
	<div class="container">
		<form onsubmit="return validateForm()" method="post" action="/realtor/controller/insertRealtor">
			<label class="mt-3 fw-bold">상호명</label> <input type="text" name="office" class="form-control">
			<label class="mt-3 fw-bold">전화번호</label> <input type="text" name="phoneNumber" class="form-control" id="hpno">
			<label class="mt-3 fw-bold">주소</label> <input type="text" name="address" class="form-control">
			<label class="mt-3 fw-bold">등급</label> 
				<select name="grade" class="form-control">
					<option value="">--선택하세요--</option>
					<option>일반중개사</option>
					<option>안심중개사</option>
					<option>프리미엄중개사</option>
				</select>
			<button type="submit" class="btn btn-primary mt-3 col-12">추가하기</button>
		</form>
	</div>
	
	<script>
	$(function() {
		$("#hpno,#telno").keyup(function(){
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
	
		
	function validateForm() {
		var regExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
		var realtor = document.getElementsByName("realtor")[0].value;
	    var address = document.getElementsByName("address")[0].value;
	    var grade = document.getElementsByName("grade")[0].value;
		var phoneNumber = document.getElementsByName("phoneNumber")[0].value;
	      
		if (office===""){
			alert("상호명을 입력해 주세요");
			return false;
			} if (phoneNumber===""){
			alert("전화번호를 입력해 주세요");
			return false;
			} if (!regExp.test(phoneNumber)){
			alert("전화번호가 올바르지 않습니다.");
			return false;
			} if (address===""){
			alert("주소를 입력해 주세요");
			return false;
			} if (grade===""){
			alert("등급을 선택해 주세요")
			return false;
			} 
			
			return true;
	}
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>