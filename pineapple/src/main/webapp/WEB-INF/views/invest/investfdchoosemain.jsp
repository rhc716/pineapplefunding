<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$('img').each(function(n){
		   console.log($(this));
		   
		   $(this).on( "error", function(){
			   $(this).attr("src", "${pageContext.request.contextPath}/resources/img/404alternateimage.jpg");
	    });
	});
	if(${fundingListChoose.size()} == 0){
		$('#investoraddlistbtn').addClass('disabled')
		$('#investoraddlistbtn').html('등록된 펀딩이 없습니다.')
	}
});
</script>
</head>
<body>
	<div class="col-xs-12" style="padding: 0px;">
	<c:forEach var="list" items="${fundingListChoose}">
	<c:set var="poster" value="${list.posterImg}"></c:set>
 	<div class="col-xs-4 fdlist-box" style="padding: 0px; margin: auto;">
 		<div class="col-xs-12" style="padding: 0px 10px; margin-bottom: 20px;">
 		<div class="col-xs-12" style="border: 1.5px solid #009442; padding: 0px;">
 		<c:choose>
 		<c:when test="${poster == null}">
 		<a href="/pineapple/investfunding.invest?fdCode=${list.fdCode}">
			<img src="${pageContext.request.contextPath}/resources/files/insertnotsum.jpg"width="100%" style="padding: 0.75px;">
		</a>
 		</c:when>
 		<c:otherwise>
		<a href="/pineapple/investfunding.invest?fdCode=${list.fdCode}">
			<img src="${pageContext.request.contextPath}/resources/files${poster.substring(poster.lastIndexOf('/'),poster.length())}"width="100%" style="padding: 0.75px;">
		</a>
		</c:otherwise>
		</c:choose>

		<div>
		<div class="fdlist-title" style="height: 56px;">
			${list.fdTitle}
		</div>
		</div>
		<div class="fdlist-comname">
			${list.comName}
		</div>
		<div class="fdlist-data" style="width: 100%">
		<div class="col-xs-12" style="padding: 0px 0px">
			<div style="border-bottom: 1px solid #d7d7d7; padding: 5px 10px;"><b>${list.days}남음</b></div>
		</div>
		<div class="col-xs-12" style="padding: 0px 0px">
			<div style="padding:5px 10px;"><b>${list.issuePrice*list.total}원 달성</b></div>
		</div>
		<div class="col-xs-12" style="padding: 0px 10px 0px 10px;">
		<div class="progress bor-defult" style="margin-bottom: 10px;">
  				<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${(list.total/list.numberOfShares)*100}%; min-width: 3em; max-width: 100%;">
    				${(list.total/list.numberOfShares)*100}%
  				</div>
		</div>
		</div>	
		</div>
	</div>
	</div>
	</div>
	</c:forEach>
	</div>
</body>
</html>