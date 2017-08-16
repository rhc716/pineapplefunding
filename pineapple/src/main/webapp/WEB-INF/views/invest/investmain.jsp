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

<!-- 개인.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

</head>
<body>
<div class="container">
<!--로그인 버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<!-- 펀딩 리스트 -->
<div class="row fdlist-main container text-center">
	<c:forEach var="list" items="${fundingList}">
 	<div class="col-xs-4 well fdlist-box">
		<a href="/pineapple/investfunding.invest?fdCode=${list.fdCode}">
			<img src="${pageContext.request.contextPath}/resources/img/invest/fundingone.jpg"width="303px" height="171px" >
		</a>
		<div>
		<h4 class="fdlist-title">
			<div>${list.fdTitle}</div>
		</h4>
		</div>
		<div class="fdlist-comname">
			${list.comName}
		</div>
		<div class="fdlist-data pd-a-10">
			구입한 주식합 = ${list.total}
			판매하는 주식 = ${list.numberOfShares}
			<div class="progress bor-defult">
  				<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(list.total/list.numberOfShares)*100}%; min-width: 3em; max-width: 100%;">
    				${(list.total/list.numberOfShares)*100}%
  				</div>
		</div>

	</div>
	</div>
	</c:forEach>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>