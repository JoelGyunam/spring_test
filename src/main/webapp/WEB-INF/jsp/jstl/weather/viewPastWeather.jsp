<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과거 날씨</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/weather/css/style.css" type="text/css">
</head>
<body>
	<div id = "wrap" class="">
	<div class="d-flex">
		<jsp:include page="weatherNav.jsp"/>

		<div id="section" class="container">
			<jsp:include page="sectionPastWeather.jsp"/>
		</div>
	</div>	
		<jsp:include page="weatherFooter.jsp"/>
	
	</div>
	
</body>
</html>