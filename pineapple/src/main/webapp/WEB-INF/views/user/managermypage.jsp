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
	
		$('.changeaccount').click(function(){
			var in_accountCode = $(this).attr('value');
			var changeAccountAjax = $.ajax({ // ajax실행부분
								        type: "post",
								        url : "/pineapple/accountchangepage.user",
								        data : {accountCode : in_accountCode},
								        success : function success(){
								        	alert('수정할 계좌코드 : '+ in_accountCode);
								        },
								        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
								        error : function error(){
							        		alert('계좌정보 불러오기 오류');
							        	}
									});
			//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
			changeAccountAjax.done(function(ic){
				$('#accountCodeChange').val(ic.accountCode);
				$('#secCompanyChange').val(ic.secCompany);
	    		$('#accountNumberChange').val(ic.accountNumber);
	    		$('#accountNicknameChange').val(ic.accountNickname);
			});
			
		});

	});
	//기업등록시 기업명 존재여부 검사
	$(document).ready(function(){
		$('#comName3').blur(function(){
			var temp = 0;
			var comname = $('#comName3').val();
			var check = /^(?=.*[0-9a-zA-Z가-힣]).{2,20}$/i;
			if(!check.test(comname)) {
				//유효하지 않을때
				temp = 1;
			} else {
				//유효할때
				temp = 0;
			}
			    	
	// 기업명 유효성 검사 통과시 중복확인용 ajax실행
	        if(temp==0){
				$.ajax({ // ajax실행부분
				    type: "post",
				    url : "/pineapple/checkcomname.user",
				    data : {comName : comname},
				    success : function(ic){
				    		console.log(ic.comName);
				    		if(ic.comName == null){
					    		$('#comnameCheck').hide();
					    		$('#comNameSuccess2').show();
					    		$('#comName4').val(comname);
				    		} else {
				    			$('#comnamech3').css("color", "#FF0000");
				    			$('#comnamech3').text('이미 존재하는 기업명입니다.');
				    			$('#comName3').val('');
				    		}
				    	},
				    //만약 해당 페이지에 값을 성공적으로 보냈다면 페이지를 rs 라는 매개변수로 받아 id = 'comnamech3' 구역에 rs를 출력하겠다. 
				    error : function error(){
				    	alert('기업명 중복검사 ajax 에러 발생');
				    }
				});
			} else {
				alert('유효한 기업명을 입력해주시기 바랍니다.');
			}
		});
	});
	$(document).ready(function(){
	//기업정보확인모달과 사원등록모달 교체 기능 구현
	
		$('#addEmployeeMngBtn').click(function(){
			$('#getCompanyOpenInfo').modal("hide");
		});
		$('#cancelBtn').click(function(){
			location.href = '/pineapple/mypage.user';
		});
		$('#employeeCancelBtn').click(function(){
			location.href = '/pineapple/mypage.user';
		});
	});
	
</script>
<script type="text/javascript">

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
				<a data-target="#insertEmployee" role="tab" id="#insertEmployee-tab" data-toggle="tab" aria-controls="#insertEmployee" aria-expanded="false">사원등록요청</a>
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
									<a type="button" class="btn btn-info btn-block changeaccount" data-toggle="modal" value="${useraccount.accountCode}" href="#changeAccountModal">수정</a>
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
							<a type="button" class="btn btn-info" data-toggle="modal" href="#newaccountmodal">+ 새로운 계좌등록</a>
						</div>
					</tfoot>
					</table>
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
				</div>
			</div>
			<!-- 두번째탭 시작 -->
			<!-- 기업등록요청하기 입력폼; 기업을 등록하는 경영진과 등록하지 않는 경영진 여부에 따라 페이지 구분 기능 구현 -->
			<div role="tabpanel" class="tab-pane fade" id="insertCompany" aria-labelledby="insertCompany-tab">
				<div class="row">
					<div class="col-xs-2">
						<p>기업등록정보확인</p>
					</div>
					<div class="col-xs-10">
						<!-- 기업을 등록한 경영진은 자신이 등록한 기업정보와 관리자에 의한 기업승인여부를 확인할 수 있다(사원정보입력) -->
						<!-- 기업을 등록지않은 경영진은 기존의 기업들 중 자신이 소속된 기업을 검색하여 사원정보를 입력한다 -->
					<br>
					<c:forEach var="companyOpenedByMyId1" items="${company}">
						<a class="btn btn-info btn-block cominfoclass" data-toggle="modal" value="${companyOpenedByMyId1.comName}" href="#getCompanyOpenInfo">${companyOpenedByMyId1.comName} 정보확인</a>
					</c:forEach>
					<p id="explain">본인의 아이디로 개설한 모든 기업정보를 확인할 수 있습니다</p>
						<!-- 개설한 모든 회사가 리스트 타입으로 리턴되므로 forEach 태그립을 사용하여 모달 내부 구현 -->
						<c:forEach var="companyOpenedByMyId2" items="${company}">
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
											<c:when test="${not empty companyOpenedByMyId2.comApprovalId}">
												  <div class="form-group has-success has-feedback">
												    <label class="control-label" for="inputSuccess4">기업승인여부</label>
												    <input type="text" class="form-control" id="comAdminApproved" name="comAdminApproved" value="기업승인완료" aria-describedby="inputSuccess4Status" readonly>
												    <input type="hidden" class="form-control" id="comAdminApprovalCheck1" name="comAdminApproval" value="${companyOpenedByMyId2.comAdminApproval}">
												    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
												    <span id="comApprovedStatus" class="sr-only">(success)</span>
												  </div>
												<br>
											</c:when>
											<c:otherwise>
												  <div class="form-group has-success has-feedback">
												    <label class="control-label" for="inputSuccess4">기업승인여부</label>
												    <input type="text" class="form-control" id="comAdminNotApproved" name="comAdminNotApproved" value="기업미승인" aria-describedby="inputSuccess4Status" readonly>
												    <input type="hidden" class="form-control" id="comAdminApprovalCheck2" name="comAdminApproval" value="${companyOpenedByMyId2.comAdminApproval}">
												    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
												    <span id="comApprovedStatus" class="sr-only">(success)</span>
												  </div>
												<br>
											</c:otherwise>
										</c:choose>
									    <div id="comOpenEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">기업등록요청아이디</label>
											<input id="comOpenUserId" name="comOpenUserId" type="text" class="form-control" value="${companyOpenedByMyId2.comOpenUserId}" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
										</div>
										<br>
										<div>
									    	<label for="comLogoFileInput">기업로고업로드</label>
										    <input type="file" id="comLogoServerName" name="comLogoServerName" value="${companyOpenedByMyId2.comLogoServerName}">
										     <p class="help-block">기업로고 이미지 파일업로드</p>
										    <input type="number" id="comLogoHeight" name="comLogoHeight" value="${companyOpenedByMyId2.comLogoHeight}" hidden>
										    <input type="number" id="comLogoWidth" name="comLogoWidth" value="${companyOpenedByMyId2.comLogoWidth}" hidden>
										    <input type="number" id="comLogoSize" name="comLogoSize" value="${companyOpenedByMyId2.comLogoSize}" hidden>
										    <input type="text" id="comLogoExtension" name="comLogoExtension" value="${companyOpenedByMyId2.comLogoExtension}" hidden>
										</div>
										<br>
										<div id="comnameChModal" class="form-group">
										    <label class="control-label" for="comNameInput">*기업이름</label>
										    <p id="explain"> (정확한 기업이름을 입력해주시기 바랍니다. 이미 등록된 기업이 존재하는 경우 기업을 등록할 수 없습니다.)</p>
										    <input id="comName" name="comName" type="text" class="form-control" value="${companyOpenedByMyId2.comName}" placeholder="Enter Company Name">
									  		<span id="comnamech"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
										<br>
									  	</div>
									  	<div class="form-group">
										    <label for="exampleInputPassword1">*사업자번호</label>
										    <p id="explain">(-없이 사업자번호 10자리를 정확히 입력해주시기 바랍니다)</p>
										    <input id="comNumber" name="comNumber" type="text" class="form-control" value="${companyOpenedByMyId2.comNumber}" maxlength="10" placeholder="Enter Company Number">
										    <span id="pwch"></span>
									  	</div>
									  	<br>
									  	<div>
									  		<label for="comHomePageInput">기업웹사이트주소</label>
										    <input id="comHomePage" name="comHomePage" type="text" class="form-control" value="${companyOpenedByMyId2.comHomePage}" placeholder="Enter Company Web Site Address">
										</div>
										<br>
										<div>
									    	<label for="comCeoNameInput">기업대표이름</label>
										    <p id="explain">(현재 기업 대표의 실명을 입력해주시기 바랍니다)</p>
										    <input id="comCeoName" name="comCeoName" type="text" class="form-control" value="${companyOpenedByMyId2.comCeoName}" placeholder="Enter Company CEO Name">
										</div>
										<br>
										<div>
									    	<label for="comEstablishYearInupt">기업설립연도</label>
										    <p id="explain">(기업의 설립연도를 입력해주시기 바랍니다)</p>
										    <input id="comEstablishYear" name="comEstablishYear" type="text" class="form-control" value="${companyOpenedByMyId2.comEstablishYear}" maxlength="4" placeholder="Enter Company Establish Year">
										</div>
										<br>
										<div>
									    	<label for="comInfoInupt">기업정보</label>
										    <p id="explain">(기업에 대한 전반적인 정보를 입력해주시기 바랍니다)</p>
										    <textarea id="comInfo" name="comInfo" class="form-control" value="${companyOpenedByMyId2.comInfo}" rows="4"></textarea>
										</div>
										<br>
										<div>
									    	<label for="comSummaryInupt">기업간략소개</label>
										    <p id="explain">(기업에 대한 소개글을 입력해주시기 바랍니다)</p>
										    <textarea id="comSummary" name="comSummary" class="form-control" value="${companyOpenedByMyId2.comSummary}" rows="4"></textarea>
										</div>
										<br>
										<div>
									    	<label for="comActivitySummaryInupt">기업활동정보</label>
										    <p id="explain">(기업의 활동분야에 대한 정보를 입력해주시기 바랍니다)</p>
										    <textarea id="comActivitySummary" name="comActivitySummary" class="form-control" value="${companyOpenedByMyId2.comActivitySummary}" rows="4"></textarea>
										</div>
										</div>
									</form>
						        </div>
						        <br>
								<div class="modal-footer">
							        <button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							        <a id="addEmployeeMngBtn" class="btn btn-primary" href="#addEmployee" data-toggle="modal">사원등록화면</a>
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
						      <!-- 기업을 최초로 개설신청한 경영진은 사원등록시 기업검색없이 기업명 데이터를 입력시켜준다 -->
						      <c:choose>
						      	<c:when test="${not empty company}">
						      		 <div class="modal-body">
								        <form id="companyCheckForm1" action="/pineapple/addemployee.user" method="post">
											<!-- 기업정보검색없이 사원등록하기 -->
											<div class="form-group has-success has-feedback">
											    <label class="control-label" for="inputSuccess4">소속기업명</label>
											    <input id="emcomName3" name="emComName" type="text" class="focus form-control" value="${companyOpenedByMyId2.comName}" readonly>
									  			<input id="emComCode1" name="emComCode" type="hidden" class="form-control" value="${companyOpenedByMyId2.comCode}">
											    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											    <span id="comApprovedStatus" class="sr-only">(success)</span>
										    </div>
											<br>
										    <div id="emUserIdEmail" class="form-group has-success has-feedback">
												<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
												<input id="emUserId1" name="emUserId" type="text" class="form-control" value="${companyOpenedByMyId2.comOpenUserId}" varia-describedby="inputSuccess2Status" readonly>
												<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
												<span id="inputSuccess2Status" class="sr-only">(success)</span>
												<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
											</div>
											<br>
											<div class="form-group">
											    <label for="emRankCodeInput">직급선택</label>
											    <p id="explain">(경영진과 일반사원 중 하나를 선택해주시기 바랍니다)</p>
											      경영진<input id="emRankCodeMng1" name="emRankCode" value="1" type="radio" checked>&nbsp&nbsp&nbsp
											      일반사원<input id="emRankCodeEmp1" name="emRankCode" value="2" type="radio">
											    <span id="emrankch1"></span>
										  	</div>
										  	<br>
										  	<div class="form-group">
											    <label for="employeeDepInput1">부서선택</label>
											    <p id="explain">(기업내의 소속 부서를 입력해주시기 바랍니다)</p>
											    <input id="emDepartment1" name="emDepartment" type="text" class="form-control">
										  	</div>
										  	<br>
										  	<div>
										  	<!-- 기업을 최초로 등록한 경영진은 자동적으로 사원요청승인처리됨 -->
										  		<input id="emCheck1" name="emCheck" type="hidden" value="1" class="form-control">
										  		<input id="emDelRequest1" name="emDelRequest" type="hidden" value="0" class="form-control">
										  	</div>
											<button id="addEmployeeMngSubmit" type="submit" class="btn btn-info">사원등록</button>
										</form>
								      </div>
						      	</c:when>
						      	<c:otherwise>
						      		<div class="modal-body">
								        <form id="companyCheckForm2" action="/pineapple/addemployee.user" method="post">
											<!-- 최초기업개설자가 아닌 경우기업정보검색 후 사원등록하기 -->
											<!-- ajax통신을 활용해 기업명, 기업코드에 검색되어 조회한 데이터 출력해준다 -->
											<div id="comNameSearch" class="form-group">
											    <label class="control-label" for="comNameInput">기업검색</label>
											    <p id="explain"> (소속한 기업을 검색하여 입력해주시기 바랍니다)</p>
											    <input id="emcomName4" name="emComName" type="text" class="focus form-control" placeholder="Enter Company Name" readonly>
											    <a data-toggle="modal" href="#searchCompanyModal" class="btn btn-info btn-block">기업검색</a>
										  		<input id="emComCode2" name="emComCode" type="hidden" class="form-control">
										  		<span id="emcomnamech2"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
											</div>
											<br>
										    <div id="emUserIdEmail2" class="form-group has-success has-feedback">
												<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
												<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
												<input id="emUserId2" name="emUserId" type="text" class="form-control" value="${id}" varia-describedby="inputSuccess2Status">
												<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
												<span id="inputSuccess2Status" class="sr-only">(success)</span>
											</div>
											<br>
											<div class="form-group">
											    <label for="emRankCodeInput2">직급선택</label>
											    <p id="explain">(경영진과 일반사원 중 하나를 선택해주시기 바랍니다)</p>
											      경영진<input id="emRankCodeMng2" name="emRankCode" type="radio" value="1" checked>&nbsp&nbsp&nbsp
											      일반사원<input id="emRankCodeEmp2" name="emRankCode" type="radio" value="2">
											    <span id="emrankch2"></span>
										  	</div>
										  	<br>
											<div class="form-group">
											    <label for="employeeDepInput2">부서선택</label>
											    <p id="explain">(기업내의 소속 부서를 입력해주시기 바랍니다)</p>
											    <input id="emDepartment2" name="emDepartment" type="text" class="form-control">
										  	</div>
											<div>
										  		<input id="emCheck2" name="emCheck" type="hidden" value="0" class="form-control">
										  		<input id="emDelRequest2" name="emDelRequest" type="hidden" value="0" class="form-control">
										  	</div>
										  	<br>
											<button id="addEmployeeMngSubmit" type="submit" class="btn btn-info">사원등록</button>
										</form>
								      </div>
						      	</c:otherwise>
						      </c:choose>
						      <div class="modal-footer">
						        <button id="employeeCancelBtn" type="button" class="btn btn-success btn-block" data-dismiss="modal">닫기</button>
			      	 		  </div>
					    	</div>
						  </div>
						</div>
						</c:forEach>
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
											    	<!-- 
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
													     -->
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
				<!-- 두번째탭 두번째row 시작-->
				<!-- 기업등록요청하기 입력폼; 기업을 등록하는 경영진과 등록하지 않는 경영진 여부에 따라 페이지 구분 기능 구현 -->
				<div class="row">
					<div class="col-xs-2">
						<br>
						<p>기업등록요청하기</p>
					</div>
					<div class="col-xs-10">
						<br>
						<p id="explanation">기존에 존재하지 않는 새로운 기업을 등록할 수 있습니다. 새로운 기업을 최초로 등록하면 [일반사원] 직급에서 개설한 기업 소속 [경영진] 직급으로 변경됩니다.</p>
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
								    <input type="text" id="comLogoServerName" name="comLogoServerName">
								     <p class="help-block">기업로고 이미지 파일업로드</p>
								    <input type="number" id="comLogoHeight" name="comLogoHeight" hidden>
								    <input type="number" id="comLogoWidth" name="comLogoWidth" hidden>
								    <input type="number" id="comLogoSize" name="comLogoSize" hidden>
								    <input type="text" id="comLogoExtension" name="comLogoExtension" hidden>
								</div>
								<br>
								<div id="comnameCheck" class="form-group">
								    <label class="control-label" for="comNameInput">*기업이름</label>
								    <p id="explain"> (정확한 기업이름을 입력해주시기 바랍니다. 이미 등록된 기업이 존재하는 경우 기업을 등록할 수 없습니다.)</p>
								    <input id="comName3" name="comNameInput" type="text" class="form-control" placeholder="Enter Company Name" required>
							  		<span id="comnamech3"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
							  	</div>
							  	<div id="comNameSuccess2" class="form-group has-success has-feedback" hidden="hidden">
									<label class="control-label" for="inputSuccess2">사용가능한 기업명</label>
									<input id="comName4" type="text" class="form-control" name="comName" varia-describedby="inputSuccess2Status" readonly>
									<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="inputSuccess2Status" class="sr-only">(success)</span>
								</div>
								<br>
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
								    <input type="submit" class="button_insert signupbtn" value="기업등록">
							   	</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 세번째탭 시작 -->
			<div role="tabpanel" class="tab-pane fade" id="insertEmployee" aria-labelledby="insertEmployee-tab">
				<!-- 기업회원일 경우 마이페이지 로딩시, 항상 사원정보를 조회하여 객체 데이터를 담아 전송한다 -->
				<div class="row">
					<div class="col-xs-2">
						<p>사원등록요청하기</p>
					</div>
					<div class="col-xs-10">
						<c:choose>
							<c:when test="${not empty employee}">
							<br>
							<a href="#addEmployee" class="btn btn-info btn-block" data-toggle="modal" >사원등록하기</a>
							<p id="explain">소속한 모든 기업을 검색하여 사원으로 등록해주시기 바랍니다</p>
								사원정보보기(승인여부체크가능), 사원요청계속 할 수 있음, 회사개설가능
							</c:when>
							<c:otherwise>
								사원등록요청, 회사개설가능
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<!-- 네번째탭 시작 -->
			<div role="tabpanel" class="tab-pane fade" id="approveEmployee" aria-labelledby="approveEmployee-tab"> 
				<p>사원요청승인</p>
			</div>
			<!-- 다섯번째탭 시작 -->
			<div role="tabpanel" class="tab-pane fade" id="employeeList" aria-labelledby="employeeList-tab"> 
				<p>전체사원리스트</p> 
			</div>
			<!-- 여섯번째탭 시작 -->
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