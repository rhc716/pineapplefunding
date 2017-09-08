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
		<form action="/pineapple" method="get" class="row">
		    <a href="/pineapple" style="display: inline;"><img src="${pageContext.request.contextPath}/resources/img/logo.jpg"></a>
		    <input style="width: 40%; display: inline;"  type="text" class="form-control">
		    <button type="submit" class="btn btnpine" style="display: inline;">
		    	<i class="glyphicon glyphicon-search" style="display: inline;"></i>
		    </button>
	    </form>
	</div>
	<div class="col-md-3">
		<br>
			<c:choose>
				<c:when test="${not empty sessionScope.userLogin}">
					<div class="col-md-6" style="float: right; display:block;">
						<a href="/pineapple/logout.user">
							<button type="button" class="btn btn-danger " aria-label="left Align">
							  <span class="glyphicon glyphicon-off" aria-hidden="true"> 로그아웃</span>
							</button>
						 </a>
					 </div>
					 <div class="col-md-6" style="float: right; display:block;">
						 <a href="/pineapple/mypage.user">
							<button type="button" class="btn btn-danger " aria-label="left Align">
							  <span class="glyphicon glyphicon-user" aria-hidden="true"> 마이페이지</span>
							</button>
						 </a>
					</div> 
				</c:when>
				<c:otherwise>
					<div class="col-md-6" style="float: right; display:block;">
						<a href="/pineapple/login.user">
							<button type="button" class="btn btn-success " aria-label="left Align">
							  <span class="glyphicon glyphicon-globe" aria-hidden="true"> 로그인</span>
							</button>
						</a>
					</div>
					 <div class="col-md-6" style="float: right; display:block;">
						<a href="/pineapple/userinsert.user">
							<button type="button" class="btn btn-success " aria-label="left Align">
							  <span class="glyphicon glyphicon-globe" aria-hidden="true"> 회원가입</span>
							</button>
						</a>
					</div> 
				</c:otherwise>
			</c:choose>
	</div>
</div>
</body>
</html>