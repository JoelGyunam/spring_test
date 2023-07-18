<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과거 날씨</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/weather/css/style.css" type="text/css">
</head>
<body>
	<div id = "wrap" class="">
	<div class="d-flex">
		<jsp:include page="weatherNav.jsp"/>

		<div id="section" class="container">
			<jsp:include page="sectionInsertWeather.jsp"/>
		</div>
	</div>	
		
		<jsp:include page="weatherFooter.jsp"/>
	
	</div>
	
	
		
</body>
</html>