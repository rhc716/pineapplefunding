<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<table class="table" style="margin: 0px;">
			<c:forEach var="myinvestormessagesend" items="${myinvestormessagesend}">
			<tbody id="${myinvestormessagesend.msgCode}" style="text-align: center;">
	 			 	<tr>
	 			 	<td></td>
	 			 	<td><a class="msgcheckno" style="color: black;" href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">받는 사람 : ${myinvestormessagesend.name}</a></td>
	 			 	<td><a class="msgcheckno contentopen" style="color: black;" href="#" data-toggle="modal" data-target="#myqnare${myinvestormessagesend.msgCode}" qna-title="re${myinvestormessagesend.msgCode}" dataCode="${myinvestormessagesend.msgCode}">${myinvestormessagesend.msgTitle}</a></td>
	 			 	<td><span style="opacity: 0.5">${myinvestormessagesend.msgTime}</span></td>
	 			 	</tr>
			</tbody>
			</c:forEach>
		</table>
			<c:forEach var="myinvestormessagesend" items="${myinvestormessagesend}">
			<div class="modal fade" id="myqnare${myinvestormessagesend.msgCode}" tabindex="-1" role="dialog" aria-labelledby="myqnaLabelre${myinvestormessagesend.msgCode}" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
			    <div class="modal-header text-lr-center">
				    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				    <h1 class="modal-title" id="myModalLabelre${myinvestormessagesend.msgCode}">질문 내용 수정</h1>
				</div>
				<div class="modal-body">
					<div>${myinvestormessagesend.msgContent}</div>
			    </div>
			    <div class="modal-footer">
					<button class="qnaupdateform btn btn-default" type="button" data-dismiss="modal" dataCode="${myinvestormessagesend.msgCode}">수정하기</button>
	       			<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
	      		</div>
			  </div>
			</div>
			</div>
			</c:forEach>
</body>
</html>