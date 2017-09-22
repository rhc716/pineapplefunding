<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일반사원 MyPage</title>
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//보고서 tab ajax 요청
	var reporttab = $.ajax({ // ajax실행부분
        type: 'get',
        url : '/pineapple/investorreportlist.timeline',
        success : function success(msg){
        	$('#reportmessage').html(msg);
        },
        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
        error : function error(){
       	}
	});
	//메세지 tab ajax 요청
	var messagetab = $.ajax({ // ajax실행부분
        type: 'get',
        url : '/pineapple/investormessagelist.timeline',
        success : function success(msg){
        	$('#investormessage').html(msg);
        },
        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
        error : function error(){
       	}
	});
	//부트스트랩 새로고침할 때 페이지 유지
	$('#myTab a').click(function(e) {
	  e.preventDefault();
	  $(this).tab('show');
	});
	
	//hash value에 현재 선택된 탭을 저장한다
	$("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
	  var id = $(e.target).attr("href").substr(1);
	  window.location.hash = id;
	});
	
	// 페이지 로드할 때 : 현재 선택된 탭으로 전환
	var hash = window.location.hash;
	$('#myTab a[href="' + hash + '"]').tab('show');
	
	//기업등록시 기업명 존재여부 검사
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
			    async : false,
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
	//사원승인여부에 따라 양식 변화시키는 ajax요청 
	$('.isApproved').click(function(){
		var in_employeeCode = $(this).attr('value');
		var changeEmployeeAjax = $.ajax({ // ajax실행부분
							        type: "get",
							        url : "/pineapple/employeechangepage.user",
							        data : {emCode : in_employeeCode},
							        success : function success(){
							        	alert('수정할 사원코드 : '+ in_employeeCode);
							        },
							        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
							        error : function error(){
						        		alert('사원정보 불러오기 오류');
						        	}
								});
		//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
		changeEmployeeAjax.done(function(ec){
			$('#emCheckChange').val(ec.emCheck);
			if(ec.emCheck == 1){
				$('#emApprovalNotPart').hide();
				$('#emApprovalDonePart').show();
				$('#emApprovalDone').val('사원승인완료');
			} else {
				$('#emApprovalDonePart').hide();
				$('#emApprovalNotPart').show();
				$('#emApprovalNot').val('사원승인대기중');
			};
		});
	});
});
//소속기업검색
$(document).ready(function(){
	$('#mycomSearchBtn').click(function(){
		var in_comName = $("#comSearchModalBody").find('input[name="comName"]').val();
		var comSearchAjax = $.ajax({ // ajax실행부분
							    type: "get",
							    url : "/pineapple/searchcomname.user",
							    data : {comName : in_comName},
							    success : function(re){
							    	if(re.comName != null){
								    	$('#comNamech').css('color','#008000');
								    	$('#comNamech').text('기업명이 존재합니다. 기업선택을 해주시기 바랍니다.');
							    	} else {
							    		$('#comNamech').css('color','#FF0000');
								    	$('#comNamech').text('기업명이 존재하지 않습니다. 기업을 개설하거나 올바른 기업명을 검색해주시기 바랍니다.');
								    	$('#comNameSearch').val('');
							    	}
						    	},
							    //만약 해당 페이지에 값을 성공적으로 보냈다면 페이지를 rs 라는 매개변수로 받아 id = 'comnamech3' 구역에 rs를 출력하겠다. 
							    error : function error(){
							    	alert('기업명 검색 ajax 에러 발생');
							    }
		});
		comSearchAjax.done(function(cs){
			$('#comNameChooseBtn').click(function(){
				$('#emComCodeRes').val(cs.comCode);
				$('#emComNameRes').val(cs.comName);
			});
		});
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
	<div class="container"> 
		<!-- 일반사원마이페이지 Tab bar -->
		<ul id="myTab" class="nav nav-tabs" role="tablist"> 
			<li role="presentation" class="active">
				<a href="#employeeinfo" id="employeeinfo-tab" role="tab" data-toggle="tab" aria-controls="employeeinfo" aria-expanded="true">내정보</a>
			</li> 
			<li role="presentation" class="">
				<a href="#insertEmployee" role="tab" id="#insertEmployee-tab" data-toggle="tab" aria-controls="#insertEmployee" aria-expanded="false">사원등록/탈퇴요청</a>
			</li>
			<li role="presentation" class="">
				<a href="#insertCompany" role="tab" id="#insertCompany-tab" data-toggle="tab" aria-controls="#insertCompany" aria-expanded="false">기업등록요청</a>
			</li>
			<li role="presentation" class="">
				<a href="#message" role="tab" id="message-tab" data-toggle="tab" aria-controls="message" aria-expanded="false">메세지</a>
			</li>  
			<li role="presentation" class="">
				<a href="#report" role="tab" id="report-tab" data-toggle="tab" aria-controls="report" aria-expanded="false">보고서</a>
			</li>  
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="employeeinfo" aria-labelledby="employeeinfo-tab">
				<!-- 마이페이지 공통 모듈 -->
				<c:import url="./mypageall.jsp"/>
			</div>
			<!-- 두번째탭 - 사원등록 -->
			<div role="tabpanel" class="tab-pane fade" id="insertEmployee" aria-labelledby="insertEmployee-tab"> 
				<!-- 기업회원일 경우 마이페이지 로딩시, 항상 사원정보를 조회하여 객체 데이터를 담아 전송한다 -->
				<div class="row">
					<div class="col-xs-2">
						<br>
						<p>사원등록정보확인</p>
					</div>
					<div class="col-xs-10">
						<br>
						<!-- 사원 등록 정보 확인 버튼 및 사원등록 정보확인 모달 -->
						<c:forEach var="employeeOneId" items="${employeeOneId}" varStatus="emCount">
							<a href="#getEmployee${emCount.count}" class="btn btn-info btn-block isApproved" data-toggle="modal" value="${employeeOneId.emCode}">${employeeOneId.emComName}사원등록정보확인</a>
							<p id="explain">${employeeOneId.emComName}에 등록한 사원정보를 확인하고, 정보를 수정할 수 있습니다</p>
							<!-- 사원등록 정보 확인 모달창 -->
							<div class="modal fade" id="getEmployee${emCount.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">${nickname}님의 사원정보확인</h4>
							      </div>
							      <!-- 기업을 최초로 개설신청한 경영진은 사원등록시 기업검색없이 기업명 데이터를 입력시켜준다 -->
					      		  <div class="modal-body">
							        <form action="/pineapple/changeemployeeinfo.user#insertEmployee" method="post">
							        	<input name="emCode" type="hidden" class="form-control" value="${employeeOneId.emCode}">
							        	<input name="emComCode" type="hidden" class="form-control" value="${employeeOneId.emComCode}">
							        	<!-- 사원등록 승인여부에 따라 둘 중 하나의 부분만 화면에 나타난다 -->
										<div id="emApprovalDonePart" class="form-group has-success has-feedback" hidden>
										    <label class="control-label" for="inputSuccess4">사원승인여부</label>
										    <input type="text" class="form-control" id="emApprovalDone" name="emAdminApproved" aria-describedby="inputSuccess4Status" readonly>
										    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
										    <span id="comApprovedStatus" class="sr-only">(success)</span>
										</div>
										<div id="emApprovalNotPart" class="form-group has-error has-feedback" hidden>
										    <label class="control-label" for="inputError2">사원승인여부</label>
										    <input type="text" class="form-control" id="emApprovalNot" name="emNotApproved"aria-describedby="inputError2Status" readonly>
										    <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
										    <span id="inputError2Status" class="sr-only">(error)</span>
										</div>
										<br>
										<div class="form-group has-success has-feedback">
										    <label class="control-label" for="inputSuccess4">소속기업명</label>
										    <input name="emComName" type="text" class="focus form-control" value="${employeeOneId.emComName}" readonly>
										    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
										    <span id="comApprovedStatus" class="sr-only">(success)</span>
									    </div>
										<br>
									    <div id="emUserIdEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
											<input name="emUserId" type="text" class="form-control" value="${employeeOneId.emUserId}" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
											<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
										</div>
										<br>
										<div class="form-group">
										    <label for="emRankCodeInput">직급선택</label>
										    <p id="explain">(경영진 : 1, 일반사원 : 2)</p>
									        ${employeeOneId.emRankCode} <input name="emRankCode" type="radio" value="${employeeOneId.emRankCode}" checked>
										    <span id="emrankch1"></span>
									  	</div>
									  	<br>
									  	<div class="form-group">
										    <label for="employeeDepInput1">부서선택</label>
										    <p id="explain">(기업내의 소속 부서를 입력해주시기 바랍니다)</p>
										    <input name="emDepartment" type="text" class="form-control" value="${employeeOneId.emDepartment}">
									  	</div>
									  	<br>
									 	<!-- 기업을 최초로 등록한 경영진은 자동적으로 사원요청승인처리됨 -->
									  	<div class="form-group">
										    <label for="emRankCodeInput">기업개설자 여부</label>
										    <c:choose>
										    	<c:when test="${not empty companyOpen}">
										    		<p>기업 최초 개설자 입니다</p>
										    	</c:when>
										    	<c:otherwise>
										    		<p>일반 사원 입니다</p>
										    	</c:otherwise>
										    </c:choose>
										    <input name="emCheck" type="hidden" value="${employeeOneId.emCheck}">
										    <span id="emrankch1"></span>
									  	</div>
									  	<div>
									  		<input name="emDelRequest" type="hidden" class="form-control" value="${employeeOneId.emDelRequest}">
									  		<div id="emDeleteDonePart" class="form-group has-success has-feedback" hidden>
											    <label class="control-label" for="inputSuccess4">사원탈퇴요청여부</label>
											    <input type="text" class="form-control" id="emDeleteDone" name="emDeleteRequestDone aria-describedby="inputSuccess4Status" readonly>
											    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											    <span id="comApprovedStatus" class="sr-only">(success)</span>
											</div>
											<div id="emDeleteNotPart" class="form-group has-error has-feedback" hidden>
											    <label class="control-label" for="inputError2">사원탈퇴요청여부</label>
											    <input type="text" class="form-control" id="emDeleteNot" name="emDeleteRequestNot"aria-describedby="inputError2Status" readonly>
											    <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
											    <span id="inputError2Status" class="sr-only">(error)</span>
											</div>
											<br>
									  	</div>
									  	<div>
											<button type="submit" class="btn btn-info">수정</button>&nbsp
											<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
										</div>
									</form>
							     </div>
							   </div>
						     </div>
					      </div>
				    	</c:forEach>
					</div>
				</div>
				<!-- 두번째탭 두번째 row; 사원삭제요청 버튼-->
				<div class="row">
					<div class="col-xs-2">
						<br>
						<p>사원삭제요청</p>
					</div>
					<div class="col-xs-10">
						<br>
						<c:forEach var="employeeOneIdforDel" items="${employeeOneId}" varStatus="index">
						<c:choose>
				  			<c:when test="${employeeOneIdforDel.emDelRequest == 1 || not empty companyOpen}">
				  				<a href="#deleteEmployee${employeeOneIdforDel.emComName}" class="btn btn-danger btn-block disabled" data-toggle="modal">${employeeOneIdforDel.emComName} 사원탈퇴요청</a>
				  			</c:when>
				  			<c:otherwise>
				  				<a href="#deleteEmployee${employeeOneIdforDel.emComName}" class="btn btn-danger btn-block" data-toggle="modal">${employeeOneIdforDel.emComName} 사원탈퇴요청</a>
				  			</c:otherwise>
				  		</c:choose>
							<p id="explain">${employeeOneIdforDel.emComName}에서 사원탈퇴 요청을 할 수 있습니다. 경영진이 사원탈퇴요청을 승인할 경우 사원에서 탈퇴하게 됩니다.</p>
							<!-- 사원등록 정보 확인 모달창 -->
							<div class="modal fade" id="deleteEmployee${employeeOneIdforDel.emComName}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">[${nickname}]님의 [${employeeOneIdforDel.emComName}] 사원탈퇴요청</h4>
							      </div>
					      		  <div class="modal-body">
							        <form action="/pineapple/deleterequestemployee.user#insertEmployee" method="post">
							        	<input name="emCode" type="hidden" class="form-control" value="${employeeOneIdforDel.emCode}">
							        	<input name="emComCode" type="hidden" class="form-control" value="${employeeOneIdforDel.emComCode}">
										<div class="form-group has-success has-feedback">
										    <label class="control-label" for="inputSuccess4">소속기업명</label>
										    <input name="emComName" type="text" class="focus form-control" value="${employeeOneIdforDel.emComName}" readonly>
										    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
										    <span id="comApprovedStatus" class="sr-only">(success)</span>
									    </div>
										<br>
									    <div id="emUserIdEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">사원탈퇴요청아이디</label>
											<input name="emUserId" type="text" class="form-control" value="${employeeOneIdforDel.emUserId}" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
											<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
										</div>
										<br>
										<div class="form-group">
										    <label for="emRankCodeInput">직급선택</label>
										    <p id="explain">(경영진 : 1, 일반사원 : 2)</p>
									        ${employeeOneIdforDel.emRankCode} <input name="emRankCode" type="radio" value="${employeeOneIdforDel.emRankCode}" checked>
										    <span id="emrankch1"></span>
									  	</div>
									  	<br>
									  	<div class="form-group">
										    <label for="employeeDepInput1">부서선택</label>
										    <p id="explain">(기업내의 소속 부서를 입력해주시기 바랍니다)</p>
										    <input name="emDepartment" type="text" value="${employeeOneIdforDel.emDepartment}" class="form-control">
									  	</div>
									  	<br>
									 	<!-- 기업을 최초로 등록한 경영진은 자동적으로 사원요청승인처리됨 -->
									  	<div class="form-group">
										    <label for="emRankCodeInput">기업개설자 여부</label>
										    <c:choose>
										    	<c:when test="${not empty companyOpen}">
										    		<p>기업 최초 개설자 입니다</p>
										    	</c:when>
										    	<c:otherwise>
										    		<p>일반 사원 입니다</p>
										    	</c:otherwise>
										    </c:choose>
										    <input name="emCheck" value="${employeeOneIdforDel.emCheck}" type="hidden">
										    <span id="emrankch1"></span>
									  	</div>
									  	<div>
									  		<input name="emDelRequest" type="hidden" value="1" class="form-control">
									  	</div>
									  	<div>
									  		<button type="submit" class="btn btn-info">사원탈퇴요청</button>&nbsp
											<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
										</div>
									</form>
							     </div>
							   </div>
						     </div>
					      </div>
						</c:forEach>
					</div>
				</div>
				<br>
				<!-- 두번째탭 세번째 row; 사원등록요청 양식 -->
				<div class="row">
					<div class="col-xs-2">
						<br>
						<p>사원등록요청하기</p>
					</div>
					<div class="col-xs-10">
						<br>
						<!-- 사원등록 요청하기 입력폼 -->
				        <h4>${nickname}님의 사원등록요청</h4>
				        <p id="explanation">소속된 기업이 있다면 사원으로 등록 요청을 해주시기 바랍니다. 경영진이 사원승인을 할 경우 사원으로 등록 완료됩니다.</p>
				        <p id="explanation">기업을 최초로 개설한 경영진이 사원등록하는 경우, [최초개설자]를 선택하면 승인없이 사원등록이 완료됩니다.</p>
						<br>
				        <form action="/pineapple/addemployee.user#insertEmployee" name="employee" method="post">
							<div id="comNameSearch" class="form-group">
							    <label class="control-label" for="comNameInput">기업검색</label>
							    <p id="explain">(소속한 기업을 검색하여 입력해주시기 바랍니다)</p>
							    <input id="emComNameRes" name="emComName" type="text" class="focus form-control" placeholder="Enter Company Name" readonly>
							    <br>
							    <a data-toggle="modal" href="#searchCompanyModal" class="btn btn-warning btn-block">기업검색</a>
						  		<input id="emComCodeRes" name="emComCode" type="hidden" class="form-control">
							</div>
							<br>
						    <div id="emUserIdEmail" class="form-group has-success has-feedback">
								<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
								<input name="emUserId" type="text" class="form-control" value="${id}" varia-describedby="inputSuccess2Status" readonly>
								<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
								<span id="inputSuccess2Status" class="sr-only">(success)</span>
								<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
							</div>
							<br>
							<div class="form-group">
							    <label for="emRankCodeInput">직급선택</label>
							    <p id="explain">(경영진과 일반사원 중 하나를 선택해주시기 바랍니다)</p>
							      경영진<input name="emRankCode" value="1" type="radio" checked>&nbsp&nbsp&nbsp
							      일반사원<input name="emRankCode" value="2" type="radio">
							    <span id="emrankch1"></span>
						  	</div>
						  	<br>
						  	<div class="form-group">
							    <label for="employeeDepInput1">부서선택</label>
							    <p id="explain">(기업내의 소속 부서를 입력해주시기 바랍니다)</p>
							    <input name="emDepartment" type="text" class="form-control">
						  	</div>
						  	<br>
						  	<div>
						  	<!-- 기업을 최초로 등록한 경영진은 자동적으로 사원요청승인처리됨 -->
						  	<div class="form-group">
							    <label for="emRankCodeInput">기업개설자 여부선택</label>
							    <p id="explain">(기업을 최초로 개설요청한 경영진이라면 최초개설에 체크해주시기 바랍니다. 일반 경영진의 경우 일반경영진에 체크해주시기 바랍니다.)</p>
							      최초개설자<input name="emCheck" value="1" type="radio" checked>&nbsp&nbsp&nbsp
							      일반경영진<input name="emCheck" value="0" type="radio">
							      일반사원<input name="emCheck" value="0" type="radio">
							    <span id="emrankch1"></span>
						  	</div>
						  		<input name="emDelRequest" type="hidden" value="0" class="form-control">
						  	</div>
						  	<div class="clearfix">
							    <button type="reset" class="button_insert cancelbtn">초기화</button>
							    <button type="submit" class="button_insert signupbtn">사원등록</button>
						   	</div>
						</form>
						<!-- 소속기업 검색 모달 내부 구현 -->
						<div class="modal fade" id="searchCompanyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">${nickname}님의 소속기업검색</h4>
						      </div>
						      <div class="modal-body" id="comSearchModalBody">
					      		<form>
								  	<div>
									    <label for="companySearchList">회사검색</label>
									    <input id="comNameSearch" name="comName" type="text" class="form-control">
									    <br>
									    <button id="mycomSearchBtn" type="button" class="btn btn-warning btn-block">검색</button>
									    <span id="comNamech"></span>
								  	</div>
							  	</form>
								 <br>
							  	<div class="modal-footer">
							  		<button id="comNameChooseBtn" type="button" class="btn btn-primary btn-lg" data-dismiss="modal">기업선택</button>
							        <button type="button" class="btn btn-success btn-lg" data-dismiss="modal">닫기</button>
					      	  	</div>
						      </div>
					    	</div>
						  </div>
						</div>
				  </div>
				</div>
			</div>
			<!-- 세번째탭 - 기업등록 -->
			<div role="tabpanel" class="tab-pane fade" id="insertCompany" aria-labelledby="insertCompany-tab">
				<!-- 기업등록요청하기 입력폼; 기업을 등록하는 경영진과 등록하지 않는 경영진 여부에 따라 페이지 구분 기능 구현 -->
				<div class="row">
					<div class="col-xs-2">
						<br>
						<p>기업등록요청하기</p>
					</div>
					<div class="col-xs-10">
						<br>
						<p id="explanation">기존에 존재하지 않는 새로운 기업을 등록할 수 있습니다. 새로운 기업을 최초로 등록하면 다음에 로그인 할 때부터 [일반사원] 직급에서 개설한 기업 소속 [경영진] 직급으로 변경되며 경영진 마이페이지를 볼 수 있습니다.</p>
						<form action="/pineapple/addnewcompany.user#insertCompany" method="post">
							<div class="container_insert">
								<div>
									<input type="hidden" name="comAdminApproval" value="0">
								</div>
							    <div id="comOpenEmail" class="form-group has-success has-feedback">
									<label class="control-label" for="inputSuccess2">기업등록요청아이디</label>
									<input name="comOpenUserId" type="text" class="form-control" value="${id}" varia-describedby="inputSuccess2Status" readonly>
									<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="inputSuccess2Status" class="sr-only">(success)</span>
								</div>
								<br>
								<div>
							    	<label for="comLogoFileInput">기업로고업로드</label>
								    <input type="text" name="comLogoServerName">
								    <p class="help-block">기업로고 이미지 파일업로드</p>
								    <input type="hidden" name="comLogoHeight" value="0">
						    		<input type="hidden" name="comLogoWidth" value="0">
						   		 	<input type="hidden" name="comLogoSize" value="0">
						    		<input type="hidden" name="comLogoExtension" value="jpg">
								</div>
								<br>
								<div id="comnameCheck" class="form-group">
								    <label class="control-label" for="comNameInput">*기업이름</label>
								    <p id="explain">(정확한 기업이름을 입력해주시기 바랍니다. 이미 등록된 기업이 존재하는 경우 기업을 등록할 수 없습니다.)</p>
								    <input id="comName3" name="comNameInput" type="text" class="form-control" placeholder="Enter Company Name">
							  		<span id="comnamech3"></span>
							  	</div>
							  	<br>
							  	<div id="comNameSuccess2" class="form-group has-success has-feedback" hidden="hidden">
									<label class="control-label" for="inputSuccess2">사용가능한 기업명</label>
									<input id="comName4" name="comName" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
									<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="inputSuccess2Status" class="sr-only">(success)</span>
								</div>
								<br>
							  	<div class="form-group">
								    <label for="exampleInputPassword1">*사업자번호</label>
								    <p id="explain">(-없이 사업자번호 10자리를 정확히 입력해주시기 바랍니다)</p>
								    <input name="comNumber" type="text" class="form-control" maxlength="10" placeholder="Enter Company Number">
								    <span id="pwch"></span>
							  	</div>
							  	<br>
						  		<div>
						  			<label for="comHomePageInput">기업웹사이트주소</label>
								    <input name="comHomePage" type="text" class="form-control" placeholder="Enter Company Web Site Address">
								</div>
								<br>
								<div>
							    	<label for="comCeoNameInput">기업대표이름</label>
								    <p id="explain">(현재 기업 대표의 실명을 입력해주시기 바랍니다)</p>
								    <input name="comCeoName" type="text" class="form-control" placeholder="Enter Company CEO Name">
								</div>
								<br>
								<div>
							    	<label for="comEstablishYearInupt">기업설립연도</label>
								    <p id="explain">(기업의 설립연도를 입력해주시기 바랍니다)</p>
								    <input name="comEstablishYear" type="text" class="form-control" maxlength="4" placeholder="Enter Company Establish Year">
								</div>
								<br>
								<div>
							    	<label for="comInfoInupt">기업정보</label>
								    <p id="explain">(기업에 대한 전반적인 정보를 입력해주시기 바랍니다)</p>
								    <textarea name="comInfo" class="form-control" rows="4"></textarea>
								</div>
								<br>
								<div>
							    	<label for="comSummaryInupt">기업간략소개</label>
								    <p id="explain">(기업에 대한 소개글을 입력해주시기 바랍니다)</p>
								    <textarea name="comSummary" class="form-control" rows="4"></textarea>
								</div>
								<br>
								<div>
							    	<label for="comActivitySummaryInupt">기업활동정보</label>
								    <p id="explain">(기업의 활동분야에 대한 정보를 입력해주시기 바랍니다)</p>
								    <textarea name="comActivitySummary" class="form-control" rows="4"></textarea>
								</div>
								<br>
								<div>
									<input name="comAdminApproval" type="hidden" class="form-control" value="0">
								</div>
								<br>
								<div class="clearfix">
								    <input type="reset" class="button_insert cancelbtn" value="초기화">
								    <input type="submit" class="button_insert signupbtn" value="기업등록">
							   	</div>
							</div>
						</form>
					</div>
						
				</div>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="message" aria-labelledby="message-tab"> 
				<h1 style="text-align: center;">MY MESSAGE LIST</h1>
				<div class="col-xs-12" id="investormessage"></div> 
			</div>
			<div role="tabpanel" class="tab-pane fade" id="report" aria-labelledby="report-tab"> 
				<h1 style="text-align: center;">MY REPORT LIST</h1>
				<div class="col-xs-12" id="reportmessage"></div> 
			</div>
		</div> 
	</div>
<!-- 풋터 -->
<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>