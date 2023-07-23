<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
	<div class="container">
	
		<h3 class="p-2">즐겨찾기 추가하기</h3>
		
		<div>
			<div class="m-3">
				<label>제목</label>
				<input type="text" id="name" class="form-control">
			</div>
			<div class="m-3">
				<label>URL</label> 
					<div class="d-flex">
						<input type="text" id="url" class="form-control">
						<button type="button" id="urlDupCheckBtn" class="btn btn-primary col-2">중복 확인</button>
					</div>
					<div id="dupInfoNeeded" class = "text-primary d-none">URL 입력 후, 중복 확인을 해주세요.</div>
					<div id="dupInfoFail" class = "text-danger d-none">중복된 URL 입니다.</div>
					<div id="dupInfoSuccess" class = "text-success d-none">등록 가능한 URL 입니다.</div>
			</div>
			<div class="m-3">
				<button type="button" id="addBtn" class="btn-success form-control col-12">추가</button>
			</div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			
			var urlDupChecked = false;
			
			$("#url").keyup(function(){
				urlDupChecked = false;
				$("#dupInfoSuccess").addClass("d-none");
				$("#dupInfoFail").addClass("d-none");
				$("#dupInfoNeeded").removeClass("d-none");
			})
			
			$("#urlDupCheckBtn").on("click",function(){
				
				let url = $("#url").val();
				if(url == ""){
					alert("url 주소를 입력해 주세요.");
					return;
				}
				if(!url.startsWith("http://") && !url.startsWith("https://") ){
					alert("정상적인 url이 아닙니다. 다시 입력해 주세요.");
					return;
				}
				$.ajax({
					type:"get"
					,url:"/bookmark/url_dup_check"
					,data:{"url":url}
					,success:function(data){
						if(data.urlDupCheck){
							urlDupChecked = false;
							$("#dupInfoFail").removeClass("d-none" )
							$("#dupInfoSuccess").addClass("d-none" )
							$("#dupInfoNeeded").addClass("d-none" )

						} else {
							urlDupChecked = true;
							$("#dupInfoSuccess").removeClass("d-none" )
							$("#dupInfoFail").addClass("d-none" )
							$("#dupInfoNeeded").addClass("d-none" )
						}
					}
					,error:function(){
						alert("중복 확인에 실패했습니다. 다시 시도해 주세요.")
					}
				})
			});
			
			$("#addBtn").on("click",function(){
				
				let name = $("#name").val();
				let url = $("#url").val();
				
				if(name == ""){
					alert("이름을 입력하세요");
					return;
				}
				if(url == ""){
					alert("url을 입력하세요");
					return;
				}
				if(urlDupChecked == false){
					alert("url 중복확인을 해주세요.");
					return;
				}
				
				$.ajax({
					type:"get"
					,url:"/bookmark/add"
					,data:{"n":name,"url":url}
					,success:function(data){
						if(data.result==="success"){
							location.href="/bookmark/list";
						} else{
							alert("추가 실패")
						};
					}
					,error:function(){
						alert("에러 발생")
					}
				})
			})
		})
	</script>
	
</body>
</html>