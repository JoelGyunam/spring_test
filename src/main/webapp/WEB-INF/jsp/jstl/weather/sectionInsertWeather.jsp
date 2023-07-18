<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div id = "insert-weatehr" class = "container">
				<h3 class = "mt-3">날씨 입력</h3>
				
				<div class="m-2 mt-5">
					<form class="m-2" onsubmit="return validateForm()" method = "get" action = "/weather/callinsertWeatherController">
						<div>
							<div class="d-flex m-2">
								<label class="col-1">날짜</label>
								<input id="datepicker" class="form-control col-3" type="text" name = "date">
							</div>
							<div class="d-flex m-2">
								<label class="col-1">날씨</label>
								<select id = "weather" class="form-control col-4" name = "weather">
									<option>맑음</option>
									<option>구름조금</option>
									<option>흐림</option>
									<option>비</option>
								</select>
							</div>
							<div class="d-flex m-2">
							<label class="col-1">미세먼지</label>
								<select id = "microDust" class="form-control col-4" name = "microDust">
									<option>좋음</option>
									<option>보통</option>
									<option>나쁨</option>
									<option>최악</option>
								</select>
							</div>
						</div>

						<div class="d-flex">
							<div class="input-group m-2">
								<label class="p-1">기온</label>
								<input id = "temperatures" type = "text" class="form-control" name = "temperatures">
								<div class="input-group-append"><span class="input-group-text">°C</span></div>
							</div>
							<div class="input-group m-2">
								<label class="p-1">강수량</label>
								<input id = "precipation" type = "text" class="form-control" name = "precipation">
								<div class="input-group-append"><span class="input-group-text">mm</span></div>
							</div>
							<div class="input-group m-2">
								<label class="p-1">풍속</label>
								<input id = "windSpeed" type = "text" class="form-control" name = "windSpeed">
								<div class="input-group-append"><span class="input-group-text">km/h</span></div>
							</div>
						</div>
						<div class="p-1">
							<button class="btn btn-success col-12" type="submit">저장</button>
						</div>
					</form>
				</div>	
			</div>
			
		<script>
		$(document).ready(function(){
			 $( "#datepicker" ).datepicker();
		})
	
	
		function validateForm() {

		var date = $( "#datepicker" )[0].value;
	    var weather = $( "#weather" )[0].value;
	    var microDust = $("#microDust")[0].value;
	    var temperatures = $("#temperatures")[0].value;
		var precipation = $("#precipation")[0].value;
		var windSpeed = $("#windSpeed")[0].value;
		var dateValidate = /^\d{2}\/\d{2}\/\d{4}$/;
		var decimalValidate21 = /^\d{2}\.\d{1}$/;
		var decimalValidate31 = /^\d{3}\.\d{1}$/;
	      
		if (date===""){
				alert("날짜를 입력해 주세요");
				return false;
			} if (weather===""){
				alert("날씨 정보를 입력해 주세요");
				return false;
			} if (microDust===""){
				alert("미세먼지 정보를 입력해 주세요");
				return false;
			} if (temperatures===""){
				alert("기온을 입력해 주세요")
				return false;
			} if (precipation===""){
				alert("강수량을 입력해 주세요")
				return false;
			} if (windSpeed===""){
				alert("풍속을 입력해 주세요")
				return false;
			} if(!dateValidate.test(date)){
				alert("날짜가 올바르지 않습니다.")
				return false;
			} if(!decimalValidate21.test(temperature)){
				alert("기온의 소수점을 확인해 주세요")
				return false;
			} if(!decimalValidate31.test(temperature)){
				alert("강수량의 소수점을 확인해 주세요")
				return false;
			} if(!decimalValidate21.test(temperature)){
				alert("풍속의 소수점을 확인해 주세요")
				return false;
			}
			
			return true;
	}
	
	</script>