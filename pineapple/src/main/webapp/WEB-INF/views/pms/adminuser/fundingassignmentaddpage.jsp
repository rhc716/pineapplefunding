<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<script type="text/javascript">
$(document).ready(function(){
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join(',');
	}
	var getfundingdividendpalnlist = $.ajax({
		type : "get",
		url : "/pineapple/getfundingdividendpalnlist.pms",
		data : { fdCode : "${getFundingAssignmentInsert.fdCode}" }
	});
	
	//성공시
	getfundingdividendpalnlist.done(function(msg){
		//console.log(msg);
		
		//배당계획이 없으면 문구를 출력
		if(msg==""){
			$('#fundingdividendplanlist').append(
					'<tr>'
						+'<td colspan="5" align="center"><b>배당계획이 없습니다</b></td>'
					+'</tr>'
			);
		}else{
			for(var i = 0; i<msg.length; i++){
				$('#fundingdividendplanlist').append(
					'<tr>'
						+'<td>'+msg[i].divIndexName+'</td>'
						+'<td>'+msg[i].settlementUnit+'일</td>'
						+'<td>'+msg[i].minMargin+'원</td>'
						+'<td>'+msg[i].maxMargin+'원</td>'
						+'<td>'+msg[i].dividendRate+'%</td>'
					+'</tr>'
				);
			}
		}
	});
	
	//실패시
	getfundingdividendpalnlist.fail(function(){
		alert('ajax통신실패');
	});
	/* 펀딩 보고서 리스트 불러올 ajax */
	var getfundingfilelist = $.ajax({
		type : "get",
		url : "/pineapple/getfundingfilelist.pms",
		data : { fdCode : "${getFundingAssignmentInsert.fdCode}"},
		async : false
	});
	// 성공시
	getfundingfilelist.done(function(msg){
		console.log("펀딩파일ajax 요청결과 : "+msg);
		//파일목록이 없으면 문구를 뜨게함
		if(msg==""){
			$('#myfundingfilelist').append(
				'<tr>'
					+'<td colspan="5" align="center"><b>펀딩보고서 파일이 없습니다</b></td>'
				+'</tr>'
			);
		
		} else {
			for(var i = 0; i<msg.length; i++){
				// 펀딩파일의 목록을 화면에 뿌려줌 
				$('#myfundingfilelist').append(
					'<tr>'
						+'<td>'+msg[i].fdTitle+'</td>'
						+'<td>'+msg[i].fdFileName+'</td>'
						+'<td>'+msg[i].fdFileExtension+'</td>'
						+'<td>'+number_to_human_size(msg[i].fdFileSize)+'</td>'
						+'<td><a href="calldownload.pms?fileFullPath='+msg[i].fdFileUploadName+'">'
						+'<button type="button" class="btn btn-sm btn-success">다운로드</button></a></td>'
					+'</tr>'
				);
			}
		}
	
	});
	// 실패시
	getfundingfilelist.fail(function(){
		alert('getfundingfilelist ajax통신실패');
	});
	
	
	// 펀딩의 투자자 리스트를 불러오는  ajax 
	var getfundinginvestorlist = $.ajax({
		type : "get",
		url : "/pineapple/getfundinginvestorlist.pms",
		data : { fdCode : "${getFundingAssignmentInsert.fdCode}" }
	});
	
	//성공시 투자자 리스트를 investorlist에 채워줌
	getfundinginvestorlist.done(function(msg){
		console.log(msg);
		
		//투자자 리스트가 없으면 문구 출력
		if(msg==""){
			$('#investorlist').append(
				'<tr>'
					+'<td colspan="4" align="center"><b>투자자가 없습니다</b></td>'
				+'</tr>'
			);
		}else{
			for(var i = 0; i<msg.length; i++){
				var paychecktext = "";
				if(msg[i].payCheck=='0'){
					paychecktext = "미결제";
				}else{
					paychecktext = "결제";
				}
				$('#investorlist').append(
					'<tr>'
						+'<td>'+msg[i].investId+'</td>'
						+'<td>'+msg[i].purchaseShares+'</td>'
						+'<td>'+paychecktext+'</td>'
						+'<td>'+formatDate(msg[i].investTime)+'</td>'
					+'</tr>'
				);
			}
		}
		
		
		$('#investorlist').append(
			'<tr id="investoraddlistbtnarea">'
				+'<td colspan="4">'
				+'<button type="button" onclick="javascript:investormoreList(this)" id="investoraddlistbtn" value="1" class="btn-block btn btn-primary">'
				+'더보기</button>'
				+'</td>'
			+'</tr>'
		);
	});
	
	//실패시
	getfundinginvestorlist.fail(function(){
		alert('getfundingdividendpalnlist ajax통신실패');
	});
});

</script>
</head>
<body>
<div class="container">
<!--로고 및 검색 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<div class="row">
	<div class="col-md-3">
		<c:import url="/resources/module/pmsleftmenu.jsp"/>
	</div>
	<div class="col-md-9" id="myfundinglist">
		<div class="pagetitleandexplainbox">
			<h1>배당 펀딩</h1>
			<span>
				<b>배당할 펀딩의 정보를 불러옵니다.</b><br>

			</span>
		</div>
		<c:set var="getFundingAssignmentInsert" value="${getFundingAssignmentInsert}"></c:set>
		<table class="table table-striped table-bordered table-hover">
						<tr class="info">
							<th>기업코드</th>
							<th>기업명</th>
						</tr>
 						<tr>
							<td>${getFundingAssignmentInsert.comCode}</td>
							<td>${getFundingAssignmentInsert.comName}</td>
						</tr>
		</table>
		<table class="table table-striped table-bordered table-hover">
						<tr class="info">
							<th>펀딩코드</th>
							<th>펀딩</th>
							<th>상황</th>
							<th>개설ID</th>
							<th>요청일</th>
							<th>승인여부</th>
							<th>승인일</th>
							<th>승인ID</th>
						</tr>
	 					<tr>
							<td>${getFundingAssignmentInsert.fdCode}</td>
							<td>${getFundingAssignmentInsert.fdTitle}</td>
							<td>${getFundingAssignmentInsert.fdStatus}</td>
							<td>${getFundingAssignmentInsert.fdPublisher}</td>
							<td>${getFundingAssignmentInsert.fdDate}</td>
							<td>
								<c:if test="${getFundingAssignmentInsert.adminApproval==1}">승인</c:if>
								<c:if test="${getFundingAssignmentInsert.adminApproval!=1}">비승인</c:if>
							</td>
							<td>${getFundingAssignmentInsert.fdApprovalDate}</td>
							<td>${getFundingAssignmentInsert.fdApprovalId}</td>
						</tr>
					</table>
					<table class="table table-striped table-bordered table-hover">
						<tr class="info">
							<th>형태</th>
							<th>발행주식수</th>
							<th>주당발행가</th>
							<th>최저이율</th>
							<th>모집 시작일 ~ 마감일</th>
							<th>프로젝트 시작일 ~ 마감일</th>
						</tr>
 						<tr>
							<td>${getFundingAssignmentInsert.fdType}</td>
							<td>${getFundingAssignmentInsert.numberOfShares}</td>
							<td>${getFundingAssignmentInsert.issuePrice}</td>
							<td>${getFundingAssignmentInsert.minInvestMoney}</td>
							<td>${getFundingAssignmentInsert.openDate}<br>~${getFundingAssignmentInsert.closeDate}</td>
							<td>${getFundingAssignmentInsert.projectStartDate}<br>~${getFundingAssignmentInsert.projectEndDate}</td>
						</tr>
					</table>
					<div class="row">
						<div class="col-xs-6">		
							<div class="pagetitleandexplainbox"> 
								<h1>보고서파일 리스트</h1>
							</div>
							<!-- 보고서 파일 다운로드 리스트 들어갈 곳 -->
							<div>
								<table class="table" id="myfundingfilelist">
									<tr>
										<td>펀딩명</td>
										<td>보고서명</td>
										<td>보고서확장자</td>
										<td>보고서용량</td>
										<td>다운로드</td>
									</tr>
									<!-- 리스트 뿌려질 곳 -->					
								</table>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="pagetitleandexplainbox"> 
								<h1>배당계획 리스트</h1>
							</div>
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr class="info">
										<td>기준명</td>
										<td>마감기준</td>
										<td>최소마진</td>
										<td>최대마진</td>
										<td>배당율</td>
									</tr>
								</thead>
								<!-- 배당계획 리스트 뿌려질 곳 -->		
								<tbody id="fundingdividendplanlist"> 
									
								</tbody>			
							</table>
						</div>
						<div class="col-xs-12">
						<div class="pagetitleandexplainbox"> 
							<h1>투자자 리스트</h1>
						</div>
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr class="info">
									<th>투자자아이디</th>
									<th>구매주식수</th>
									<th>결제여부</th>
									<th>투자일</th>
								</tr>
							</thead>
							<!-- ajax요청으로 목록을 채워줌 -->
							<tbody id="investorlist"> 
										
							</tbody>
						</table>
					</div>
					</div>
						<div class="pagetitleandexplainbox"> 
							<h1>배정 할 내역</h1>
						</div>
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr class="info">
									<th>배정 회사명</th>
									<th>총 판매 주</th>
									<th>주당발행가</th>
									<th>총 배정 금</th>
								</tr>
							</thead>
							<tbody> 
								<tr>
									<td>${getFundingAssignmentInsert.comName}</td>
									<td>${getFundingAssignmentInsert.numberOfShares}</td>
									<td>${getFundingAssignmentInsert.issuePrice}</td>
									<td>${getFundingAssignmentInsert.numberOfShares*getFundingAssignmentInsert.issuePrice}</td>
								</tr>
								<tr>
									<td colspan="4">
									<form action="/pineapple/fundingassignmentinsert.invest" method="post">
									<input type="hidden" value="3" name="mfCategory">
									<input type="hidden" value="0" name="mfInvestCode">
									<input type="hidden" value="${getFundingAssignmentInsert.fdCode}" name="mfFdCode">
									<input type="hidden" value="${getFundingAssignmentInsert.numberOfShares*getFundingAssignmentInsert.issuePrice}" name="mfAmount">
									<button type="submit" class="btn-block btn btn-warning">배정하기</button>
									</form>
									</td>
									</tr>
							</tbody>
						</table>

					
	</div>
</div>

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>