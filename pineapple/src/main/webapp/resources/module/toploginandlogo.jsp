<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6 logoandsearch">
		<a href="/pineapple"><img src="${pageContext.request.contextPath}/resources/img/logo.jpg"></a>
	</div>
	<c:choose>
		<c:when test="${not empty sessionScope.userLogin }">
			<div class="col-md-3">
				<form action="/pineapple/logout.user" method="post">
					<button id="logoutBtn" type="submit" class="btn btnpine loginorlogoutbtn">로그아웃</button>
				</form>
			</div> 
		</c:when>
		<c:otherwise>
			<div class="col-md-3">
				<form action="/pineapple/login.user" method="get">
					<button id="loginBtn" type="submit" class="btn btnpine loginorlogoutbtn">로그인</button>
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	
</div>
</body>
</html>