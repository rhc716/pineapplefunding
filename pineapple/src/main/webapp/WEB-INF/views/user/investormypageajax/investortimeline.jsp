<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Investor Time Line List</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

</head>
<body>
			<div class="col-xs-12" style="text-align: center; border: 1px solid;">
				<div class="col-xs-6" style="padding: 0px">
					<div class="col-xs-12">
					1
					</div>
					<div class="col-xs-12">
					2
					</div>
					<div class="col-xs-12">
					3
					</div>
				</div>
				<div class="col-xs-6" style="padding: 0px">
					<div id="linechart_material" style="width: 100%; height: 200px;">4</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="col-xs-12 timemaintop">
					<div class="col-xs-9 timeinputbox">
						<input id="timeinputbox" type="text" class="form-control box1" placeholder="타임라인을 등록해주세요"  data-toggle="modal" data-target="#myModal" readonly="readonly">
					</div>
					<div class="col-xs-3 timeinputbtn">
						<button id="timeinputbotton" class="timeinputbotton" data-toggle="modal" data-target="#myModal">게시하기</button>
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
				
				<div class="col-xs-12">
					<c:forEach var="Data" items="${myinvestortimeline}">
					<div class="col-xs-12 timelinelist">
						<div class="col-xs-12">
							<div class="col-xs-12 timelinenameandtime">
								<span class="timelinenameandtimespan">
										<span>${Data.nickname}</span><span>${Data.tlTime}</span>
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
												<button class="timelinereplyinsertbtn" dataCode="${Data.tlCode}" style="width: 50%; height: 100px; padding:0px; border:1px solid; font-size:20px;">댓글등록하기</button>
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
</body>
</html>