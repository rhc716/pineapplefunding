<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />

<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />


</head>
<body>

<div class="container">
<!--최상단 로고 및 로그인 or 로그아웃버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<div class="row">
	<div class="col-md-3">
		<c:import url="/resources/module/pmsleftmenu.jsp"/>
	</div>
	<div class="col-md-9">
		<div class="col-md-6">
		펀딩형태:
		<select id="fdType">
			<option value="채권형">채권형</option>
			<option value="주식형">주식형</option>
		</select><br><br>
		펀딩명:
		<input type="text" class="form-control" id="fdTitle"><br>
		최소투자금액:
		<input type="text" class="form-control" id="minInvestMoney"><br>
		판매주식수:
		<input type="text" class="form-control" id="numberOfShares"><br>
		주당발행가:
		<input type="text" class="form-control" id="issuePrice"><br>
	
	
		오픈일:
		<input type="text" class="form-control" id="openDate"><br>
		마감일:
		<input type="text" class="form-control" id="closeDate"><br>
		최소보장이율:
		<input type="text" class="form-control" id="numberOfShares"><br>
		
	</div>
	<div class="col-md-3">
	</div>
	
	<div class="col-md-3">
	</div>
	<div class="col-md-9">	
		<button>입력완료</button>
	</div>
	</div>
	
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>