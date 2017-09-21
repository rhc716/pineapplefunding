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
				<h1 class="guidetitlebox" class="colorchangetitle" align="center"><b>PineApple</b></h1>
			</div>
		</div>
		<div class="col-xs-3 col-md-3">
		<!-- 로그인폼 -->
			<c:import url="/resources/module/login_main.jsp"/>
		</div>
	</div><br>

<!-- 본문 -->
<div class="row">
	<div class="col-xs-1"></div>
	<div class="col-xs-10 guidebigbox">
		<div class="row">
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					파인애플펀딩의 프로젝트관리 목적
				</h1>
				<div class="guidecontentbox">
					1. 기업은 WBS 단위로 프로젝트 상세하게 관리 할 수 있다.<br>			
					2. 투자자는 자신이 투자한 펀딩의 상세하고 투명한 정보를 얻을 수 있다.<br>				
					3. 펀딩에 대한 상세한 프로젝트관리를 기반으로 투명성있는 정보를 얻고 배당을 지급받는다.<br>				
					4. PMS를 접목한 크라우드 펀딩을 통해 기업의 재정적 필요를 충족시키고, 투자자의 투자 수익율을 보장한다.			
  
				</div>
			</div>
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					기업회원과 투자자회원 
				</h1>
				<div class="guidecontentbox">
					기업회원은 펀딩을 개설하기 위해 회사에 소속되는 회원을 말한다. 
					기업회원은 회사를 개설 할 수 있으며(경영진권한으로 변경), 일반사원으로 회사에 소속될 수 있다. 
					펀딩을 개설하고 펀딩내 권한을 부여받아서 프로젝트관리에서 맡은 역할을 수행한다. 
					투자자회원은 투자를 할 수 있는 일반회원이다. 펀딩에 투자하고 배당금액을 얻을 수 있다. 
				</div>
			</div>
		</div>
		<div class="row">	
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					펀딩 개설 및 진행 과정
				</h1>
				<div class="guidecontentbox">
				펀딩개설신청 → 펀딩상세정보입력, 배당계획, 사업분야, 펀딩포스터 등록 → 마일스톤생성 -> WBS 계획 생성
				→ 펀딩 개설 심사 통과 → 펀딩 투자자 모집 -> 펀딩 투자금액 유치 성공시 자금 배정 or 실패시 투자금 환불
				 -> 프로젝트 진행 -> WBS 실제 작성 -> 증권 발행 및 배정
				</div>
			</div>
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					투자방법
				</h1>
				<div class="guidecontentbox">
					투자하기 페이지에서 원하는 펀딩에 들어가서 투자사전예약 -> 모집기간이 끝나고 모집률 100%가 넘었을때에 결제모집기간으로 변경되며 선착순대로 결제가 가능하게 된다
					 -> 결제를 하고 결제율이 100%가 달성되면 프로젝트가 진행된다   
				</div>
			</div>
		</div>
		<div class="row">
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					배당금
				</h1>
				<div class="guidecontentbox">
					배당은 펀딩마다 정해놓은 지급기준일마다 최소보장이율 x 투자금액 + (지급기준단위x배당율) 을 통해서 정해진다
				</div>
			</div>
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					소제목
				</h1>
				<div class="guidecontentbox">
					내용   
				</div>
			</div>
		</div>
		<div class="row">	
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					소제목
				</h1>
				<div class="guidecontentbox">
					내용   
				</div>
			</div>
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					소제목
				</h1>
				<div class="guidecontentbox">
					내용   
				</div>
			</div>
		</div>
		<div class="row">	
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					소제목
				</h1>
				<div class="guidecontentbox">
					내용   
				</div>
			</div>
			<div class="guidesmallbox">
				<h1 class="guidetitlebox">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg" class="logoimg">
					소제목
				</h1>
				<div class="guidecontentbox">
					내용	   
				</div>
			</div>
		</div>	
	</div>
	<div class="col-xs-1"></div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>