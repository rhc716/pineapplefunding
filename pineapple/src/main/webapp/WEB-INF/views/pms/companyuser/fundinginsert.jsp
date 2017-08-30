<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

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

<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />

<script>
/*******************회사코드, 회사명 select option채워줄 ajax  ********************/
$(document).ready(function(){
	var getcomlist = $.ajax({
		type : "get",
		url : "/pineapple/getcomlist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}"}
	});
	// 성공시
	getcomlist.done(function(msg){
		console.log(msg);
		for(var i = 0; i<msg.length; i++){
			$('#comList').append(
				'<option value="'+msg[i].comCode+'">'+msg[i].comName+'</option>'
			);
		}
	});
	// 실패시
	getcomlist.fail(function(){
		alert('ajax요청실패');
	});



	/******************* 유효성검사 *********************/
//	펀딩명 유효성검사 및 중복검사
	$('#fdTitle').blur(function() {
        var temp = 0;
		var in_fdtitle = $('#fdTitle').val();
		// 한 영 숫자 4~20자
		var check = /^[0-9a-zA-Z가-힣]{4,20}$/;
		if(!check.test(in_fdtitle)) {
			//유효하지 않을때
			temp = 1;
		} else {
			//유효할때
			temp = 0;
		}
		    	
// 유효성 검사 통과시 중복확인용 ajax실행
        if(temp==0){
        	$.ajax({ // ajax실행부분
                type: "get",
                url : "/pineapple/fdtitlecheck.pms",
                data : {fdTitle : in_fdtitle},
                success : function(ic){ 
                	// 공백일때 -> 펀딩명 중복검사 결과가 없을때 -> 펀딩명 사용가능
                	if (ic=='') {
                		$('#checkresult').css("color", "#008000");
            			$('#checkresult').text('사용가능한 펀딩명입니다.');
                	// 공백이 아닐때 -> 펀딩명 중복검사 결과가 있을때 -> 펀딩명 사용불가능
                	} else {
                		$('#checkresult').css("color", "#FF0000");
            			$('#checkresult').text('이미 사용중인 펀딩명입니다.');
                    	$('#fdTitle').val('');
            			$('#fdTitle').focus();
                	}		
                	
                	},
                //만약 해당 페이지에 값을 성공적으로 보냈다면 페이지를 ic 라는 매개변수로 받아 id = 'idch' 구역에 ic를 출력하겠다. 
                error : function error(){
                		alert('ajax 통신실패');	
                	}
        	});
        } else {
        	$('#checkresult').css("color", "#FF0000");
			$('#checkresult').text('유효한 펀딩명을 입력해주시기 바랍니다.');
        	$('#fdTitle').val('');
			$('#fdTitle').focus();
        }
	
	});
});




	
</script>

</head>
<body>

<div class="container">
<!--최상단 로고 및 로그인 or 로그아웃버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<div class="row">
	<div class="col-md-3">
		<c:import url="/resources/module/pmsleftmenu.jsp"/>
	</div>
	<div class="col-md-9">
			<div class="col-md-9">
				<div class="pagetitleandexplainbox">
					<h1>펀딩개설</h1>
					<span>
						<b> 펀딩명은 수정이 불가능하니 신중히 지어주세요 </b><br>
						<b> 오픈일, 마감일 -> 펀딩 모집기간 </b><br>
						<b> 프로젝트 시작일, 프로젝트 마감일 -> 실제 프로젝트 기간 </b><br>
						<b> 최소보장이율은 펀딩전체 기간동안 배당금과 별개로 투자원금에 대해 지급되는 이자율입니다 </b><br><br>
					</span>
				</div>
				<div class="panel panel-default">
					<div class="panel-body form-horizontal payment-form">
					<form action="/pineapple/addfunding.pms" method="post" enctype="multipart/form-data">
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">펀딩형태</label>
		                        <div class="col-sm-9">
									<select name="fdType" class="form-control" required="required">
										<option value="채권">채권</option>
										<option value="주식">주식</option>
									</select>
       							</div>
                    	</div>
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">회사명</label>
		                        <div class="col-sm-9">
									<select name="fdComCode" class="form-control" id="comList" required="required">
										<!-- ajax요청으로 회사명과 회사코드를 각각 넣어줌  -->
										<option value="null">선택하세요</option>
									</select>
								</div>
                    	</div>
                    	<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">펀딩명</label>
		                        <div class="col-sm-9">
								<input type="text" class="form-control" id="fdTitle" name="fdTitle" required="required"><br>
								<span id="checkresult"></span>
							</div>
                    	</div>
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">최소투자금액</label>
		                        <div class="col-sm-9">
								<input type="number" class="form-control" name="minInvestMoney" required="required">
								</div>
                    	</div>
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">판매주식수</label>
		                        <div class="col-sm-9">
									<input type="number" class="form-control" name="numberOfShares" required="required">
								</div>
                    	</div>
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">주당발행가</label>
		                        <div class="col-sm-9">
									<input type="number" class="form-control" name="issuePrice" required="required">	
								</div>
                    	</div>
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">오픈일</label>
		                        <div class="col-sm-9">
									<input type="date" class="form-control" name="openDate" required="required">
								</div>
                    	</div>
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">마감일</label>
		                        <div class="col-sm-9">
									<input type="date" class="form-control" name="closeDate" required="required">
								</div>
                    	</div>
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">최소보장이율</label>
		                        <div class="col-sm-9">
									<input type="number" class="form-control" name="minInterestRate" required="required">
								</div>
                    	</div>
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">프로젝트 시작일</label>
		                        <div class="col-sm-9">
									<input type="date" class="form-control" name="projectStartDate" required="required">
								</div>
                    	</div>
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">프로젝트 마감일</label>
		                        <div class="col-sm-9">
									<input type="date" class="form-control" name="projectEndDate" required="required">
								</div>
                    	</div>
							<!-- 히든값으로 펀딩개설자 id를 세션에서받아서 넣어줌 -->
						<input type="hidden" class="form-control" name="fdPublisher" value="${id}">
						<div class="form-group">
	                        <div class="col-sm-12 text-right">
	                            <button type="submit" class="btn btn-success preview-add-button">
									입력완료
	                            </button>
	                        </div>
                    	</div>
					</form>
				</div>
			</div>
			</div>
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>