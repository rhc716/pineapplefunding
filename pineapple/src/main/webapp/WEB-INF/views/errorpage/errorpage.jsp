<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
body {
   font-family: jejugothic, sans-serif;
   text-align: center;
   color: #424545;
   background-color: #f1c40f;
   transition: background 500ms ease;
}

.error h1 {
   font-size: 10em;
}

.error h2 {
   top: 5%;
}

.error h2.emoji {
   font-size: 4em;
}

body:hover,
body:active {
   background-color: #2ecc71;
   transition: background 1.5s ease-in;
}
</style>
</head>
<body>
<% 
Integer status_code = (Integer)request.getAttribute("javax.servlet.error.status_code");
request.setAttribute("status_code", status_code);
%>
<c:if test="${status_code eq 400}">
	<div class="error">
	   <h2 class="emoji">&#x25D5; &#xFE35; &#x25D5;</h2>
	   <h2>요청이 잘못되었습니다</h2>
	   <h1>${status_code}</h1>
	</div>
</c:if>
<c:if test="${status_code eq 404}">
	<div class="error">
	   <h2 class="emoji">&#x25D5; &#xFE35; &#x25D5;</h2>
	   <h2>요청하신 페이지가 없습니다</h2>
	   <h1>${status_code}</h1>
	</div>
</c:if>
<c:if test="${status_code eq 405}">
	<div class="error">
	   <h2 class="emoji">&#x25D5; &#xFE35; &#x25D5;</h2>
	   <h2>요청이 잘못되었습니다</h2>
	   <h1>${status_code}</h1>
	</div>
</c:if>
<c:if test="${status_code eq 500}">
	<div class="error">
	   <h2 class="emoji">&#x25D5; &#xFE35; &#x25D5;</h2>
	   <h2>서버 내부에 에러가 발생해서 처리중입니다</h2>
	   <h1>${status_code}</h1>
	</div>
</c:if>
<c:if test="${status_code eq 503}">
	<div class="error">
	   <h2 class="emoji">&#x25D5; &#xFE35; &#x25D5;</h2>
	   <h2>서버가 일시적으로 서비스 제공할 수 없습니다</h2>
	   <h1>${status_code}</h1>
	</div>
</c:if>
</body>
</html>