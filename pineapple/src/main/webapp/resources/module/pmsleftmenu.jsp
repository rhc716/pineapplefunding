<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBulC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/js/leftmenu.js">
</script>
<body>

<!-- 분기를 통해 권한별 왼쪽 메뉴를 다르게 해줌 -->

<!-- 기업회원일 경우 -->
<nav id="mysidebarmenu" class="amazonmenu">
	<ul>
		<li><a href="">펀딩관리</a>
			<ul>
		  		<li><a href="">펀딩개설</a>
		  		<li><a href="">펀딩조회</a>
			</ul>
		</li>
		<li><a href="">마일스톤관리</a>
			<ul>
				<li><a href="">마일스톤생성</a></li>
				<li><a href="">마일스톤조회</a></li>
			</ul>
		</li>
		<li><a href="">WBS관리</a>
			<ul>
				<li><a href="">WBS예상작성</a></li>
				<li><a href="">WBS예상조회</a></li>
				<li><a href="">WBS실제작성</a></li>
				<li><a href="">WBS실제조회</a></li>
				<li><a href="">WBS승인</a></li>
			</ul>
		</li>
		<li><a>보고서관리</a>
			<ul>
				<li><a href="">보고서작성</a></li>
				<li><a href="">보고서조회</a></li>
			</ul>
		</li>
		<li><a>배당하기</a></li>
		<li><a>펀딩내권한부여</a></li>
	</ul>
</nav>
 
<!-- 투자자일 경우 -->
<nav class="vertical-menu">
	<ul>
		<li><a href="" class="active">펀딩관리</a></li>
		<li><a href="">마일스톤보기</a></li>
		<li><a href="">WBS보기</a></li>
		<li><a>배당내역보기</a></li>
	</ul>
</nav>

<!-- 관리자일 경우 -->
<!-- <nav class="vertical-menu">
	<ul>
		<li><a href="" class="active">펀딩관리</a></li>
		<li><a href="">마일스톤보기</a></li>
		<li><a href="">WBS보기</a></li>
		<li><a>배당내역보기</a></li>
	</ul>
</nav> -->
</body>
</html>