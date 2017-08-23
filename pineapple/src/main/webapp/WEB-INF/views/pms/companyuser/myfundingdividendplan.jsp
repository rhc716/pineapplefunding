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
		
		// 펀딩을 선택하는 select option 채워주는 코드
		// 개설요청중인 펀딩은 조회도 입력도 가능하지만, 그 외의 상태는 조회만 가능하다.
		for(var i = 0; i<msg.length; i++){
			switch(msg[i].fdStatus){
				case '개설요청' :
					$('.fdselectlist').append(
						'<option value="'+msg[i].fdCode+'">'+msg[i].fdTitle+'</option>'
					);
					break;
				default :
					$('#selectfdforview').append(
						'<option value="'+msg[i].fdCode+'">'+msg[i].fdTitle+'</option>'
					);
					break;
			}
					
			
		}
	});	
	// 실패시
	getfundinglist.fail(function(){
		alert('ajax통신실패');
	});

	/*********** 펀딩을 셀렉트 했을때 배당계획 리스트를 불러오는 ajax*********/
	$('#selectfdforview').change(function(){
		// 폼 초기화
		$('#dividendlist').html('');
		//console.log($("#selectfd option:selected").val());
		var getfundingdividendpalnlist = $.ajax({
			type : "get",
			url : "/pineapple/getfundingdividendpalnlist.pms",
			data : { fdCode : $("#selectfdforview option:selected").val() }
		});
		
		//성공시
		getfundingdividendpalnlist.done(function(msg){
			console.log(msg);
			for(var i = 0; i<msg.length; i++){
				switch(msg[i].fdStatus){
					// 펀딩상태가 개설요청중일때 삭제가능
					case '개설요청' :
						$('#dividendlist').append(
							'<tr>'
							+'<td>'+msg[i].divIndexName+'</td>'
							+'<td>'+msg[i].settlementUnit+'일</td>'
							+'<td>'+msg[i].minMargin+'원</td>'
							+'<td>'+msg[i].maxMargin+'원</td>'
							+'<td>'+msg[i].dividendRate+'%</td>'
							+'<td><a href="/pineapple/removefundingdividendpaln.pms?divCode='+msg[i].divCode+'">'
							+'<button type="button" class="btn btn-sm btn-danger deletebtn">삭제</button></a></td>'
							+'</tr>'
						);
					break;
					// 펀딩상태가 개설요청중이 아닐때 삭제 불가능		
					default :
						$('#dividendlist').append(
							'<tr>'
							+'<td>'+msg[i].divIndexName+'</td>'
							+'<td>'+msg[i].settlementUnit+'일</td>'
							+'<td>'+msg[i].minMargin+'원</td>'
							+'<td>'+msg[i].maxMargin+'원</td>'
							+'<td>'+msg[i].dividendRate+'%</td>'
							+'<td><a href="/pineapple/removefundingdividendpaln.pms?divCode='+msg[i].divCode+'">'
							+'</tr>'
						);
					break;
				}
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
	<div class="col-md-9">
		<span>
			<b>한 펀딩당 배당계획은 3개 이상이 좋습니다, 마감기준은 펀딩단위로 통일되어야 합니다.</b><br>
			<b>배당계획은 펀딩개설요청중에만 입력,삭제가 가능합니다. 이후에는 바꿀 수 없습니다.</b><br>
			<br>ex) 마감기준 : 30 / 최소마진 : 1000 / 최대마진 : 2000 / 배당율 : 1
			<br>=> 30일 기준으로 계산된 마진이 1000~2000(원) 사이일때 마진의 1%를
			<br>=> 구매 구좌수의 비율만큼 배당해줌.  	
			<hr>
		</span>
		<div class="col-md-3">
			<form action="/pineapple/adddividendplan.pms" method="post">
				펀딩명
				<select name="divFdCode" class="fdselectlist">
				<option value="null">선택해주세요</option>
					<!-- ajax요청으로 목록을 채워줌 -->
				</select><br><br>
				배당기준명
				<input type="text" class="form-control" name="divIndexName"><br>
				마감기준(일)
				<input type="number" class="form-control" name="settlementUnit" min="30" max="999"><br>
				최소마진(원)
				<input type="number" class="form-control" name="minMargin" min="0"><br>
				최대마진(원)
				<input type="number" class="form-control" name="maxMargin" min="0"><br>
				배당율(%)
				<input type="number" class="form-control" name="dividendRate" min="0" max="100"><br>
				<button type="submit" class="btn btn-success">입력완료</button>
			</form>
		</div>
		<div class="col-md-9" id="myfundinglist">
		<!-- 펀딩배당계획 리스트 뿌려질 곳 -->
		<b> 펀딩배당계획 보기 </b>
		<select class="fdselectlist" id="selectfdforview">
			<option value="null">선택해주세요</option>	
		</select><br><br>
			<table class="table">
				<thead>
					<tr>
						<td>기준명</td>
						<td>마감기준</td>
						<td>최소마진</td>
						<td>최대마진</td>
						<td>배당율</td>
						<td>삭제버튼</td>
					</tr>
				</thead>
				<!-- ajax요청으로 목록을 채워줌 -->
				<tbody id="dividendlist"> 
							
				</tbody>
			</table>
		</div>
	</div>

</div>

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>