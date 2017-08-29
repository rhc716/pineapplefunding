<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투자자 MyPage</title>
</head>
<body>
<c:forEach var="investorData" items="${investorinvest}">
	<c:choose>
	<c:when test="${investorData.payCheck == 1}">
	<div class="col-xs-12"style="padding: 10px; border: 1px solid #d7d7d7; margin-bottom: 20px">
		<div class="col-xs-6" style="padding: 0px">
			<div class="col-xs-12" style="padding: 0px 10px 0px 0px;border-bottom: 1px solid #d7d7d7; margin-bottom: 5px;">
				<div style="font-size: 25px;padding: 0px;">${investorData.fdTitle}</div>
				<span style="opacity: 0.5">${investorData.investTime}</span>
			</div>
			<div class="col-xs-12" style="padding: 0px">
				<div class="col-xs-6" style="padding: 0px">
				<div style="font-size: 20px; margin-bottom: 10px;">투자 결제 금액</div><div>새로운 쿼리문으로 적용</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6" style="padding: 10px; line-height: 60px; text-align: center; border-left: 1px solid #d7d7d7;">
			<div style="font-size: 20px">
			결제 모집금 : ${investorData.investtotal*investorData.issuePrice}
			</div>
			<div class="progress" style="margin: 0px; border: 1px solid; height: 40px;">
 					<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(investorData.investtotal/investorData.numberOfShares)*100}%; min-width: 4em; max-width: 100%;">
   					<span style="line-height: 40px; font-size: 15px;">${(investorData.investtotal/investorData.numberOfShares)*100}%</span>
 					</div>
			</div>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div class="col-xs-12"style="padding: 10px; border: 1px solid #d7d7d7; margin-bottom: 20px">
		<div class="col-xs-6" style="padding: 0px">
			<div class="col-xs-12" style="padding: 0px 10px 0px 0px;border-bottom: 1px solid #d7d7d7; margin-bottom: 5px;">
				<div style="font-size: 25px;padding: 0px;">${investorData.fdTitle}</div>
				<span style="opacity: 0.5">${investorData.investTime}</span>
			<c:choose>
				<c:when test="${investorData.fdStatus == '결제모집중'}">
				<a href="#">결제하기</a>
				</c:when>
			</c:choose>
			</div>
			<div class="col-xs-12" style="padding: 0px">
				<div class="col-xs-6" style="padding: 0px">
				<div style="font-size: 20px; margin-bottom: 10px;">투자 예약 금액</div><div>새로운 쿼리문으로 적용</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6" style="padding: 10px; line-height: 60px; text-align: center; border-left: 1px solid #d7d7d7;">
			<div>
				<c:choose>
					<c:when test="${investorData.fdStatus == '결제모집중'}">
						<div style="font-size: 20px">
						결제 모집금 : ${investorData.investtotal*investorData.issuePrice}
						</div>
					</c:when>
					<c:otherwise>
						<div style="font-size: 20px">
						예약 모집금 : ${investorData.investtotal*investorData.issuePrice}
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="progress" style="margin: 0px;border: 1px solid; height: 40px;">
 					<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(investorData.investtotal/investorData.numberOfShares)*100}%; min-width: 4em; max-width: 100%;">
   					<span style="line-height: 40px; font-size: 15px;">${(investorData.investtotal/investorData.numberOfShares)*100}%</span>
 					</div>
			</div>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
</c:forEach>
</body>
</html>