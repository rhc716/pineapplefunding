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
/* 보고서를 업로드할때 필요한 펀딩코드를 불러오는 ajax 요청 */
$(document).ready(function(){
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/getmyfundinglist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "id01@maver.com" }
	});
	
	getfundinglist.done(function(msg){
		console.log(msg);
		
		for(var i = 0; i<msg.length; i++){
			$('#fdselectlist').append(
				'<option value="'+msg[i].fdCode+'">'+msg[i].fdTitle+'</option>'
			);
		}
	});
	getfundinglist.fail(function(){
		alert('ajax통신 실패');
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
				<form action="/pineapple/addfundingfile.pms" enctype="multipart/form-data" method="post">
					펀딩명
					<select name="fileFdCode" id="fdselectlist">
					<option value="null">선택해주세요</option>
						<!-- ajax요청으로 목록을 채워줌 -->
					</select><br><br>
					<input type="file" name="uploadFile"><br><br>
					<button type="submit" class="btn btn-success">입력완료</button>
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