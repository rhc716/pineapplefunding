<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투자자 MyPage</title>
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
	
	//버튼 클릭시 실행
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
			$('#accountIdChange').val(ic.accountId);
			$('#secCompanyChange').val(ic.secCompany);
    		$('#accountNumberChange').val(ic.accountNumber);
    		$('#accountNicknameChange').val(ic.accountNickname);
		});
	});
	//투자내역 tab ajax 요청
	var investmenttab = $.ajax({ // ajax실행부분
        type: 'get',
        url : '/pineapple/investorinvestment.invest',
        success : function success(msg){
        	$('#investorinvest').html(msg);
        },
        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
        error : function error(){
       	}
	});
 	//Q&A tab ajax 요청
	var investorqnatab = $.ajax({ // ajax실행부분
        type: "get",
        url : "/pineapple/investorfundingqna.invest",
        success : function success(msg){
        	$('#investorfundingqna').empty();
        	$('#investorfundingqna').html(msg);
         	//수정 버튼 click 이벤트
         	$('.qnaupdateform').click(function(){
         		var qnaCode = $(this).attr('dataCode');
         		$('#qnaform'+qnaCode+'').submit();
         	});
        	$('.reply-main').click(function(){
        		var qnaCode = $(this).attr('dataCode');
        		var investorqnatab = $.ajax({ // ajax실행부분
        	        type: "get",
        	        url : "/pineapple/investorfundingqnareply.invest",
        	        data : {qnaCode : qnaCode},
        	        success : function success(msg){
        	        	$('#qnaCode_'+qnaCode+'').html(msg);
        	        	$('.qnareupdateform').click(function(){
        	        		var qnaReCode = $(this).attr('id');
        	        		$('#qnareform'+qnaReCode+'').submit();
        	        	});
        	        },
        	        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
        	        error : function error(){
                	}
        		});
        	});
        },
        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
        error : function error(){
       	}
	});
	//타임라인 tab ajax 요청
	databoo = $(this).attr('dataBoo');
	var timelinetab = $.ajax({ // ajax실행부분
        type: 'get',
        url : '/pineapple/investortimeline.timeline',
        success : function success(msg){
        	$('#investortimeline').html(msg);
        	$('#timelinereservebtn').click(function(){
        		$('#timelineform').submit();
        	});
        	$('.timelinereservebtn').click(function(){
        		var tldata = $(this).attr('dataCode');
        		$('#timelineform'+tldata+'').submit();
        	});
        	$('.timereply').click(function(){
        		var dataCode = $(this).attr('dataCode');
        		var investortimelinereply = $.ajax({ // ajax실행부분
        	        type: 'get',
        	        url : '/pineapple/investortimelinereply.timeline',
        	        data : {tlCode : dataCode},
        	        success : function success(msg2){
        	   				$('#timelinereplylist'+dataCode+'').html(msg2);
        	   				$('.timelinereplyinsertbtn').click(function(){
        	   					var tlCode = $(this).attr('dataCode')
        	   					$('#timelinereplyform'+tlCode+'').submit();
        	   				});
        	        },
        	        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
        	        error : function error(){
        	        	alert('1실패')
                	}
        		});
        	});
        },
        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
        error : function error(){
        	alert('1실패')
       	}
	});
	//메세지 tab 클릭시 ajax 요청
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
<!-- 투자자마이페이지 Tab bar -->
<div class="container"> 
	<ul id="myTab" class="nav nav-tabs" role="tablist"> 
		<li role="presentation" class="active">
			<a href="#investorinfo" id="investorinfo-tab" role="tab" data-toggle="tab" aria-controls="investorinfo" aria-expanded="true">내정보</a>
		</li> 
		<li role="presentation" class="">
			<a href="#timeline" role="tab" id="timeline-tab" data-toggle="tab" aria-controls="timeline" aria-expanded="false" dataBoo="false">타임라인</a>
		</li>
		<li role="presentation" class="">
			<a href="#fundingqna" role="tab" id="fundingqna-tab" data-toggle="tab" aria-controls="fundingqna" aria-expanded="false">펀딩Q&A</a>
		</li>
		<li role="presentation" class="">
			<a href="#message" role="tab" id="message-tab" data-toggle="tab" aria-controls="message" aria-expanded="false">메세지</a>
		</li>  
		<li role="presentation" class="">
			<a href="#investmemt" role="tab" id="investmemt-tab" data-toggle="tab" aria-controls="investmemt" aria-expanded="false">투자내역</a>
		</li>  
	</ul>
	<div id="myTabContent" class="tab-content">
		<div role="tabpanel" class="tab-pane fade active in" id="investorinfo" aria-labelledby="investorinfo-tab">
			<!-- 마이페이지 공통 모듈 -->
			<c:import url="./mypageall.jsp"/>
			<br>
			<div class="row">
				<div class="col-md-2">
					<p>계좌정보</p>
				</div>
				<div class="col-md-10">
				<!-- 투자자 고유 영역 -->
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
										<input type="hidden" id="accountCode" name="accountCode" value="${useraccount.accountCode}">
										<button type="submit" class="btn btn-info btn-block">삭제</button>
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
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						        <button type="button" class="btn btn-primary">추가하기</button>
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
									<input type="text" class="form-control" id="accountIdChange" name="accountId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
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
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						        <button type="submit" class="btn btn-primary">수정하기</button>
						      </div>
				        </form>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="timeline" aria-labelledby="timeline-tab"> 
			<h1 style="text-align: center;">MY TIMELINE LIST</h1> 
			<div class="col-xs-12" style="text-align: center; border: 1.5px solid #009442 ;border-radius: 5px; padding: 0px; margin: 0px 0px 20px 0px">
				<div class="col-xs-6" id="googletimelinelog" style="padding: 0px">
					<div class="col-xs-12">
						<h2>총 타임라인 글수</h2>
						<h3 id="timelinetotalcount"></h3>
					</div>
				</div>
				<div class="col-xs-6" id="timelinelogcheck" dataCode="on" style="padding: 0px 20px; margin: 20px 0px; border-left: 1px solid #d7d7d7;">
					<div id="linechart_material" style="width: 100%; height: 200px;"></div>
				</div>
			</div>
			<div class="col-xs-12" id="investortimeline" style="padding: 0px"></div> 
		</div>
		<div role="tabpanel" class="tab-pane fade" id="fundingqna" aria-labelledby="fundingqna-tab"> 
			<h1 style="text-align: center;">MY FUNDING Q&A LIST</h1>
			<div class="col-xs-12" id="investorfundingqna"></div> 
		</div>
		<div role="tabpanel" class="tab-pane fade" id="message" aria-labelledby="message-tab"> 
			<h1 style="text-align: center;">MY MESSAGE LIST</h1>
			<div class="col-xs-12" id="investormessage"></div> 
		</div>
		<div role="tabpanel" class="tab-pane fade" id="investmemt" aria-labelledby="investmemt-tab"> 
			<h1 style="text-align: center;">MY INVEST LIST</h1>
			<div class="col-xs-12" id="investorinvest"></div> 
		</div>
	</div>
</div>
<!-- 풋터 -->
<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>