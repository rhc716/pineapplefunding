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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
		<div class="pagetitleandexplainbox" style="width: 690px;">
			<h1>진행중 펀딩 조회</h1>
			<span>
				<b> 진행중 펀딩 LIST 를 조회합니다.</b>
			</span>
		</div>
		<c:forEach var="divlist" items="${getMyFundingDividendpay}">
			<div class="container-fluid fundinglistbox">
			<input type="hidden" readonly="readonly" value="'+msg[i].fdCode+'">
			<div class="fundinglistboxtop">
			<h3>${divlist.fdTitle}</h3><br>
			<b>펀딩상태 : ${divlist.fdStatus}</b><br>펀딩개설자 : ${divlist.fdPublisher} 개설요청일 : ${divlist.fdDate}</div>
			<div class="fundinglistboxbottom"><a href="/pineapple/mydividendpayinvestlist.invest">
			<button type="button" class="btn btn-sm btn-primary">투자자 배당하기
			</button></a></div></div>
		</c:forEach>
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>