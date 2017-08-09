<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />

<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />


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
			<div class="col-md-1"></div>
				<div class="col-md-7">
					<form action="" method="post">
						<label for="wbsplanhuman">WBS인원예상지출</label><br><br>
						인원수:<br>
						<input type="text" id=""><br>
						총비용:<br>
						<input type="text" id="milestoneName"><br>
						비고:<br>
						<input type="text" id="milestoneName"><br>
						<label for="wbsplanhuman">WBS예상장비지출</label><br>
						장비명:<br>
						<input type="text"><br>
						수:<br>
						<input type="text" id="milestoneName"><br>
						단가:<br>
						<input type="text" id="milestoneName"><br>
						총비용:<br>
						<input type="text" id="milestoneName">
						<label for="wbsplanhuman">WBS예상기타지출</label><br>
						비용명:<br>
						<input type="text"><br>
						가격:<br>
						<input type="text" id="milestoneName"><br>
						비고:<br>
						<input type="text" id="milestoneName"><br>
						<label for="wbsplanhuman">WBS시설예상지출</label><br><br>
						시설명:<br>
						<input type="text"><br>
						비용:<br>
						<input type="text" id="milestoneName"><br>
						비고:<br>
						<input type="text" id="milestoneName"><br>
						<label for="wbsplanhuman">WBS예상외주지출</label><br>
						업체명:<br>
						<input type="text"><br>
						비용:<br>
						<input type="text" id="milestoneName"><br>
						비고:<br>
						<input type="text" id="milestoneName">
						<label for="wbsplanhuman">WBS예상수익</label><br>
						수익상황:<br>
						<input type="text"><br>
						수익:<br>
						<input type="text" id="milestoneName">
						<button type="submit">입력완료</button>
					</form>
				</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</div>
<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>