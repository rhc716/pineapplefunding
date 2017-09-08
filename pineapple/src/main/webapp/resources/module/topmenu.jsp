<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 상단메뉴 -->
<c:choose>
	<c:when test="${not empty sessionScope.userLogin }">
		<div class="row navbar">
			<ul class="navbar_pine"><a href="/pineapple"><b style="color: #1ec545">PineApple</b></a></ul>
			<ul class="navbar_menuleft"><a href="/pineapple/timelinemain.timeline">타임라인</a></ul>
			<ul class="navbar_menuleft"><a href="/pineapple/investmain.invest">투자하기</a></ul>
			<ul class="navbar_menuleft"><a href="/pineapple/pmsmain.pms">프로젝트관리(펀딩)</a></ul>
			<ul class="navbar_menuright"><a>이용안내(개발중)</a></ul>
			<ul class="navbar_menuright"><a href="/pineapple/mypage.user?level=${level}">Mypage</a></ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row navbar">
			<ul class="navbar_pine"><a href="/pineapple"><b style="color: #1ec545">PineApple</b></a></ul>
			<ul class="navbar_menuleft"><a href="/pineapple/timelinemain.timeline">타임라인</a></ul>
			<ul class="navbar_menuleft"><a href="/pineapple/investmain.invest">투자하기</a></ul>
			<ul class="navbar_menuleft"><a href="/pineapple/pmsmain.pms" class="gologin">프로젝트관리(펀딩)</a></ul>
			<ul class="navbar_menuright"><a>이용안내(개발중)</a></ul>
			<ul class="navbar_menuright"><a href="/pineapple/userinsert.user">회원가입</a></ul>
		</div>
	</c:otherwise>
</c:choose>
</body>
</html>