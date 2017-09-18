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
// 용량 보기 쉽게 변환해주는 코드
function number_to_human_size(x) {
	  var s = ['bytes', 'kB', 'MB', 'GB', 'TB', 'PB'];
	  var e = Math.floor(Math.log(x) / Math.log(1024));
	  return (x / Math.pow(1024, e)).toFixed(2) + " " + s[e];
};


/* 업로드 리스트 불러올 ajax */
$(document).ready(function(){
	var getfundingfilelist = $.ajax({
		type : "get",
		url : "/pineapple/getfundingfilelist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}"},
		async : false
	});
	// 성공시
	getfundingfilelist.done(function(msg){
		console.log(msg);
	// 펀딩파일의 목록을 화면에 뿌려줌 
	for(var i = 0; i<msg.length; i++){
		$('#myfundingfilelist').append(
			'<tr>'
				+'<td>'+msg[i].fdTitle+'</td>'
				+'<td>'+msg[i].fdFileName+'</td>'
				+'<td>'+msg[i].fdFileExtension+'</td>'
				+'<td>'+number_to_human_size(msg[i].fdFileSize)+'</td>'
				+'<td><a href="calldownload.pms?fileFullPath='+msg[i].fdFileUploadName+'">'
				+'<button type="button" class="btn btn-sm btn-success">다운로드</button></a></td>'
				+'<td><a href="deletefundingfile.pms?fileFullPath='+msg[i].fdFileUploadName+'&fdFileCode='+msg[i].fdFileCode+'">'
				+'<button type="button" class="btn btn-sm btn-danger">삭제</button></a></td>'
			+'</tr>'
		);
	}
	
	});
	// 실패시
	getfundingfilelist.fail(function(){
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
	<div class="col-md-9">
	<div class="pagetitleandexplainbox">
		<h1>펀딩보고서조회</h1>
	</div>
		<table class="table" id="myfundingfilelist">
			<tr>
				<td>펀딩명</td>
				<td>보고서명</td>
				<td>보고서확장자</td>
				<td>보고서용량</td>
				<td>다운로드</td>
				<td>삭제</td>
			</tr>
			<!-- 리스트 뿌려질 곳 -->					
		</table>
	</div>

</div>

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>