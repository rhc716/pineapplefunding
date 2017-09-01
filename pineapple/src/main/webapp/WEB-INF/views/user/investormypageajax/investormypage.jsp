<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투자자 MyPage</title>
</head>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />


<body>
<c:forEach var="investorData" items="${investorinvest}">
	<c:choose>
	<c:when test="${investorData.payCheck == 1}">
	<div class="col-xs-12 investorinvestmain">
		<div class="col-xs-6 investorinvestpadding0">
			<div class="col-xs-12 investoridandtime">
				<div class="investorid">${investorData.fdTitle}</div>
				<span class="investortime">${investorData.investTime}</span>
			</div>
			<div class="col-xs-12 investorinvestpadding0">
				<div class="col-xs-6 investorinvestpadding0">
				<div class="investmymoney">투자 결제 금액</div><div>새로운 쿼리문으로 적용</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 investorpandg">
			<div class="investorp">
			결제 모집금 : ${investorData.investtotal*investorData.issuePrice}
			</div>
			<div class="progress investorg">
 					<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(investorData.investtotal/investorData.numberOfShares)*100}%; min-width: 4em; max-width: 100%;">
   					<span class="investorgtext">${(investorData.investtotal/investorData.numberOfShares)*100}%</span>
 					</div>
			</div>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div class="col-xs-12 investorinvestpay0main">
		<div class="col-xs-6 investorinvestpadding0">
			<div class="col-xs-12 investorpay0idandtime">
				<div class="investorpay0id">${investorData.fdTitle}</div>
				<span class="investorpay0time">${investorData.investTime}</span>
			<c:choose>
				<c:when test="${investorData.fdStatus == '결제모집중'}">
				<a href="#">결제하기</a>
				</c:when>
			</c:choose>
			</div>
			<div class="col-xs-12 investorinvestpadding0">
				<div class="col-xs-6 investorinvestpadding0">
				<div class="investpay0mymoney">투자 예약 금액</div><div>새로운 쿼리문으로 적용</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 investorpay0pandg">
			<div>
				<c:choose>
					<c:when test="${investorData.fdStatus == '결제모집중'}">
						<div class="investorpay0p">
						결제 모집금 : ${investorData.investtotal*investorData.issuePrice}
						</div>
					</c:when>
					<c:otherwise>
						<div class="investorpay0p">
						예약 모집금 : ${investorData.investtotal*investorData.issuePrice}
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="progress investorpay0g">
 					<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(investorData.investtotal/investorData.numberOfShares)*100}%; min-width: 4em; max-width: 100%;">
   					<span class="investorpay0gtext">${(investorData.investtotal/investorData.numberOfShares)*100}%</span>
 					</div>
			</div>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
</c:forEach>
</body>
</html>