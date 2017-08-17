<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage 공통모듈</title>
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

<!-- css lbr -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lbr.css" />
</head>
<body>

<!-- 본문 -->
<!-- 마이페이지 내정보 Tab bar -->
	<div class="row">
		<div class="col-md-2">
			<p>내정보</p>
		</div>
		<div class="col-md-10">
			<br>
			<div>
				${level} 아이디 : ${id}<br>
				${level} 닉네임 : ${nickname}<br>
				${level} 권한 : ${level}<br>
			</div>
			<br>
			<!-- 상세정보 입력한 경우는 더이상 입력 불가(마이페이지메인으로 리다이렉트됨), 확인만 가능 -->
			<div>
				<button type="submit" class="btn btn-info btn-block" data-toggle="modal" data-target="#userdetailcheckModal">회원상세정보보기</button>
				<p id="explain">(회원상세정보를 확인하려면 클릭해주시기 바랍니다)</p>
			</div>
			<!-- userdetailcheckModal -->
			<div class="modal fade" id="userdetailcheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">${nickname}님 상세정보확인</h4>
			      </div>
			      <div id="userdetailmodalbody" class="modal-body">
				      <div class="container_insert">
					    <div id="emailSuccess" class="form-group has-success has-feedback">
							<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
							<input type="text" class="form-control" id="userDetailId" name="userDetailId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
							<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
							<span id="inputSuccess2Status" class="sr-only">(success)</span>
						</div>
						<br>
					  	<div class="form-group">
						    <label for="phoneFront3">전화번호앞3자리</label>
						    <p><input type="text" id="phoneFront3" name="phoneFront3" maxlength="3" class="form-control" value="${userdetail.phoneFront3}" readonly="readonly"></p>
					  	</div>
					  	<div class="form-group">
					  	 	<label for="phoneFront3">전화번호뒤8자리</label>
						    <p><input type="text" id="phoneRest8" name="phoneRest8" maxlength="8" class="form-control" value="${userdetail.phoneRest8}" readonly="readonly"></p>
					  	</div>
						<br>
						<div>
					    	<label for="postalCodeInput">주소</label>
						    <input type="text" id="postalCode" name="postalCode" value="${userdetail.phoneRest8}" readonly="readonly">
							<input type="text" id="address" name="address" value="${userdetail.address}" readonly="readonly">
							<span id="guide" style="color:#999"></span>
						</div>
						<br>
				      </div>
			      </div>
			       <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        <button id="userdetailmodifyBtn" type="button" class="btn btn-primary" href="/pineapple/userdetailmodify.user">수정하기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 회원정보 수정하기(모달화면 교체를 통한 수정) -->
			<div class="modal fade" id="userdetailmodifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">${nickname}님 상세정보수정</h4>
			        <p id="explain">(수정할 내용을 입력하고 수정 버튼을 누르세요)</p>
			      </div>
			      <div class="modal-body">
      					<form id="form" action="/pineapple/userdetailmodify.user" name="userdetail" method="post" style="border:1px solid #ccc">
							<div class="container_insert">
							    <div id="emailSuccess" class="form-group has-success has-feedback">
									<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
									<input type="text" class="form-control" id="userDetailId" name="userDetailId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
									<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="inputSuccess2Status" class="sr-only">(success)</span>
								</div>
								<br>
							  	<div class="form-group">
								    <label for="phoneFront3">전화번호앞3자리</label>
								    <p id="explain">(전화번호 앞3자리는 3자리의 숫자로 입력해야합니다)</p>
								    <p><input type="text" id="phoneFront3" name="phoneFront3" maxlength="3" class="form-control" value="${userdetail.phoneFront3}"></p>
								    <span id="phch1"></span>
							  	</div>
							  	<div class="form-group">
								    <p id="explain">(전화번호 뒤8자리는 -없이 8자리의 숫자로 입력해야합니다)</p>
								    <p><input type="text" id="phoneRest8" name="phoneRest8" maxlength="8" class="form-control" value="${userdetail.phoneRest8}"></p>
								    <span id="phch2"></span>
							  	</div>
								<br>
								<div>
							    	<label for="postalCodeInput">우편번호</label>
								    <p id="explain">(주소를 정확히 입력해 주시기 바랍니다)</p>
								    <input type="text" id="postalCode" name="postalCode" value="${userdetail.phoneRest8}">
									<input type="button" id="findPostalCode" onclick="sample4_execDaumPostcode()" value="우편번호찾기"><br>
									<input type="text" id="address" name="address" value="${userdetail.address}">
									<input type="text" id="address" name="address" placeholder="나머지 주소">
									<span id="guide" style="color:#999"></span>
								</div>
								<br>
						      </div>
						      <div class="modal-footer">
						        <button id="cancelBtn" type="reset" class="btn btn-default" data-dismiss="modal">닫기</button>
						        <button id="submitBtn" type="submit" class="btn btn-primary" href="/pineapple/userdetailmodify.user">수정하기</button>
						      </div>
				      	</form>
				    </div>
				  </div>
				</div>
			</div>
			<div>
				<form action="/pineapple/userdetailinsert.user">
					<button type="submit" class="btn btn-info btn-block">상세정보입력</button>
					<p id="explain">(회원상세정보를 입력해주시기 바랍니다. 최초입력 후에는 수정하기만 가능합니다)</p>
				</form>
			</div>
		</div>
	</div>		
</body>
</html>