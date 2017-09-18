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
		<div class="row">
			<div class="col-xs-6">
				<div class="pagetitleandexplainbox"> 
					<h2> 보고서파일 </h2>
				</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr class="info">
							<td>보고서명</td>
							<td>보고서확장자</td>
							<td>용량</td>
							<td>다운로드버튼</td>
						</tr>
					</thead>
					<tbody id="fdfilelist">
					</tbody>
				</table>
			</div>
			<div class="col-xs-6">
				<div class="pagetitleandexplainbox"> 
					<h2> 배당계획 </h2>
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
					<tbody id="divlist">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 풋터 -->
<script type="text/javascript" >
// 용량 보기 쉽게 변환해주는 코드
function number_to_human_size(x) {
	  var s = ['bytes', 'kB', 'MB', 'GB', 'TB', 'PB'];
	  var e = Math.floor(Math.log(x) / Math.log(1024));
	  return (x / Math.pow(1024, e)).toFixed(2) + " " + s[e];
};


//정보보기 버튼을 눌렀을때
function fdbtnclick(btn){
	console.log(btn.value);
	
	/* 펀딩 보고서 리스트 불러올 ajax */
	var getfundingfilelist = $.ajax({
		type : "get",
		url : "/pineapple/getfundingfilelist.pms",
		data : { fdCode : btn.value},
		async : false
	});
	
	// 성공시
	getfundingfilelist.done(function(msg){
		//초기화
		$('#fdfilelist').html("");
		console.log("펀딩파일ajax 요청결과 : "+msg);
		//파일목록이 없으면 문구를 뜨게함
		if(msg==""){
			$('#fdfilelist').append(
				'<tr>'
					+'<td colspan="5" align="center"><b>펀딩보고서 파일이 없습니다</b></td>'
				+'</tr>'
			);
		
		} else {
			for(var i = 0; i<msg.length; i++){
				// 펀딩파일의 목록을 화면에 뿌려줌 
				$('#fdfilelist').append(
					'<tr>'
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
	
	
	// 펀딩의 배당계획 리스트를 가져오는 ajax
	var getfundingdividendpalnlist = $.ajax({
		type : "get",
		url : "/pineapple/getfundingdividendpalnlist.pms",
		data : { fdCode : btn.value }
	});
	
	//성공시
	getfundingdividendpalnlist.done(function(msg){
		//console.log(msg);
		//초기화
		$('#divlist').html("");
		//배당계획이 없으면 문구를 출력
		if(msg==""){
			$('#divlist').append(
					'<tr>'
						+'<td colspan="5" align="center"><b>배당계획이 없습니다</b></td>'
					+'</tr>'
			);
		}else{
			for(var i = 0; i<msg.length; i++){
				$('#divlist').append(
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
}
</script>
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>