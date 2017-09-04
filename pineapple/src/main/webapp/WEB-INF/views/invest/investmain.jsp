<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>invest Main</title>

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
<div class="row fdlist-main text-center" style="padding: 0px;">
<div class="col-md-12" id="menubar" style="padding: 0px">
	<div class="col-md-2" style="padding: 0px 0px 0px 0px; text-align: center; margin-left: auto; margin-right: auto;">
			<ul style="font-size: 20px; list-style: none; height: 100%; width: 100%; border: 1.5px solid #009442; border-radius: 5px; padding: 10px; text-align: center;">
				<li class="messagenav"><a class="messagenav1" dataCode="messagesend" href="#">메뉴</a></li>
				<li class="messagenav"><a class="messagenav1" dataCode="receivelist" href="#">BAR</a></li>
				<li class="messagenav"><a class="messagenav1" dataCode="sendlist" href="#">옴</a></li>
			</ul>
	</div>
	<div class="col-md-10" style="padding: 0px;">
	<c:forEach var="list" items="${fundingList}">
	<c:set var="poster" value="${list.posterImg}"></c:set>
 	<div class="col-md-4 fdlist-box" style="padding: 0px; margin: auto;">
 		<div class="col-md-12" style="padding: 0px 10px; margin-bottom: 20px;">
 		<div class="col-md-12" style="border: 1.5px solid #009442; padding: 0px;">
 		<c:choose>
 		<c:when test="${poster == null}">
 		<a href="/pineapple/investfunding.invest?fdCode=${list.fdCode}">
			<img src="${pageContext.request.contextPath}/resources/files/insertnotsum.jpg"width="100%" style="padding: 0.75px;">
		</a>
 		</c:when>
 		<c:otherwise>
		<a href="/pineapple/investfunding.invest?fdCode=${list.fdCode}">
			<img src="${pageContext.request.contextPath}/resources/files${poster.substring(poster.lastIndexOf('/'),poster.length())}"width="100%" style="padding: 0.75px;">
		</a>
		</c:otherwise>
		</c:choose>
		<div>
		<h4 class="fdlist-title">
			<div>${list.fdTitle}</div>
		</h4>
		</div>
		<div class="fdlist-comname">
			${list.comName}
		</div>
		<div class="fdlist-data" style="width: 100%">
		<div class="col-xs-12" style="padding: 0px 10px">
			<div style="float: left;">${list.minInvestMoney*list.numberOfShares}원 달성</div><div style="float: right;">${list.days}남음</div>
		</div>
		<div class="col-md-12" style="padding: 0px 10px 0px 10px;">
		<div class="progress bor-defult" style="margin-bottom: 10px;">
  				<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(list.total/list.numberOfShares)*100}%; min-width: 3em; max-width: 100%;">
    				${(list.total/list.numberOfShares)*100}%
  				</div>
		</div>
		</div>	
		</div>
	</div>
	</div>
	</div>
	</c:forEach>
	</div>
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>