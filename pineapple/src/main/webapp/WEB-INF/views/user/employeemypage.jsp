<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일반사원 MyPage</title>
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
	//기업등록시 기업명 존재여부 검사
	$('#comName1').blur(function(){
			$.ajax({ // ajax실행부분
			    type: "post",
			    url : "/pineapple/checkcomname.user",
			    data : {comName : $('#comName1').val()},
			    success : function(){ 
			    			$('#comnamech').css("color", "#FF0000");
			    			$('#comnamech').text('이미 존재하는 기업명입니다.');
			    			$('#comName1').val('');
			    	},
			    //만약 해당 페이지에 값을 성공적으로 보냈다면 페이지를 rs 라는 매개변수로 받아 id = 'comnamech' 구역에 rs를 출력하겠다. 
			    error : function error(){
			    		$('#comNameCheck').hide();
			    		$('#comNameSuccess').show();
			    		document.getElementById("comName2").readOnly = true;
			    		$("#comName2").val($('#comName1').val());
			    		
			    	}
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
				<a data-target="#employeeinfo" id="employeeinfo-tab" role="tab" data-toggle="tab" aria-controls="employeeinfo" aria-expanded="true">내정보</a>
			</li> 
			<li role="presentation" class="">
				<a data-target="#insertEmployee" role="tab" id="#insertEmployee-tab" data-toggle="tab" aria-controls="#insertEmployee" aria-expanded="false">사원등록요청</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#insertCompany" role="tab" id="#insertCompany-tab" data-toggle="tab" aria-controls="#insertCompany" aria-expanded="false">기업등록요청</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#fundingqna" role="tab" id="fundingqna-tab" data-toggle="tab" aria-controls="fundingqna" aria-expanded="false">펀딩Q&A</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#message" role="tab" id="message-tab" data-toggle="tab" aria-controls="message" aria-expanded="false">메세지</a>
			</li>  
			<li role="presentation" class="">
				<a data-target="#investmemt" role="tab" id="investmemt-tab" data-toggle="tab" aria-controls="investmemt" aria-expanded="false">투자내역</a>
			</li>  
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="employeeinfo" aria-labelledby="employeeinfo-tab">
				<!-- 마이페이지 공통 모듈 -->
				<c:import url="./mypageall.jsp"/>
			</div> 
			<div role="tabpanel" class="tab-pane fade" id="insertEmployee" aria-labelledby="insertEmployee-tab">
			<!-- 기업회원일 경우 마이페이지 로딩시, 항상 사원정보를 조회하여 객체 데이터를 담아 전송한다 -->
			<c:choose>
				<c:when test="${not empty employee}">
					사원정보보기(승인여부체크가능), 사원요청계속 할 수 있음, 회사개설가능
				</c:when>
				<c:otherwise>
					사원등록요청, 회사개설가능
				</c:otherwise>
			</c:choose>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="insertCompany" aria-labelledby="insertCompany-tab">
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
								    <input id="comName1" name="comNameInput" type="text" class="form-control" placeholder="Enter Company Name">
							  		<span id="comnamech"><input type="hidden" value="0" id="comNameValue0" name="comNameValue0"/></span>
							  	</div>
							  	<br>
							  	<div id="comNameSuccess" class="form-group has-success has-feedback" hidden="hidden">
									<label class="control-label" for="inputSuccess2">사용가능한 기업명</label>
									<input type="text" class="form-control" id="comName2" name="comName" varia-describedby="inputSuccess2Status">
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
								    <input id="submitComInsertBtn" type="button" class="button_insert signupbtn" value="기업등록">
							   	</div>
							</div>
						</form>
					</div>
						
				</div>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="fundingqna" aria-labelledby="fundingqna-tab"> 
				<p>펀딩Q&A</p> 
			</div>
			<div role="tabpanel" class="tab-pane fade" id="message" aria-labelledby="message-tab"> 
				<p>메세지</p> 
			</div>
			<div role="tabpanel" class="tab-pane fade" id="investmemt" aria-labelledby="investmemt-tab"> 
				<p></p> 
			</div>
		</div> 
	</div>
<!-- 풋터 -->
<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>