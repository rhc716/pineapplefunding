<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	padding: 20px 20px;
}
.timelinebox{
	
	height: 100%;
}
.timelinediv{
	border: 1px solid #1ec545;
	display: inline-block;
	width: 100%;
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
		<div class="row">
			<div class="pagetitleandexplainbox">
				<h4 align="center">
					펀딩분야 검색결과
				</h4>
			</div>
			<div>
				<table class="table table-striped table-bordered table-hover">
					<tr class="info">
						<th>펀딩명</th>
						<th>형태</th>
						<th>발행주식수</th>
						<th>주당발행가</th>
						<th>최저이율</th>
						<th>모집 시작일 ~ 마감일</th>
						<th>프로젝트 시작일 ~ 마감일</th>
						<th>링크</th>
					</tr>
					<c:forEach items="${searchResult.mainSearchFunding}" var="result">
						<tr>
							<td>${result.fdTitle}</td>
							<td>${result.fdType}</td>
							<td>${result.numberOfShares}</td>
							<td>${result.issuePrice}</td>
							<td>${result.minInterestRate}</td>
							<td>${fn:split(result.openDate," ")[0]} <br>~ ${fn:split(result.closeDate," ")[0]}</td>
							<td>${fn:split(result.projectStartDate," ")[0]} <br>~ ${fn:split(result.projectEndDate," ")[0]}</td>
							<td><a href="${pageContext.request.contextPath}/investfunding.invest?fdCode=${result.fdCode}"><button type="button" class="btn btn-block btn-small btn-primary">보기</button></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="pagetitleandexplainbox">
				<h4 align="center">
					타임라인분야 검색결과
				</h4>
			</div>
			<div>
			<div class="timelinebox">
					<c:forEach items="${searchResult.mainSearchTimeline}" var="result2">
						<div class="timelinediv">
						<div class="col-xs-12 timelinenameandtime">
							<span class="timelinenameandtimespan">
							<c:choose>
								<c:when test="${result2.emComName == null}">
									<span>${result2.nickname}</span><span>${result2.tlTime}</span>
								</c:when>
								<c:otherwise>
									<span>${result2.emComName}</span><span>${result2.tlTime}</span>
								</c:otherwise>
							</c:choose>
							</span>
							<span class="timeupanddelspan">
							&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#${result2.tlCode}">수정하기</a>
							&nbsp;&nbsp;<a href="/pineapple/timelinedelete.timeline?tlCode=${result2.tlCode}">삭제하기</a>
							</span>
						</div>
	
						<h3 class="col-xs-12 timelinetitle">
							${result2.tlTitle}
						</h3>
						<div class="col-xs-12 timelinecontent">
							${result2.tlContent}
						</div>
						<div class="col-xs-12 timelinefooter ">
							<a class="timereply" id="timelinereply${result2.tlCode}" href="#collapseExample${result2.tlCode}" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample${result2.tlCode}" dataCode="${result2.tlCode}">댓글더보기</a>
							<div class="col-xs-12 collapse" id="collapseExample${result2.tlCode}">
								<div class="col-xs-12" style="margin:20px 0px;">
									<form id="timelinereplyform${result2.tlCode}" action="/pineapple/timelinereplyinsert.invest" method="post">
										<div class="col-xs-8">
											<input name="tlCode" type="hidden" value="${result2.tlCode}">
											<input name="tlReId" type="hidden" value="${id}">
											<textarea class="form-control" name="tlReContent" rows="3" style="width: 100%; height: 100px; resize: none;" placeholder="댓글을 입력해주세요"></textarea>
										</div>
										<div class="col-xs-4" style="text-align:left; padding:0px;">
											<button class="timelinereplyinsertbtn btn btn-info" dataCode="${result2.tlCode}" style="width: 50%; height: 100px; padding:0px; font-size:20px;">댓글등록하기</button>
										</div>
									</form>
								</div>
								<div id="timelinereplylist${result2.tlCode}">
								</div>
							</div>
						</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
		
	<!-- 본문 우측 부분 -->
	<div class="col-xs-3 col-md-3" style="padding-left: 30px;">
		<!-- 우측 배너 -->
		<div class="row">
			<a id="myAdLink" href="">
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