<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>통나무 펜션</title>
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

            <section class="banner">
                <img width = "1200" src="http://www.guryelog.com/img_up/shop_pds/grlog/contents/banner/mf21556937886.jpg" id="bannerImage">
            </section>
            <sction class="d-flex">
                <article class="reservation d-flex justify-content-center align-items-center">
                    <div class="display-4">
                        실시간 <br>
                        예약 하기 
                    </div>
                </article>
                <article class="reservation-confirm">
                    <div class="m-4">
                        <div class="d-flex align-items-end">
                            <h3 class="mr-4">예약 확인</h3>
                        </div>
                        <div class="no-member-input mt-3" id="nonMember">
                            <div class="input-gorup form-inline">
                                <label class="input-label">이름 </label>
                                <input type="text" class="form-control text-input" id="name">
                            </div>
                            <div class="input-gorup form-inline mt-3">
                                <label class="input-label">전화번호 </label>
                                <input type="text" class="form-control text-input" id="phoneNumber">
                            </div>

                        </div>
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-success mt-3 mr-5" id="lookupBtn">조회 하기</button>
                        </div>
                    </div>
                </article>
                <article class="reservation-call d-flex justify-content-center align-items-center">
                    <div>
                        <h3>예약문의 : </h3>
                        <h1>010-</h1>
                        <h1>000-1111</h1>
                    </div>
                </article>
            </sction>

			<jsp:include page="global/footer.jsp"/>

        </div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(document).ready(function() {

        	$("#lookupBtn").on("click",function(){
        		
        		function dateFormat(dateValue){
        			let date = new Date(dateValue);
        			let year = date.getFullYear();
        			let month = date.getMonth()+1;
        			let day = date.getDate();
        			return year + "년 " + month + "월 " + day + "일"
        		}
        		
        		let name = $("#name").val().trim();
        		let phoneNumber = $("#phoneNumber").val().trim();
        		
        		if(name==""){
        			alert("이름을 입력해 주세요");
        			return;
        		}
        		if(phoneNumber==""){
        			alert("전화번호를 입력해 주세요");
        			return;
        		}
        		
        		$.ajax({
        			type:"get"
        			,url:"/pension/reservation/search"
        			,data:{"name":name,"ph":phoneNumber}
        			,success:function(data){
        				if(data.result === "success"){
        					let name = data.info.name;
        					let date = data.info.date;
        					let day = data.info.day;
        					let headcount = data.info.headcount;
        					let state = data.info.state;
        					alert(
        							"이름 : " + name + "\n"
        							+ "날짜 : " + dateFormat(date) + "\n"		
        							+ "일수 : " + day + "\n"		
        							+ "인원 : " + headcount + "\n"		
        							+ "상태 : " + state + "\n"		
        					);
        				} else alert("조회된 결과가 없습니다.");
        			}
        			,error:function(){
        				alert("오류가 발생되었습니다.");
        			}
        		})
        		
        	});

        } );
    </script>
    </body>
</html>