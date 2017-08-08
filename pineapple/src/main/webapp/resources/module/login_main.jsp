<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="" class="login_up login_form" method="post">
				<div class="login_insert">
					<input type="text" class="login_id" name="id">
					<input type="password" class="login_pw" name="pw">
				</div>
				<div class="login_btnsec">
				<div class="login_save">
					
				</div>
					<button type="button" class="login_bt btnpine btn-primary" >로그인</button>
				</div>
		</form>
			<div class="login_down">
				<div><a class="login_down_one" href="${pageContext.request.contextPath}/addUserForm">회원가입</a></div>
				<div class="login_down_two">ID/PW찾기</div>
			</div>
 
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