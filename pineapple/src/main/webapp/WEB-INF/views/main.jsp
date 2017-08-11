<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />


 
  
  
  

</head>
<body>
<div class="container">
<!--로고 및 검색 -->
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 logoandsearch">
			<img src="${pageContext.request.contextPath}/resources/img/logo.jpg">
			<i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;<input type="text">&nbsp;
			<button type="button" class="btn btnpine">검색</button>
		</div>
		<div class="col-md-3"></div>
	</div>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<div class="row">
	<!-- 본문 좌측 -->
	<div class="col-md-3">
	</div>
	<!-- 본문 중앙부분 -->
	<div class="col-md-6">
			<!-- carousel : 회전하면서 이미지를 보여주는 것 -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>
			
			    <!-- 화면에 보여줄 아이템 들어갈 곳 -->
			    <div class="carousel-inner">
			      <div class="item active">
			        <img src="https://www.w3schools.com/bootstrap/la.jpg" alt="Los Angeles" style="width:100%;">
			      </div>
			
			      <div class="item">
			        <img src="https://www.w3schools.com/bootstrap/chicago.jpg" alt="Chicago" style="width:100%;">
			      </div>
			    
			      <div class="item">
			        <img src="https://www.w3schools.com/bootstrap/ny.jpg" alt="New york" style="width:100%;">
			      </div>
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
		  	</div>
		  <!-- carousel 끝 -->
		  
		  
		</div>
		
	<!-- 본문 우측 부분 -->
	<div class="col-md-3">
		<c:import url="/resources/module/login_main.jsp"/>
	</div>
	 
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>