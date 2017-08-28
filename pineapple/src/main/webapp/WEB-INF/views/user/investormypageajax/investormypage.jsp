<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투자자 MyPage</title>
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

<!-- css lbr -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lbr.css" />

</head>
<body>
<c:forEach var="investorData" items="${investorinvest}">
	<c:choose>
	<c:when test="${investorData.payCheck == 1}">
	<div class="col-xs-12"style="padding: 0px">
		<div class="col-xs-6" style="padding: 0px">
			<div class="col-xs-12" style="padding: 0px">
			<span>펀딩제목 넣을공간</span>
			<span>${investorData.investTime}</span>
			</div>
			<div class="col-xs-12" style="padding: 0px">
				<div class="col-xs-6">
				내가 투자한 금액 : ${investorData.investtotal*investorData.issuePrice} 하고 주당발행가 합산
				</div>
			</div>
			<div class="col-xs-12" style="padding: 0px">
				<div class="progress bor-defult">
  					<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%; min-width: 3em; max-width: 100%;">
    					프로그레스 바 
  					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6" style="padding: 0px">
			<div class="col-xs-12" style="padding: 0px">
			4
			</div>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div class="col-xs-12"style="padding: 0px">
		<div class="col-xs-6" style="padding: 0px">
			<div class="col-xs-12" style="padding: 0px">
			<span></span>
			</div>
			<div class="col-xs-12" style="padding: 0px">
				<div class="col-xs-6">
				내가 투자한 금액 : ${investorData.investtotal*investorData.issuePrice} 하고 주당발행가 합산
				</div>
			</div>
			<div class="col-xs-12" style="padding: 0px">
				<div class="progress bor-defult">
  					<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%; min-width: 3em; max-width: 100%;">
    					프로그레스 바 
  					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6" style="padding: 0px">
			<div class="col-xs-12" style="padding: 0px">
			4
			</div>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
</c:forEach>
</body>
</html>