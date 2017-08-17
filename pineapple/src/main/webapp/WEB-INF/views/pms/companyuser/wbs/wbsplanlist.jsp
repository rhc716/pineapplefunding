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

<script>
/* 펀딩 리스트 불러올 ajax */
$(document).ready(function(){
	var wbsplan = $.ajax({
		type : "get",
		url : "/pineapple/wbsplanlist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "id01@maver.com" }
	});
	// 성공시
	wbsplan.done(function(msg){
		console.log(msg);
	
		var msgleng = msg.length;
		for(var i = 0; i<msgleng; i++){
				$('#wbsplanlist').append(
					'<form action="/pineapple/wbsplandetail.pms" method="post">' 
					+'<div class="col-xs-4 well">'
					+'<div>'
					+'<input type="hidden" name="wbsPlanCode" value="'+msg[i].wbsPlanCode+'"/>'
					+'펀딩명 :'+msg[i].fdTitle+'<br>'
					+'마일스톤명 :'+msg[i].milestoneName+'<br>'
					+'wbs순서:'+msg[i].wbsPlanOrder
					+'wbs이름 :'+msg[i].wbsPlanName+'<br>'
					+'<input type="submit" value="상세정보"/>'
					+'</div>'
					+'</div>'
					+'</form>'	
		)}
	})
})
		
</script>
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
	<div class="col-md-9" id ="wbsplanlist">
<%-- 		<c:forEach var="list" items="${wbsplanlist}">
		 	<form action="/pineapple/wbsplandetail.pms" method="post"> 
			 	<div class="col-xs-4 well">
					<div>
						<input type="hidden" name="wbsPlanCode" value="${list.wbsPlanCode}"/>
						펀딩명 = ${list.fdTitle}<br>
						마일스톤명 = ${list.milestoneName}<br>
						wbs순서 = ${list.wbsPlanOrder}
						wbs이름 = ${list.wbsPlanName}<br>
						<input type="submit" value="상세정보"/> 
					</div>
				</div>	
			</form>
		</c:forEach> --%>
	</div>
</div>
<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>