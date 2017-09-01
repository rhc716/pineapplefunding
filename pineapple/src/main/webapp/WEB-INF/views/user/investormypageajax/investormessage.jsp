<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투자자 메세지 list</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

</head>
<script type="text/javascript">
$(document).ready(function(){
	$('#messagesend').hide()
	$('#sendlist').hide()
});
</script>
<body>
	<div class="col-xs-12" style="padding: 0px">
		<div class="col-xs-2" style="padding: 0px 15px 0px 0px;">
				<ul style="font-size: 20px; list-style: none; height: 100%; width: 100%; border: 1.5px solid #009442; border-radius: 5px; padding: 10px; text-align: center;">
					<li class="messagenav"><a class="messagenav1" dataCode="messagesend" href="#">메세지 보내기</a></li>
					<li class="messagenav"><a class="messagenav1" dataCode="receivelist" href="#">받은 메세지함</a></li>
					<li class="messagenav"><a class="messagenav1" dataCode="sendlist" href="#">보낸 메세지함</a></li>
				</ul>
		</div>
		
		<!-- 받은 메세지함 리스트 -->
		<div class="col-xs-10" id="receivelist" style="border: 1.5px solid #009442; border-radius: 5px;">
		<table class="table" style="margin: 0px;">
			<tbody style="text-align: center;">
				<c:forEach var="myinvestormessage" items="${myinvestormessage}">
	 			 	<tr>
	 			 	<td><input type="checkbox" name="${myinvestormessage.msgCode}"></td>
	 			 	<c:choose>
	 			 	<c:when test="${myinvestormessage.msgCheck == 0}">
	 			 	<td><a class="msgcheckok"  href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">보낸 사람 : ${myinvestormessage.name}</a></td>
	 			 	<td><a class="msgcheckok">${myinvestormessage.msgTitle}</a></td>
	 			 	</c:when>
	 			 	<c:otherwise>
	 			 	<td><a class="msgcheckno" style="color: black;" href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">보낸 사람 : ${myinvestormessage.name}</a></td>
	 			 	<td><a class="msgcheckno" style="color: black;" href="#">${myinvestormessage.msgTitle}</a></td>
	 			 	</c:otherwise>
	 			 	</c:choose>
	 			 	<td><span style="opacity: 0.5">${myinvestormessage.msgTime}</span></td>
	 			 	</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<!-- 보낸 메세지함 리스트 -->
		<div class="col-xs-10" id="sendlist" style="border: 1.5px solid #009442; border-radius: 5px;">
			보낸 메세지함
		</div>
		
		
		<!-- 메세지 보내기 -->
		<div class="col-xs-10" id="messagesend" style="border: 1.5px solid #009442; border-radius: 5px;">
			메세지 보내기
		</div>
		
		
	</div>
</body>
</html>