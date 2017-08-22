<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
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

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<script>
$(document).ready(function(){
	/*********** 펀딩을 선택하는 select option 채워줄 ajax *********/
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/getmyfundinglist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "id01@maver.com" }
	});
	// 성공시
	getfundinglist.done(function(msg){
		console.log(msg);
		
		//펀딩을 선택하는 select option 채워주는 코드 
		for(var i = 0; i<msg.length; i++){
			$('.fdselectlist').append(
				'<option value="'+msg[i].fdCode+'">'+msg[i].fdTitle+'</option>'
			);
		}
	});	
	// 실패시
	getfundinglist.fail(function(){
		alert('ajax통신실패');
	});

	
	/* 날짜를 yyyy-mm-dd 형태로 바꿔주는 함수 */
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join('-');
	}
	/*********** 펀딩을 셀렉트 했을때 투자자 리스트를 불러오는 ajax*********/
	$('#selectfd').change(function(){
		// 폼 초기화
		console.log($("#selectfd option:selected").val());
		$('#investorlist').html('');
		//console.log($("#selectfd option:selected").val());
		var getfundingdividendpalnlist = $.ajax({
			type : "get",
			url : "/pineapple/getfundinginvestorlist.pms",
			data : { fdCode : $("#selectfd option:selected").val() }
		});
		
		//성공시
		getfundingdividendpalnlist.done(function(msg){
			console.log(msg);
			for(var i = 0; i<msg.length; i++){
				$('#investorlist').append(
					'<tr>'
						+'<td>'+msg[i].investId+'</td>'
						+'<td>'+msg[i].purchaseShares+'</td>'
						+'<td>'+msg[i].payCheck+'</td>'
						+'<td>'+formatDate(msg[i].investTime)+'</td>'
					+'</tr>'
				);
			}
		});
		
		//실패시
		getfundingdividendpalnlist.fail(function(){
			alert('ajax통신실패');
		});
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
		<select class="fdselectlist" id="selectfd">
			<option value="null">선택해주세요</option>	
		</select><br><br>
		<table class="table">
			<thead>
				<tr>
					<td>투자자아이디</td>
					<td>구매주식수</td>
					<td>결제여부</td>
					<td>투자일</td>
				</tr>
			</thead>
			<!-- ajax요청으로 목록을 채워줌 -->
			<tbody id="investorlist"> 
						
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