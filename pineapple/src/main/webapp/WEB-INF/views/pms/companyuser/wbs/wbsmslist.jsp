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

<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lsk.css" />

 
</head>
<body>

<div class="container">
<!--로고 및 검색 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<div class="row">
	<div class="col-md-3">
		<c:import url="/resources/module/pmsleftmenu.jsp"/>
	</div>
	<div class="col-md-9">
		<form action="/pineapple/wbsmsview.pms" method="post">	
			<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
			<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
			<button type="submit" class="btn btn-sm btn-primary">펀딩명 :  ${fdTitle}</button>
		</form>
		<div class="col-md-7">
			<c:forEach var="list" items="${mslist}">
				<form action="/pineapple/wbsform.pms" method="post">
					<div  class="container-fluid boxs">
						<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
						<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
						<input type="hidden" readonly="readonly"  name="milestoneCode" value="${list.milestoneCode}">
						<input type="hidden" readonly="readonly"  name="milestoneName" value="${list.milestoneName}">
						<input type="hidden" readonly="readonly"  name="msComCode" value="${list.msComCode}">
						마일스톤 단계 = ${list.milestoneStep}<br>
						마일스톤 이름 = ${list.milestoneName}<br>
						마일스톤 요약 = ${list.milestoneSummary}<br>
						<button type="submit" class="btn btn-sm btn-primary" name="btn" value="wbsinsert">WBS예상입력</button>
						<button type="submit" class="btn btn-sm btn-primary" name="btn" value="wbslist">WBS예상보기</button><br>
						<button type="submit" class="btn btn-sm btn-primary" name="btn" value="wbsainsert">WBS실제입력</button>
						<button type="submit" class="btn btn-sm btn-primary" name="btn" value="wbsalist">WBS실제보기</button>
					</div>
				</form>
			</c:forEach>
		</div>	
	</div>
</div>

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>