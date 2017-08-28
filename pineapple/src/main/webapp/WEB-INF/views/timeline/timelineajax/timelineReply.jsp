<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

<script type="text/javascript">
$(document).ready(function() {
	$('.timelinereupdate').click(function(){
		var tlReCode = $(this).attr('dataCode');
		$('#timelinereplyreload'+tlReCode+'').attr('class','timeline-display')
		$('#timelinereplyreload_'+tlReCode+'').attr('class','')
	});
	$('.timelinereplyreloadupdatebtn').click(function(){
		var tlReCode = $(this).attr('dataCode');
		$('#timelinereplyreload'+tlReCode+'').attr('class','')
		$('#timelinereplyreload_'+tlReCode+'').attr('class','timeline-display')
		$('#timelinereplyform'+tlReCode+'').submit();
		
	});
});
</script>
</head>
<body>
 	<c:set var="Datalist" value="${timelinereplylist}"/>
 	<c:choose>
 	<c:when test="${Datalist.size() == 0}">
		<div>
			<div><span class="glyphicon glyphicon-menu-right timeline-replyicon"></span></div>
			<div class="timeline-content">등록된 댓글이 없습니다.</div>
		</div>
 	</c:when>
 	<c:otherwise>
		<c:forEach var="Data" items="${timelinereplylist}">
			<div>
				<div class="col-xs-12">
					<span class="glyphicon glyphicon-menu-right timeline-replyicon"></span>
					<span class="timeline-replyidandtime">
						<span>${Data.nickname}</span>
						<span>${Data.tlReTime}</span>
					</span>
					<span class="timeline-replyupanddel">
						&nbsp;&nbsp;<a class="timelinereupdate" dataCode="${Data.tlReCode}">수정하기</a>
						&nbsp;&nbsp;<a href="/pineapple/timelinereplydelete.invest?tlReCode=${Data.tlReCode}">삭제하기</a>
					</span>
				</div>
				<div class="" id="timelinereplyreload${Data.tlReCode}">
					<div class="col-xs-12">
						<div class="timeline-content" id="timelinereContent${Data.tlReCode}">${Data.tlReContent}</div>
					</div>
				</div>
				<div class="timeline-display" id="timelinereplyreload_${Data.tlReCode}">
					<form id="timelinereplyform${Data.tlReCode}" action="/pineapple/timelinereplyupdate.invest" method="post">
						<div class="col-xs-6">
							<input type="hidden" name="tlReCode" value="${Data.tlReCode}">
							<input class="form-control timeline-replyupdateforminput" type="text" name="tlReContent" value="${Data.tlReContent}">
						</div>
						<div class="col-xs-6">
							<button class="timelinereplyreloadupdatebtn timeline-replyupdateformbtn" dataCode="${Data.tlReCode}">수정완료</button>	
						</div>
					</form>
				</div>
			</div>
		</c:forEach>
 	</c:otherwise>
	</c:choose>
</body>
</html>