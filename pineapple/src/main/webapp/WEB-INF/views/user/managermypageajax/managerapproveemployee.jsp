<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경영진 사원요청 목록</title>
<script>
$(document).ready(function(){
	$('.approveemployee').click(function(){
		var in_employeeCode = $('.approveemployee').attr('value');
		console.log(in_employeeCode);
		var approveEmployeeAjax = $.ajax({ // ajax실행부분
							        type: "get",
							        url : "/pineapple/approveemployeepage.user",
							        data : {emCode : in_employeeCode},
							        success : function success(){
							        	alert('승인할 사원코드 : '+ in_employeeCode);
							        },
							        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
							        error : function error(){
						        		alert('사원정보 불러오기 오류');
						        	}
								});
		
	});
});
</script>
</head>
<body>
	<c:forEach var="employeeRequestList" items="${employeeRequestList}" varStatus="status">
	 	<tr>
	 		<td class="emCode">${employeeRequestList.emCode}</td>
	 		<td class="emUserId">${employeeRequestList.emUserId}</td>
	 		<td class="emComName">${employeeRequestList.emComName}</td>
	 		<td class="emDepartment">${employeeRequestList.emDepartment}</td>
	 		<td>
	 			<a href="#approveEmployeePage${status.index}" class="btn btn-success btn-block approveemployee" data-toggle="modal" value="${employeeRequestList.emCode}">승인화면</a>
	 		</td>
	 	</tr>
	 	<!-- 사원등록요청 승인처리를 위한 사원정보확인 모달 내부 구현 (승인까지 가능)-->
		<div class="modal fade" id="approveEmployeePage${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">${employeeRequestList.emComName}사원요청에 대한 사원승인</h4>
		      </div>
		      <div class="modal-body">
		        <form action="/pineapple/approveemployee.user" method="post">
		        	<input id="emCodeCheck" name="emCode" value="${employeeRequestList.emCode}" type="hidden" class="form-control">
		        	<input id="emComCodeCheck" name="emComCode" value="${employeeRequestList.emComCode}" type="hidden" class="form-control">
					<div class="form-group has-success has-feedback">
					    <label class="control-label" for="inputSuccess4">소속기업명</label>
					    <input id="emComNameCheck" name="emComName" value="${employeeRequestList.emComName}" type="text" class="focus form-control" readonly>
					    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					    <span id="comApprovedStatus" class="sr-only">(success)</span>
				    </div>
					<br>
				    <div id="emUserIdEmail" class="form-group has-success has-feedback">
						<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
						<input id="emUserIdCheck" name="emUserId" value="${employeeRequestList.emUserId}" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
						<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
						<span id="inputSuccess2Status" class="sr-only">(success)</span>
						<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
					</div>
					<br>
					<div class="form-group">
					    <label for="emRankCodeInput">직급</label>
					    <p id="explain">(1:경영진/2:일반사원)</p>
				        <input id="emRankCodeCheck" name="emRankCode" value="${employeeRequestList.emRankCode}" type="text" readonly>
					    <span id="emrankch1"></span>
				  	</div>
				  	<br>
				  	<div class="form-group">
					    <label for="employeeDepInput1">부서</label>
					    <p id="explain">(사원등록요청한 사원의 기업내의 소속 부서)</p>
					    <input id="emDepartmentCheck" name="emDepartment" value="${employeeRequestList.emDepartment}" type="text" class="form-control" readonly>
				  	</div>
				  	<br>
				  	<div>
				  	 	<input id="emCheckCheck" name="emCheck" type="hidden" value="1">
				  		<input id="emDelRequestCheck" name="emDelRequest" value="${employeeRequestList.emDelRequest}" type="hidden" value="0" class="form-control">
				  	</div>
				  	<div>
						<button type="submit" class="btn btn-info">사원승인</button>&nbsp
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>				
	</c:forEach>
	
</body>
</html>