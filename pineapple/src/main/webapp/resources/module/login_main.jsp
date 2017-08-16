<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

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
</head>
<body>
<!-- 세션값 있을 경우 로그인 성공 후 화면, 세션값 없을 경우 로그인 화면 -->
	<c:choose>
		<c:when test="${not empty sessionScope.userLogin }">
			${msg}<br>
			${id}님 ${level} 권한으로 로그인<br>
			<a href="#">메시지</a>&nbsp&nbsp&nbsp
			<form action="/pineapple/logout.user" method="post">
				<button id="logoutBtn"type="submit" class="login_bt btnpine btn-primary">로그아웃</button>
			</form>
		</c:when>
		<c:otherwise>
			<p>로그인</p>
			<form id="loginForm" action="/pineapple/login.user" class="login_up login_form" method="post">
				<div class="login_insert">
					<input type="text" class="login_id" name="id">
					<input type="password" class="login_pw" name="pw">
				</div>
				<div class="login_btnsec">
				<div class="login_save">
				</div>
					<button id="loginBtn" type="submit" class="login_bt btnpine btn-primary" >로그인</button>
				</div>
				<div class="login_down">
				<div><a class="login_down_one" href="/pineapple/userinsert.user">회원가입</a></div>
				<div class="login_down_two">ID/PW찾기</div>
				</div>
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>