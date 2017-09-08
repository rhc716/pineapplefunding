<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />

<!-- 메인화면 배너 -->
<!-- 우측배너 -->
<script src="${pageContext.request.contextPath}/resources/js/mainbanner.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/utils/Draggable.min.js"></script>
<script>
	$(document).ready(function(){
		// 우측 배너를 실행해줌 (처음 호출 후 10초마다 한번씩) 
		banner();
		setInterval("banner()", 10000);
		
	});
 </script>
 
<style type="text/css">
#toptitlearea{
	padding: 20px 20px;
}
</style>
</head>
<body>
<div class="container">
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>


	<div class="row" id="toptitlearea">
		<!-- 로고 및 검색 -->
		<div class="col-xs-2 col-md-2 logoandsearch">
			<form action="/pineapple" method="get" class="row" align="left">
			    <input style="width: 70%; display: inline;"  type="text" class="form-control">
			    <button type="submit" class="btn btnpine btn-sm" style="display: inline;">
			    	<i class="glyphicon glyphicon-search" style="display: inline;"></i>
			    </button>
		   	</form>
		</div>
		<div class="col-xs-7 col-md-7">
		<!-- 타이틀영역 -->
			<div class="row" id="maintitlearea" align="left">
				<h2 class="colorchangetitle" align="center">프로젝트관리(PMS)가 가능한 크라우드펀딩사이트</h2>
				<h1 class="colorchangetitle" align="center"><b>PineApple</b></h1>
			</div>
		</div>
		<div class="col-xs-3 col-md-3">
		<!-- 로그인폼 -->
			<c:import url="/resources/module/login_main.jsp"/>
		</div>
	</div><br>

<!-- 본문 -->
<div class="row">
	<!-- 본문 좌측 -->
	<div class="col-xs-2 col-md-2">
	</div>
	<!-- 본문 중앙부분 -->
	<div class="col-xs-7 col-md-7">
		<!-- 가장 큰 carousel1번 영역 -->
		<div class="row">
			<!-- carousel : 회전하면서 이미지를 보여주는 것 -->
			<div id="myCarousel1" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			    	<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
			    	<li data-target="#myCarousel1" data-slide-to="1"></li>
			    </ol>
			
			    <!-- 화면에 보여줄 아이템 들어갈 곳 -->
			    <div class="carousel-inner">
				    <div class="item active">
				    	<img src="${pageContext.request.contextPath}/resources/img/main/photo1.jpg" alt="Los Angeles" style="width:100%; height:450px;">
				    </div>
				    <div class="item">
				    	<img src="${pageContext.request.contextPath}/resources/img/main/photo2.jpg" alt="Chicago" style="width:100%; height:450px;">
				    </div>
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel1" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
		  	</div>
		</div>
		  <!-- carousel 끝 -->
		  <br>
		  
		<!-- carousel2,3번 영역 -->
		<div class="row">	
			<div id="myCarousel2" class="carousel slide" data-ride="carousel" style="width: 48%; height:225px; float: left;">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			    	<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
			    	<li data-target="#myCarousel2" data-slide-to="1"></li>
			    </ol>
			
			    <!-- 화면에 보여줄 아이템 들어갈 곳 -->
			    <div class="carousel-inner">
				    <div class="item active">
				    	<img src="${pageContext.request.contextPath}/resources/img/main/photo1.jpg" alt="Los Angeles" style="width:100%; height:225px;">
				    </div>
				    <div class="item">
				    	<img src="${pageContext.request.contextPath}/resources/img/main/photo2.jpg" alt="Chicago" style="width:100%; height:225px;">
				    </div>
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel2" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel2" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
		  	</div>
		  <!-- carousel 끝 -->
		
		<!-- carousel : 회전하면서 이미지를 보여주는 것 -->
			<div id="myCarousel3" class="carousel slide" data-ride="carousel" style="width: 48%; height:225px; float: right;">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			    	<li data-target="#myCarousel3" data-slide-to="0" class="active"></li>
			    	<li data-target="#myCarousel3" data-slide-to="1"></li>
			    </ol>
			
			    <!-- 화면에 보여줄 아이템 들어갈 곳 -->
			    <div class="carousel-inner">
				    <div class="item active">
				    	<img src="${pageContext.request.contextPath}/resources/img/main/photo1.jpg" alt="Los Angeles" style="width:100%; height:225px;">
				    </div>
				    <div class="item">
				    	<img src="${pageContext.request.contextPath}/resources/img/main/photo2.jpg" alt="Chicago" style="width:100%; height:225px;">
				    </div>
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel3" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel3" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
		  	</div>
		  <!-- carousel 끝 -->
		</div>
		<br>
		<br>
		<div class="row">
		인기펀딩목록
		<br><br><br><br><br><br><br><br>
		
		신규펀딩목록
		<br><br><br><br><br><br><br><br>
		</div>
		
	</div>
		
	<!-- 본문 우측 부분 -->
	<div class="col-xs-3 col-md-3" style="padding-left: 30px;">
		<!-- 우측 배너 -->
		<div class="row">
			<a id="myAdLink" href="">
				<div id="myAd">
				  <div class="myAd_Img" id="adBg"></div>
				  <div class="myAd_Img" id="myAd_chrome"></div>
				  <div class="myAd_Img" id="myAd_firefox"></div>
				  <div class="myAd_Img" id="myAd_head"></div>
				  <div id="myAd_txt1">파인애플 펀딩에 오신것을 환영합니다</div>
				  <div id="myAd_txt2">파인애플 펀딩이 처음이신가요 ?</div>
				  <div id="myAd_txt3">클릭하시면 가이드북으로 이동합니다</div>
				</div>
			</a>
		</div>
		

	</div>
	
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>