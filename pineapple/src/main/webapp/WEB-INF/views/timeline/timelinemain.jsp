<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Time Line</title>

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

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.js"></script>

<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var getfundingqnareply = $.ajax({
			type : 'get',
			url : '/pineapple/timelineselectmenu.invest',
			data : {timedataCode : "최신"}
		});
		getfundingqnareply.done(function(msg){	
			$('#timecontent').html(msg)
			
		});
		getfundingqnareply.fail(function(){
			alert("실패");
		});
		$('.summernote').summernote();
        $('#timelinereservebtn').click(function(){
        	 $('#timelineform').submit();
	    });
 		$('.timelinereservebtn').click(function(){
 			var tlCode = $(this).attr('dataCode');
 			$('#timelineform'+tlCode+'').submit();
 		});
 		$('.timelinereplyinsertbtn').click(function(){
 			var tlCode = $(this).attr('dataCode');
 			$('#timelinereplyform'+tlCode+'').submit();
 		});
        $('.timereply').click(function(){
 			var tlCode = $(this).attr('dataCode')
 			var TF = $(this).attr('aria-expanded')
 				if(TF == 'false'){
				var getfundingqnareply = $.ajax({
					type : 'get',
					url : '/pineapple/timelinereplylist.invest',
					data : {tlCode : tlCode}
				});
				getfundingqnareply.done(function(msg){	
					$('#timelinereplylist'+tlCode+'').html(msg)
				});
				getfundingqnareply.fail(function(){
					alert("실패");
				});
 				}else{
 					console.log('ajax미실행')
 					$('#timelinereply'+tlCode+'').attr('aria-expanded',false)
 				}
        });
		var getfundingqnareply = $.ajax({
			type : 'get',
			url : '/pineapple/timelinefundingranking.timeline'
		});
		getfundingqnareply.done(function(msg){	
			$('#fundingranking').html(msg);
		});
		getfundingqnareply.fail(function(){
			alert("실패");
		});
		$('.timemenu').click(function(){
			$('#investoraddlistbtn').removeClass('disabled')
			$('#investoraddlistbtn').attr('dataCode',5)
			$('#investoraddlistbtn').html('더보기')
			var timedataCode = $(this).attr('dataCode')
			$('#DataCheckbtn').attr('DataCheck',timedataCode)
			var getfundingqnareply = $.ajax({
				type : 'get',
				url : '/pineapple/timelineselectmenu.invest',
				data : {timedataCode : timedataCode}
			});
			getfundingqnareply.done(function(msg){	
				$('#timecontent').html(msg)
			});
			getfundingqnareply.fail(function(){
				alert("실패");
			});
			
		});
		$('#investoraddlistbtn').click(function(){
			var numberOfRequests = $(this).attr('dataCode');
			var timedataCode = $('#DataCheckbtn').attr('DataCheck')
			var getfundingqnareply = $.ajax({
				type : 'get',
				url : '/pineapple/timelineselectmenu.invest',
				data : {timedataCode : timedataCode,
						numberOfRequests : numberOfRequests}
			});
			getfundingqnareply.done(function(msg){	
				$('#timecontent').append(msg)
				$('#investoraddlistbtn').attr('dataCode',Number(numberOfRequests)+3)
			});
			getfundingqnareply.fail(function(){
				alert("실패");
			});
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
		<div class="row">
			<div class="col-xs 12" style="text-align: center;">
				<h1>TIME LINE</h1>
			</div>
			<div class="col-xs-2" style="padding: 0px;">
				<div class="btn-group" role="group">
   					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="width: 125px;" id="DataCheckbtn" DataCheck="최신">
      				메뉴
      				<span class="caret"></span>
   				 </button>
    				<ul class="dropdown-menu" role="menu" style="width: 100px;">
     					 <li><a class="timemenu" href="#" dataCode="최신">최신순</a></li>
     					 <li><a class="timemenu" href="#" dataCode="인기">인기순</a></li>
     					 <li><a class="timemenu" href="#" dataCode="댓글">댓글순</a></li>
    				</ul>
  				</div>
			</div>
			<div class="col-xs-8" style="padding: 0px;">
			<div class="col-xs-12" style="padding: 0px;">
				<div class="col-xs-12 timemaintop">
					<div class="col-xs-9 timeinputbox">
						<input id="timeinputbox" type="text" class="form-control box1" placeholder="타임라인을 등록해주세요"  data-toggle="modal" data-target="#myModal" readonly="readonly">
					</div>
					<div class="col-xs-3 timeinputbtn">
						<button id="timeinputbotton" class="timeinputbotton btn btn-info" data-toggle="modal" data-target="#myModal" style="height: 46px;">게시하기</button>
					</div>
				</div>
				
				<!-- Time line input modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			 	  <div class="modal-dialog modal-lg" role="document">
			 	    <div class="modal-content font-j"> 
			 	      <div class="modal-header text-lr-center">
			 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			 	        <h1 class="modal-title" id="myModalLabel">타임라인 등록 하기</h1>
			 	      </div>
			 	      <div class="modal-body">
			 	      <div class="form-group">
			 	      	<form id="timelineform" action="/pineapple/timelineinsert.timeline" method="post">
			 	      		<input class="form-control" type="hidden" name="tlId" value="${id}">
			 	      		<div>
							<h3>제목</h3>
							<input class="form-control" type="text" name="tlTitle" placeholder="타임라인의 제목을 입력해주세요">
							</div>
							<div>
							<h3>내용</h3>
							<textarea id="summernote" name="tlContent" class="form-control summernote" style="height: 100%;"></textarea>
							</div>
			 			</form>
			 	      </div>
			 	      <div class="modal-footer">
			 	      	<button id="timelinereservebtn" type="button" class="btn btn-default" data-dismiss="modal">타임라인등록</button>
			 	        <button type="button" class="btn btn-default" data-dismiss="modal">등록그만두기</button>
			 	      </div>
			 	    </div>
			 	  </div>
			 	</div>
			 	</div>
				<!-- Time line input modal -->
				</div>
				<div class="col-xs-12"  id="timecontent" timedataCode="">
				</div>
				<div class="col-xs-12">
					<button type="button" id="investoraddlistbtn" dataCode="5" class="btn-block btn btn-primary">더보기</button>
				</div>
			</div>
			<div class="col-xs-2" style="padding: 0px;">
			<div class="col-xs-12" style="border: 1.5px solid #009442; text-align: center; margin-bottom: 10px; padding: 5px; border-radius: 5px;">
			최근 등록 펀딩
			</div>
			<div class="col-xs-12" id="fundingranking" style="padding: 0px;">
				
			</div>
			</div>
		</div>
	<!-- 풋터 -->
		<c:import url="/resources/module/footer.jsp"/>
	</div>
</body>
</html>