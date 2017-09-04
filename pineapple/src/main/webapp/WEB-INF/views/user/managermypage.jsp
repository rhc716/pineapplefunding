<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경영진 MyPage</title>
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
		//동적쿼리 사용전 방법(비교용으로 코드 유지중)
		//사원요청 승인탭을 클릭하면 사원요청목록 데이터를 각 기업별로 이미 로딩된 상태로 갖고 있게 됨 
		/*
	    $('#approveEmployee-tab').click(function(){
   	    	var collapseIds = $.each($('.comCollapseBtn'), function(index, items) {
 			    var collapseIds = $(items).attr('id', index);
   			    //console.log(collapseIds);
   			    var in_emComName = $(collapseIds).attr('value');
   	    		console.log(in_emComName);
   	    		//각 기업별 버튼 클릭시 사원요청목록 불러오는 ajax 실행
		        var emRequestListByComNameAjax = $.ajax({ // ajax실행부분
			        type: "get",
			        url : "/pineapple/getemrequestlist.user",
			        data : {comName : in_emComName},
			        success : function success(emlistres){
			        	//기업별 collapse 부분에 기업에 속한 사원요청목록을 각 테이블의 tbody 부분(id를 각각 지정)에 개별적으로 한번에 출력함.
			        	var tbodyId =  "#employeelistimport"+index;
			        	//console.log(tbodyId);
		        		$(tbodyId).html(emlistres);
			        },
			        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
			        error : function error(){
		        		alert('사원등록요청 사원리스트 불러오기 오류');
		        	}
				});
   			    
   			});
   	    	
	   	   
	     });
		*/
		
	$(document).ready(function(){
		$('#newAccountSubmitBtn').click(function(){
			$('#newaccountform').submit();
		});
		$('#newAccountCancelBtn').click(function(){
			location.href = '/pineapple/mypage.user';
		});
		//계좌정보수정하기 - 여러개의 계좌별로 수정하는 모달 내용 변화 기능 구현
		$('.changeaccount').click(function(){
			var in_accountCode = $(this).attr('value');
			var changeAccountAjax = $.ajax({ // ajax실행부분
								        type: "get",
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
		//기업정보수정하기 - 여러개의 개설한 기업정보별로 수정하는 모달 내용 변화 기능 구현
		$('.changecompanyinfo').click(function(){
			var in_companyCode = $(this).attr('value');
			var changeCompanyAjax = $.ajax({ // ajax실행부분
								        type: "get",
								        url : "/pineapple/companychangepage.user",
								        data : {comCode : in_companyCode},
								        success : function success(){
								        	alert('수정할 기업코드 : '+ in_companyCode);
								        },
								        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
								        error : function error(){
							        		alert('기업정보 불러오기 오류');
							        	}
									});
			//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
			changeCompanyAjax.done(function(cc){
				$('#comAdminApprovalChange').val(cc.comAdminApproval);
				if(cc.comAdminApproval == 1){
					$('#comApprovalNotPart').hide();
					$('#comApprovalDonePart').show();
					$('#comApprovalDone').val('기업승인완료');
				} else {
					$('#comApprovalDonePart').hide();
					$('#comApprovalNotPart').show();
					$('#comApprovalNot').val('기업승인대기중');
				}
				$('#comCodeChange').val(cc.comCode);
	    		$('#comOpenUserIdChange').val(cc.comOpenUserId);
	    		$('#comLogoServerNameChange').val(cc.comLogoServerName);
	    		$('#comLogoHeightChange').val(cc.comLogoHeight);
	    		$('#comLogoWidthChange').val(cc.comLogoWidth);
	    		$('#comLogoSizeChange').val(cc.comLogoSize);
	    		$('#comLogoExtensionChange').val(cc.comLogoExtension);
	    		$('#comNameChange').val(cc.comName);
				$('#comNumberChange').val(cc.comNumber);
	    		$('#comHomePageChange').val(cc.comHomePage);
	    		$('#comCeoNameChange').val(cc.comCeoName);
	    		$('#comEstablishYearChange').val(cc.comEstablishYear);
	    		$('#comInfoChange').val(cc.comInfo);
	    		$('#comSummaryChange').val(cc.comSummary);
	    		$('#comActivitySummaryChange').val(cc.comActivitySummary);
			});
			
		});
		//기업삭제요청하기 - 여러개의 개설한 기업정보별로 삭제요청하는 모달 내용 변화 기능 구현
		$('.deletecompanyinfo').click(function(){
			var in_companyCode = $(this).attr('value');
			var deleteCompanyAjax = $.ajax({ // ajax실행부분
								        type: "get",
								        url : "/pineapple/companydeletepage.user",
								        data : {comCode : in_companyCode},
								        success : function success(){
								        	alert('삭제할 기업코드 : '+ in_companyCode);
								        },
								        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
								        error : function error(){
							        		alert('기업정보 불러오기 오류');
							        	}
									});
			//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
			deleteCompanyAjax.done(function(dc){
				$('#comAdminApprovalDel').val(dc.comAdminApproval);
				$('#comCodeDel').val(dc.comCode);
	    		$('#comOpenUserIdDel').val(dc.comOpenUserId);
	    		$('#comLogoServerNameDel').val(dc.comLogoServerName);
	    		$('#comLogoHeightDel').val(dc.comLogoHeight);
	    		$('#comLogoWidthDel').val(dc.comLogoWidth);
	    		$('#comLogoSizeDel').val(dc.comLogoSize);
	    		$('#comLogoExtensionDel').val(dc.comLogoExtension);
	    		$('#comNameDel').val(dc.comName);
				$('#comNumberDel').val(dc.comNumber);
	    		$('#comHomePageDel').val(dc.comHomePage);
	    		$('#comCeoNameDel').val(dc.comCeoName);
	    		$('#comEstablishYearDel').val(dc.comEstablishYear);
	    		$('#comInfoDel').val(dc.comInfo);
	    		$('#comSummaryDel').val(dc.comSummary);
	    		$('#comActivitySummaryDel').val(dc.comActivitySummary);
			});
			
		});
		//사원정보수정하기 - 여러개의 사원정보별로 수정하는 모달 내용 변화 기능 구현
		$('.changeemployeeinfo').click(function(){
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
				$('#emCodeChange').val(ec.emCode);
				$('#emComCodeChange').val(ec.emComCode);
	    		$('#emComNameChange').val(ec.emComName);
	    		$('#emUserIdChange').val(ec.emUserId);
	    		$('#emRankCodeChange').val(ec.emRankCode);
	    		$('#emDepartmentChange').val(ec.emDepartment);
	    		$('#emDelRequestChange').val(ec.emDelRequest);
	    		if(ec.emDelRequest == 1){
	    			$('#emDeleteNotPart').hide();
					$('#emDeleteDonePart').show();
					$('#emDeleteDone').val('사원삭제요청완료');
	    		} else {
	    			$('#emDeleteDonePart').hide();
					$('#emDeleteNotPart').show();
					$('#emdelbtnCanSee').hide();
					$('#emDeleteNot').val('사원삭제요청없음');
	    		};
			});
		});
		//사원탈퇴요청하기(탈퇴요청모달 확인 후 삭제요청 제출)
		$('.deleteemployeeinfo').click(function(){
			var in_employeeCode = $(this).attr('value');
			var deleteEmployeeAjax = $.ajax({ // ajax실행부분
								        type: "get",
								        url : "/pineapple/deleterequestemployeepage.user",
								        data : {emCode : in_employeeCode},
								        success : function success(){
								        	alert('삭제할 사원코드 : '+ in_employeeCode);
								        },
								        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
								        error : function error(){
							        		alert('사원정보 불러오기 오류');
							        	}
									});
			//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
			deleteEmployeeAjax.done(function(de){
				$('#emCodeDel').val(de.emCode);
				$('#emComCodeDel').val(de.emComCode);
	    		$('#emComNameDel').val(de.emComName);
	    		$('#emUserIdDel').val(de.emUserId);
	    		$('#emRankCodeDel').val(de.emRankCode);
	    		$('#emDepartmentDel').val(de.emDepartment);
	    		$('#emCheckDel').val(de.emCheck);
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
	});
	$(document).ready(function(){
	//기업정보확인모달과 사원등록모달 교체 기능 구현
		$('#addEmployeeMngBtn').click(function(){
			$('#getCompanyOpenInfo').modal("hide");
		});
		$('#employeeCancelBtn').click(function(){
			location.href = '/pineapple/mypage.user';
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
<!-- 경영진마이페이지 Tab bar -->
	<div class="container"> 
		<ul id="myTab" class="nav nav-tabs" role="tablist"> 
			<li role="presentation" class="active">
				<a data-target="#managerinfo" id="managerinfo-tab" role="tab" data-toggle="tab" aria-controls="managerinfo" aria-expanded="true">내정보</a>
			</li> 
			<li role="presentation" class="">
				<a data-target="#insertCompany" role="tab" id="insertCompany-tab" data-toggle="tab" aria-controls="insertCompany" aria-expanded="false">기업등록/삭제요청</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#insertEmployee" role="tab" id="#insertEmployee-tab" data-toggle="tab" aria-controls="#insertEmployee" aria-expanded="false">사원등록/탈퇴요청</a>
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
					        <form action="/pineapple/changeaccount.user" method="post">
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
							        <button type="submit" class="btn btn-info">수정하기</button>
							        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
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
						<br>
						<p>기업등록정보확인</p>
					</div>
					<div class="col-xs-10">
						<!-- 기업을 등록한 경영진은 자신이 등록한 기업정보와 관리자에 의한 기업승인여부를 확인할 수 있다(사원정보입력) -->
						<!-- 기업을 등록지않은 경영진은 기존의 기업들 중 자신이 소속된 기업을 검색하여 사원정보를 입력한다 -->
					<br>
					<c:forEach var="companyOpenedByMyId" items="${companyOpen}">
						<a class="btn btn-info btn-block changecompanyinfo" data-toggle="modal" value="${companyOpenedByMyId.comCode}" href="#getCompanyOpenInfo">${companyOpenedByMyId.comName} 정보확인</a>
						<p id="explain">본인의 아이디로 개설한 모든 기업정보를 확인할 수 있습니다</p>
						<!-- 개설한 기업의 승인여부 및 세부사항 확인 을 위한 모달 내부 구현 -->
						<div class="modal fade" id="getCompanyOpenInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">${nickname}님의 기업등록정보</h4>
						      </div>
						      <div class="modal-body">
						      <!-- 회사정보확인 및 수정 모달 -->
						        <form action="/pineapple/changecompanyinfo.user" method="post">
						        	<div class="container_insert">
										<div id="comApprovalDonePart" class="form-group has-success has-feedback" hidden>
										    <label class="control-label" for="inputSuccess4">기업승인여부</label>
										    <input type="text" class="form-control" id="comApprovalDone" name="comAdminApproved" aria-describedby="inputSuccess4Status" readonly>
										    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
										    <span id="comApprovedStatus" class="sr-only">(success)</span>
										</div>
										<div id="comApprovalNotPart" class="form-group has-error has-feedback" hidden>
										    <label class="control-label" for="inputError2">기업승인여부</label>
										    <input type="text" class="form-control" id="comApprovalNot" name="comAdminNotApproved"aria-describedby="inputError2Status" readonly>
										    <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
										    <span id="inputError2Status" class="sr-only">(error)</span>
										</div>
										<br>
										<div>
											<input id="comAdminApprovalChange" type="hidden" class="form-control" name="comAdminApproval">
									    	<input id="comCodeChange" type="hidden" class="form-control" name="comCode">
									    </div>
									    <div id="comOpenEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">기업등록요청아이디</label>
											<input id="comOpenUserIdChange" name="comOpenUserId" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
										</div>
										<br>
										<div>
									    	<label for="comLogoFileInput">기업로고업로드</label>
										    <input id="comLogoServerNameChange" type="text" name="comLogoServerName">
										     <p class="help-block">기업로고 이미지 파일업로드</p>
										    <input id="comLogoHeightChange" name="comLogoHeight" type="hidden">
										    <input id="comLogoWidthChange" name="comLogoWidth" type="hidden">
										    <input id="comLogoSizeChange" name="comLogoSize" type="hidden">
										    <input id="comLogoExtensionChange" name="comLogoExtension" type="hidden">
										</div>
										<br>
										<div id="comnameChModal" class="form-group">
										    <label class="control-label" for="comNameInput">*기업이름</label>
										    <p id="explain"> (정확한 기업이름을 입력해주시기 바랍니다. 이미 등록된 기업이 존재하는 경우 기업을 등록할 수 없습니다.)</p>
										    <input id="comNameChange" name="comName" type="text" class="form-control" placeholder="Enter Company Name">
									  		<span id="comnamech"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
										<br>
									  	</div>
									  	<div class="form-group">
										    <label for="exampleInputPassword1">*사업자번호</label>
										    <p id="explain">(-없이 사업자번호 10자리를 정확히 입력해주시기 바랍니다)</p>
										    <input id="comNumberChange" name="comNumber" type="text" class="form-control" maxlength="10" placeholder="Enter Company Number">
										    <span id="pwch"></span>
									  	</div>
									  	<br>
									  	<div>
									  		<label for="comHomePageInput">기업웹사이트주소</label>
										    <input id="comHomePageChange" name="comHomePage" type="text" class="form-control" placeholder="Enter Company Web Site Address">
										</div>
										<br>
										<div>
									    	<label for="comCeoNameInput">기업대표이름</label>
										    <p id="explain">(현재 기업 대표의 실명을 입력해주시기 바랍니다)</p>
										    <input id="comCeoNameChange" name="comCeoName" type="text" class="form-control" placeholder="Enter Company CEO Name">
										</div>
										<br>
										<div>
									    	<label for="comEstablishYearInupt">기업설립연도</label>
										    <p id="explain">(기업의 설립연도를 입력해주시기 바랍니다)</p>
										    <input id="comEstablishYearChange" name="comEstablishYear" type="text" class="form-control" maxlength="4" placeholder="Enter Company Establish Year">
										</div>
										<br>
										<div>
									    	<label for="comInfoInupt">기업정보</label>
										    <p id="explain">(기업에 대한 전반적인 정보를 입력해주시기 바랍니다)</p>
										    <textarea id="comInfoChange" name="comInfo" class="form-control" rows="4">${companyOpenedByMyId.comInfo}</textarea>
										</div>
										<br>
										<div>
									    	<label for="comSummaryInupt">기업간략소개</label>
										    <p id="explain">(기업에 대한 소개글을 입력해주시기 바랍니다)</p>
										    <textarea id="comSummaryChange" name="comSummary" class="form-control" rows="4">${companyOpenedByMyId.comSummary}</textarea>
										</div>
										<br>
										<div>
									    	<label for="comActivitySummaryInupt">기업활동정보</label>
										    <p id="explain">(기업의 활동분야에 대한 정보를 입력해주시기 바랍니다)</p>
										    <textarea id="comActivitySummaryChange" name="comActivitySummary" class="form-control" rows="4">${companyOpenedByMyId.comActivitySummary}</textarea>
										</div>
										</div>
										<br>
										<div class="modal-footer">
											<button type="submit" class="btn btn-info">수정</button>
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
				<!-- 두번째탭 두번째row 시작(기업삭제요청버튼)-->
				<div class="row">
					<div class="col-xs-2">
						<br>
						<p>기업삭제요청</p>
					</div>
					<div class="col-xs-10">
					<br>
					<c:forEach var="companyOpenedByMyIdforDel" items="${companyOpen}">
						<a class="btn btn-danger btn-block deletecompanyinfo" data-toggle="modal" value="${companyOpenedByMyIdforDel.comCode}" href="#CompanyDelRequest">${companyOpenedByMyIdforDel.comName} 삭제요청</a>
						<p id="explain">본인의 아이디로 개설한 모든 기업에 대해 삭제요청 할 수 있습니다</p>
						<!-- 개설한 기업의 승인여부 및 세부사항 확인 을 위한 모달 내부 구현 -->
						<div class="modal fade" id="CompanyDelRequest" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">${nickname}님의 기업삭제요청</h4>
						      </div>
						      <div class="modal-body">
						      <!-- 회사정보확인 및 수정 모달 -->
						        <form action="/pineapple/deleterequestcompany.user" method="post">
						        	<div class="container_insert">
										<div>
											<input id="comAdminApprovalDel" type="hidden" class="form-control" name="comAdminApproval">
									    	<input id="comCodeDel" type="hidden" class="form-control" name="comCode">
									    	<input id="comDelRequestIdDel" type="hidden" class="form-control" name="comDelRequestId" value="${id}">
									    	<input id="comDelTimeDel" type="hidden" class="form-control" name="comDelTime">
									    </div>
									    <div id="comOpenEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">기업등록요청아이디</label>
											<input id="comOpenUserIdDel" name="comOpenUserId" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
										</div>
										<br>
										<div>
									    	<label for="comLogoFileInput">기업로고업로드</label>
										    <input id="comLogoServerNameDel" type="text" name="comLogoServerName">
										     <p class="help-block">기업로고 이미지 파일업로드</p>
										    <input id="comLogoHeightDel" name="comLogoHeight" type="hidden">
										    <input id="comLogoWidthDel" name="comLogoWidth" type="hidden">
										    <input id="comLogoSizeDel" name="comLogoSize" type="hidden">
										    <input id="comLogoExtensionDel" name="comLogoExtension" type="hidden">
										</div>
										<br>
										<div id="comnameChModal" class="form-group">
										    <label class="control-label" for="comNameInput">*기업이름</label>
										    <p id="explain"> (정확한 기업이름을 입력해주시기 바랍니다. 이미 등록된 기업이 존재하는 경우 기업을 등록할 수 없습니다.)</p>
										    <input id="comNameDel" name="comName" type="text" class="form-control" placeholder="Enter Company Name">
									  		<span id="comnamech"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
										<br>
									  	</div>
									  	<div class="form-group">
										    <label for="exampleInputPassword1">*사업자번호</label>
										    <p id="explain">(-없이 사업자번호 10자리를 정확히 입력해주시기 바랍니다)</p>
										    <input id="comNumberDel" name="comNumber" type="text" class="form-control" maxlength="10" placeholder="Enter Company Number">
										    <span id="pwch"></span>
									  	</div>
									  	<br>
									  	<div>
									  		<label for="comHomePageInput">기업웹사이트주소</label>
										    <input id="comHomePageDel" name="comHomePage" type="text" class="form-control" placeholder="Enter Company Web Site Address">
										</div>
										<br>
										<div>
									    	<label for="comCeoNameInput">기업대표이름</label>
										    <p id="explain">(현재 기업 대표의 실명을 입력해주시기 바랍니다)</p>
										    <input id="comCeoNameDel" name="comCeoName" type="text" class="form-control" placeholder="Enter Company CEO Name">
										</div>
										<br>
										<div>
									    	<label for="comEstablishYearInupt">기업설립연도</label>
										    <p id="explain">(기업의 설립연도를 입력해주시기 바랍니다)</p>
										    <input id="comEstablishYearDel" name="comEstablishYear" type="text" class="form-control" maxlength="4" placeholder="Enter Company Establish Year">
										</div>
										<br>
										<div>
									    	<label for="comInfoInupt">기업정보</label>
										    <p id="explain">(기업에 대한 전반적인 정보를 입력해주시기 바랍니다)</p>
										    <textarea id="comInfoDel" name="comInfo" class="form-control" rows="4">${companyOpenedByMyId.comInfo}</textarea>
										</div>
										<br>
										<div>
									    	<label for="comSummaryInupt">기업간략소개</label>
										    <p id="explain">(기업에 대한 소개글을 입력해주시기 바랍니다)</p>
										    <textarea id="comSummaryDel" name="comSummary" class="form-control" rows="4">${companyOpenedByMyId.comSummary}</textarea>
										</div>
										<br>
										<div>
									    	<label for="comActivitySummaryInupt">기업활동정보</label>
										    <p id="explain">(기업의 활동분야에 대한 정보를 입력해주시기 바랍니다)</p>
										    <textarea id="comActivitySummaryDel" name="comActivitySummary" class="form-control" rows="4">${companyOpenedByMyId.comActivitySummary}</textarea>
										</div>
									</div>
									<br>
									<div class="modal-footer">
										<button type="submit" class="btn btn-info">삭제요청</button>
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
				<!-- 두번째탭 세번째row 시작-->
				<!-- 기업등록요청하기 입력폼; 기업을 등록하는 경영진과 등록하지 않는 경영진 여부에 따라 페이지 구분 기능 구현 -->
				<div class="row">
					<div class="col-xs-2">
						<br>
						<p>기업등록요청하기</p>
					</div>
					<div class="col-xs-10">
						<br>
						<p id="explanation">기존에 존재하지 않는 새로운 기업을 등록할 수 있습니다. 새로운 기업을 최초로 등록하면 사원등록시 개설한 기업 소속 [경영진] 직급 [최초개설자]로 사원등록신청을 해주시면 됩니다.</p>
						<form action="/pineapple/addnewcompany.user" name="company" method="post">
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
							<div>
								<input name="comAdminApproval" type="hidden" class="form-control" value="0">
							</div>
							<br>
							<div class="clearfix">
							    <button type="reset" class="button_insert cancelbtn">초기화</button>
							    <button type="submit" class="button_insert signupbtn">기업등록</button>
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
						<br>
						<p>사원등록정보확인</p>
					</div>
					<div class="col-xs-10">
						<br>
						<!-- 사원 등록 정보 확인 버튼 및 사원등록 정보확인 모달 -->
						<c:forEach var="employeeOneId" items="${employeeOneId}">
							<a href="#getEmployee" class="btn btn-info btn-block changeemployeeinfo" data-toggle="modal" value="${employeeOneId.emCode}">${employeeOneId.emComName}사원등록정보확인</a>
							<p id="explain">${employeeOneId.emComName}에 등록한 사원정보를 확인하고, 정보를 수정할 수 있습니다</p>
							<!-- 사원등록 정보 확인 모달창 -->
							<div class="modal fade" id="getEmployee" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">${nickname}님의 사원정보확인</h4>
							      </div>
							      <!-- 기업을 최초로 개설신청한 경영진은 사원등록시 기업검색없이 기업명 데이터를 입력시켜준다 -->
					      		  <div class="modal-body">
							        <form action="/pineapple/changeemployeeinfo.user" method="post">
							        	<input id="emCodeChange" name="emCode" type="hidden" class="form-control">
							        	<input id="emComCodeChange" name="emComCode" type="hidden" class="form-control">
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
										    <input id="emComNameChange" name="emComName" type="text" class="focus form-control" readonly>
										    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
										    <span id="comApprovedStatus" class="sr-only">(success)</span>
									    </div>
										<br>
									    <div id="emUserIdEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
											<input id="emUserIdChange" name="emUserId" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
											<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
										</div>
										<br>
										<div class="form-group">
										    <label for="emRankCodeInput">직급선택</label>
										    <p id="explain">(경영진과 일반사원 중 하나를 선택해주시기 바랍니다)</p>
									        ${rank}  <input id="emRankCodeChange" name="emRankCode" type="radio" checked>
										    <span id="emrankch1"></span>
									  	</div>
									  	<br>
									  	<div class="form-group">
										    <label for="employeeDepInput1">부서선택</label>
										    <p id="explain">(기업내의 소속 부서를 입력해주시기 바랍니다)</p>
										    <input id="emDepartmentChange" name="emDepartment" type="text" class="form-control">
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
										    		<p>일반 경영진 입니다</p>
										    	</c:otherwise>
										    </c:choose>
										    <input id="emCheckChange" name="emCheck" type="hidden">
										    <span id="emrankch1"></span>
									  	</div>
									  	<div>
									  		<input id="emDelRequestChange" name="emDelRequest" type="hidden" class="form-control" >
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
				<!-- 세번째탭 두번째 row; 사원삭제요청 버튼-->
				<div class="row">
					<div class="col-xs-2">
						<br>
						<p>사원삭제요청</p>
					</div>
					<div class="col-xs-10">
						<br>
						<c:forEach var="employeeOneIdforDel" items="${employeeOneId}" varStatus="index">
							<a href="#deleteEmployee" class="btn btn-danger btn-block deleteemployeeinfo" data-toggle="modal" value="${employeeOneIdforDel.emCode}">${employeeOneIdforDel.emComName} 사원탈퇴요청</a>
							<p id="explain">${employeeOneIdforDel.emComName}에서 사원탈퇴 요청을 할 수 있습니다. 경영진이 사원탈퇴요청을 승인할 경우 사원에서 탈퇴하게 됩니다.</p>
							<!-- 사원등록 정보 확인 모달창 -->
							<div class="modal fade" id="deleteEmployee" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">${nickname}님의 사원탈퇴요청</h4>
							      </div>
					      		  <div class="modal-body">
							        <form action="/pineapple/deleterequestemployee.user" method="post">
							        	<input id="emCodeDel" name="emCode" type="hidden" class="form-control">
							        	<input id="emComCodeDel" name="emComCode" type="hidden" class="form-control">
										<div class="form-group has-success has-feedback">
										    <label class="control-label" for="inputSuccess4">소속기업명</label>
										    <input id="emComNameDel" name="emComName" type="text" class="focus form-control" readonly>
										    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
										    <span id="comApprovedStatus" class="sr-only">(success)</span>
									    </div>
										<br>
									    <div id="emUserIdEmail" class="form-group has-success has-feedback">
											<label class="control-label" for="inputSuccess2">사원탈퇴요청아이디</label>
											<input id="emUserIdDel" name="emUserId" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
											<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
											<span id="inputSuccess2Status" class="sr-only">(success)</span>
											<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
										</div>
										<br>
										<div class="form-group">
										    <label for="emRankCodeInput">직급선택</label>
										    <p id="explain">(경영진과 일반사원 중 하나를 선택해주시기 바랍니다)</p>
									        ${rank}  <input id="emRankCodeDel" name="emRankCode" type="radio" checked>
										    <span id="emrankch1"></span>
									  	</div>
									  	<br>
									  	<div class="form-group">
										    <label for="employeeDepInput1">부서선택</label>
										    <p id="explain">(기업내의 소속 부서를 입력해주시기 바랍니다)</p>
										    <input id="emDepartmentDel" name="emDepartment" type="text" class="form-control">
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
										    		<p>일반 경영진 입니다</p>
										    	</c:otherwise>
										    </c:choose>
										    <input id="emCheckDel" name="emCheck" type="hidden">
										    <span id="emrankch1"></span>
									  	</div>
									  	<div>
									  		<input id="emDelRequestDel" name="emDelRequest" type="hidden" value="1" class="form-control">
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
				<!-- 세번째탭 세번째 row; 사원등록요청 양식 -->
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
				        <form action="/pineapple/addemployee.user" name="employee" method="post">
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
			<!-- 네번째탭 시작(사원리스트 - 전체사원리스트, 승인요청사원조회, 삭제요청사원조회, 회사별조회,   -->
			<div role="tabpanel" class="tab-pane fade" id="employeeList" aria-labelledby="employeeList-tab">
				<div class="row">
					<div class="col-md-2">
						<br>
						<p>사원목록</p>
					</div>
					<div class="col-md-10">
						<br>
						<p id="explanation">자신이 경영진으로 속한 기업의 전체사원리스트를 확인할 수 있습니다. 전체사원조회, 기업별, 등록요청사원별, 삭제요청사원별 조회를 할 수 있습니다.</p>
						<br>
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr class="info">
									<td>번호</td>
									<td>사원코드</td>
									<td>사원아이디</td>
									<td>소속기업</td>
									<td>사원직급</td>
									<td>소속부서</td>
									<td>등록승인</td>
									<td>탈퇴승인</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="AllEmployee" items="${AllEmployeeListInMyCom}" varStatus="numberofemployee">
									<tr>
										<td>${numberofemployee.count}</td>
										<td>${AllEmployee.emCode}</td>
										<td>${AllEmployee.emUserId}</td>
										<td>${AllEmployee.emComName}</td>
										<td>${AllEmployee.emRankCode}</td>
										<td>${AllEmployee.emDepartment}</td>
										<td>
											<c:choose>
												<c:when test="${AllEmployee.emCheck == 0}">
													<a class="btn btn-success btn-block approveEmployeeBtn" href="#approveEmployeePage${numberofemployee.count}" type="button" data-toggle="modal" value="${AllEmployee.emCode}">등록승인</a>
													<!-- 사원등록요청 승인처리를 위한 사원정보확인 모달 내부 구현 (승인까지 가능)-->
													<div class="modal fade" id="approveEmployeePage${numberofemployee.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header">
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													        <h4 class="modal-title" id="myModalLabel">${AllEmployee.emComName}사원등록요청 승인</h4>
													      </div>
													      <div class="modal-body">
													        <form action="/pineapple/approveemployee.user" method="post">
													        	<input id="emCodeCheck" name="emCode" value="${AllEmployee.emCode}" type="hidden" class="form-control">
													        	<input id="emComCodeCheck" name="emComCode" value="${AllEmployee.emComCode}" type="hidden" class="form-control">
																<div class="form-group has-success has-feedback">
																    <label class="control-label" for="inputSuccess4">소속기업명</label>
																    <input id="emComNameCheck" name="emComName" value="${AllEmployee.emComName}" type="text" class="focus form-control" readonly>
																    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																    <span id="comApprovedStatus" class="sr-only">(success)</span>
															    </div>
																<br>
															    <div id="emUserIdEmail" class="form-group has-success has-feedback">
																	<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
																	<input id="emUserIdCheck" name="emUserId" value="${AllEmployee.emUserId}" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
																	<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																	<span id="inputSuccess2Status" class="sr-only">(success)</span>
																	<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
																</div>
																<br>
																<div class="form-group">
																    <label for="emRankCodeInput">직급</label>
																    <p id="explain">(1:경영진/2:일반사원)</p>
															        <input id="emRankCodeCheck" name="emRankCode" value="${AllEmployee.emRankCode}" type="text" readonly>
																    <span id="emrankch1"></span>
															  	</div>
															  	<br>
															  	<div class="form-group">
																    <label for="employeeDepInput1">부서</label>
																    <p id="explain">(사원등록요청한 사원의 기업내의 소속 부서)</p>
																    <input id="emDepartmentCheck" name="emDepartment" value="${AllEmployee.emDepartment}" type="text" class="form-control" readonly>
															  	</div>
															  	<br>
															  	<div>
															  	 	<input id="emCheckCheck" name="emCheck" type="hidden" value="1">
															  		<input id="emDelRequestCheck" name="emDelRequest" value="${AllEmployee.emDelRequest}" type="hidden" value="0" class="form-control">
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
												</c:when>
												<c:otherwise>
													<a type="button" class="btn btn-warning btn-block disabled">승인완료</a>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${AllEmployee.emDelRequest == 1}">
													<a id="deleteEmployeeBtn" href="#deleteEmployeePage${numberofemployee.count}" type="button" class="btn btn-danger btn-block" data-toggle="modal" value="${AllEmployee.emCode}">탈퇴승인</a>
													<!-- 사원등록요청 승인처리를 위한 사원정보확인 모달 내부 구현 (승인까지 가능)-->
													<div class="modal fade" id="deleteEmployeePage${numberofemployee.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header">
													        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													        <h4 class="modal-title" id="myModalLabel">${AllEmployee.emComName}사원탈퇴요청승인</h4>
													      </div>
													      <div class="modal-body">
													        <form action="/pineapple/deleteemployee.user" method="post">
													        	<label>사원코드</label>
													        	<input name="emCode" value="${AllEmployee.emCode}" class="form-control">
													        	<input name="emComCode" value="${AllEmployee.emComCode}" type="hidden" class="form-control">
																<div class="form-group has-success has-feedback">
																    <label class="control-label" for="inputSuccess4">소속기업명</label>
																    <input name="emComName" value="${AllEmployee.emComName}" type="text" class="focus form-control" readonly>
																    <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																    <span id="comApprovedStatus" class="sr-only">(success)</span>
															    </div>
																<br>
															    <div id="emUserIdEmail" class="form-group has-success has-feedback">
																	<label class="control-label" for="inputSuccess2">사원등록요청아이디</label>
																	<input name="emUserId" value="${AllEmployee.emUserId}" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
																	<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																	<span id="inputSuccess2Status" class="sr-only">(success)</span>
																	<p id="explain">(사원으로 등록하려고 하는 분의 아이디입니다)</p>
																</div>
																<br>
																<div class="form-group">
																    <label for="emRankCodeInput">직급</label>
																    <p id="explain">(1:경영진/2:일반사원)</p>
															        <input name="emRankCode" value="${AllEmployee.emRankCode}" type="text" readonly>
																    <span id="emrankch1"></span>
															  	</div>
															  	<br>
															  	<div class="form-group">
																    <label for="employeeDepInput1">부서</label>
																    <p id="explain">(사원등록요청한 사원의 기업내의 소속 부서)</p>
																    <input name="emDepartment" value="${AllEmployee.emDepartment}" type="text" class="form-control" readonly>
															  	</div>
															  	<br>
															  	<div>
															  	 	<input name="emCheck" type="hidden" value="${AllEmployee.emCheck}" class="form-control">
															  		<input name="emDelRequest" type="hidden" value="${AllEmployee.emDelRequest}" class="form-control">
															  	</div>
															  	<div>
																	<button type="submit" class="btn btn-info">탈퇴승인</button>&nbsp
																	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
																</div>
													        </form>
													      </div>
													    </div>
													  </div>
													</div>				
												</c:when>
												<c:otherwise>
													<a type="button" class="btn btn-success btn-block disabled">요청없음</a>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				
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