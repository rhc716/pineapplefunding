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
	 			 	<td><input type="checkbox" name="${myinvestormessagesend.msgCode}"></td>
	 			 	<c:choose>
	 			 	<c:when test="${myinvestormessagesend.msgCheck == 0}">
	 			 	<td><a class="msgcheckok"  href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">보낸 사람 : ${myinvestormessagesend.name}</a></td>
	 			 	<td><a class="msgcheckok contentopen"  href="#" data-toggle="modal" data-target="#myqna${myinvestormessagesend.msgCode}" qna-title="${myinvestormessagesend.msgCode}"  dataCode="${myinvestormessagesend.msgCode}">${myinvestormessagesend.msgTitle}</a></td>
	 			 	</c:when>
	 			 	<c:otherwise>
	 			 	<td><a class="msgcheckno" style="color: black;" href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">보낸 사람 : ${myinvestormessagesend.name}</a></td>
	 			 	<td><a class="msgcheckno contentopen" style="color: black;" href="#" data-toggle="modal" data-target="#myqna${myinvestormessagesend.msgCode}" qna-title="${myinvestormessagesend.msgCode}" dataCode="${myinvestormessagesend.msgCode}">${myinvestormessagesend.msgTitle}</a></td>
	 			 	</c:otherwise>
	 			 	</c:choose>
	 			 	<td><span style="opacity: 0.5">${myinvestormessagesend.msgTime}</span></td>
	 			 	</tr>
			</tbody>
			</c:forEach>
		</table>
</body>
</html>