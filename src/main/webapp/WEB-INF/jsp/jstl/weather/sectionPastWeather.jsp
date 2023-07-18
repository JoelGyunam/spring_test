<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
			<div id = "pastWeather" class = "container">
				<h3 class = "mt-3">과거 날씨</h3>
				
				<table class="table text-center fs-small">
					<thead>
						<tr>
							<th class="fs-small">날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var = "i" items="${selectPastMd }" varStatus = "status">
						<tr>
							<td><fmt:formatDate value = "${i.date }" pattern = "yyyy년 M월 d일"/></td>
							<td>
								<c:choose>
									<c:when test="${i.weather eq '맑음'}"><img height = "30" src = "/weather/image/weatherIcon/sunny.png"></c:when>
									<c:when test="${i.weather eq '구름조금'}"><img height = "30" src = "/weather/image/weatherIcon/littlecloud.png"></c:when>
									<c:when test="${i.weather eq '흐림'}"><img height = "30" src = "/weather/image/weatherIcon/cloud.png"></c:when>
									<c:when test="${i.weather eq '비'}"><img height = "30" src = "/weather/image/weatherIcon/rainy.png"></c:when>
								</c:choose>
							</td>
							<td>${i.temperatures }°C</td>
							<td>${i.precipation }mm</td>
							<td>${i.microDust }</td>
							<td>${i.windSpeed }km/h</td>
						</tr>
						</c:forEach>
					</tbody>
					
				</table>
				
			</div>