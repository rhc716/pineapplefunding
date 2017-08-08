<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />
<style type="text/css">
	.fdlist-main{
				}
	.fdlist-box{height: 396px;
				width: 303px;
				margin: auto;
				padding: 0px;}
	.fdlist-title{padding: 12px 10px 2px;
				  font-size: 17px;
				  font-weight: bold}
	.fdlist-context{font-size : 11px;
					line-height: 17px;
    				height: 68px;
					margin-top: 7px;
   					margin-left: 10px;
  					margin-bottom: 0px;}
	.fdlist-comname{font-size: 13px;
					color: #252525;
					font-weight: bold;
   					text-align: left;
   					padding: 11px 10px 9px;}
	.fdlist-data{width: 303px;
   				 height: 88px;
   				 border-top: 1px solid #d7d7d7;}
	
</style>

</head>
<body>
<div class="container">
<!--로그인 버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<!-- 펀딩 리스트 -->
<div class="row fdlist-main">
	<div class="col-xs-4 well fdlist-box">
		<a href="/investfunding.invest">
			<img src="${pageContext.request.contextPath}/resources/img/invest/fundingone.jpg"width="303px" height="171px" >
		</a>
		<h4 class="fdlist-title">
			셀프웨딩족을 위한 웨딩O2O 어플
		</h4>
		<h6 class="fdlist-context">
 			웨딩플래너 없이 혼자서 쉽게 따져보고 결혼을 준비한다면?! 투명한 웨딩시장을 위해 만든 어플! 웨딩메이트입니다
		</h6>
		<div class="fdlist-comname">
			회사명
		</div>
		<div class="fdlist-data">
			펀딩성공률
		</div>
	</div>
	<div class="col-xs-4 well fdlist-box">
		<a href="#" style="text-align: center;">
			<img src="#"width="303px" height="171px" >
		</a>
		<h4 class="fdlist-title">
			셀프웨딩족을 위한 웨딩O2O 어플
		</h4>
		<h6 class="fdlist-context">
 			웨딩플래너 없이 혼자서 쉽게 따져보고 결혼을 준비한다면?! 투명한 웨딩시장을 위해 만든 어플! 웨딩메이트입니다
		</h6>
		<div class="fdlist-comname">
			회사명
		</div>
		<div class="fdlist-data">
			펀딩성공률
		</div>
	</div>
	<div class="col-xs-4 well fdlist-box">
		<a href="#" style="text-align: center;">
			<img src="#"width="303px" height="171px" >
		</a>
		<h4 class="fdlist-title">
			셀프웨딩족을 위한 웨딩O2O 어플
		</h4>
		<h6 class="fdlist-context">
 			웨딩플래너 없이 혼자서 쉽게 따져보고 결혼을 준비한다면?! 투명한 웨딩시장을 위해 만든 어플! 웨딩메이트입니다
		</h6>
		<div class="fdlist-comname">
			회사명
		</div>
		<div class="fdlist-data">
			펀딩성공률
		</div>
	</div>
	 
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>