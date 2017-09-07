<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			${list.fdTitle}
		</h4>
		</div>
		<div class="fdlist-comname">
			${list.comName}
		</div>
		<div class="fdlist-data" style="width: 100%">
			<div class="col-xs-12" style="padding: 0px 10px">
				<div style="float: left;">${list.issuePrice*list.total}원 달성<span style="font-size: 13px; opacity: 0.5">(${list.fdStatus})</span></div><div style="float: right;">${list.days}남음</div>
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
</body>
</html>