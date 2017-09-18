<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Invest Funding</title>

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

<!-- 개인.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />


<script> 
	//펀딩 Tab Content
  	$(document).ready(function() {
	  	$('img').each(function(n){
	 		console.log($(this));
	 		$(this).on( "error", function(){
	 			$(this).attr("src", "${pageContext.request.contextPath}/resources/img/404alternateimage.jpg");
	 	    });
	 	});
		$('#myTab a').click(function(e) {
			  e.preventDefault();
			  $(this).tab('show');
			});
			
			//hash value에 현재 선택된 탭을 저장한다
			$("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
			  var id = $(e.target).attr("href").substr(1);
			  window.location.hash = id;
			});
			
			// 페이지 로드할 때 : 현재 선택된 탭으로 전환
			var hash = window.location.hash;
			$('#myTab a[href="' + hash + '"]').tab('show');
			
 		//펀딩Q&A클릭시
		$('#fundingqnalist').empty();
		var getfundingqna = $.ajax({
			type : "get",
			url : "/pineapple/investfundingqna.invest",
			data : {fdCode : ${param.fdCode}}
		});
		//성공
		getfundingqna.done(function(msg){
			$('#fundingqnalist').html(msg)
			$('.qnaupdateform').click(function(){
				var qnaupdate = $(this).attr("id")
				console.log(qnaupdate)
				$('#qnaform'+qnaupdate+'').submit();
			});
	 		//답글보기 클릭시
	 		$('.reply-main').click(function(){
	 			var turefalse = $(this).attr('aria-expanded')
	 			var qnaCode = $(this).attr('id')
					var getfundingqnareply = $.ajax({
						type : 'get',
						url : '/pineapple/investfundingqnareply.invest',
						data : {qnaCode : qnaCode}
					});
					getfundingqnareply.done(function(msg){
						$('.qnaCode_'+qnaCode+'').html(msg)
						$('.qnareupdateform').click(function(){
							var qnareupdate = $(this).attr("id");
							console.log(qnareupdate);
							$('#qnareform'+qnareupdate+'').submit();
						});
					});
					getfundingqnareply.fail(function(){
						alert("실패");
					});
			});
	 		
		});
		//실패
		getfundingqna.fail(function(){
			alert('두번째 ajax통신실패');
		});
		var getfundingdata = $.ajax({
			type : "get",
			url : "/pineapple/investfundingdetail.invest",
			data : {fdCode : ${param.fdCode}}
		});
		// 성공시
		getfundingdata.done(function(msg){
			console.log(msg)
			$('#openstoryContent').html(msg.openstory);
			$('#comValueContent').text(msg.comValue);
		});
		// 실패시
		getfundingdata.fail(function(){
			alert('첫번째 ajax통신실패');
		}); 
		//TAB 메뉴
		$('a[data-toggle="tab"]').on('hidden.bs.tab', function(e){
		}); 
		//버튼클릭이벤트(질문하기,답변하기,투자하기)
		$('#questionbtn').click(function(){
			$('#questionform').submit();
		});
		$('#answerbtn').click(function(){
			$('#answerform').submit();
		});
		$('#investreservebtnopen').click(function(){
			$('#investform').submit();
		});
		//MODAL
		//투자 취소 클릭시
		$('#investdeletebtn').click(function (){
			var fdCode = $(this).attr('dataCode');
			var fundinglistnameselectajax = $.ajax({
				type: 'get',
				url : '/pineapple/investdeletedata.invest',
				data : {fdCode : fdCode},
				success : function success(msg){
					$('#investmentdeletedatainsert').html(msg);
				},
				error : function error(){
					
				}
			});
		});
		$('#moneyinsertbtn').click(function (){
			var fdCode = $(this).attr('dataCode');
			var fundinglistnameselectajax = $.ajax({
				type: 'get',
				url : '/pineapple/investmoneydata.invest',
				data : {fdCode : fdCode},
				success : function success(msg){
					$('#investmentmoneydatainsert').html(msg);
				},
				error : function error(){
					
				}
			});
		});
		var getfundingfilelist = $.ajax({
			type : "get",
			url : "/pineapple/getfundingfilelist.invest",
			/* 아이디 세션에서 받아서 가져옴 */
			data : {fdCode : ${param.fdCode}},
			async : false
		});
		// 성공시
		getfundingfilelist.done(function(msg){
			$('#reportContent').html(msg);
		});
		getfundingfilelist.fail(function(){
			alert('ajax통신실패');
		});
	});
</script>
</head>
<body>
<div class="container">
<!--로그인 버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
	
<div class="col-md-12" style="padding: 0px;">
	<!-- 펀딩제목 -->
	<c:set var="Data" value="${fundingData}" />
	<div>
		<h2 style="text-align: center;">${Data.fdTitle}</h2>
	</div>
	<div class="col-md-12" style="padding: 0px;">
	<div class="col-md-7" style="padding: 0px 10px;margin-bottom: 20px;"> 
		<c:set var="poster" value="${Data.posterImg}"></c:set>
		<div class="col-md-12" style="padding: 0.3px;border: 1.5px solid #009442 ; text-align: center;">
			<c:choose>
	 		<c:when test="${poster == null}">
				<img src="${pageContext.request.contextPath}/resources/files/insertnotsum.jpg"width="100%" style="padding: 0.75px;">
	 		</c:when>
	 		<c:otherwise>
				<img src="${pageContext.request.contextPath}/resources/files${poster.substring(poster.lastIndexOf('/'),poster.length())}"width="100%" style="padding: 0.75px;">
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="col-md-5" style="padding: 0px 10px; height: 450px;">
		<div class="col-xs-12" style="padding: 0px; border: 1.5px solid #009442 ;border-radius: 5px; text-align: center;height: 100%">
			<div class="col-xs-12" style="padding: 0px; border-bottom: 1px solid #d7d7d7; height: 20%;">
				<div class="col-xs-4" style="padding: 0px; border-right: 1px solid #d7d7d7; height: 100%; line-height: 44px;">
					<h4>목표금액</h4>
					<div>${Data.numberOfShares*Data.issuePrice}원</div>
				</div>
				<div class="col-xs-4" style="padding: 0px; height: 100%; line-height: 44px;">
					<h4>투자자</h4>
					<div>${Data.investcount}명</div>
				</div>
				<div class="col-xs-4" style="padding: 0px; border-left: 1px solid #d7d7d7; height: 100%;line-height: 44px;">
					<h4>달성률</h4>
					<div>${(Data.investtotal/Data.numberOfShares)*100}%</div>
				</div>
			</div>
			<div class="col-xs-12" style="padding: 0px; border-bottom: 1px solid #d7d7d7; height: 30%;">
				<div class="col-xs-12" style="height: 50%; line-height: 66px; font-size: 20px;">
				<c:choose>
				<c:when test="${Data.fdStatus == '모집중'}">
					모집 금액 : ${Data.investtotal*Data.issuePrice}
				</c:when>
				<c:otherwise>
					결제 금액 : ${Data.investtotal*Data.issuePrice}
				</c:otherwise>
				</c:choose>
				</div>
				<div class="col-xs-12" style="height: 50%;line-height: 66px;">
					<div class="progress bor-defult" style="margin: 0px; height: 30px;">
  						<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(Data.investtotal/Data.numberOfShares)*100}%; min-width: 3em; max-width: 100%;">
    						<span style="font-size: 18px; line-height: 28px;">${(Data.investtotal/Data.numberOfShares)*100}%</span>
  						</div>
  					</div>
				</div>
			</div>
			<div class="col-xs-12" style="padding: 0px; border-bottom: 1px solid #d7d7d7; height: 20%">
			<div class="col-xs-6" style="height: 100%;line-height: 88px;">
				<span class="glyphicon glyphicon-thumbs-up"></span> : ${Data.liketotal}
			</div>
			<div class="col-xs-6" style="border-left: 1px solid #d7d7d7; height: 100%;line-height: 44px;">
				<h4>마감일</h4>
				<div>${Data.closeDate}</div>
			</div>
			</div>
			<div class="col-xs-12" style="padding: 0px; height: 30%">
				<div class="col-xs-6" style="padding: 0px; height: 100%">
					<div class="col-xs-12" style="border-bottom: 1px solid #d7d7d7; padding: 0px; height: 70%">
					<c:choose>
					<c:when test="${Data.fdStatus == '모집중'}">
						<c:choose>
							<c:when test="${Data.idpaycheck == 2}">
								<button class="btn btn-info" style="width: 100%; height: 100%; font-size: 30px;"  data-toggle="modal" data-target="#investinsert">투자하기</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-info" style="width: 100%; height: 100%; font-size: 30px;"  data-toggle="modal" data-target="#investdelete" dataCode=${Data.fdCode} id="investdeletebtn">투자취소</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${Data.idpaycheck == 0}">
								<button class="btn btn-info" style="width: 100%; height: 100%; font-size: 30px;"  data-toggle="modal" data-target="#moneyinsert" dataCode=${Data.fdCode} id="moneyinsertbtn">결제하기</button>
							</c:when>
							<c:when test="${Data.idpaycheck == 2}">
								<button class="btn btn-info disabled" style="width: 100%; height: 100%; font-size: 30px;">투자마감</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-info disabled" style="width: 100%; height: 100%; font-size: 30px;">결제해주셔서<br>감사합니다</button>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
					</c:choose>
					</div>
					<div class="col-xs-12" style="height: 30%;padding: 0px;">
					<button class="btn btn-info" style="width: 100%; height: 100%" data-toggle="modal" data-target="#guide">투자안내</button>
					</div>
				</div>
				<div class="col-xs-6"  style="border-left: 1px solid #d7d7d7; padding: 0px; height: 100%;line-height: 31px;">
					펀딩형태 : ${Data.fdType}형 <br>
					판매 주식수 : ${Data.numberOfShares} <br>
					주당 발행가 : ${Data.issuePrice} <br>
					최소신청금액 : ${Data.minInvestMoney} <br>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- MODAL -->
	
	<!-- 투자하기 -->
	<div class="modal fade" id="investinsert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	  <div class="modal-dialog">
 	    <div class="modal-content font-j"> 
 	      <div class="modal-header text-lr-center">
 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 	        <h1 class="modal-title" id="myModalLabel">투자 예약 하기</h1>
 	      </div>
 	      <div class="modal-body">
 	      <div class="investinsert-form-group">
 	      	<form id="investform" action="/pineapple/investmentinsert.invest" method="post">
 	      		<h3>최소신청금액 : ${Data.minInvestMoney}</h3>
 	      		<h3>주당 발행가 : ${Data.issuePrice}</h3>
 	      		<h3>최소 구입 주식수 : ${Data.minInvestMoney/Data.issuePrice}</h3>
 	      		<input type="hidden" name="investFdCode" value="${Data.fdCode}">
 	      		<input type="hidden" name="investId" value="${id}">
 	      		<br>
 				<div style="font-size: 30px">구입 주식수<input type="number" class="form-control" name="purchaseShares"></div>
 			</form>
 	      </div>
 	      <div class="modal-footer">
 	      	<button id="investreservebtnopen" type="button" class="btn btn-default" data-dismiss="modal">투자예약하기</button>
 	        <button type="button" class="btn btn-default" data-dismiss="modal">투자그만두기</button>
 	      </div>
 	    </div>
 	  </div>
 	</div>
 	</div>
 	
 	<!-- 투자안내 -->
 	<div class="modal fade" id="guide" tabindex="-1" role="dialog" aria-labelledby="guideLabel" aria-hidden="true">
 	  <div class="modal-dialog">
 	    <div class="modal-content font-j"> 
 	      <div class="modal-header text-lr-center">
 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 	        <h1 class="modal-title" id="guide">투자 예약 방법</h1>
 	      </div>
 	      <div class="modal-body">
			<h1>투자 예약 관련 내용이 들어옵니다.</h1>
 	    </div>
 	  </div>
 	</div>
 	</div>
 	
 	<!-- 투자취소 -->
 	<div class="modal fade" id="investdelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	  <div class="modal-dialog">
 	    <div class="modal-content font-j"> 
 	      <div class="modal-header text-lr-center">
 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 	        <h1 class="modal-title" id="myModalLabel">투자 취소 하기</h1>
 	      </div>
 	      <div class="modal-body" id="investmentdeletedatainsert">
 	    </div>
 	  </div>
 	</div>
 	</div>
 	
 	<!-- 결제하기 -->
 	<div class="modal fade" id="moneyinsert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	  <div class="modal-dialog">
 	    <div class="modal-content font-j"> 
 	      <div class="modal-header text-lr-center">
 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 	        <h1 class="modal-title" id="myModalLabel">투자 결제 하기</h1>
 	      </div>
 	      <div class="modal-body" id="investmentmoneydatainsert">
 	    </div>
 	  </div>
 	</div>
 	</div>
 	
	<!-- 펀딩 Tab -->
	<div class="row">
	<div> 
		<ul id="myTab" class="nav nav-tabs font-j" role="tablist"> 
			<li role="presentation" class="active">
				<a href="#openstory" id="openstory-tab" role="tab" data-toggle="tab" aria-controls="openstory" aria-expanded="true">오픈스토리</a>
			</li> 
			<li role="presentation" class="">
				<a href="#comValue" role="tab" id="comValue-tab" data-toggle="tab" aria-controls="comValue" aria-expanded="false">기업가치</a>
			</li> 
			<li role="presentation" class="">
				<a href="#fundingqna" role="tab" id="fundingqna-tab" data-toggle="tab" aria-controls="fundingqna" aria-expanded="false">펀딩Q&A</a>
			</li>
			<li role="presentation" class="">
				<a href="#report" role="tab" id="report-tab" data-toggle="tab" aria-controls="report" aria-expanded="false">보고서</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content font-j" style="text-align: center;">
			<div role="tabpanel" class="tab-pane fade active in" id="openstory" aria-labelledby="openstory-tab">
				<div id="openstoryContent"></div>
			</div> 
			<div role="tabpanel" class="tab-pane fade" id="comValue" aria-labelledby="comValue-tab"> 
				<div id="comValueContent"></div> 
			</div> 
			<div role="tabpanel" class="tab-pane fade pd-a-0" id="fundingqna" aria-labelledby="fundingqna-tab"> 
				<h2>펀딩 Q&A</h2>
				<div class="col-md-12"style="text-align: center;padding: 0px">
				<form id="questionform" action="/pineapple/investquestion.invest" method="post">
					<div class="col-md-10 " style="padding: 0px">
					<input type="hidden" name="qnaFdId" value="${id}">
					<input type="hidden" name="qnaFdCode" value="${Data.fdCode}">
					<input name="qnaFdTitle" type="text" class="form-control" placeholder="제목을 입력해주세요" style="width: 100%; height: 30px; margin-bottom: 10px;">
					<textarea class="form-control" name="qnaFdContent" rows="3" style="width: 100%; height: 100px; resize: none;" placeholder="내용을 입력해주세요"></textarea>
					</div>
					<div class="col-md-2" style="padding-left: 0px;padding-right: 0px;">
					<button id="questionbtn" class="pd-a-0 btn btn-info" style="width: 100%; height: 140px; font-size: 28px;">질문등록</button>
					</div>
				</form>
				</div>
				<div id="fundingqnalist">
				</div>
			</div> 
			<div role="tabpanel" class="tab-pane fade" id="report" aria-labelledby="report-tab"> 
				<div id="reportContent">
				</div> 
			</div> 
		</div> 
	</div>

	</div>

<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>