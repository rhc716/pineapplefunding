<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />
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
					$('#newmessage').css("color","#34ffd2");
					$('#newmessage').html(msg)
				}else{
					$('#newmessage').css("color","#34ffd2");
					$('#newmessage').html("0");
				}
				
		
			});	
			// 실패시
			getmynewmessagenum.fail(function(){
				alert('ajax통신실패');
			});
		}
	});
</script>
<style>
.topbtnspan{
	font-size: 15px;
}
.topbtnspan b{
	font-family: jejugothic;
}
</style>
</head>
<body>
<div class="row" align="right">
	<c:choose>
		<c:when test="${not empty sessionScope.userLogin}">
		
            <div style="float: right; display:block;">
				
				
	            <c:if test="${sessionScope.level eq '관리자'}">
		            <a href="/pineapple/adminmypage.user#message">
						<button type="button" class="btn btn-primary btn-sm" aria-label="left Align">
							<span class="topbtnspan glyphicon glyphicon-envelope pull-right"><b> 메세지 (<span id="newmessage">0</span>)</b></span>
						</button>
					</a>
	            </c:if>
	            <!-- 경영진과 일반사원을 분기해줌 -->
	            <c:if test="${sessionScope.level eq '기업회원'}">
		            <c:if test="${sessionScope.rank eq '경영진'}">
			            <a href="/pineapple/managermypage.user#message">
							<button type="button" class="btn btn-primary btn-sm" aria-label="left Align">
								<span class="topbtnspan glyphicon glyphicon-envelope pull-right"><b> 메세지 (<span id="newmessage">0</span>)</b></span>
							</button>
						</a>
		            </c:if>
		            <c:if test="${sessionScope.rank eq '일반사원' || empty sessionScope.rank}">
			            <a href="/pineapple/employeemypage.user#message">
							<button type="button" class="btn btn-primary btn-sm" aria-label="left Align">
								<span class="topbtnspan glyphicon glyphicon-envelope pull-right"><b> 메세지 (<span id="newmessage">0</span>)</b></span>
							</button>
						</a>
		            </c:if>
	            </c:if>
	            <c:if test="${sessionScope.level eq '투자자'}">
		            <a href="/pineapple/investormypage.user#message">
						<button type="button" class="btn btn-primary btn-sm" aria-label="left Align">
							<span class="topbtnspan glyphicon glyphicon-envelope pull-right"><b> 메세지 (<span id="newmessage">0</span>)</b></span>
						</button>
					</a>
	            </c:if>
		    </div> 
			<div style="float: right; display:block;">
				<a href="/pineapple/logout.user">
					<button type="button" class="btn btn-danger  btn-sm" aria-label="left Align">
					  <span class="topbtnspan glyphicon glyphicon-off" aria-hidden="true"><b> 로그아웃</b></span>
					</button>&nbsp;
				 </a>
			 </div>
			 <div style="float: right; display:block;">
				 <a href="/pineapple/mypage.user">
					<button type="button" class="btn btn-success  btn-sm" aria-label="left Align">
					  <span class="topbtnspan glyphicon glyphicon-user" aria-hidden="true"><b> 마이페이지</b></span>
					</button>&nbsp;
				 </a>
			</div> 
		</c:when>
		<c:otherwise>
			<div style="float: right; display:block;">
				<a href="/pineapple/login.user">
					<button type="button" class="btn btn-success  btn-sm" aria-label="left Align">
					  <span class="topbtnspan glyphicon glyphicon-globe" aria-hidden="true"><b> 로그인</b></span>
					</button>
				</a>
			</div>
			 <div style="float: right; display:block;">
				<a href="/pineapple/userinsert.user">
					<button type="button" class="btn btn-success btn-sm" aria-label="left Align">
					  <span class="topbtnspan glyphicon glyphicon-globe" aria-hidden="true"><b> 회원가입</b></span>
					</button>&nbsp;
				</a>
			</div> 
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>