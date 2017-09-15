<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#footerp {
		line-height: 25px;
		border: 1px solid #50e2c2; 
		padding: 8px 8px;
		color: #50e2c2;
		margin-top:25px; 
	} 
	
	.team {
		height: 30px;
	}
	
.colorchangetitle {
    -webkit-animation-name: example; /* Safari 4.0 - 8.0 */
    -webkit-animation-duration: 4s; /* Safari 4.0 - 8.0 */
    animation-name: examplecolorchange;
    animation-duration: 7s;
    animation-iteration-count: infinite;
}
.asdfasdf{
	color : #e84c3d;
	color : #f8f8cd;
	color : #081420;
}
/* Safari 4.0 - 8.0 */
@-webkit-keyframes examplecolorchange {
    0%   {color: #e84c3d;}
    25%  {color: #f8f8cd;}
    50%  {color: #081420;}
    75%  {color: #f8f8cd;}
    100% {color: #e84c3d;}
}

/* Standard syntax */
@keyframes examplecolorchange {
    0%   {color: #e84c3d;}
    25%  {color: #f8f8cd;}
    50%  {color: #081420;}
    75%  {color: #f8f8cd;}
    100% {color: #e84c3d;}
}

</style>
</head>
<body>
<!-- 풋터 -->
<div class="row footer">
	<div class="col-xs-6 col-md-6">
		<h2 class="colorchangetitle"><i class="glyphicon glyphicon-grain"></i> PineappleFunding</h2>
		<p id="footerp">pineapplefunding은 플랫폼을 제공하는 중개자(온라인소액투자중개자 및 통신판매중개자)로 크라우드펀딩으로 자금을 모집하는 당사자가 아니며,
		투자손실의 위험을 보전하거나 보상품 제공을 보장해 드리지 못합니다</p>
	</div>
	<div class="col-xs-4 col-md-4">
		<b style="color: #1ec545;">팀원 사이트가기</b> <br>
		<div class="team row">
		노현철 <i class="glyphicon glyphicon-hand-right"></i> 
		<a href="http://jack716.cafe24.com/"><button type="button" class="btn btn-sm btn-success">호스팅사이트로</button></a>
		<a href="http://blog.naver.com/jack716"><button type="button" class="btn btn-sm btn-primary">블로그로</button></a>
		<a href="https://github.com/rhc716"><button type="button" class="btn btn-sm btn-info">Git으로</button></a>
		</div>
		<div class="team row">
		이슬기 <i class="glyphicon glyphicon-hand-right"></i> 
		<a href=""><button type="button" class="btn btn-sm btn-success">호스팅사이트로</button></a>
		<a href="http://blog.naver.com/cruel9768"><button type="button" class="btn btn-sm btn-primary">블로그로</button></a>
		<a href="https://github.com/lsk9768/ "><button type="button" class="btn btn-sm btn-info">Git으로</button></a>
		</div>
		<div class="team row" >
		이보라 <i class="glyphicon glyphicon-hand-right"></i> 
		<a href="http://swswbrbr.cafe24.com/pineapple/"><button type="button" class="btn btn-sm btn-success">호스팅사이트로</button></a>
		<a href="http://blog.naver.com/essence14"><button type="button" class="btn btn-sm btn-primary">블로그로</button></a>
		<a href="https://github.com/swswbrbr"><button type="button" class="btn btn-sm btn-info">Git으로</button></a>
		</div>
		<div class="team row">
		은혁진 <i class="glyphicon glyphicon-hand-right"></i> 
		<a href="http://gurwls2399.cafe24.com"><button type="button" class="btn btn-sm btn-success">호스팅사이트로</button></a>
		<a href="http://sseambong.tistory.com/"><button type="button" class="btn btn-sm btn-primary">블로그로</button></a>
		<a href="https://github.com/Eunjin0910"><button type="button" class="btn btn-sm btn-info">Git으로</button></a>
		</div>
	</div>
	<div class="col-xs-2 col-md-2" align="right" id="footerright">
	<br>
	<br>
	<br>
		<a href="http://ksmart.or.kr/" class="colorchangetitle" style="text-decoration: none; ">http://ksmart.or.kr/</a>
	</div>
</div>
</body>
</html>