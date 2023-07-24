<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<header class="mt-4">
                <div class="text-center display-4" id="headerTitle">통나무 팬션</div>
                <nav class="mt-4">
                    <ul class="nav nav-fill">
                        <li class="nav-item"><a class="nav-link" href="#">팬션소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">객실보기</a></li>
                        <li class="nav-item"><a class="nav-link" href="/pension/reservation">예약하기</a></li>
                        <li class="nav-item"><a class="nav-link" href="/pension/reservation_list">예약목록</a></li>
                    </ul>
                </nav>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
                <script>
                	$(document).ready(function(){
	                	$("#headerTitle").on("click",function(){
	                		location.href = "/pension/home";
	                	})
                	});
                </script>
            </header>