<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#investmentmoneybtn').click(function(){
			$('#investmoneyform').submit();
		});
		$('#sendnumber').keyup(function(){
			var share = $(this).val()
			var IssuePrice = $(this).attr('IssuePrice')
			$('#receivenumber').val(Number(share)*Number(IssuePrice))
		});
	});
</script>
</head>
<body>
	<c:set var="moneyData" value="${investmentmoneydata}"></c:set>
	<div class="investmoney-form-group">
	<h3>총 판매 주</h3>
	<div>${moneyData.numberOfShares}</div>
	<h3>예약 주 수</h3>
	<div>${moneyData.purchaseShares}</div>
	<h3>구입 가능 주 수</h3>
	<fmt:parseNumber var="sharesnumber" value="${moneyData.numberOfShares-moneyData.moneytotal/moneyData.issuePrice}" integerOnly="true"/>
	<div>${sharesnumber}</div>
	<h3>주 구입</h3>
	<form id="investmoneyform" action="/pineapple/investmentmoney.invest" method="post">
		<input type="number" id="sendnumber" IssuePrice="${moneyData.issuePrice}">
	<input style="outline: none;" readonly="readonly" id="receivenumber" name="mfAmount">원
	<input type="hidden" value="${moneyData.fdCode}" name="mfFdCode">
	<input type="hidden" value="${moneyData.investCode}" name="mfInvestCode">
	</form>
	</div>
     <div class="modal-footer">
     	<button id="investmentmoneybtn" type="button" class="btn btn-default" data-dismiss="modal">결제하기</button>
       <button type="button" class="btn btn-default" data-dismiss="modal">그만두기</button>
     </div>
</body>
</html>