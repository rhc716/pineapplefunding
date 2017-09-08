<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row" align="right">
	<c:choose>
		<c:when test="${not empty sessionScope.userLogin}">
			<div style="float: right; display:block;">
				<a href="/pineapple/logout.user">
					<button type="button" class="btn btn-danger  btn-sm" aria-label="left Align">
					  <span class="glyphicon glyphicon-off" aria-hidden="true">로그아웃</span>
					</button>
				 </a>
			 </div>
			 <div style="float: right; display:block;">
				 <a href="/pineapple/mypage.user">
					<button type="button" class="btn btn-danger  btn-sm" aria-label="left Align">
					  <span class="glyphicon glyphicon-user" aria-hidden="true">마이페이지</span>
					</button>&nbsp;
				 </a>
			</div> 
		</c:when>
		<c:otherwise>
			<div style="float: right; display:block;">
				<a href="/pineapple/login.user">
					<button type="button" class="btn btn-success  btn-sm" aria-label="left Align">
					  <span class="glyphicon glyphicon-globe" aria-hidden="true">로그인</span>
					</button>
				</a>
			</div>
			 <div style="float: right; display:block;">
				<a href="/pineapple/userinsert.user">
					<button type="button" class="btn btn-success btn-sm" aria-label="left Align">
					  <span class="glyphicon glyphicon-globe" aria-hidden="true">회원가입</span>
					</button>&nbsp;
				</a>
			</div> 
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>