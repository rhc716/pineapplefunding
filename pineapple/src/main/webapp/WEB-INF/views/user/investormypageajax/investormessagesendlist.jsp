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
	$('.contentopen').click(function(){
		var msgCode = $(this).attr('dataCode');
		$('#'+msgCode+'').find('a').addClass('msgcheckno').removeClass('msgcheckok')
		$('#'+msgCode+'').find('.checkcheck').addClass('glyphicon glyphicon-ok').removeClass('checkcheck')
		var investmenttab = $.ajax({ // ajax실행부분
	        type: 'get',
	        url : '/pineapple/investormessageopen.timeline',
	        data : {msgCode : msgCode},
	        success : function success(msg){
	        },
	        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
	        error : function error(){
        	}
		});
	});
});
</script>
</head>
<body>
			<table class="table" style="margin: 0px;">
				<c:forEach var="myinvestormessage" items="${myinvestormessage}">
				<tbody id="${myinvestormessage.msgCode}" style="text-align: center;">
		 			 	<tr>
		 			 	<td><input type="checkbox" name="messagechecked" value="${myinvestormessage.msgCode}"></td>
		 			 	<c:choose>
		 			 	<c:when test="${myinvestormessage.msgCheck == 0}">
		 			 	<td><a class="msgcheckok"  href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">보낸 사람 : ${myinvestormessage.name}</a></td>
		 			 	<td><a class="msgcheckok contentopen"  href="#" data-toggle="modal" data-target="#myqna${myinvestormessage.msgCode}" qna-title="${myinvestormessage.msgCode}"  dataCode="${myinvestormessage.msgCode}">${myinvestormessage.msgTitle}</a></td>
		 			 	</c:when>
		 			 	<c:otherwise>
		 			 	<td><a class="msgcheckno" style="color: black;" href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">보낸 사람 : ${myinvestormessage.name}</a></td>
		 			 	<td><a class="msgcheckno contentopen" style="color: black;" href="#" data-toggle="modal" data-target="#myqna${myinvestormessage.msgCode}" qna-title="${myinvestormessage.msgCode}" dataCode="${myinvestormessage.msgCode}">${myinvestormessage.msgTitle}</a></td>
		 			 	</c:otherwise>
		 			 	</c:choose>
		 			 	<td><span style="opacity: 0.5">${myinvestormessage.msgTime}</span></td>
		 			 	<c:choose>
		 			 	<c:when test="${myinvestormessage.msgCheck == 0}">
						<td><span class="checkcheck"></span></td>	 		
		 			 	</c:when>
		 			 	<c:otherwise>
						<td><span class="glyphicon glyphicon-ok"></span></td>	 			 	
						</c:otherwise>
		 			 	</c:choose>
		 			 	</tr>
				</tbody>
				</c:forEach>
			</table>
			
			<c:forEach var="myinvestormessage" items="${myinvestormessage}">
			<div class="modal fade" id="myqna${myinvestormessage.msgCode}" tabindex="-1" role="dialog" aria-labelledby="myqnaLabel${myinvestormessage.msgCode}" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
			    <div class="modal-header text-lr-center">
				    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				    <h1 class="modal-title" id="myModalLabel${myinvestormessage.msgCode}">질문 내용 수정</h1>
				</div>
				<div class="modal-body">
					<div>${myinvestormessage.msgContent}</div>
			    </div>
			    <div class="modal-footer">
					<button class="qnaupdateform btn btn-default" type="button" data-dismiss="modal" dataCode="${myinvestormessage.msgCode}">수정하기</button>
	       			<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
	      		</div>
			  </div>
			</div>
			</div>
			</c:forEach>
</body>
</html>