<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<!-- 개인.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />


<script> 
	
	//펀딩 Tab Content
	$(document).ready(function() { 
		var getfundingdata = $.ajax({
			type : "get",
			url : "/pineapple/investfundingdetail.invest",
			data : {fdCode : ${param.fdCode}}
		});
		//펀딩Q&A클릭시
		$('#fundingqna-tab').click(function(param){
			$('#fundingqnalist').empty();
			var getfundingqna = $.ajax({
				type : "get",
				url : "/pineapple/investfundingqna.invest",
				data : {fdCode : ${param.fdCode}}
			});
			getfundingqna.done(function(msg){
			
				console.log(msg)
				for(var i = 0 ;i < msg.length ; i++ ){
				$('#fundingqnalist').append(
							'<div class=\'col-xs-12 funding-qna\'>'+
								'<div class=\'col-xs-12 funding-qnaid\'>'+
									'<span style=\'opacity\:0.4;\'>'+msg[i].qnaFdId+'&nbsp;&nbsp;'+msg[i].qnaFdTime+'</span>'+
									'<span style=\'opacity\:0.8;\'>'+
									'&nbsp;&nbsp;<a class=\'qnaupdate\' id=\'qnaupdate'+[i]+'\' data-toggle=\'modal\' data-target=\'#myqna'+[i]+'\' qna-title=\''+msg[i].qnaFdCode+'\'>수정하기</a>'+
									'&nbsp;&nbsp;<a href=\'/pineapple/investqnadelete.invest?fdCode='+msg[i].qnaFdCode+'&qnaCode='+msg[i].qnaCode+'\'>삭제하기</a>'+
									'</span>'+
								'</div>'+
								'<div class=\'col-xs-12 funding-title\'>Q&A제목 : <span id=\'qnatitle'+[i]+'\'>'+msg[i].qnaFdTitle+'</span></div>'+
								'<div class=\'col-xs-12 funding-content\'>Q&A내용 : <span id=\'qnacontent'+[i]+'\'>'+msg[i].qnaFdContent+'</span></div>'+
								'<div class=\'replyall\'>'+
									'<a class=\'col-xs-1 replymain\' id=\''+msg[i].qnaCode+'\' data-toggle=\'collapse\' href=\'#collapseExample'+[i]+'\' aria-expanded=\'false\' aria-controls=\'collapseExample'+[i]+'\''+
									'style=\'padding\:0px; text-align\:left\'>'+
			  						'답글보기'+
			  						'</a>'+
			  						'<div class=\'col-xs-11\'></div>'+
					  				'<div class=\'col-xs-12 collapse\' id=\'collapseExample'+[i]+'\'>'+
					  					'<div class=\'col-xs-12\' style=\'margin\:20px 0px;\'>'+
					  						'<form id=\'answerform\' action=\'/pineapple/investanswer.invest?fdCode='+msg[i].qnaFdCode+'\' method=\'post\'>'+
						  						'<div class=\'col-xs-8\'>'+
						  							'<input name=\'reQnaCode\' type=\'hidden\' value=\''+msg[i].qnaCode+'\'>'+
						  							'<input name=\'qnaReId\' type=\'hidden\' value=\'${id}\'>'+
						  							'<textarea class=\'form-control\' name=\'qnaReContent\' rows=\'3\' style=\'width\: 100%; height\: 100px; resize\: none;  padding\:0px;\' placeholder=\'답변을 입력해주세요\'></textarea>'+
						  						'</div>'+
				  								'<div class=\'col-xs-4\' style=\'text-align\:left; padding\:0px;\'>'+
				  									'<button id=\'answerbtn\' style=\'width\: 50%; height\: 100px; padding\:0px; border\:1px solid; font-size\:20px;\'>답변등록하기</button>'+
				  								'</div>'+
				  							'</form>'+
			  							'</div>'+
			  		  				'<div class=\'col-xs-12 replycontent qnaCode_'+msg[i].qnaCode+'\' style=\'text-align\: left; margin\:0px 0px 20px 0px;\'>'+
			  		  				'</div>'+
			  					'</div>'+
							'</div>'+
							'<div class=\'modal fade\' id=\'myqna'+[i]+'\' tabindex=\'-1\' role=\'dialog\' aria-labelledby=\'myqnaLabel'+[i]+'\' aria-hidden=\'true\'>'+
						 	  '<div class=\'modal-dialog\'>'+
						 	    '<div class=\'modal-content\'>'+
						 	      '<div class=\'modal-header text-lr-center\'>'+
						 	        '<button type=\'button\' class=\'close\' data-dismiss=\'modal\' aria-label=\'Close\'><span aria-hidden=\'true\'>&times;</span></button>'+
						 	        '<h1 class=\'modal-title\' id=\'myModalLabel'+[i]+'\'>질문 내용 수정</h1>'+
						 	      '</div>'+
						 	      '<div class=\'modal-body\'>'+
						 	      	'<form id=\'qnaform'+[i]+'\' action=\'/pineapple/investqnaupdate.invest?fdCode='+msg[i].qnaFdCode+'\' method=\'post\'>'+
						 	      		'<div class=\'form-group\'>'+
						 	      			'<input type=\'hidden\' name=\'qnaCode\' value=\''+msg[i].qnaCode+'\'>'+
											'<input type=\'hidden\' name=\'qnaFdCode\' value=\''+msg[i].qnaFdCode+'\'>'+
						 					'<input class=\'form-control\' id=\'qnaupdatetitle\'  name=\'qnaFdTitle\' type=\'text\'  placeholder=\'수정할 제목을 입력해주세요\' style=\'width\: 100%; height\: 30px; margin-bottom\: 10px;\' value=\''+msg[i].qnaFdTitle+'\'>'+
											'<textarea class=\'form-control\' id=\'qnaupdatecontent\' name=\'qnaFdContent\' rows=\'3\' style=\'width\: 100%; height\: 100px; resize\: none;\' placeholder=\'수정할 내용을 입력해주세요\'>'+msg[i].qnaFdContent+'</textarea>'+
						 	      		'</div>'+
						 	      		'<div class=\'modal-footer\'>'+
						 	      			'<button class=\'qnaupdateform btn btn-default\' id=\''+[i]+'\' type=\'button\' data-dismiss=\'modal\'>수정하기</button>'+
						 	       			'<button type=\'button\' class=\'btn btn-default\' data-dismiss=\'modal\'>취소하기</button>'+
						 	      		'</div>'+
						 			'</form>'+
						 	    '</div>'+
						 	  '</div>'+
						 	'</div>'+
						 	'</div>'
							);
				$('.qnaupdateform').click(function(){
					var qnaupdate = $(this).attr("id")
					console.log(qnaupdate)
					$('#qnaform'+qnaupdate+'').submit();
				});
				};
		 		//답글보기 클릭시
		 		$('.replymain').click(function(){
		 			var turefalse = $(this).attr('aria-expanded')
		 			var qnaCode = $(this).attr('id')
						var getfundingqnareply = $.ajax({
							type : 'get',
							url : '/pineapple/investfundingqnareply.invest',
							data : {qnaCode : qnaCode}
						});
						getfundingqnareply.done(function(msg){
							console.log(msg)
							$('.qnaCode_'+qnaCode+'').empty();
							if(msg.length == 0){
								$('.qnaCode_'+qnaCode+'').append(
										'<span class=\'glyphicon glyphicon-menu-right\'></span>'+
										'<span class=\'reply-title\'></span><div style=\'padding\:0px 0px 0px 16px;font-size\:18px\'>등록된 답변이 없습니다.</div>')
							}else{
								for(var i = 0; i< msg[0].fundingQnaReply.length;i++){
									$('.qnaCode_'+qnaCode+'').append(
										'<span class=\'glyphicon glyphicon-menu-right\'></span>'+
										'<span style=\'opacity\:0.4;font-size\:12px\'>'+msg[0].fundingQnaReply[i].qnaReId+'&nbsp;&nbsp;'+msg[0].fundingQnaReply[i].qnaReTime+'</span>'+
										'<span style=\'opacity\:0.8;font-size\:12px\'>'+
										'&nbsp;&nbsp;<a class=\'qnareupdate\' id=\'qnareupdate'+[i]+'\' data-toggle=\'modal\' data-target=\'#myqnare'+[i]+'\' qna-title=\''+msg[0].qnaFdCode+'\'>수정하기</a>'+
										'&nbsp;&nbsp;<a href=\'/pineapple/investqnaredelete.invest?fdCode='+msg[0].qnaFdCode+'&qnaReCode='+msg[0].fundingQnaReply[i].qnaReCode+'\'>삭제하기</a>'+
										'</span>'+
										'<div style=\'padding\:0px 0px 0px 16px ;font-size\:18px;\'>'+msg[0].fundingQnaReply[i].qnaReContent+'</div>'+
										'<div class=\'modal fade\' id=\'myqnare'+[i]+'\' tabindex=\'-1\' role=\'dialog\' aria-labelledby=\'myqnareLabel'+[i]+'\' aria-hidden=\'true\'>'+
									 	  '<div class=\'modal-dialog\'>'+
									 	    '<div class=\'modal-content\'>'+
									 	      '<div class=\'modal-header text-lr-center\'>'+
									 	        '<button type=\'button\' class=\'close\' data-dismiss=\'modal\' aria-label=\'Close\'><span aria-hidden=\'true\'>&times;</span></button>'+
									 	        '<h1 class=\'modal-title\' id=\'myModalreLabel'+[i]+'\'>답변 내용 수정</h1>'+
									 	      '</div>'+
									 	      '<div class=\'modal-body\'>'+
									 	      	'<form id=\'qnareform'+[i]+'\' action=\'/pineapple/investqnareupdate.invest?fdCode='+msg[0].qnaFdCode+'\' method=\'post\'>'+
									 	      		'<div class=\'form-group\'>'+
									 	      			'<input type=\'hidden\' name=\'qnaReCode\' value=\''+msg[0].fundingQnaReply[i].qnaReCode+'\'>'+
														'<textarea class=\'form-control\' id=\'qnaupdatecontent\' name=\'qnaReContent\' rows=\'3\' style=\'width\: 100%; height\: 100px; resize\: none;\' placeholder=\'수정할 내용을 입력해주세요\'>'+msg[0].fundingQnaReply[i].qnaReContent+'</textarea>'+
									 	      		'</div>'+
									 	      		'<div class=\'modal-footer\'>'+
									 	      			'<button class=\'qnareupdateform btn btn-default\' id=\''+[i]+'\' type=\'button\' data-dismiss=\'modal\'>수정하기</button>'+
									 	       			'<button type=\'button\' class=\'btn btn-default\' data-dismiss=\'modal\'>취소하기</button>'+
									 	      		'</div>'+
									 			'</form>'+
									 	    '</div>'+
									 	  '</div>'+
									 	'</div>'
									);
								}
								$('.qnareupdateform').click(function(){
									var qnareupdate = $(this).attr("id");
									console.log(qnareupdate);
									$('#qnareform'+qnareupdate+'').submit();
								});
							}
						});
						getfundingqnareply.fail(function(){
							alert("실패");
						});

				});
		 		
			});
			getfundingqna.fail(function(){
				alert('두번째 ajax통신실패');
			});
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
		$('#investreservebtn').click(function(){
			$('#investform').submit();
		});
		//MODAL
		//투자 하기 모달창
		var check = "";
		$('#investbtn').click(function () {
		      $('#myModal').modal('show',function(){
		      });
		    })
		//모달창 열때
		$('#myModal').on('shown.bs.modal', function () {
		      //alert('호출되었습니다.')
		    })
		//모달창 닫을때
		$('#myModal').on('hidden.bs.modal', function () {
		      //alert('호출되었습니다.')
		    })
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
	
<div>
	<!-- 펀딩제목 -->
	<c:set var="Data" value="${fundingData}" />
	<div>
		<h2 style="text-align: center;">${Data.fdTitle}</h2>
	</div>
	<div class="col-xs-12 pd-a-20 bor-defult ma-b-20 font-j"> 
		
		<div class="col-xs-7 funding-vedio pd-a-0">
			<iframe width="620" height="349" src="https://www.youtube.com/embed/JGwWNGJdvx8" frameborder="0" allowfullscreen style="padding-right: 20px"></iframe>
		</div>
		<div class="col-xs-5 bor-defult text-lr-center" style="padding: 0px;">
			<div class="fundingdata1">
				<div class="col-xs-4 topdata">
					<h4>목표금액</h4>
					<div>${Data.numberOfShares*Data.issuePrice}</div>
				</div>
				<div class="col-xs-4 topdata">
					<h4>투자자</h4>
					<div>${Data.investcount}명</div>
				</div>
				<div class="col-xs-4 topdata">
					<h4>달성률</h4>
					<div>${(Data.investtotal/Data.numberOfShares)*100}%</div>
				</div>
			</div>
			<div class="col-xs-12 chart-bar">
				<div>
					모집 금액 : ${Data.investtotal*Data.issuePrice}
				</div>
				<div class="progress bor-defult">
  					<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(Data.investtotal/Data.numberOfShares)*100}%; min-width: 3em; max-width: 100%;">
    					${(Data.investtotal/Data.numberOfShares)*100}%
  				</div>
			</div>
			</div>
			<div class="fundingdata2">
				<div class="col-xs-6">
					<span class="glyphicon glyphicon-thumbs-up"></span> : ${Data.liketotal}
				</div>
				<div class="col-xs-6">
					${Data.closeDate}
				</div>
			</div>
			<div class="col-xs-12 investbtn-all"style="padding: 0px">
				<div class="col-xs-6 bor-defult" style="height: 160px;padding: 0px" >
					<button id="investbtn" type="button" class="col-xs-12 investbtn-invest" data-toggle="modal" data-target="#mymodal" style="padding: 0px">
					투자하기
					</button>
					<button id="investguide" type="button" class="col-xs-12 investbtn-investguide" data-toggle="modal" data-target="#guide" style="padding: 0px">
					투자방법안내
					</button>
				</div>
				<div class="col-xs-6 funding-investdata"  style="padding: 0px">
					펀딩형태 : ${Data.fdType}형 <br>
					판매 주식수 : ${Data.numberOfShares} <br>
					주당 발행가 : ${Data.issuePrice} <br>
					최소신청금액 : ${Data.minInvestMoney} <br>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 다른페이지에서 요청하는식으로 변경예정 -->
	<!-- MODAL -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	  <div class="modal-dialog">
 	    <div class="modal-content font-j"> 
 	      <div class="modal-header text-lr-center">
 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 	        <h1 class="modal-title" id="myModalLabel">투자 예약하기</h1>
 	      </div>
 	      <div class="modal-body">
 	      <div class="form-group">
 	      	<form id="investform" action="/pineapple/investmentinsert.invest" method="post">
 	      		<input type="hidden" name="investFdCode" value="${Data.fdCode}">
 	      		<input type="hidden" name="investId" value="${id}">
 				<div style="font-size: 30px">구입 주식수 : <input type="text" name="purchaseShares"></div>
 			</form>
 	      </div>
 	      <div class="modal-footer">
 	      	<button id="investreservebtn" type="button" class="btn btn-default" data-dismiss="modal">투자예약하기</button>
 	        <button type="button" class="btn btn-default" data-dismiss="modal">투자그만두기</button>
 	      </div>
 	    </div>
 	  </div>
 	</div>
 	</div>
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
	<!-- 다른페이지에서 요청하는식으로 변경예정 -->
	<!-- 펀딩 Tab -->
	<div class="row">
	<div> 
		<ul id="myTab" class="nav nav-tabs font-j" role="tablist"> 
			<li role="presentation" class="active">
				<a data-target="#openstory" id="openstory-tab" role="tab" data-toggle="tab" aria-controls="openstory" aria-expanded="true">오픈스토리</a>
			</li> 
			<li role="presentation" class="">
				<a data-target="#comValue" role="tab" id="comValue-tab" data-toggle="tab" aria-controls="comValue" aria-expanded="false">기업가치</a>
			</li> 
			<li role="presentation" class="">
				<a data-target="#fundingqna" role="tab" id="fundingqna-tab" data-toggle="tab" aria-controls="fundingqna" aria-expanded="false">펀딩Q&A</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content font-j" style="text-align: center;">
			<div role="tabpanel" class="tab-pane fade active in" id="openstory" aria-labelledby="openstory-tab">
				<div id="openstoryContent"></div>
			</div> 
			<div role="tabpanel" class="tab-pane fade" id="comValue" aria-labelledby="comValue-tab"> 
				<p id="comValueContent"></p> 
			</div> 
			<div role="tabpanel" class="tab-pane fade pd-a-0" id="fundingqna" aria-labelledby="fundingqna-tab"> 
				<h2>펀딩 Q&A</h2>
				<div class="col-xs-12"style="text-align: center;padding: 0px">
				<form id="questionform" action="/pineapple/investquestion.invest" method="post">
					<div class="col-xs-10 " style="padding: 0px">
					<input type="hidden" name="qnaFdId" value="${id}">
					<input type="hidden" name="qnaFdCode" value="${Data.fdCode}">
					<input name="qnaFdTitle" type="text" class="form-control" placeholder="제목을 입력해주세요" style="width: 100%; height: 30px; margin-bottom: 10px;">
					<textarea class="form-control" name="qnaFdContent" rows="3" style="width: 100%; height: 100px; resize: none;" placeholder="내용을 입력해주세요"></textarea>
					</div>
					<div class="col-xs-2" style="padding-left: 20px;padding-right: 0px;">
					<button id="questionbtn" class="pd-a-0 bor-defult" style="width: 100%; height: 140px; font-size: 28px;">질문등록하기</button>
					</div>
				</form>
				</div>
				<div id="fundingqnalist">
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