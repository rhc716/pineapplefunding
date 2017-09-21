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
	<c:forEach var="timelinereplydelete" items="${timelinereplydelete}">
	<div class="col-xs-12" style="border: 1.5px solid #009442; border-radius: 5px; margin-bottom: 10px; padding: 0px;">
		<a href="/pineapple/investfunding.invest?fdCode=${timelinereplydelete.fdCode}" style="color: black;">
		<div class="col-xs-12" style="padding: 0px 5px;">
			<h4 style="margin: 0px; padding: 3px;">펀딩명</h4>
			<div style="padding: 3px;">${timelinereplydelete.fdTitle}</div>
		</div>
		<div class="col-xs-12" style="padding: 0px 5px;">
			<h4 style="margin: 0px; padding: 3px;">모집금액</h4>
			<div style="padding: 3px;">${timelinereplydelete.numberOfShares*timelinereplydelete.issuePrice}</div>
		</div>
		<div class="col-xs-12" style="padding: 0px 5px;">
			<h4 style="margin: 0px; padding: 3px;">모집률</h4>
		<div class="progress bor-defult" style="margin-bottom: 10px;">
  				<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(list.total/list.numberOfShares)*100}%; min-width: 3em; max-width: 100%;">
    				${(list.total/list.numberOfShares)*100}%
  				</div>
		</div>
		</div>
		</a>
	</div>

	</c:forEach>
</body>
</html>