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
		$('#investmentdeletebtn').click(function(){
			$('#investmentdeleteform').submit();
		});
	});
</script>
</head>
<body>
	<c:set var="deleteData" value="${investmentdeletedata}"></c:set>
	<div class="investdelete-form-group" id="investdeleteform">
	<form id="investmentdeleteform" action="/pineapple/investmentdelete.invest" method="POST">
	<h3>예약 주식 수</h3>
	<input type="hidden" name="investCode" value="${deleteData.investCode}">
	<input type="hidden" name="investfdCode" value="${deleteData.investFdCode}">
	</form>
	</div>
     <div class="modal-footer">
     	<button id="investmentdeletebtn" type="button" class="btn btn-default" data-dismiss="modal">투자예약취소</button>
       <button type="button" class="btn btn-default" data-dismiss="modal">그만두기</button>
     </div>
</body>
</html>