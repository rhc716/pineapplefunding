<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	$(document).ready(function(){
		$('#loginBtn').click(function(){
			var loginCheck = $.ajax({ // ajax실행부분
		            type: "post",
		            url : "/pineapple/login.user",
		            data : {id : loginId , pw : loginPw},
		            success : function(ic){
		            			if(ic.id == loginId){
		            				if(ic.pw == loginPw){
		            					alert('로그인 성공. 메인페이지 이동');
		            				} else {
		            					alert('비밀번호가 일치하지 않습니다');
		            				}
		            			} else {
		            				alert('아이디를 찾을 수 없습니다');
		            			}
		            		},
		            //로그인 요청 실패시 alert 표시
		            error : function error(){
		            		alert('페이지를 찾을 수 없습니다');
		            		}
				});
			
		});
	});
</script>



</head>
<body>
		<div>
			session id : ${id}<br>
		    session nickname : ${nickname}<br>
		    session age : ${level}<br>
	    </div>
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
		

<!--
 		<div id="lf_a">
			님 반갑습니다 <a href="" id="log_out_btn">로그아웃</a>
		</div>
		<dl id="lf_b">
			<dt>작성글: </dt><dd>dddd</dd>
			<dt>댓글: </dt><dd>dddd</dd>
			<dt>방명록: </dt><dd>dddd</dd>
		</dl>
		<dl id="lf_c">
			<dt>권한 :</dt><dd></dd> 
			<dt>lv :</dt><dd></dd>
		</dl>
		<div id="lf_d">
			<a href="" id="a_logbox"></a>
			<input type="button" onclick="location.href=''" id="btn_userinfo" value="회원정보">
		</div>
 -->
</body>
</html>