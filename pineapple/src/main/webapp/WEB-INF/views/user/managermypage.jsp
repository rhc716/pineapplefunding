<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경영진 MyPage</title>
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
<script type="text/javascript">
	$(document).ready(function(){
		$('#newAccountSubmitBtn').click(function(){
			$('#newaccountform').submit();
		});
		$('#newAccountCancelBtn').click(function(){
			location.href = '/pineapple/mypage.user';
		});
		$('#changeAccountModalBtn').click(function(){
			var in_accountCode = $('#changeAccountModalBtn').val();
			var changeAccountAjax = $.ajax({ // ajax실행부분
								        type: "get",
								        url : "/pineapple/changeaccountpage.user",
								        data : {accountCode : in_accountCode},
								        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
								        error : function error(){
								        		alert('계좌정보 불러오기 오류');
								        	}
									});
			//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
			changeAccountAjax.done(function(ic){
				console.log(ic);
				$('#accountCodeChange').val(ic.accountCode);
				$('#secCompanyChange').val(ic.secCompany);
	    		$('#accountNumberChange').val(ic.accountNumber);
	    		$('#accountNicknameChange').val(ic.accountNickname);
			});
		});
	});
	//기업정보확인모달과 사원등록모달 교체 기능 구현
	$(document).ready(function(){
		$('#addEmployeeMngBtn').click(function(){
			$('#getCompanyOpenInfo').modal("hide");
			$('#addEmployee').modal("show");
		});
		$('#cancelBtn').click(function(){
			location.href = '/pineapple/mypage.user';
		});
	});
</script>
</head>
<body>
<div class="container">
<!--로그인 버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<!-- 경영진마이페이지 Tab bar -->
	<div class="container"> 
		<ul id="myTab" class="nav nav-tabs" role="tablist"> 
			<li role="presentation" class="active">
				<a data-target="#managerinfo" id="managerinfo-tab" role="tab" data-toggle="tab" aria-controls="managerinfo" aria-expanded="true">내정보</a>
			</li> 
			<li role="presentation" class="">
				<a data-target="#insertCompany" role="tab" id="insertCompany-tab" data-toggle="tab" aria-controls="insertCompany" aria-expanded="false">기업등록요청</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#approveEmployee" role="tab" id="approveEmployee-tab" data-toggle="tab" aria-controls="approveEmployee" aria-expanded="false">사원요청승인</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#employeeList" role="tab" id="employeeList-tab" data-toggle="tab" aria-controls="employeeList" aria-expanded="false">사원리스트</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#message" role="tab" id="message-tab" data-toggle="tab" aria-controls="message" aria-expanded="false">메세지</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="managerinfo" aria-labelledby="managerinfo-tab">
				<!-- 마이페이지 공통 모듈 -->
				<c:import url="./mypageall.jsp"/>
				<br>
				<div class="row">
					<div class="col-md-2">
						<p>계좌정보</p>
					</div>
					<div class="col-md-10">
					<!-- 경영진 고유 영역 -->
					<br>
					<p>내계좌정보</p>
					<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr class="info">
						<td>증권사</td>
						<td>계좌번호</td>
						<td>계좌이름</td>
						<td>계좌정보수정</td>
						<td>계좌정보삭제</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="useraccount" items="${user.account}">
							<tr>
								<td> ${useraccount.secCompany} </td>
								<td> ${useraccount.accountNumber} </td>
								<td> ${useraccount.accountNickname} </td>
								<td>
									<button id="changeAccountModalBtn" type="button" class="btn btn-info btn-block" data-toggle="modal" data-target="#changeAccountModal" value="${useraccount.accountCode}">수정</button>
								</td>
								<td>
									<form action="/pineapple/deleteaccount.user" method="post">
										<input type="hidden" id="accountCode" name="accountCode" value="${useraccount.accountCode}">
										<button id="deleteAccountBtn" type="submit" class="btn btn-info btn-block">삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<div>
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#newaccountmodal">+ 새로운 계좌등록</button>
						</div>
					</tfoot>
					</table>
					</div>
					<!-- 새로운 계좌등록을위한 모달 내부 구현 -->
					<div class="modal fade" id="newaccountmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="myModalLabel">${nickname}님의 새로운 계좌등록</h4>
					      </div>
					      <div class="modal-body">
					        <form id="newaccountform" action="/pineapple/addnewaccount.user" method="post">
					        	<div class="container_insert">
								    <div id="accountHolerIdinput" class="form-group has-success has-feedback">
										<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
										<input type="text" class="form-control" id="accountId" name="accountId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
										<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
										<span id="inputSuccess2Status" class="sr-only">(success)</span>
									</div>
									<br>
								  	<div class="form-group">
									    <label for="secCompany">증권사</label>
									    <p id="explain">(계좌를 만든 증권사 이름을 정확히 입력해주세요)</p>
									    <p><input type="text" id="secCompany" name="secCompany" class="form-control"></p>
								  	</div>
								  	<br>
								  	<div class="form-group">
								  		<label for="accountNumber">계좌번호</label>
									    <p id="explain">(계좌번호를 -없이 입력해주세요)</p>
									    <p><input type="text" id="accountNumber" name="accountNumber" class="form-control"></p>
								  	</div>
									<br>
									<div class="form-group">
								  		<label for="accountNickname">계좌번호 별명</label>
									    <p id="explain">(계좌번호의 별명을 등록해주세요. 필수사항이 아니므로 별명을 등록하지 않으셔도 됩니다.)</p>
									    <p><input type="text" id="accountNickname" name="accountNickname" class="form-control"></p>
								  	</div>
									<br>
							      </div>
							      <div class="modal-footer">
							        <button id="newAccountCancelBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							        <button id="newAccountSubmitBtn" type="button" class="btn btn-primary">추가하기</button>
							      </div>
					        </form>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- 계좌정보 수정을위한 모달 내부 구현 -->
					<div class="modal fade" id="changeAccountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="myModalLabel">${nickname}님의 계좌정보수정</h4>
					      </div>
					      <div class="modal-body">
					        <form id="changeaccountform" action="/pineapple/changeaccount.user" method="post">
					        	<div class="container_insert">
					        		<input type="hidden" id="accountCodeChange" name="accountCode">
								    <div id="accountHolerIdinput" class="form-group has-success has-feedback">
										<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
										<input type="text" class="form-control" id="accountId" name="accountId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
										<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
										<span id="inputSuccess2Status" class="sr-only">(success)</span>
									</div>
									<br>
								  	<div class="form-group">
									    <label for="secCompany">증권사</label>
									    <p id="explain">(계좌를 만든 증권사 이름을 정확히 입력해주세요)</p>
									    <p><input type="text" id="secCompanyChange" name="secCompany" class="form-control"></p>
								  	</div>
								  	<br>
								  	<div class="form-group">
								  		<label for="accountNumber">계좌번호</label>
									    <p id="explain">(수정할 계좌번호를 -없이 입력해주세요)</p>
									    <p><input type="text" id="accountNumberChange" name="accountNumber" class="form-control"></p>
								  	</div>
									<br>
									<div class="form-group">
								  		<label for="accountNickname">계좌번호 별명</label>
									    <p id="explain">(수정할 계좌번호의 별명을 등록해주세요. 필수사항이 아니므로 별명을 등록하지 않으셔도 됩니다.)</p>
									    <p><input type="text" id="accountNicknameChange" name="accountNickname" class="form-control"></p>
								  	</div>
									<br>
							      </div>
							      <div class="modal-footer">
							        <button id="newAccountCancelBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							        <button type="submit" class="btn btn-primary">수정하기</button>
							      </div>
					        </form>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
			</div>
			<!-- 기업등록요청하기 입력폼; 기업을 등록하는 경영진과 등록하지 않는 경영진 여부에 따라 페이지 구분 기능 구현 -->
			<div role="tabpanel" class="tab-pane fade" id="insertCompany" aria-labelledby="insertCompany-tab">
				<div class="row">
					<div class="col-xs-2">
						<p>기업등록정보확인</p>
						<p>사원등록요청</p>
					</div>
					<div class="col-xs-10">
						<!-- 기업을 등록한 경영진은 자신이 등록한 기업정보와 관리자에 의한 기업승인여부를 확인할 수 있다(사원정보입력) -->
						<!-- 기업을 등록지않은 경영진은 기존의 기업들 중 자신이 소속된 기업을 검색하여 사원정보를 입력한다 -->
						<c:choose>
							<c:when test="${not empty company}">
								<br>
								<button id="getCompanyOpenInfoBtn" type="button" class="btn btn-info btn-block" data-toggle="modal" data-target="#getCompanyOpenInfo">기업개설정보확인</button>
								<br>
								<p id="explain">개설한 기업정보를 확인할 수 있습니다</p>
							</c:when>
							<c:otherwise>
								<br>
								<button id="addEmployeeBtn" type="button" class="btn btn-info btn-block" data-toggle="modal" data-target="#addEmployee">사원등록하기</button>
								<br> 
								<p id="explain">소속한 기업을 검색하여 사원으로 등록해주시기 바랍니다</p>
							</c:otherwise>
						</c:choose>
						<!-- 개설한 기업의 승인여부 및 세부사항 확인을 위한 모달 내부 구현 -->
						<div class="modal fade" id="getCompanyOpenInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">${nickname}님의 기업등록정보</h4>
						      </div>
						      <div class="modal-body">
						        <form id="companyCheckForm">
									<div class="container_insert">
									<c:choose>
										<c:when test="${not empty company.comApprovalId}">
											<form class="form-inline">
											  <div class="form-group has-success has-feedback">
											    <label class="control-label" for="inputSuccess4">기업승인여부</label>
											    <input type="text" class="form-control" id="comAdminApproved" name="comAdminApproved" value="기업승인완료" aria-describedby="inputSuccess4Status" readonly>
											    <input type="hidden" class="form-control" id="comAdminApprovalCheck1" name="comAdminApproval" value="${company.comAdminApproval}">
											    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											    <span id="comApprovedStatus" class="sr-only">(success)</span>
											  </div>
											</form>
											<br>
										</c:when>
										<c:otherwise>
											<form class="form-inline">
											  <div class="form-group has-success has-feedback">
											    <label class="control-label" for="inputSuccess4">기업승인여부</label>
											    <input type="text" class="form-control" id="comAdminNotApproved" name="comAdminNotApproved" value="기업미승인" aria-describedby="inputSuccess4Status" readonly>
											    <input type="hidden" class="form-control" id="comAdminApprovalCheck2" name="comAdminApproval" value="${company.comAdminApproval}">
											    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											    <span id="comApprovedStatus" class="sr-only">(success)</span>
											  </div>
											</form>
											<br>
										</c:otherwise>
									</c:choose>
									    <div id="comOpenEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">기업등록요청아이디</label>
											<input id="comOpenUserId" name="comOpenUserId" type="text" class="form-control" value="${company.comOpenUserId}" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
										</div>
										<br>
										<div>
									    	<label for="comLogoFileInput">기업로고업로드</label>
										    <input type="file" id="comLogoServerName" name="comLogoServerName" value="${company.comLogoServerName}">
										     <p class="help-block">기업로고 이미지 파일업로드</p>
										    <input type="number" id="comLogoHeight" name="comLogoHeight" value="${company.comLogoHeight}" hidden>
										    <input type="number" id="comLogoWidth" name="comLogoWidth" value="${company.comLogoWidth}" hidden>
										    <input type="number" id="comLogoSize" name="comLogoSize" value="${company.comLogoSize}" hidden>
										    <input type="text" id="comLogoExtension" name="comLogoExtension" value="${company.comLogoExtension}" hidden>
										</div>
										<br>
										<div id="comNameCheck" class="form-group">
										    <label class="control-label" for="comNameInput">*기업이름</label>
										    <p id="explain"> (정확한 기업이름을 입력해주시기 바랍니다. 이미 등록된 기업이 존재하는 경우 기업을 등록할 수 없습니다.)</p>
										    <input id="comName" name="comName" type="text" class="form-control" value="${company.comName}" placeholder="Enter Company Name">
									  		<span id="comnamech"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
										<br>
									  	</div>
									  	<div class="form-group">
										    <label for="exampleInputPassword1">*사업자번호</label>
										    <p id="explain">(-없이 사업자번호 10자리를 정확히 입력해주시기 바랍니다)</p>
										    <input id="comNumber" name="comNumber" type="text" class="form-control" value="${company.comNumber}" maxlength="10" placeholder="Enter Company Number">
										    <span id="pwch"></span>
									  	</div>
									  	<br>
									  	<div>
									  		<label for="comHomePageInput">기업웹사이트주소</label>
										    <input id="comHomePage" name="comHomePage" type="text" class="form-control" value="${company.comHomePage}" placeholder="Enter Company Web Site Address">
										</div>
										<br>
										<div>
									    	<label for="comCeoNameInput">기업대표이름</label>
										    <p id="explain">(현재 기업 대표의 실명을 입력해주시기 바랍니다)</p>
										    <input id="comCeoName" name="comCeoName" type="text" class="form-control" value="${company.comCeoName}" placeholder="Enter Company CEO Name">
										</div>
										<br>
										<div>
									    	<label for="comEstablishYearInupt">기업설립연도</label>
										    <p id="explain">(기업의 설립연도를 입력해주시기 바랍니다)</p>
										    <input id="comEstablishYear" name="comEstablishYear" type="text" class="form-control" value="${company.comEstablishYear}" maxlength="4" placeholder="Enter Company Establish Year">
										</div>
										<br>
										<div>
									    	<label for="comInfoInupt">기업정보</label>
										    <p id="explain">(기업에 대한 전반적인 정보를 입력해주시기 바랍니다)</p>
										    <textarea id="comInfo" name="comInfo" class="form-control" value="${company.comInfo}" rows="4"></textarea>
										</div>
										<br>
										<div>
									    	<label for="comSummaryInupt">기업간략소개</label>
										    <p id="explain">(기업에 대한 소개글을 입력해주시기 바랍니다)</p>
										    <textarea id="comSummary" name="comSummary" class="form-control" value="${company.comSummary}" rows="4"></textarea>
										</div>
										<br>
										<div>
									    	<label for="comActivitySummaryInupt">기업활동정보</label>
										    <p id="explain">(기업의 활동분야에 대한 정보를 입력해주시기 바랍니다)</p>
										    <textarea id="comActivitySummary" name="comActivitySummary" class="form-control" value="${company.comActivitySummary}" rows="4"></textarea>
										</div>
										</div>
									</form>
						        </div>
						        <br>
								<div class="modal-footer">
							        <button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							        <button id="addEmployeeMngBtn" type="button" class="btn btn-primary">사원등록화면</button>
							    </div>
						    </div>
						  </div>
						</div>
						<!-- 사원등록(모든경영진사용) 모달 내부 구현 -->
						<div class="modal fade" id="addEmployee" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">${nickname}님의 사원등록요청</h4>
						      </div>
						      <div class="modal-body">
						        <form id="companyCheckForm" action="/pineapple/addemployee.user" method="post">
										<!-- 기업정보검색 후 사원등록하기 -->
										<div id="comNameSearch" class="form-group">
										    <label class="control-label" for="comNameInput">기업검색</label>
										    <p id="explain"> (소속한 기업을 검색하여 입력해주시기 바랍니다)</p>
										    <input id="emComName" name="emComName" type="text" class="form-control" placeholder="Enter Company Name" readonly>
										    <button id="emComSearchBtn" class="form-control">기업검색</button>
									  		<input id="emComCode" name="emComCode" type="hidden" class="form-control">
									  		<span id="comnamech"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
										<br>
									    <div id="emUserIdEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
											<input id="emUserId" name="emUserId" type="text" class="form-control" value="${company.comOpenUserId}" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
										</div>
										<br>
									</div>
								</form>
						      </div>
						      <div class="modal-footer">
							        <button id="cancelBtn" type="button" class="btn btn-success btn-lg" data-dismiss="modal">닫기</button>
							        <button id="addEmployeeMngSubmit" type="button" class="btn btn-primary">사원등록</button>
					      	  </div>
					    	</div>
						  </div>
						</div>
						<!-- 소속기업 검색 모달 내부 구현 -->
						<div class="modal fade" id="searchCompanyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">${nickname}님의 소속기업검색</h4>
						      </div>
						      <div class="modal-body">
						        <form id="companySelect" action="/pineapple/selectcompany.user" method="post">
								  	<div class="form-group">
									    <label for="companySearchList">회사검색</label>
									    <input id="comName" name="comName" type="text" class="form-control">
									    <button id="mycomSearchBtn" type="submit">검색</button>
								  	</div>
									<br>
									<!-- 
									<c:choose>
										<c:when test="${not empty mycompany}">
									  		<table class="table table-striped table-bordered table-hover">
											    	<thead>
											    		<tr>
											    			<td>회사코드</td>
											    			<td>회사명</td>
											    		</tr>
											    	</thead>
											    	<tbody>
													    <c:forEach var="mycompany" items="${mycompany}">
													    	<tr>
													    		<td>
													    			${mycompany.emComCode}
													    		</td>
													    		<td>
													    			${mycompany.emComName}
													    		</td>
													    	</tr>
													    </c:forEach>
											    	</tbody>
											    </table>
									  	</c:when>
									  	<c:otherwise>
									  	 -->
									  		<div class="form-group">
											    <label for="allcompanylist">전체회사목록</label>
											    <table class="table table-striped table-bordered table-hover">
											    	<thead>
											    		<tr>
											    			<td>회사코드</td>
											    			<td>회사명</td>
											    		</tr>
											    	</thead>
											    	<tbody>
													    <c:forEach var="allcompany" items="${allcompany}">
													    	<tr>
													    		<td>
													    			${allcompany.comCode}
													    		</td>
													    		<td>
													    			${allcompany.comName}
													    		</td>
													    	</tr>
													    </c:forEach>
											    	</tbody>
											    </table>
										  	</div>
										  	<!-- 
									  	</c:otherwise>
								  	</c:choose>
								  	 -->
								  	<div class="modal-footer">
								        <button id="cancelBtn" type="button" class="btn btn-success btn-lg" data-dismiss="modal">닫기</button>
								        <button id="addCompanyBtn" type="submit" class="btn btn-primary btn-lg">기업등록</button>
						      	  	</div>
								</form>
						      </div>
					    	</div>
						  </div>
						</div>
					</div>

				</div>
				<br>
				<div class="row">
					<div class="col-xs-2">
						<p>기업등록요청하기</p>
					</div>
					<div class="col-xs-10">
						<form id="companyInsertForm" action="/pineapple/addnewcompany.user" method="post">
							<div class="container_insert">
								<div>
									<input type="hidden" id="comAdminApproval" name="comAdminApproval" value="0">
								</div>
							    <div id="comOpenEmail" class="form-group has-success has-feedback">
									<label class="control-label" for="inputSuccess2">기업등록요청아이디</label>
									<input id="comOpenUserId" name="comOpenUserId" type="text" class="form-control" value="${id}" varia-describedby="inputSuccess2Status" readonly>
									<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="inputSuccess2Status" class="sr-only">(success)</span>
								</div>
								<br>
								<div>
							    	<label for="comLogoFileInput">기업로고업로드</label>
								    <input type="file" id="comLogoServerName" name="comLogoServerName">
								     <p class="help-block">기업로고 이미지 파일업로드</p>
								    <input type="number" id="comLogoHeight" name="comLogoHeight" hidden>
								    <input type="number" id="comLogoWidth" name="comLogoWidth" hidden>
								    <input type="number" id="comLogoSize" name="comLogoSize" hidden>
								    <input type="text" id="comLogoExtension" name="comLogoExtension" hidden>
								</div>
								<br>
								<div id="comNameCheck" class="form-group">
								    <label class="control-label" for="comNameInput">*기업이름</label>
								    <p id="explain"> (정확한 기업이름을 입력해주시기 바랍니다. 이미 등록된 기업이 존재하는 경우 기업을 등록할 수 없습니다.)</p>
								    <input id="comName" name="comName" type="text" class="form-control" placeholder="Enter Company Name">
							  		<span id="comnamech"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
								<br>
							  	</div>
							  	<div class="form-group">
								    <label for="exampleInputPassword1">*사업자번호</label>
								    <p id="explain">(-없이 사업자번호 10자리를 정확히 입력해주시기 바랍니다)</p>
								    <input id="comNumber" name="comNumber" type="text" class="form-control" maxlength="10" placeholder="Enter Company Number">
								    <span id="pwch"></span>
							  	</div>
							  	<br>
							  	<div>
							  		<label for="comHomePageInput">기업웹사이트주소</label>
								    <input id="comHomePage" name="comHomePage" type="text" class="form-control" placeholder="Enter Company Web Site Address">
								</div>
								<br>
								<div>
							    	<label for="comCeoNameInput">기업대표이름</label>
								    <p id="explain">(현재 기업 대표의 실명을 입력해주시기 바랍니다)</p>
								    <input id="comCeoName" name="comCeoName" type="text" class="form-control" placeholder="Enter Company CEO Name">
								</div>
								<br>
								<div>
							    	<label for="comEstablishYearInupt">기업설립연도</label>
								    <p id="explain">(기업의 설립연도를 입력해주시기 바랍니다)</p>
								    <input id="comEstablishYear" name="comEstablishYear" type="text" class="form-control" maxlength="4" placeholder="Enter Company Establish Year">
								</div>
								<br>
								<div>
							    	<label for="comInfoInupt">기업정보</label>
								    <p id="explain">(기업에 대한 전반적인 정보를 입력해주시기 바랍니다)</p>
								    <textarea id="comInfo" name="comInfo" class="form-control" rows="4"></textarea>
								</div>
								<br>
								<div>
							    	<label for="comSummaryInupt">기업간략소개</label>
								    <p id="explain">(기업에 대한 소개글을 입력해주시기 바랍니다)</p>
								    <textarea id="comSummary" name="comSummary" class="form-control" rows="4"></textarea>
								</div>
								<br>
								<div>
							    	<label for="comActivitySummaryInupt">기업활동정보</label>
								    <p id="explain">(기업의 활동분야에 대한 정보를 입력해주시기 바랍니다)</p>
								    <textarea id="comActivitySummary" name="comActivitySummary" class="form-control" rows="4"></textarea>
								</div>
								<br>
								<div class="clearfix">
								    <input id="cancelComInsertBtn" type="reset" class="button_insert cancelbtn" value="초기화">
								    <input id="submitComInsertBtn" type="button" class="button_insert signupbtn" value="기업등록">
							   	</div>
							</div>
						</form>
					</div>
				</div>
				
			</div>
			<div role="tabpanel" class="tab-pane fade" id="approveEmployee" aria-labelledby="approveEmployee-tab"> 
				<p>사원요청승인</p>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="employeeList" aria-labelledby="employeeList-tab"> 
				<p>전체사원리스트</p> 
			</div>
			<div role="tabpanel" class="tab-pane fade" id="message" aria-labelledby="message-tab"> 
				<p>메세지</p> 
			</div>
			

		</div> 
	</div>
<!-- 풋터 -->
<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>