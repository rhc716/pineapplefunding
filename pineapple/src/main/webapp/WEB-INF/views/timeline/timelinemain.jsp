<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		$('[data-toggle="tooltip"]').tooltip({
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
        
	})
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
			<div class="col-xs-2" style="padding: 0px 0px;">
				<div class="col-xs-12" style="border: 1.5px solid #009442; border-radius: 5px; padding: 10px;">
				<ul style="font-size:15px; list-style: none; height: 100%; width: 100%; padding: 10px; text-align: left; margin: 0px; border-bottom: 1px solid #d7d7d7;">
						<label style="font-size: 20px;">카테고리</label>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="it"></span><span>IT</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="핀테크"></span><span>핀테크</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="인터넷서비스"></span><span>인터넷서비스</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="문화"></span><span>문화</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="디자인"></span><span>디자인</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="뷰티"></span><span>뷰티</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="의료"></span><span>의료</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="제조"></span><span>제조</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="유통"></span><span>유통</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="농수산"></span><span>농수산</span></li>
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
				<div class="col-xs-12">
					<c:forEach var="Data" items="${timelinelist}">
					<div class="col-xs-12 timelinelist">
						<div class="col-xs-12">
							<div class="col-xs-12 timelinenameandtime">
								<span class="timelinenameandtimespan">
								<c:choose>
									<c:when test="${Data.emComName == null}">
										<span>${Data.nickname}</span><span>${Data.tlTime}</span>
									</c:when>
									<c:otherwise>
										<span>${Data.emComName}</span><span>${Data.tlTime}</span>
									</c:otherwise>
								</c:choose>
								</span>
								<span class="timeupanddelspan">
								&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#${Data.tlCode}">수정하기</a>
								&nbsp;&nbsp;<a href="/pineapple/timelinedelete.timeline?tlCode=${Data.tlCode}">삭제하기</a>
								</span>
							</div>

							<h3 class="col-xs-12 timelinetitle">
								${Data.tlTitle}
							</h3>
							<div class="col-xs-12 timelinecontent">
								${Data.tlContent}
							</div>
							<div class="col-xs-12 timelinefooter ">
								<a class="likecount" href="#" data-toggle="tooltip" data-placement="bottom" data-html="true"
								title="<c:choose><c:when test="${Data.timelinelikecount == 0}"></c:when><c:otherwise><h6>Like User</h6><c:forEach var="Datalist" items="${Data.timelineLike}"><div>${Datalist.timelinelikenickname}</div></c:forEach></c:otherwise></c:choose>">
									<span class="glyphicon glyphicon-thumbs-up"></span>
									<span>${Data.timelinelikecount}</span>
								</a>
								<a class="timereply" id="timelinereply${Data.tlCode}" href="#collapseExample${Data.tlCode}" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample${Data.tlCode}" dataCode="${Data.tlCode}">댓글더보기</a>
								<div class="col-xs-12 collapse" id="collapseExample${Data.tlCode}">
									<div class="col-xs-12" style="margin:20px 0px;">
										<form id="timelinereplyform${Data.tlCode}" action="/pineapple/timelinereplyinsert.invest" method="post">
											<div class="col-xs-8">
												<input name="tlCode" type="hidden" value="${Data.tlCode}">
												<input name="tlReId" type="hidden" value="${id}">
												<textarea class="form-control" name="tlReContent" rows="3" style="width: 100%; height: 100px; resize: none;" placeholder="댓글을 입력해주세요"></textarea>
											</div>
											<div class="col-xs-4" style="text-align:left; padding:0px;">
												<button class="timelinereplyinsertbtn btn btn-info" dataCode="${Data.tlCode}" style="width: 50%; height: 100px; padding:0px; font-size:20px;">댓글등록하기</button>
											</div>
										</form>
									</div>
									<div id="timelinereplylist${Data.tlCode}">
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- Time line update modal -->
					<div class="modal fade" id="${Data.tlCode}" tabindex="-1" role="dialog" aria-labelledby="myModalLabelupdate" aria-hidden="true">
				 	  <div class="modal-dialog modal-lg" role="document">
				 	    <div class="modal-content font-j"> 
				 	      <div class="modal-header text-lr-center">
				 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				 	        <h1 class="modal-title" id="myModalLabelupdate">타임라인 수정 하기</h1>
				 	      </div>
				 	      <div class="modal-body">
				 	      <div class="form-group">
				 	      	<form id="timelineform${Data.tlCode}" action="/pineapple/timelineupdate.timeline" method="post">
				 	      		<input class="form-control" type="hidden" name="tlCode" value="${Data.tlCode}">
				 	      		<div>
								<h3>제목</h3>
								<input class="form-control" type="text" name="tlTitle" placeholder="타임라인의 제목을 입력해주세요" value="${Data.tlTitle}">
								</div>
								<div>
								<h3>내용</h3>
								<textarea name="tlContent" class="form-control summernote" style="height: 100%;">${Data.tlContent}</textarea>
								</div>
				 			</form>
				 	      </div>
				 	      <div class="modal-footer">
				 	      	<button type="button" class="btn btn-default timelinereservebtn" data-dismiss="modal" dataCode="${Data.tlCode}">타임라인수정</button>
				 	        <button type="button" class="btn btn-default" data-dismiss="modal">등록그만두기</button>
				 	      </div>
				 	    </div>
				 	  </div>
				 	</div>
				 	</div>
				 	<!-- Time line update modal -->
				 	
					</c:forEach>
				</div>
			</div>
			<div class="col-xs-2" id="fundingranking" style="padding: 0px;">
				
			</div>
		</div>
	<!-- 풋터 -->
		<c:import url="/resources/module/footer.jsp"/>
	</div>
</body>
</html>