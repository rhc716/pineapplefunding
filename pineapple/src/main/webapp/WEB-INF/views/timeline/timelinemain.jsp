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

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.js"></script>

<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	      $('#summernote').summernote();
	})
</script>
</head>
<body>
<div class="container">
<!--로고 및 검색 -->
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 logoandsearch">
			<img src="${pageContext.request.contextPath}/resources/img/logo.jpg">
			<i class="glyphicon glyphicon-search"></i>&nbsp;&nbsp;<input type="text">&nbsp;
			<button type="button" class="btn btnpine">검색</button>
		</div>
		<div class="col-md-3"></div>
	</div>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<div class="row">
	<div class="col-xs 12" style="text-align: center;">
		<h1>TIME LINE</h1>
	</div>
	<div class="col-xs-12">
		<div class="col-xs-12 timemaintop">
			<div class="col-xs-9 timeinputbox">
				<input id="timeinputbox" type="text" class="form-control box1" placeholder="타임라인을 등록해주세요"  data-toggle="modal" data-target="#myModal">
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
	 	      	<form id="investform" action="/pineapple/investmentinsert.invest" method="post">
	 	      		<input class="form-control" type="hidden" name="tlId" value="${id}">
	 	      		<div>
					<div>제목</div>
					<input class="form-control" type="text" name="tlTitle" placeholder="타임라인의 제목을 입력해주세요">
					</div>
					<div>
					<div>내용</div>
					<textarea id="summernote" name="tlContent" class="form-control" style="height: 100%;"></textarea>
					</div>
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
		<div class="col-xs-12">
			<c:forEach var="Data" items="${timelinelist}">
			<div class="col-xs-12 timelinelist">
				<div class="col-xs-12">
				<div class="col-xs-12 timelinenameandtime">
				<c:choose>
				<c:when test="${Data.emComName == null}">
				<span>${Data.name}</span><span>${Data.tlTime}</span>
				</c:when>
				<c:otherwise>
				<span>${Data.emComName}</span><span>${Data.tlTime}</span>
				</c:otherwise>
				</c:choose>
				</div>
				<h3 class="col-xs-12 timelinetitle">
				${Data.tlTitle}
				</h3>
				<div class="col-xs-12 timelinecontent">
				${Data.tlContent}
				</div>
				<div class="col-xs-12 timelinefooter">
				<a class="likecount" href="#">
				<span class="glyphicon glyphicon-thumbs-up"></span>
				<span>${Data.timelinelikecount}</span>
				</a>
				<a class="timereply" href="#">댓글더보기</a>
				</div>
				<div class="col-xs-12">
					<c:forEach var="Datalist" items="${Data.timelineLike}">
					<div class="col-xs-12">
						<!-- 좋아요에 마우스 올렸을때 list 보이게 만들기 -->
					</div>
					</c:forEach>
				</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>