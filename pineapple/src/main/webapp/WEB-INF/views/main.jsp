<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Pineapple Funding</title>

<!-- 파비콘 -->
<link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.ico">

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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />

<!-- 메인화면 배너 -->
<!-- 우측배너 -->
<script src="${pageContext.request.contextPath}/resources/js/mainbanner.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/utils/Draggable.min.js"></script>
<script>
$(document).ready(function(){
	// 우측 배너를 실행해줌 (처음 호출 후 10초마다 한번씩) 
	banner();
	setInterval("banner()", 10000);

	//모집중 랭킹 5 펀딩순위를 가져오는 ajax 요청
	var getcompanyrankingfive = $.ajax({
		type : "get",
		url : "/pineapple/getcompanyrankingfive.pms",
	});
	
	// 성공시
	getcompanyrankingfive.done(function(msg){
		console.log(msg);
		// 랭킹 5에 불러온 펀딩 수 만큼 추가해줌  // 링크도 걸어줌
		for(var i=0; i<msg.length; i++){
			$('#rankinglist').find("a:eq("+i+")").html(msg[i].fdTitle);
			$('#rankinglist').find("a:eq("+i+")").attr("href","/pineapple/investfunding.invest?fdCode="+msg[i].fdCode);
		}
		
	});	
	
	// 실패시
	getcompanyrankingfive.fail(function(){
		alert('ajax통신실패');
	});
	
	
});
 </script>
<style type="text/css">
#toptitlearea{
	padding: 0px 20px 0px 20px;
}
</style>
</head>
<body>
<div class="container">
	<div style="height: 25px;"></div>
	<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>


	<div class="row" id="toptitlearea">
		<!-- 타이틀 및 검색 -->
		<div class="col-xs-2 col-md-2 logoandsearch">
			<form action="/pineapple/mainsearch.pms" method="post" class="row" align="left">
			    <input style="width: 70%; display: inline;" name="searchtext" type="text" class="form-control" maxlength="10">
			    <button type="submit" class="btn btnpine btn-sm" style="display: inline;">
			    	<i class="glyphicon glyphicon-search" style="display: inline;"></i>
			    </button>
		   	</form>
		</div>
		<div class="col-xs-7 col-md-7">
		<!-- 타이틀영역 -->
			<div class="row" id="maintitlearea" align="left">
				<h2 class="colorchangetitle" align="center">프로젝트관리(PMS)가 가능한 크라우드펀딩사이트</h2>
				<h1 class="colorchangetitle" align="center"><b>PineApple</b></h1>
			</div>
		</div>
		<div class="col-xs-3 col-md-3">
		<!-- 로그인폼 -->
			<c:import url="/resources/module/login_main.jsp"/>
		</div>
	</div><br>

<!-- 본문 -->
<div class="row">
	<!-- 본문 좌측 -->
	<div class="col-xs-2 col-md-2">
		<div class="list-group" id="rankinglist">
		  <h4 align="center" class="list-group-item active"> 모집중 펀딩<br> 투자금액 순위 TOP5</h4>
		  <a href="#" class="list-group-item list-group-item-action" ></a>
		  <a href="#" class="list-group-item list-group-item-action list-group-item-success"></a>
		  <a href="#" class="list-group-item list-group-item-action list-group-item-info"></a>
		  <a href="#" class="list-group-item list-group-item-action list-group-item-warning"></a>
		  <a href="#" class="list-group-item list-group-item-action list-group-item-danger"></a>
		</div>
	</div>
	<!-- 본문 중앙부분 -->
	<div class="col-xs-7 col-md-7">
		<!-- 가장 큰 carousel1번 영역 -->
		<div class="row">
			<!-- carousel : 회전하면서 이미지를 보여주는 것 -->
			<div id="myCarousel1" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			    	<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
			    	<li data-target="#myCarousel1" data-slide-to="1"></li>
			    </ol>
			
			    <!-- 화면에 보여줄 아이템 들어갈 곳 -->
			    <div class="carousel-inner maincarouselitem">
			   		<div class="item active maincarouseliteminner" style="height: 450px;">
				    	 <h1>투자</h1>
                        	<p>파인애플 크라우드펀딩은 주식과 채권을
							발행해서 자금을 조달할 수 있는 방법입니다.<br>
                        	2017년 9월 25일부터 개설되었으며,<br>
                        	다양한 기업들이 투자를 유치하고 있습니다.</p>
                        
				    </div>
				    <div class="item maincarouseliteminner"  style="height: 450px;">
				    	<h1>파인애플 펀딩을 <br> 선택해야 하는 이유</h1>
						<p>일반 크라우드펀딩 처럼 단순히 투자하고 기다리는 것 뿐만 아니라,<br>
						프로젝트에 대한 실시간으로 이루어지는 정보를 얻을 수 있습니다.</p>
				    </div>
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel1" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
		  	</div>
		</div>
		  <!-- carousel 끝 -->
		<br>
		<div class="row">
			<h1><b class="mainfundingtitle">인기펀딩목록</b></h1>
			<c:forEach var="fdorderbytotal" items="${fdorderbytotal}">
				<div class="col-xs-6" style="text-align: center; padding: 0px 0px 0px 5px;">
					<table>
						<tr>	
							<td style="background-color: #EAEAEA; color: #000000">
								<h3>D -	${fdorderbytotal.days}  ${fdorderbytotal.fdStatus}</h3>
							</td>
						</tr>
						<tr>
							<td>
								<a href="/pineapple/investfunding.invest?fdCode=${fdorderbytotal.fdCode}">
									<img src="${pageContext.request.contextPath}/resources/files${fdorderbytotal.posterImg.substring(fdorderbytotal.posterImg.lastIndexOf('/'),fdorderbytotal.posterImg.length())}" width="100%" style="padding: 0.75px;">
								</a>
							</td>
						</tr>
						<tr>	
							<td style="background-color: #8C8C8C; color: #FFFFFF">
								<h3>${fdorderbytotal.comName}</h3>
								<span class="mainfdboxtitlearea"><b>${fdorderbytotal.fdTitle}</b></span>
							</td>
						</tr>
					</table>
			  	</div>
		  	</c:forEach>
		</div>
		
		<div class="row">
			<h1><b class="mainfundingtitle">신규펀딩목록</b></h1>
			<c:forEach var="fdorderbydate" items="${fdorderbydate}">
				<div class="col-xs-6" style="text-align: center; padding: 0px 0px 0px 5px;">
					<table>
						<tr>	
							<td style="background-color: #EAEAEA; color: #000000">
								<h3>D -	${fdorderbydate.days}  ${fdorderbydate.fdStatus}</h3>
							</td>
						</tr>
						<tr>
							<td>
								<a href="/pineapple/investfunding.invest?fdCode=${fdorderbydate.fdCode}">
									<img src="${pageContext.request.contextPath}/resources/files${fdorderbydate.posterImg.substring(fdorderbydate.posterImg.lastIndexOf('/'),fdorderbydate.posterImg.length())}"width="100%" style="padding: 0.75px;">
								</a>
							</td>
						</tr>
						<tr>	
							<td style="background-color: #8C8C8C; color: #FFFFFF">
								<h3>${fdorderbydate.comName}</h3>
								<span class="mainfdboxtitlearea"><b>${fdorderbydate.fdTitle}</b></span>
							</td>
						</tr>
					</table>	
				</div>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
	$('img').each(function(n){
		   console.log($(this));
		   $(this).on("error", function(){
			   $(this).attr("src", "${pageContext.request.contextPath}/resources/img/404alternateimage.jpg");
	    });
	});
	</script>	
	<!-- 본문 우측 부분 -->
	<div class="col-xs-3 col-md-3" style="padding-left: 30px;">
		<!-- 우측 배너 -->
		<div class="row">
			<a id="myAdLink" href="/pineapple/guidepage.pms">
				<div id="myAd">
				  <div class="myAd_Img" id="adBg"></div>
				  <div class="myAd_Img" id="myAd_chrome"></div>
				  <div class="myAd_Img" id="myAd_firefox"></div>
				  <div class="myAd_Img" id="myAd_head"></div>
				  <div id="myAd_txt1">파인애플 펀딩에 오신것을 환영합니다</div>
				  <div id="myAd_txt2">파인애플 펀딩이 처음이신가요 ?</div>
				  <div id="myAd_txt3">클릭하시면 가이드북으로 이동합니다</div>
				</div>
			</a>
		</div>
		

	</div>
	
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>