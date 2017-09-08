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
	$('.receiveidclick').click(function(){
		$('#messagereceiveidinput').val($(this).text());
		
	});
});
</script>
</head>
<body>
	<label for="selectlist">검색 목록</label>
	<div class="col-xs-12" id="selectlist" style="overflow: auto; border: 1px solid #d7d7d7; border-radius: 5px; padding: 10px 10px; height: 80px; resize: none;">
	<c:forEach var="receivelist" items="${myinvestormessagesendreceiveid}">
		<div class="receiveidclick" style="padding: 5px 0px;">${receivelist.nickname}</div>
	</c:forEach>
	</div>
</body>
</html>