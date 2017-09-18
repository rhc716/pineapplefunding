<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script type="text/javascript">
$(document).ready(function(){
	
	//(마감, 모집실패 제외) 펀딩 리스트를 불러오는  ajax
	var getallfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/getallfundinglist.pms"
	});
	
	//성공시 펀딩 리스트를 뿌려줌
	getallfundinglist.done(function(msg){
		console.log(msg);
		
		for(var i=0; i<msg[0].length; i++){
			$('#fdlistgroup').append(
				'<button class="list-group-item" onclick="javascript:fdbtnclick(this)"' 
				+'value="'+msg[0][i].fdCode+'">'+msg[0][i].fdTitle+'</button>'
			);
			
			// 마지막에 더보기 버튼을 추가함
			if(i==msg[0].length-1){
				$('#fdlistgroup').append(
					'<button id="fdaddlistbtn" value="1" onclick="javascript:fdmoreList(this)"'
					+'class="morebtn active list-group-item">더보기</button>'
				);
			}
		}
	});
	
	//실패시
	getallfundinglist.fail(function(){
		alert('getallfundinglist ajax통신실패');
	});

});
</script>
<style type="text/css">
	h1,h2,h3,h4 {
		text-align: center;
	}
	#fdlistgroup,#divplanlistgroup{
		height: 300px;
		overflow: scroll;
		overflow-x: hidden;
		padding-left: 0px;
	}
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
	<div class="col-md-9">
		<div class="row">
			<div class="pagetitleandexplainbox"> 
				<h2>펀딩을 선택하면 배당계획 및 실제 배당상황을 볼 수 있습니다</h2>
			</div>		
			<div class="col-xs-6">
				<div class="pagetitleandexplainbox"> 
					<h3>펀딩</h3>
				</div>
				<div class="pagetitleandexplainbox" id="fdlistgroup">

				</div>
			</div>
			<div class="col-xs-6">
				<div class="pagetitleandexplainbox"> 
					<h3>배당계획</h3>
				</div>
				<div class="pagetitleandexplainbox" id="divplanlistgroup">
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
						<!-- ajax요청으로 목록을 채워줌 -->
						<tbody id="divplanlist"> 
									
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="pagetitleandexplainbox"> 
				<h3>배당현황</h3>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="info">
						<td>배당코드</td>
						<td>투자자아이디</td>
						<td>주당발행가</td>
						<td>구입주식수</td>
						<td>최소보장이율</td>
						<td>배당율</td>
						<td>총마진</td>
						<td>배당금액</td>
						<td>배당일</td>
					</tr>
				</thead>
				<!-- ajax요청으로 목록을 채워줌 -->
				<tbody id="divpaylist">
				
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- 풋터 -->
<!-- 버튼클릭시 자바스크립트 함수 -->
<script type="text/javascript">

//펀딩목록의 더보기버튼 실행 함수 (ajax 요청)
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
            	$('#fdaddlistbtn').attr("class","morebtn active list-group-item disabled");
            	$('#fdaddlistbtn').text("없음");
            } else {
            	// 불러올 펀딩 목록이 있는 경우
            	var content="";
            	for(var i=0; i<data.length; i++){
	                content +=
	                	'<button class="list-group-item" onclick="javascript:fdbtnclick(this)"' 
	    				+'value="'+data[i].fdCode+'">'+data[i].fdTitle+'</button>';
           		}
            
            	// 기존 버튼을 지우고 새로 만들어줄때 value 값을 1 증가시켜서 다음 10개를 불러올 페이징넘버를 기억하게함.
            	var pagingNum = Number(btn.value) + 1; 
	            content += 
	            	'<button id="fdaddlistbtn" value="'+pagingNum+'" onclick="javascript:fdmoreList(this)"'
					+'class="morebtn active list-group-item">더보기</button>';
	            	
	            //console.log("content : "+content);
	            $('#fdaddlistbtn').remove();
	            $('#fdlistgroup').append(content);
	       }
            
        }, 
        error : function(){
           alert('ajax 통신 실패');
        }
   
	});
}

//금액에 콤마찍어주는 함수			
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 펀딩을 선택시 작동하는 함수
function fdbtnclick(btn){
	console.log("선택한 펀딩코드 : "+btn.value);
	
	//배당계획을 누를때마다 초기화
	$('#divplanlist').html('');
	
	// 펀딩을 선택시 배당계획 리스트를 가져오는 ajax 
	var getfundingdividendpalnlist = $.ajax({
		type : "get",
		url : "/pineapple/getfundingdividendpalnlist.pms",
		data : { fdCode : btn.value }
	});
	
	//성공시
	getfundingdividendpalnlist.done(function(msg){
		console.log(msg);
		for(var i = 0; i<msg.length; i++){
			$('#divplanlist').append(
				'<tr>'
				+'<td>'+msg[i].divIndexName+'</td>'
				+'<td>'+msg[i].settlementUnit+'일</td>'
				+'<td>'+numberWithCommas(msg[i].minMargin)+'원</td>'
				+'<td>'+numberWithCommas(msg[i].maxMargin)+'원</td>'
				+'<td>'+msg[i].dividendRate+'%</td>'
				+'</tr>'
			);
		}
	});
	
	//실패시
	getfundingdividendpalnlist.fail(function(){
		alert('ajax통신실패');
	});
	
	
	
	//펀딩을 선택시 배당현황 리스트를 가져오는 ajax
	var getdividendpaylist = $.ajax({
		type : "get",
		url : "/pineapple/getdividendpaylist.pms",
		data : { fdCode : btn.value }
	});
	
	//성공시
	getdividendpaylist.done(function(msg){
		console.log("getdividendpaylist 성공시 매개변수 : "+msg);
		for(var i = 0; i<msg.length; i++){
			$('#divpaylist').append(
				'<tr>'
					+'<td>'+msg[i].divPayCode+'</td>'
					+'<td>'+msg[i].investId+'</td>'
					+'<td>'+numberWithCommas(msg[i].divPayissuePrice)+'원</td>'
					+'<td>'+msg[i].divPayPurchaseShares+'주</td>'
					+'<td>'+msg[i].divPayMinInterestRate+'%</td>'
					+'<td>'+msg[i].divPayDividendRate+'%</td>'
					+'<td>'+numberWithCommas(msg[i].divPayTotalMargin)+'원</td>'
					+'<td>'+numberWithCommas(msg[i].divPayAmount)+'원</td>'
					+'<td>'+msg[i].divPayDate+'</td>'
				+'</tr>'
			);
		}
	});
	
	
	//실패시
	getdividendpaylist.fail(function(){
		alert('ajax통신실패');
	});
}
</script>
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>