<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Pineapple Funding</title>

<!-- 파비콘 -->
<link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.ico">

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
</head>
<body>
<div class="container">
	<div style="height: 25px;"></div>
	<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>


	<div class="row" id="toptitlearea">
		<!-- 타이틀 및 검색 -->
		<div class="col-xs-2 col-md-2 logoandsearch">
			<form action="/pineapple/mainsearch.pms" method="post" class="row" align="left">
			    <input style="width: 70%; display: inline;" name="searchtext" type="text" class="form-control" maxlength="10">
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
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>