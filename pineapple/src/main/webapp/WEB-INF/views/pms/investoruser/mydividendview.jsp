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
<script>
$(document).ready(function(){
	// 자신이 투자한 펀딩 리스트를 불러오는  ajax
	var getinvestorfundinglist = $.ajax({
		type : "get"
		,url : "/pineapple/getinvestorfundinglist.pms"
		,data : {userId : "${id}"}
	});
	
	//성공시 펀딩 리스트를 뿌려줌
	getinvestorfundinglist.done(function(msg){
		console.log(msg);
		
		for(var i=0; i<msg.length; i++){
			var payCheckStr = "";
			if(msg[i].payCheck==1){
				payCheckStr = "결제"
			} else {
				payCheckStr = "미결제"
			}
			
			$('#fdlistgroup').append(
				'<tr>'
				+'<td>'+msg[i].fdTitle+'</td>'
				+'<td>'+msg[i].purchaseShares+'</td>'
				+'<td>'+msg[i].investTime+'</td>'
				+'<td>'+payCheckStr+'</td>'
				+'<td><button type="button" class="btn-block btn-primary btn" onclick="javascript:fdbtnclick(this)"' 
				+'value="'+msg[i].fdCode+'">정보보기</button></td>'
				+'</tr>'
			);
		}
	});
	
	//실패시
	getinvestorfundinglist.fail(function(){
		alert('getallfundinglist ajax통신실패');
	});


});	

</script>

<style type="text/css">
	h1,h2, h4 {
		text-align: center;
	}
	.pagetitleandexplainbox {
		padding:0px 0px !important;
	}
	#fdlistgroup{
		height: 300px;
		overflow: scroll;
		overflow-x: hidden; 
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
				<h1>투자한 펀딩 리스트</h1>
			</div>
		</div>
		<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="info">
						<td>펀딩명</td>
						<td>구입주식수</td>
						<td>투자일</td>
						<td>결제여부</td>
						<td>정보보기</td>
					</tr>
				</thead>
				<tbody id="fdlistgroup">
				</tbody>
		</table>
		<div class="row">
			<div class="pagetitleandexplainbox"> 
				<h1> 정보보기를 누르시면 정보가 나옵니다 </h1>
			</div>
		</div>
		<div class="pagetitleandexplainbox"> 
			<h2> 배당내역 </h2>
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
			<tbody id="divlist">
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
//금액에 콤마찍어주는 함수			
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//정보보기 버튼을 눌렀을때
function fdbtnclick(btn){
	console.log(btn.value);
	
	/* 펀딩 보고서 리스트 불러올 ajax */
	var getdividendpaylist = $.ajax({
		type : "get",
		url : "/pineapple/getdividendpaylist.pms",
		data : { fdCode : btn.value},
		async : false
	});
	
	// 성공시
	getdividendpaylist.done(function(msg){
		//초기화
		$('#divlist').html("");
		console.log("펀딩파일ajax 요청결과 : "+msg);
		//파일목록이 없으면 문구를 뜨게함
		if(msg==""){
			$('#divlist').append(
				'<tr>'
					+'<td colspan="9" align="center"><b>배당내역이 없습니다</b></td>'
				+'</tr>'
			);
		
		} else {
			for(var i = 0; i<msg.length; i++){
				$('#divlist').append(
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
		}
	
	});
	// 실패시
	getdividendpaylist.fail(function(){
		alert('getfundingfilelist ajax통신실패');
	});
}
</script>
<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>