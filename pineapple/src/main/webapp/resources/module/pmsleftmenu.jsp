<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBulC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 분기를 통해 권한별 왼쪽 메뉴를 다르게 해줌 -->

<!-- 기업회원일 경우 -->
	<div class="vertical-menu">
	  <ul>
	  	<li><a href="/pmsmain.pms" class="active">펀딩관리</a>
	  		<ul class="closed">
	  			<li><a href="/pmsmain.pms" class="active">펀딩오픈하기</a></li>
	  		</ul>
	  	</li>
	  	<li><a href="#">마일스톤 관리</a></li>	  
	  	<li><a href="#">WBS 관리</a></li>	  
	  	<li><a href="#">PMS 업무</a></li>	 
	  	<li><a href="#">WBS 예상 작성</a></li>	  
	  	<li><a href="#">WBS 실제 작성</a></li>  
	  	<li><a href="#">WBS 승인</a></li>	  
	  	<li><a href="#">배당하기</a></li>  
	  	<li><a href="#">보고하기</a></li>  
	  	<li><a href="#">펀딩내 권한부여</a></li>
	  </ul>
	</div>
</body>
</html>