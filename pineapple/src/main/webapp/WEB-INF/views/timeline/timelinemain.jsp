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
	<div class="col-xs 12" style="text-align: center;">
		<h1>TIME LINE</h1>
	</div>
	<div class="col-xs-12">
		<div class="col-xs-9">
			<input type="text" class="form-control" placeholder="타임라인을 등록해주세요" style="width: 100%; height: 40px; margin-bottom: 10px;">
		</div>
		<div class="col-xs-3">
			<button style="width: 100%;height: 40px;font-size: 30px;border: 1px solid;">게시하기</button>
		</div>
		<div class="col-xs-12">
			<h2 style="text-align: center;">TIME LINE LIST</h2>
			<div class="col-xs-12">
				<div class="col-xs-12">
				ID or COMPANYNAME AND TIME
				</div>
				<div class="col-xs-12">
				TIMELINE TITLE
				</div>
				<div class="col-xs-12">
				TIMELINE CONTENT
				</div>
				<div class="col-xs-12">
				TIMELINE FOOTER
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>