<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<!-- 구글차트  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	img {
		display: inline-block;
		text-align: center;
	}
	p {
		margin :0px;
		width: 100%;
		padding: 0px 6%;
	}
</style>
<script>
$(document).ready(function(){
	/* 날짜를 yyyy-mm-dd 형태로 바꿔주는 함수 */
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join(',');
	}
	
	//wbsplan 리스트를 불러오는 ajax
	$('.milestonebtn').click(function(){
		var wbsplanlist = $.ajax({
			type : "post",
			url : "/pineapple/Wbsplanlist.pms",
			/* 마일스톤으로 검색 */
			data : { milestoneCode : $(this).val() }
		});
		// 성공시
		wbsplanlist.done(function(msg){
	
		//console.log(msg);
		
			//구글차트를 그려줌
		 	google.charts.load('current', {'packages':['gantt']});
		    google.charts.setOnLoadCallback(drawChart);
	
	
		    function drawChart() {
	
		      var data = new google.visualization.DataTable();
		      data.addColumn('string', '작업번호');
		      data.addColumn('string', '작업명');
		      data.addColumn('date', '시작일');
		      data.addColumn('date', '종료일');
		      data.addColumn('number', '작업기간');
		      data.addColumn('number', '진행도');
		      data.addColumn('string', '선행작업');
		      
		      $('#chart_btnarea').html('');
		      for(var s = 0; s<msg.length; s++){
				if(msg[s].wbsPlanStartDate!=null){
					if(msg[s].wbsPlanDependency=="없음"){
						data.addRows([
							[msg[s].wbsPlanName, msg[s].wbsPlanName,
				      new Date(msg[s].wbsPlanStartDate), null, msg[s].wbsPlanDuration* 24 * 60 * 60 * 1000,  100, null],
					 ]);
					}else{
				 data.addRows([
					 [msg[s].wbsPlanName, msg[s].wbsPlanName,
				      new Date(msg[s].wbsPlanStartDate), null, msg[s].wbsPlanDuration* 24 * 60 * 60 * 1000,  100, msg[s].wbsPlanDependency],
					 ]);
					}
				}else{
					 data.addRows([
				 [msg[s].wbsPlanName, msg[s].wbsPlanName,
				     null, null, msg[s].wbsPlanDuration* 24 * 60 * 60 * 1000,  100, msg[s].wbsPlanDependency],
				 ]);
				}
		      	
		      
		      }
		      
		      // 구글차트 높이가 자동으로 정해지지 않아서 불러온 wbs리스트 개수에 따라 높이를 다르게 해줌 
		      var heightvalue = 42;
		      heightvalue += msg.length*42    
		      
		      var options = {
		        height: heightvalue 
		        ,gantt: {
		            criticalPathEnabled: false, // Critical path arrows will be the same as other arrows.
		            arrow: {
		              angle: 100,
		              width: 5,
		              color: 'green',
		              radius: 0
		            }
		      
		        }
		      
		      };
	
		      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));
	
		      chart.draw(data, options);
		    } 
		});
		
		// 실패시
		wbsplanlist.fail(function(){
			alert('wbsplanlist ajax통신실패');
		});
	});
	
	// 용량 보기 쉽게 변환해주는 코드
	function number_to_human_size(x) {
		  var s = ['bytes', 'kB', 'MB', 'GB', 'TB', 'PB'];
		  var e = Math.floor(Math.log(x) / Math.log(1024));
		  return (x / Math.pow(1024, e)).toFixed(2) + " " + s[e];
	};

	
	
	
	
/////////////////////////////////	파라미터값으로 fdCode가 있을때에만 => 펀딩을 선택해서 들어올경우/////////////////	
	if(${param.fdCode!=null}){
		/* 펀딩 보고서 리스트 불러올 ajax */
		var getfundingfilelist = $.ajax({
			type : "get",
			url : "/pineapple/getfundingfilelist.pms",
			data : { fdCode : "${fundingAndComAndMile[0].fdCode}"},
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
			data : { fdCode : "${fundingAndComAndMile[0].fdCode}" }
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
		
		
		
		
		// 펀딩의 배당계획 리스트를 가져오는 ajax
		var getfundingdividendpalnlist = $.ajax({
			type : "get",
			url : "/pineapple/getfundingdividendpalnlist.pms",
			data : { fdCode : "${fundingAndComAndMile[0].fdCode}" }
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
		
		
	} else {
		/////////////////////// 펀딩선택을 하지 않고 펀딩보기를 눌렀을때 <펀딩의 모든 리스트를 보여주고 고르게함> //////////
		
		//  (마감, 모집실패 제외) 펀딩 리스트를 불러오는  ajax
		var getallfundinglist = $.ajax({
			type : "get",
			url : "/pineapple/getallfundinglist.pms"
		});
		
		//성공시 펀딩 리스트를 뿌려줌
		getallfundinglist.done(function(msg){
			console.log(msg);
			
			for(var i=0; i<msg[0].length; i++){
				$('#adminFdList').append(
						'<tr>'
							+'<td>'+msg[0][i].fdCode+'</td>'
							+'<td>'+msg[0][i].fdStatus+'</td>'
	       					+'<td>'+msg[0][i].fdTitle+'</td>'
	       					+'<td>'
	       						+'<div class="progress">'
								+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
								+'aria-valuemin="0" aria-valuemax="100" style="width:'
								+msg[0][i].total/msg[0][i].numberOfShares*100+'%; max-width: 100%;">'
								+msg[0][i].total/msg[0][i].numberOfShares*100+'%'
								+'</div>'
								+'</div>'
							+'</td>'
	       					+'<td><a href="/pineapple/fundingtotalview.pms?fdCode='+msg[0][i].fdCode+'">'
	       					+'<button type="button" class="btn btn-sm btn-warning btn-block">정보보기</button></a></td>'
       					+'</tr>'
				);
				
				// 마지막에 더보기 버튼을 추가함
				if(i==msg[0].length-1){
					$('#adminFdList').append(
						'<tr id="fdaddlistbtnarea">'
						+'<td colspan="5">'
						+'<div class="btns">'
						+'<button id="fdaddlistbtn" onclick="javascript:fdmoreList(this);" value="1" class="btn btn-primary btn-block">더보기</button>'
						+'</div>'
						+'</td>'
						+'</tr>'
     				);
				}
			}
		});
		
		//실패시
		getallfundinglist.fail(function(){
			alert('getallfundinglist ajax통신실패');
		});
		
		
		
	//  마감, 모집실패 펀딩 리스트를 불러오는  ajax
		var getendfundinglist = $.ajax({
			type : "get",
			url : "/pineapple/getendfundinglist.pms"
		});
		
		//성공시 펀딩 리스트를 뿌려줌
		getendfundinglist.done(function(msg){
			console.log(msg);
			
			for(var i=0; i<msg[0].length; i++){
				$('#adminEndFdList').append(
						'<tr>'
							+'<td>'+msg[0][i].fdCode+'</td>'
							+'<td>'+msg[0][i].fdStatus+'</td>'
	       					+'<td>'+msg[0][i].fdTitle+'</td>'
	       					+'<td>'
	       						+'<div class="progress">'
								+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
								+'aria-valuemin="0" aria-valuemax="100" style="width:'
								+msg[0][i].total/msg[0][i].numberOfShares*100+'%; max-width: 100%;">'
								+msg[0][i].total/msg[0][i].numberOfShares*100+'%'
								+'</div>'
								+'</div>'
							+'</td>'
	       					+'<td><a href="/pineapple/fundingtotalview.pms?fdCode='+msg[0][i].fdCode+'">'
	       					+'<button type="button" class="btn btn-sm btn-warning btn-block">정보보기</button></a></td>'
       					+'</tr>'
				);
				
				// 마지막에 더보기 버튼을 추가함
				if(i==msg[0].length-1){
					$('#adminEndFdList').append(
						'<tr id="endfdaddlistbtnarea">'
						+'<td colspan="5">'
						+'<div class="btns">'
						+'<button id="endfdaddlistbtn" onclick="javascript:endfdmoreList(this);" value="1" class="btn btn-primary btn-block">더보기</button>'
						+'</div>'
						+'</td>'
						+'</tr>'
     				);
				}
			}
		});
		
		//실패시
		getendfundinglist.fail(function(){
			alert('getEndfundinglist ajax통신실패');
		});
		
	}
});
</script>
<style type="text/css">
h1{	text-align:center;}
</style>
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
			<div class="row">
			<!-- 펀딩코드가 들어왔을때와 들어오지 않았을때 화면구성을 다르게 해줌 -->
				<c:if test="${param.fdCode!=null}">
					<div class="pagetitleandexplainbox"> 
						<h1>펀딩정보</h1>
					</div>
					<table class="table table-striped table-bordered table-hover">
						<tr class="info">
							<th>기업코드</th>
							<th>기업명</th>
						</tr>
						<tr>
							<td>${fundingAndComAndMile[0].comCode}</td>
							<td>${fundingAndComAndMile[0].comName}</td>
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
							<td>${fundingAndComAndMile[0].fdCode}</td>
							<td>${fundingAndComAndMile[0].fdTitle}</td>
							<td>${fundingAndComAndMile[0].fdStatus}</td>
							<td>${fundingAndComAndMile[0].fdPublisher}</td>
							<td>${fundingAndComAndMile[0].fdDate}</td>
							<td>
								<c:if test="${fundingAndComAndMile[0].adminApproval==1}">승인</c:if>
								<c:if test="${fundingAndComAndMile[0].adminApproval!=1}">비승인</c:if>
							</td>
							<td>${fundingAndComAndMile[0].fdApprovalDate}</td>
							<td>${fundingAndComAndMile[0].fdApprovalId}</td>
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
							<td>${fundingAndComAndMile[0].fdType}</td>
							<td>${fundingAndComAndMile[0].numberOfShares}</td>
							<td>${fundingAndComAndMile[0].issuePrice}</td>
							<td>${fundingAndComAndMile[0].minInvestMoney}</td>
							<td>${fundingAndComAndMile[0].openDate}<br>~${fundingAndComAndMile[0].closeDate}</td>
							<td>${fundingAndComAndMile[0].projectStartDate}<br>~${fundingAndComAndMile[0].projectEndDate}</td>
						</tr>
					</table>
					<div class="row">
						<div class="col-xs-5">
							<div class="pagetitleandexplainbox">
								<h1>펀딩포스터</h1>
							</div>
							<c:if test="${fundingAndComAndMile[0].posterImg!=null}">
								<p><img src="${pageContext.request.contextPath}/resources/files/${fn:substringAfter(fundingAndComAndMile[0].posterImg, 'files')}"></p>
							</c:if>
							<c:if test="${fundingAndComAndMile[0].posterImg==null}">
								<p><img src="${pageContext.request.contextPath}/resources/files/insertnotsum.jpg"></p>
							</c:if>
						</div>
						<div class="col-xs-7">
							<div class="row">
								<div class="pagetitleandexplainbox"> 
									<h1>마일스톤 리스트</h1>
								</div>
								<div>
									<table class="table table-striped table-bordered table-hover">
										<tr class="info">
											<th>마일스톤코드</th>
											<th>마일스톤단계</th>
											<th>마일스톤명</th>
											<th>마일스톤요약</th>
											<th>담당자아이디</th>
											<th>WBS정보보기</th>
										</tr>
										<c:forEach var="milestone" items="${fundingAndComAndMile[0].mileStoneList}">
											<tr>
												<td>${milestone.milestoneCode}</td>
												<td>${milestone.milestoneStep}</td>
												<td>${milestone.milestoneName}</td>
												<td>${milestone.milestoneSummary}</td>
												<td>${milestone.pm}</td>
												<td><button type="button" value="${milestone.milestoneCode}" class="milestonebtn btn btn-primary btn-sm">클릭</button></td>
											</tr>
										</c:forEach>
										<c:if test="${empty fundingAndComAndMile[0].mileStoneList}">
											<tr>
												<td align="center" colspan="6"><b>마일스톤데이터가 없습니다</b></td>
											</tr>
										</c:if>
									</table>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="pagetitleandexplainbox" align="center"> 
							<h1>WBSPLAN 리스트</h1>
							<span>
								◎ 마일스톤리스트의 WBS정보보기 버튼을 눌러주세요 
							</span>
						</div>
						<div class="col-xs-12">
							<!-- wbs리스트 부분  -->
							<div class="row" id="mywbsplanlist">
							</div>
							<!-- 차트뿌려지는곳 -->
							<div class="row" id="chart_div">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">		
							<div class="pagetitleandexplainbox"> 
								<h1>보고서파일 리스트</h1>
							</div>
							<!-- 보고서 파일 다운로드 리스트 들어갈 곳 -->
							<div>
								<table class="table table-striped table-bordered table-hover" id="myfundingfilelist">
									<tr class="info">
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
					</div>
					<div class="row">
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
				</c:if>
				<!-- 펀딩코드를 선택하지 않았을때는 펀딩목록을 보여줌 -->
           		<c:if test="${param.fdCode==null}">
	           		<div class="pagetitleandexplainbox"> 
		           		<h1>마감, 모집실패상태를 제외한 모든 펀딩리스트</h1>
					</div>
	           		<table class="table table-striped table-bordered table-hover">
	           			<thead>
	           				<tr class="info">
	           					<td>펀딩코드</td>
	           					<td>펀딩상태</td>
	           					<td>펀딩명</td>
	           					<td>모집률</td>
	           					<td>정보보기</td>
	           				</tr>
	           			</thead>
	           			<tbody id="adminFdList">
	           			<!-- 펀딩목록 들어올 곳 -->
	           			
	           			</tbody>
	           		</table>
					<div class="pagetitleandexplainbox"> 
						<h1>마감, 모집실패상태의 펀딩</h1>
					</div>
           			<table class="table table-striped table-bordered table-hover">
	           			<thead>
	           				<tr class="info">
	           					<td>펀딩코드</td>
	           					<td>펀딩상태</td>
	           					<td>펀딩명</td>
	           					<td>모집률</td>
	           					<td>정보보기</td>
	           				</tr>
	           			</thead>
	           			<tbody id="adminEndFdList">
	           			<!-- 펀딩목록 들어올 곳 -->
	           			
	           			</tbody>
	           		</table>
           		</c:if>
			</div>
	</div>
</div>
<script>
	// 모든펀딩보기의 더보기버튼 실행 함수 (ajax 요청)
	function fdmoreList(btn){
		//console.log("moreList에서 받은 매개변수 : "+btn);
		//console.log("moreList 매개변수로 들어온 (버튼객체)의 value = 페이징 "+btn.value);
	    $.ajax({
	        url : "/pineapple/getmorefdlist.pms",
	        type : "get",
	        cache : false,
	        dataType: 'json',
	        data : {numberOfRequests : btn.value },
	        success : function(data){
	            //console.log(data);
	            
	            if(data.length==0){
	            	// 더 불러올 펀딩 목록이 없는 경우
	            	$('#fdaddlistbtn').attr("class","btn btn-primary btn-block disabled");
	            	$('#fdaddlistbtn').text("더 불러올 펀딩목록이 없습니다");
	            } else {
	            	// 불러올 펀딩 목록이 있는 경우
	            	var content="";
	            	for(var i=0; i<data.length; i++){
		                content +=
		                '<tr>'
		                	+'<td>'+data[i].fdCode+'</td>'
		                    +'<td>'+data[i].fdStatus+'</td>'
		                    +'<td>'+data[i].fdTitle+'</td>'
		                    +'<td>'
	   						+'<div class="progress">'
							+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
							+'aria-valuemin="0" aria-valuemax="100" style="width:'
							+data[i].total/data[i].numberOfShares*100+'%; max-width: 100%;">'
							+data[i].total/data[i].numberOfShares*100+'%'
							+'</div>'
							+'</div>'
							+'</td>'
							+'<td><a href="/pineapple/fundingtotalview.pms?fdCode='+data[i].fdCode+'">'
							+'<button type="button" class="btn btn-sm btn-warning btn-block">정보보기</button></td>'
		                +'</tr>';
	           		}
	            
	            	// 기존 버튼을 지우고 새로 만들어줄때 value 값을 1 증가시켜서 다음 10개를 불러올 페이징넘버를 기억하게함.
	            	var pagingNum = Number(btn.value) + 1; 
		            content += '<tr id="fdaddlistbtnarea">'
		            	+'<td colspan="5"><div class="btns">'
		            	+'<button type="button" id="fdaddlistbtn" onclick="javascript:fdmoreList(this);"'
		            	+'value="'+pagingNum+'" class="btn btn-primary btn-block">'
		            	+'더보기</button></div></td></tr>"';
		            //console.log("content : "+content);
		            $('#fdaddlistbtnarea').remove();
		            $('#adminFdList').append(content);
		       }
	            
	        }, 
	        error : function(){
	           alert('ajax 통신 실패');
	        }
	   
		});
	}
	
	
	// 모집실패, 마감펀딩보기의 더보기버튼 실행 함수 (ajax 요청)
	function endfdmoreList(btn){
		//console.log("moreList에서 받은 매개변수 : "+btn);
		//console.log("moreList 매개변수로 들어온 (버튼객체)의 value = 페이징 "+btn.value);
	    $.ajax({
	        url : "/pineapple/getmoreendfdlist.pms",
	        type : "get",
	        cache : false,
	        dataType: 'json',
	        data : {numberOfRequests : btn.value },
	        success : function(data){
	            console.log("endfdmoreList의 ajax 통신 성공함수 매개변수 : "+data);
	            
	            if(data==""){
	            	// 더 불러올 펀딩 목록이 없는 경우
	            	$('#endfdaddlistbtn').attr("class","btn btn-primary btn-block disabled");
	            	$('#endfdaddlistbtn').text("더 불러올 펀딩목록이 없습니다");
	            } else {
	            	// 불러올 펀딩 목록이 있는 경우
	            	var content="";
	            	for(var i=0; i<data.length; i++){
		                content +=
		                '<tr>'
		                	+'<td>'+data[i].fdCode+'</td>'
		                    +'<td>'+data[i].fdStatus+'</td>'
		                    +'<td>'+data[i].fdTitle+'</td>'
		                    +'<td>'
	   						+'<div class="progress">'
							+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
							+'aria-valuemin="0" aria-valuemax="100" style="width:'
							+data[i].total/data[i].numberOfShares*100+'%; max-width: 100%;">'
							+data[i].total/data[i].numberOfShares*100+'%'
							+'</div>'
							+'</div>'
							+'</td>'
							+'<td><a href="/pineapple/fundingtotalview.pms?fdCode='+data[i].fdCode+'">'
							+'<button type="button" class="btn btn-sm btn-warning btn-block">정보보기</button></td>'
		                +'</tr>';
	           		}
	            
	            	// 기존 버튼을 지우고 새로 만들어줄때 value 값을 1 증가시켜서 다음 10개를 불러올 페이징넘버를 기억하게함.
	            	var pagingNum = Number(btn.value) + 1; 
		            content += '<tr id="endfdaddlistbtnarea">'
		            	+'<td colspan="5"><div class="btns">'
		            	+'<button type="button" id="endfdaddlistbtn" onclick="javascript:endfdmoreList(this);"'
		            	+'value="'+pagingNum+'" class="btn btn-primary btn-block">'
		            	+'더보기</button></div></td></tr>"';
		            //console.log("content : "+content);
		            $('#endfdaddlistbtnarea').remove();
		            $('#adminEndFdList').append(content);
		       }
	            
	        }, 
	        error : function(){
	           alert('ajax 통신 실패');
	        }
	   
		});
	}

	
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join('-');
	}
	
	
	// 투자자의 더보기버튼 실행 함수 (ajax 요청)
	
	function investormoreList(btn){
	//console.log("moreList에서 받은 매개변수 : "+btn);
	//console.log("moreList 매개변수로 들어온 (버튼객체)의 value = 페이징 "+btn.value);
    $.ajax({
        url : "/pineapple/getfundinginvestorlist.pms",
        type : "get",
        cache : false,
        dataType: 'json',
        data : {
        	fdCode : "${fundingAndComAndMile[0].fdCode}"
        	,numberOfRequests : btn.value },
        success : function(data){
            //console.log(data);
            
            if(data.length==0){
            	// 더 불러올 펀딩 목록이 없는 경우
            	$('#investoraddlistbtn').attr("class","btn btn-primary btn-block disabled");
            	$('#investoraddlistbtn').text("더 불러올 투자자 목록이 없습니다");
            } else {
            	// 불러올 펀딩 목록이 있는 경우
            	var content="";
            	for(var i=0; i<data.length; i++){
            		if(data[i].payCheck=='0'){
						paychecktext = "미결제";
					}else{
						paychecktext = "결제";
					}
	                content +=
						'<tr>'
							+'<td>'+data[i].investId+'</td>'
							+'<td>'+data[i].purchaseShares+'</td>'
							+'<td>'+paychecktext+'</td>'
							+'<td>'+formatDate(data[i].investTime)+'</td>'
						+'</tr>'
           		}
            
            	// 기존 버튼을 지우고 새로 만들어줄때 value 값을 1 증가시켜서 다음 10개를 불러올 페이징넘버를 기억하게함.
            	var pagingNum = Number(btn.value) + 1; 
	            content += 
	            	'<tr id="investoraddlistbtnarea">'
						+'<td colspan="4">'
						+'<button type="button" onclick="javascript:investormoreList(this)" id="investoraddlistbtn" value="'+btn.value+1+'" class="btn-block btn btn-primary">'
						+'더보기</button>'
						+'</td>'
					+'</tr>'
	            //console.log("content : "+content);
	            $('#investoraddlistbtnarea').remove();
	            $('#investorlist').append(content);
	       	}
            
        }, 
        error : function(){
           alert('ajax 통신 실패');
        }
   
	});
	}
		
//이미지 경로가 잘못되었을때 표시해주는 이미지 
$('img').each(function(n){
	//console.log($(this));
	$(this).on( "error", function(){
		$(this).attr("src", "${pageContext.request.contextPath}/resources/img/404alternateimage.jpg");
    });
});
</script>
<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>