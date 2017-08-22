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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />

<script>
/*******************회사코드, 회사명 select option채워줄 ajax  ********************/
$(document).ready(function(){
	var getcomlist = $.ajax({
		type : "get",
		url : "/pineapple/getcomlist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "id01@maver.com" }
	});
	// 성공시
	getcomlist.done(function(msg){
		console.log(msg);
		for(var i = 0; i<msg.length; i++){
			$('#comList').append(
				'<option value="'+msg[i].comCode+'">'+msg[i].comName+'</option>'
			);
		}
	});
	// 실패시
	getcomlist.fail(function(){
		alert('ajax요청실패');
	});
});	
	
</script>

</head>
<body>

<div class="container">
<!--최상단 로고 및 로그인 or 로그아웃버튼 -->
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
			
				<form action="/pineapple/addfunding.pms" method="post" enctype="multipart/form-data">
					펀딩형태
					<select name="fdType">
						<option value="채권">채권</option>
						<option value="주식">주식</option>
					</select><br><br>
					회사명
					<select name="fdComCode" id="comList">
						<!-- ajax요청으로 회사명과 회사코드를 각각 넣어줌  -->
						<option value="null">선택하세요</option>
					</select><br><br>			
					펀딩명
					<input type="text" class="form-control" name="fdTitle"><br>
					최소투자금액
					<input type="text" class="form-control" name="minInvestMoney"><br>
					판매주식수
					<input type="text" class="form-control" name="numberOfShares"><br>
					주당발행가
					<input type="text" class="form-control" name="issuePrice"><br>	
					오픈일
					<input type="text" class="form-control" name="openDate"><br>
					마감일
					<input type="text" class="form-control" name="closeDate"><br>
					최소보장이율
					<input type="text" class="form-control" name="numberOfShares"><br>
					프로젝트 시작일
					<input type="text" class="form-control" name="projectStartDate"><br>
					프로젝트 마감일
					<input type="text" class="form-control" name="projectEndDate"><br>
						<!-- 히든값으로 펀딩개설자 name를 세션에서받아서 넣어줌 -->
					<input type="hidden" class="form-control" name="fdPublisher" value="id01@maver.com">
					<button type="submit"  class="btn btn-success">입력완료</button>
				</form>
			</div>
		<div class="col-md-1"></div>
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>