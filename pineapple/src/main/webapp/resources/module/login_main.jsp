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
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	$(document).ready(function(){
		if(${not empty sessionScope.userLogin}){
			console.log('메인에서 로그인 이벤트 발생');
			// 새메세지가 있을경우 알림을 위한 메세지수를 가져오는 ajax
			var getmynewmessagenum = $.ajax({
				type : "get",
				url : "/pineapple/getmynewmessagenum.pms",
				/* 아이디 세션에서 받아서 가져옴 */
				data : { userId : "${id}"}
			});
			// 성공시
			getmynewmessagenum.done(function(msg){
				console.log(msg);
				// 새메세지가 있을때
				if(msg!=0){
					$('#newmessage').css("color","#e95343");
					$('#newmessage').html(msg)
				}else{
					$('#newmessage').css("color","#0c1218");
				}
				
		
			});	
			// 실패시
			getmynewmessagenum.fail(function(){
				alert('ajax통신실패');
			});
		}
	});
</script>
</head>
<body>
<!-- 세션값 있을 경우 로그인 성공 후 화면, 세션값 없을 경우 로그인 화면 -->
	<c:choose>
		<c:when test="${not empty sessionScope.userLogin}">
			<div id="user-widget" class="list-group">
	            <div class="list-group-item heading">
	               <div class="text-wrap">
	                  <h4 class="list-group-item-heading">${userLogin.nickname}</h4>
	                  <p class="list-group-item-text">${level} ${rank} 권한 로그인중</p>
	               </div>
	               <div class="clearfix"></div>
	            </div>
	            <a href="/pineapple/mypage.user" class="list-group-item">
	               <i class="fa fa-user fa-lg pull-right" style="color: #009442;"></i>
	               <p class="list-group-item-text">${nickname}님의 마이페이지</p>
	            </a>
	            <a href="/pineapple/investormypage.user#message" class="list-group-item">
	               <i class="glyphicon glyphicon-envelope pull-right" style="color: #01619d;"></i>
	               <p class="list-group-item-text">메세지 (<span id="newmessage">0</span>)</p>
	            </a>
	            <a href="/pineapple/logout.user" class="list-group-item">
	               <i class="glyphicon glyphicon-off pull-right logouttxt"></i>
	               <p class="list-group-item-text">로그아웃</p>
	            </a>
			</div>
		</c:when>
		<c:otherwise>
			<p>로그인</p>
			<form id="loginForm" action="/pineapple/login.user" class="login_up login_form" method="post">
				<div class="login_insert">
					<input type="text" class="login_id" name="id" value="id01@maver.com">
					<input type="password" class="login_pw" name="pw" value="asdf1234">
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
			<form id="loginForm" action="/pineapple/login.user" method="post">
					<input type="hidden" name="id" value="admin">
					<input type="hidden" name="pw" value="asdf1234">
			<button type="submit" class="btn btn-sm btn-success" style="float:left; padding:2px 2px;">관리자 로그인</button>
			</form>
			<form id="loginForm" action="/pineapple/login.user"  method="post">
							<input type="hidden" name="id" value="id02@maver.com">
							<input type="hidden" name="pw" value="asdf1234">
			<button type="submit" class="btn btn-sm btn-success" style="float:left; padding:2px 2px;">투자자 로그인</button>
			</form>
			<form id="loginForm" action="/pineapple/login.user"  method="post">
							<input type="hidden" name="id" value="id01@maver.com">
							<input type="hidden" name="pw" value="asdf1234">
			<button type="submit" class="btn btn-sm btn-success" style="float:left; padding:2px 2px;">기업회원 로그인</button>
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>