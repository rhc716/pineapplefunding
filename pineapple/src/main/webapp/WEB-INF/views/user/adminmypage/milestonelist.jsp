<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>마일스톤리스트 조회검색</title>
</head>
<body>
<div class="container">
<!--로그인 버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
	<div class="row">
		<div class="col-md-3">
			<br>
			<p>펀딩 대시보드</p>
			<br>
			<nav id="mysidebarmenu" class="amazonmenu">
				<ul>
					<li><a href="/pineapple/mypage.user">MY PAGE 돌아가기</a></li>
					<li><a href="/pineapple/fundinglist.user">펀딩현황</a></li>
					<li><a href="/pineapple/milestonelist.user">마일스톤리스트</a></li>
					<li><a href="/pineapple/wbslist.user">WBS비교리스트</a></li>
					<li><a href="/pineapple/investorlist.user">투자자현황</a></li>
					<li><a href="/pineapple/dividendlist.user">배당지급현황</a></li>
				</ul>
			</nav> 
		</div>
		<div class="col-md-9">
			<br>
			<p id="explanation">
				펀딩별 마일스톤 전체 목록을 조회하고 검색할 수 있습니다.
			</p>
			<br>
			<!-- 조회 목록 출력될 부분 -->
			<div>
				
			</div>
		</div>
	</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>	
</body>
</html>