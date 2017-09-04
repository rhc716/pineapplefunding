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
/* 펀딩 리스트 불러올 ajax */
$(document).ready(function(){
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/wbsfundinglist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}" }
	});
	// 성공시
	getfundinglist.done(function(msg){
		console.log(msg);
		
		/* 날짜를 yyyy-mm-dd 형태로 바꿔주는 함수 */
		function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) month = '0' + month;
		    if (day.length < 2) day = '0' + day;

		    return [year, month, day].join('-');
		}
		
		//alert(formatDate(msg[0].fdDate));
		//펀딩리스트를 myfundinglist에 채워줌 // 수정버튼과 모달창, 삭제버튼을 만들어줌
		for(var i = 0; i<msg.length; i++){
			
				$('#myfundinglist').append(
						'<form action="/pineapple/wbsmsview.pms" method="post">' 
						/* 펀딩리스트 폼, 모달 버튼  */
						+'<div class="container-fluid fundinglistbox">'
						+'<input type="hidden" readonly="readonly"  name="fdCode" value="'+msg[i].fdCode+'">'
						+'<div class="fundinglistboxtop">'
						+'<h3>'+msg[i].fdTitle+'</h3><br>'
						+'<b>펀딩상태 : '+msg[i].fdStatus+'</b><br>펀딩개설자 : '+msg[i].fdPublisher
						+'개설요청일 : '+formatDate(msg[i].fdDate)+'</div>'
						+'<button type="submit" class="btn btn-sm btn-primary">마일스톤보기</button>'
						+'<input type="hidden" class="form-control" name="fdCode" value="'+msg[i].fdCode+'"/><br>'
						+'<input type="hidden" class="form-control" name="fdTitle" value="'+msg[i].fdTitle+'"/><br>'
						+'</div></div></form>'
				);
		}
	});
	// 실패시
	getfundinglist.fail(function(){
		alert('ajax통신실패');
	});
});
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
	<div class="col-md-9" id="myfundinglist">
<!-- 펀딩 리스트 뿌려질 곳 -->
	</div>

</div>

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>