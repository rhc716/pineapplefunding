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
	// 펀딩의 투자자 리스트를 불러오는  ajax 
	var getfundinginvestorlist = $.ajax({
		type : "get",
		url : "/pineapple/fundingrefundlist.invest",
		data : { fdCode : ${param.fdCode} }
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
			<div class="pagetitleandexplainbox"> 
					<h1>펀딩의 환불대상 투자자들</h1>
					<b>결제모집실패로 인한 환불시 <b style="color: red;">환불대상 투자자들</b>에게 <b style="color: red;">모두 환불</b>됩니다.</b>
			</div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<td colspan="4">
							<a href="/pineapple/fundingrefundinsert.invest?fdCode=${param.fdCode}">
							<button type="button" id="refundbtn" class="btn-block btn btn-warning">환불하기</button>
							</a>
							</td>
						</tr>
					</thead>
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
	<script>

	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join(',');
	}
	function investormoreList(btn){
		//console.log("moreList에서 받은 매개변수 : "+btn);
		//console.log("moreList 매개변수로 들어온 (버튼객체)의 value = 페이징 "+btn.value);
	    $.ajax({
	        url : "/pineapple/fundingrefundlist.invest",
	        type : "get",
	        cache : false,
	        dataType: 'json',
	        data : {
	        	fdCode : ${param.fdCode}
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
	    			for(var i = 0; i<data.length; i++){
	    				var paychecktext = "";
	    				if(data[i].payCheck=='0'){
	    					paychecktext = "미결제";
	    				}else{
	    					paychecktext = "결제";
	    				}
	    				$('#investorlist').append(
	    					'<tr>'
	    						+'<td class="refundidlist">'+data[i].investId+'</td>'
	    						+'<td>'+data[i].purchaseShares+'</td>'
	    						+'<td>'+paychecktext+'</td>'
	    						+'<td>'+formatDate(data[i].investTime)+'</td>'
	    					+'</tr>'
	    				);
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
	</script>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>