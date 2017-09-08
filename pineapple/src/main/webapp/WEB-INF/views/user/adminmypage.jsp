<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 MyPage</title>
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
	
	//계좌수정버튼 클릭시 ajax 이벤트 실행
	$('.changeaccount').click(function(){
		var in_accountCode = $(this).attr('value');
		var changeAccountAjax = $.ajax({ // ajax실행부분
							        type: "get",
							        url : "/pineapple/accountchangepage.user",
							        data : {accountCode : in_accountCode},
							        success : function success(){
							        		alert('수정할 계좌코드 : '+in_accountCode);
							        },
							        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
							        error : function error(){
							        		alert('계좌정보 불러오기 오류');
						        	}
								});
		//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
		changeAccountAjax.done(function(ic){
			$('#accountCodeChange').val(ic.accountCode);
			$('#accountIdChange').val(ic.accountId);
			$('#secCompanyChange').val(ic.secCompany);
    		$('#accountNumberChange').val(ic.accountNumber);
    		$('#accountNicknameChange').val(ic.accountNickname);
		});
	});
	//기업정보확인하기 - 기업정보 확인 후 승인 또는 삭제
	$('.approveCompanyBtn').click(function(){
		var in_companyCode = $(this).attr('value');
		var changeCompanyAjax = $.ajax({ // ajax실행부분
							        type: "get",
							        url : "/pineapple/companychangepage.user",
							        data : {comCode : in_companyCode},
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
		});
	});
	//회원전체리스트에서 각 회원의 상세정보 확인 모달
	/**
	$('#userdetailBtn').click(function(){
		var in_userId = $(this).attr('value');
		var changeUserDetailAjax = $.ajax({ // ajax실행부분
							        type: "get",
							        url : "/pineapple/userdetailmodify.user",
							        data : {userId : in_userId},
							        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
							        error : function error(){
							        		alert('회원상세정보 불러오기 오류');
							        }
								});
		//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
		changeUserDetailAjax.done(function(ud){
			$('#userDetailIdChange').val(ud.userDetailId);
			$('#phoneFront3Change').val(ud.phoneFront3);
			$('#phoneRest8Change').val(ud.phoneRest8);
    		$('#postalCodeChange').val(ud.postalCode);
    		$('#addressChange').val(ud.address);
    		$('#address2Change').val(ud.address2);
		});
	});
	**/
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
<!-- 사이트관리자마이페이지 Tab bar -->
	<ul id="myTab" class="nav nav-tabs" role="tablist"> 
		<li role="presentation" class="active">
			<a href="#admininfo" id="admininfo-tab" role="tab" data-toggle="tab" aria-controls="admininfo" aria-expanded="true">내정보</a>
		</li>
		<li role="presentation" class="">
			<a href="#fundinginfo" role="tab" id="fundinginfo-tab" data-toggle="tab" aria-controls="fundinginfo" aria-expanded="false">펀딩현황조회</a>
		</li>
		<li role="presentation" class="">
			<a href="#allCompanyList" role="tab" id="allCompanyList-tab" data-toggle="tab" aria-controls="allCompanyList" aria-expanded="false">전체회사목록</a>
		</li>
		<li role="presentation" class="">
			<a href="#allUserList" role="tab" id="allUserList-tab" data-toggle="tab" aria-controls="allUserList" aria-expanded="false">전체회원목록</a>
		</li>
		<li role="presentation" class="">
			<a href="#message" role="tab" id="message-tab" data-toggle="tab" aria-controls="message" aria-expanded="false">메세지</a>
		</li>
	</ul>
	<!-- 첫번째 탭 시작(관리자 정보 보기) -->
	<div id="myTabContent" class="tab-content">
		<div role="tabpanel" class="tab-pane fade active in" id="admininfo" aria-labelledby="admininfo-tab">
			<!-- 마이페이지 공통 모듈 -->
			<c:import url="./mypageall.jsp"/>
			<br>
				<div class="row">
				<!-- 관리자 고유 영역 -->
				<div class="col-md-2">
					<p>계좌정보</p>
				</div>
				<div class="col-md-10">
				<br><br>
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
										<input type="hidden" name="accountCode" value="${useraccount.accountCode}">
										<button type="submit" class="btn btn-info btn-block">삭제</button>
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
				        <form action="/pineapple/addnewaccount.user" method="post">
				        	<div class="container_insert">
							    <div id="accountHolerIdinput" class="form-group has-success has-feedback">
									<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
									<input type="text" class="form-control" name="accountId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
									<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="inputSuccess2Status" class="sr-only">(success)</span>
								</div>
								<br>
							  	<div class="form-group">
								    <label for="secCompany">증권사</label>
								    <p id="explain">(계좌를 만든 증권사 이름을 정확히 입력해주세요)</p>
								    <p><input type="text" name="secCompany" class="form-control"></p>
							  	</div>
							  	<br>
							  	<div class="form-group">
							  		<label for="accountNumber">계좌번호</label>
								    <p id="explain">(계좌번호를 -없이 입력해주세요)</p>
								    <p><input type="text" name="accountNumber" class="form-control"></p>
							  	</div>
								<br>
								<div class="form-group">
							  		<label for="accountNickname">계좌번호 별명</label>
								    <p id="explain">(계좌번호의 별명을 등록해주세요. 필수사항이 아니므로 별명을 등록하지 않으셔도 됩니다.)</p>
								    <p><input type="text" name="accountNickname" class="form-control"></p>
							  	</div>
								<br>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						        <button type="submit" class="btn btn-info">추가하기</button>
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
				        <form action="/pineapple/changeaccount.user" method="post">
				        	<div class="container_insert">
				        		<input type="hidden" id="accountCodeChange" name="accountCode">
							    <div id="accountHolerIdinput" class="form-group has-success has-feedback">
									<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
									<input type="text" class="form-control" id="accountIdChange" name="accountId" varia-describedby="inputSuccess2Status" readonly>
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
						      	<div class="modal-footer">
						        	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						        	<button type="submit" class="btn btn-info">수정하기</button>
						      	</div>
						      </div>
				        </form>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
		<!-- 두번째 탭; 사이트에서 개설한 펀딩 현황(마일스톤, 예상WBS, 실제WBS) 조회 및 검색 -->
		<div role="tabpanel" class="tab-pane fade" id="fundinginfo" aria-labelledby="fundinginfo-tab">
			<div class="row">
				<div class="col-md-2">
					<br>
					<p>펀딩 대시보드</p>
					<br>
					<nav class="amazonmenu">
						<ul>
							<li><a href="/pineapple/adminmypage.user#fundinginfo">펀딩현황</a></li>
							<li><a href="/pineapple/milestonelist.user">마일스톤리스트</a></li>
							<li><a href="/pineapple/wbslist.user">WBS비교리스트</a></li>
							<li><a href="/pineapple/investorlist.user">투자자현황</a></li>
							<li><a href="/pineapple/dividendlist.user">배당지급현황</a></li>
						</ul>
					</nav> 
				</div>
				<div class="col-md-10">
					<br>
					<p id="explanation">파인애플펀딩 사이트에서 활동중인 펀딩의 전체목록을 조회, 검색 할 수 있습니다. 
										펀딩 진행중인 상황에 대한 대시보드로서 기능하며, 개별 펀딩에 포함된 프로젝트 관리 사항인 
										마일스톤 목록, 예상WBS 목록, 실제WBS 목록을 조회하고 비교할 수 있습니다.
					</p>
					<br>
					<!-- 조회 목록 출력될 부분 -->
					<div>
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr class="info">
									<td>번호</td>
									<td>펀딩코드</td>
									<td>회사</td>
									<td>펀딩</td>
									<td>형태</td>
									<td>상황</td>
									<td>최저이율</td>
									<td>개설ID</td>
									<td>등록요청일</td>
									<td>승인여부</td>
									<td>승인일</td>
									<td>승인ID</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="allfdList" items="${allfdList}" varStatus="numberoffdlist">
									<tr>
										<td>${numberoffdlist.count}</td>
										<td>${allfdList.fdCode}</td>
										<td>${allfdList.comName}</td>
										<td>${allfdList.fdTitle}</td>
										<td>${allfdList.fdType}</td>
										<td><a type="button" class="btn btn-block btn-success disabled">${allfdList.fdStatus}</a></td>
										<td>${allfdList.minInterestRate}</td>
										<td>${allfdList.fdPublisher}</td>
										<td>${allfdList.fdDate}</td>
										<c:choose>
											<c:when test="${allfdList.adminApproval == 0}">
												<td>
													<form action="/pineapple/approvefunding.user#fundinginfo" method="post">
														<input type="hidden" name="fdCode" value="${allfdList.fdCode}">
														<button type="submit" class="btn btn-block btn-primary">펀딩승인</button>
													</form>
												</td>
												<td>${allfdList.fdApprovalDate}</td>
												<td>${allfdList.fdApprovalId}</td>
											</c:when>
											<c:otherwise>
												<td><a type="button" class="btn btn-block btn-success disabled">승인완료</a></td>
												<td>${allfdList.fdApprovalDate}</td>
												<td>${allfdList.fdApprovalId}</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 세번째 탭(전체기업목록조회, 기업등록승인, 기업삭제승인) -->
		<div role="tabpanel" class="tab-pane fade" id="allCompanyList" aria-labelledby="allCompanyList-tab"> 
			<div class="row">
				<div class="col-md-2">
					<br>
					<p>전체기업조회</p>
				</div>
				<div class="col-md-10">
					<br>
					<p id="explanation">파인애플펀딩 사이트에 등록요청/등록승인된 기업의 전체기업리스트를 확인할 수 있습니다. 
										전체기업리스트 조회 후 바로 기업등록승인 또는 기업삭제승인 작업을 할 수 있습니다.</p>
					<br>
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr class="info">
								<td>번호</td>
								<td>기업코드</td>
								<td>기업명</td>
								<td>사업자번호</td>
								<td>기업대표명</td>
								<td>개설자아이디</td>
								<td>등록승인</td>
								<td>삭제승인</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="allcompany" items="${allcompany}" varStatus="numberofcompany">
								<tr>
									<td>${numberofcompany.count}</td>
									<td>${allcompany.comCode}</td>
									<td>${allcompany.comName}</td>
									<td>${allcompany.comNumber}</td>
									<td>${allcompany.comCeoName}</td>
									<td>${allcompany.comOpenUserId}</td>
									<td>
										<c:choose>
											<c:when test="${allcompany.comAdminApproval == 0}">
												<a class="btn btn-success btn-block approveCompanyBtn" href="#approveCompanyPage${numberofcompany.count}" type="button" data-toggle="modal" value="${allcompany.comCode}">등록승인</a>
												<!-- 기업등록요청 승인처리를 위한 기업정보확인 모달 내부 구현 (승인까지 가능)-->
												<div class="modal fade" id="approveCompanyPage${numberofcompany.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												        <h4 class="modal-title" id="myModalLabel">${nickname}님의 기업등록정보</h4>
												      </div>
												      <div class="modal-body">
												      <!-- 회사정보확인 및 수정 모달 -->
												        <form action="/pineapple/approvecompany.user#allCompanyList" method="post">
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
																	<input type="hidden" class="form-control" name="comAdminApproval" value="1">
															    	<input type="hidden" class="form-control" name="comCode" value="${allcompany.comCode}">
															    	<input type="hidden" class="form-control" name="comApprovalDate">
															    	<input type="hidden" class="form-control" name="comApprovalId" value="${id}">
															    </div>
															    <div id="comOpenEmail" class="form-group has-success has-feedback">
																	<label class="control-label" for="inputSuccess2">기업등록요청아이디</label>
																	<input name="comOpenUserId" value="${allcompany.comOpenUserId}" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
																	<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																	<span id="inputSuccess2Status" class="sr-only">(success)</span>
																</div>
																<br>
																<div id="comnameChModal" class="form-group">
																    <label class="control-label" for="comNameInput">*기업이름</label>
																    <input name="comName" value="${allcompany.comName}" type="text" class="form-control">
																<br>
															  	</div>
															  	<div class="form-group">
																    <label for="exampleInputPassword1">*사업자번호</label>
																    <input name="comNumber" value="${allcompany.comNumber}" type="text" class="form-control" maxlength="10">
															  	</div>
															  	<br>
															  	<div>
															  		<label for="comHomePageInput">기업웹사이트주소</label>
																    <input name="comHomePage" value="${allcompany.comHomePage}" type="text" class="form-control">
																</div>
																<br>
																<div>
															    	<label for="comCeoNameInput">기업대표이름</label>
																    <p id="explain">(현재 기업 대표의 실명을 입력해주시기 바랍니다)</p>
																    <input name="comCeoName" value="${allcompany.comHomePage}" type="text" class="form-control">
																</div>
																<br>
																<div>
															    	<label for="comInfoInupt">기업정보</label>
																    <p id="explain">(기업에 대한 전반적인 정보를 입력해주시기 바랍니다)</p>
																    <textarea name="comInfo" class="form-control" rows="4">${allcompany.comInfo}</textarea>
																</div>
																<br>
																<div class="modal-footer">
																	<button type="submit" class="btn btn-info">기업승인</button>
																	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
																</div>
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
											<c:when test="${allcompany.comDelRequestId != null and allcompany.comDelApprovalId == null}">
												<a href="#deleteCompanyPage${numberofcompany.count}" type="button" class="btn btn-danger btn-block" data-toggle="modal" value="${allcompany.comCode}">삭제승인</a>
												<!-- 사원등록요청 승인처리를 위한 사원정보확인 모달 내부 구현 (승인까지 가능)-->
												<div class="modal fade" id="deleteCompanyPage${numberofcompany.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												        <h4 class="modal-title" id="myModalLabel">${allcompany.comName}삭제요청 승인</h4>
												      </div>
												      <div class="modal-body">
												        <form action="/pineapple/deletecompany.user#allCompanyList" method="post">
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
															    	<input type="hidden" class="form-control" name="comCode" value="${allcompany.comCode}">
															    	<input type="hidden" class="form-control" name="comDelTime" value="${allcompany.comDelTime}">
															    	<input type="hidden" class="form-control" name="comDelApprovalId" value="${id}">
															    </div>
															    <div id="comOpenEmail" class="form-group has-success has-feedback">
																	<label class="control-label" for="inputSuccess2">기업등록요청아이디</label>
																	<input name="comOpenUserId" value="${allcompany.comOpenUserId}" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
																	<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																	<span id="inputSuccess2Status" class="sr-only">(success)</span>
																</div>
																<br>
																 <div id="comOpenEmail" class="form-group has-success has-feedback">
																	<label class="control-label" for="inputSuccess2">기업삭제요청아이디</label>
																	<input name="comDelRequestId" value="${allcompany.comDelRequestId}" type="text" class="form-control" varia-describedby="inputSuccess2Status" readonly>
																	<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																	<span id="inputSuccess2Status" class="sr-only">(success)</span>
																</div>
																<br>
																<div id="comnameChModal" class="form-group">
																    <label class="control-label" for="comNameInput">*기업이름</label>
																    <input name="comName" value="${allcompany.comName}" type="text" class="form-control">
																<br>
															  	</div>
															  	<div class="form-group">
																    <label for="exampleInputPassword1">*사업자번호</label>
																    <input name="comNumber" value="${allcompany.comNumber}" type="text" class="form-control" maxlength="10">
															  	</div>
															  	<br>
															  	<div>
															  		<label for="comHomePageInput">기업웹사이트주소</label>
																    <input name="comHomePage" value="${allcompany.comHomePage}" type="text" class="form-control">
																</div>
																<br>
																<div>
															    	<label for="comCeoNameInput">기업대표이름</label>
																    <p id="explain">(현재 기업 대표의 실명을 입력해주시기 바랍니다)</p>
																    <input name="comCeoName" value="${allcompany.comCeoName}" type="text" class="form-control">
																</div>
																<br>
																<div>
															    	<label for="comInfoInupt">기업정보</label>
																    <p id="explain">(기업에 대한 전반적인 정보를 입력해주시기 바랍니다)</p>
																    <textarea name="comInfo" class="form-control" rows="4">${allcompany.comInfo}</textarea>
																</div>
																<br>
																<div class="modal-footer">
																	<button type="submit" class="btn btn-info">삭제승인</button>
																	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
																</div>
															</div>
												        </form>
												      </div>
												    </div>
												  </div>
												</div>				
											</c:when>
											<c:when test="${allcompany.comDelRequestId != null and allcompany.comDelApprovalId != null}">
												<a type="button" class="btn btn-success btn-block disabled">삭제완료</a>
											</c:when>
											<c:otherwise>
												<a type="button" class="btn btn-default btn-block disabled">요청없음</a>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 네번째탭 시작(전체회원조회, 탈퇴승인) -->
		<div role="tabpanel" class="tab-pane fade" id="allUserList" aria-labelledby="allUserList-tab">
			<div class="row">
				<div class="col-md-2">
					<br>
					<p>전체회원조회</p>
				</div>
				<div class="col-md-10">
					<br>
					<p id="explanation">파인애플펀딩 사이트에 가입한 전체회원리스트를 확인할 수 있습니다.
										회원상세정보를 보기위해 상세정보 버튼을 클릭해주시기 바랍니다.</p>
					<br>
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr class="info">
								<td>번호</td>
								<td>아이디</td>
								<td>닉네임</td>
								<td>이름</td>
								<td>권한</td>
								<td>탈퇴요청시간</td>
								<td>상세정보</td>
								<td>삭제</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="alluser" items="${alluserwithdetail}" varStatus="numberofuser">
								<tr>
									<td>${numberofuser.count}</td>
									<td>${alluser.userId}</td>
									<td>${alluser.nickname}</td>
									<td>${alluser.name}</td>
									<td>${alluser.userlevel.userLevelName} ${alluser.rankcode.rankName}</td>
									<c:choose>
										<c:when test="${alluser.uDelTime != null}">
											<td><a class="btn btn-block btn-warning disabled">${alluser.uDelTime}</a></td>
										</c:when>
										<c:otherwise>
											<td><a class="btn btn-block btn-default disabled">탈퇴요청없음</a></td>
										</c:otherwise>
									</c:choose>
									<td>
										<a class="btn btn-info btn-block" data-toggle="modal" href="#userdetailcheckModal${numberofuser.count}" value="${alluser.userId}">상세정보</a>
										<!-- 회원정보 수정하기(모달화면 교체를 통한 수정) -->
										<div class="modal fade" id="userdetailcheckModal${numberofuser.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="myModalLabel">${alluser.nickname}님의 상세정보</h4>
										      </div>
										      <div class="modal-body">
							      					<form action="/pineapple/userdetailinsert.user#allUserList" method="post" style="border:1px solid #ccc">
														<div class="container_insert">
														    <div id="emailSuccess" class="form-group has-success has-feedback">
																<label class="control-label" for="inputSuccess2">${alluser.nickname}님의 아이디</label>
																<input type="text" class="form-control" name="userDetailId" value="${alluser.userId}" varia-describedby="inputSuccess2Status" readonly="readonly">
																<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																<span id="inputSuccess2Status" class="sr-only">(success)</span>
															</div>
															<br>
														  	<div class="form-group">
															    <label for="phoneFront3">전화번호앞3자리</label>
															    <p id="explain">(전화번호 앞3자리는 3자리의 숫자로 입력해야합니다)</p>
															    <p><input type="text" name="phoneFront3" value="${alluser.phoneFront3}" maxlength="3" class="form-control"></p>
															    <span id="phch1Change"></span>
														  	</div>
														  	<div class="form-group">
															    <p id="explain">(전화번호 뒤8자리는 -없이 8자리의 숫자로 입력해야합니다)</p>
															    <p><input type="text" name="phoneRest8" value="${alluser.phoneRest8}" maxlength="8" class="form-control"></p>
															    <span id="phch2Change"></span>
														  	</div>
															<br>
															<div>
														    	<label for="postalCodeInput">우편번호</label>
															    <p id="explain">(주소를 정확히 입력해 주시기 바랍니다)</p>
															    <input type="text" name="postalCode" value="${alluser.postalCode}">
																<input type="button" id="findPostalCode" onclick="sample4_execDaumPostcode()" value="우편번호찾기"><br>
																<input type="text" name="address" value="${alluser.address}">
																<input type="text" name="address2" value="${alluser.address2}" placeholder="나머지 주소">
																<span id="guide" style="color:#999"></span>
															</div>
															<br>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
													        <button type="submit" class="btn btn-info">수정</button>
													      </div>
											      	</form>
											      	
											    </div>
											  </div>
											</div>
										</div>		
									</td>
									<td>
										<a href="#deleteUserPage${numberofuser.count}" type="button" class="btn btn-danger btn-block disabled" data-toggle="modal" value="${alluser.userId}">삭제승인</a>
										<!-- 사원등록요청 승인처리를 위한 사원정보확인 모달 내부 구현 (승인까지 가능)-->
										<div class="modal fade" id="deleteUserPage${numberofuser.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="myModalLabel">${alluser.nickname}님의 상세정보</h4>
										      </div>
										      <div class="modal-body">
							      					<form action="#" method="post" style="border:1px solid #ccc">
														<div class="container_insert">
														    <div id="emailSuccess" class="form-group has-success has-feedback">
																<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
																<input type="text" class="form-control" id="userDetailIdDel" name="userDetailId" value="${alluser.userId}" varia-describedby="inputSuccess2Status" readonly="readonly">
																<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
																<span id="inputSuccess2Status" class="sr-only">(success)</span>
															</div>
															<br>
														  	<div class="form-group">
															    <label for="phoneFront3">전화번호앞3자리</label>
															    <p><input type="text" id="phoneFront3Del" name="phoneFront3" maxlength="3" class="form-control"></p>
														  	</div>
														  	<div class="form-group">
															    <p><input type="text" id="phoneRest8Del" name="phoneRest8" maxlength="8" class="form-control"></p>
														  	</div>
															<br>
															<div>
														    	<label for="postalCodeInput">우편번호</label>
															    <p id="explain">(주소를 정확히 입력해 주시기 바랍니다)</p>
															    <input type="text" id="postalCodeDel" name="postalCode">
																<input type="button" id="findPostalCode" onclick="sample4_execDaumPostcode()" value="우편번호찾기"><br>
																<input type="text" id="addressDel" name="address">
																<input type="text" id="address2Del" name="address2" placeholder="나머지 주소">
																<span id="guide" style="color:#999"></span>
															</div>
															<br>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
													        <button type="button" class="btn btn-info">수정</button>
													      </div>
											      	</form>
											    </div>
										    </div>
										  </div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>	
		</div>
		<!-- 다섯번째 탭 시작 -->
		<div role="tabpanel" class="tab-pane fade" id="message" aria-labelledby="message-tab"> 
			<p>메세지</p> 
		</div>
		
	</div> 
<!-- 풋터 -->
<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>