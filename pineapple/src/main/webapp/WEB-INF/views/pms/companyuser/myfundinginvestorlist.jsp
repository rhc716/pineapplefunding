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
		data : { userId : "${id}"}
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
	/*********** 펀딩을 셀렉트 했을때 투자자 리스트를 불러오는 ajax && 공지하기 버튼을 보기에 해줌*********/
	$('#selectfd').change(function(){
		// 폼 초기화
		//console.log($("#selectfd option:selected").val());
		$('#investorlist').html('');
		
		// 선택했을때만 ajax통신
		if($("#selectfd option:selected").val()!="null"){
			var getfundinginvestorlist = $.ajax({
				type : "get",
				url : "/pineapple/getfundinginvestorlist.pms",
				data : { fdCode : $("#selectfd option:selected").val()}
			});
			
			//성공시 투자자 리스트를 investorlist에 채워줌
			getfundinginvestorlist.done(function(msg){
				console.log(msg);
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
			});
			
			//실패시
			getfundinginvestorlist.fail(function(){
				alert('ajax통신실패');
			});
			
		}
		
		//공지하기 버튼을 보이게 해줌.
		if($("#selectfd option:selected").val()!="null"){
			$('#employeebtn').show();
		} else {
			$('#employeebtn').hide();
		}
	});
	
	// 공지하기 버튼을 눌렀을때 모달안의 form에 투자자들의 아이디들을 input hidden 으로 추가해줌
	// 메세지를 보내줄 대상들을 배열로 넘겨서 컨트롤러에서 처리할 것임
	$('#employeebtn').click(function(){
		// console.log($('#investorlist').find("tr:eq(0)").find("td:eq(0)").text());
		// console.log($('#investorlist').find("tr").length);
		var inputidArr = new Array();
		for(var i=0; i<$('#investorlist').find("tr").length; i++ ){
			inputidArr[i] = $('#investorlist').find("tr:eq("+i+")").find("td:eq(0)").text();
		}
		console.log(inputidArr);
		
		$('#inputidArrArea').append(
				
		);
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
			<h1>펀딩투자자조회</h1>
			<span> 
				펀딩을 선택하면 <button class="btn btn-primary btn-sm disabled">공지하기</button> 버튼이 나옵니다<br>
				버튼을 누르면 투자자에게 공지가 가능합니다<br>
				(펀딩내의 투자자에게 전체 메세지)
			</span>
		</div>
		<div class="row">
			<div class="col-xs-6">
				<select class="fdselectlist" id="selectfd">
					<option value="null">선택해주세요</option>	
				</select>
			</div>
			<div class="col-xs-6" align="right" >
				<button type="button" id="employeebtn" style="display: none;" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" >
					공지하기
				</button>
			</div>
		</div>
		<br><br>
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
		<br>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
		  <div class="modal-dialog">
		  
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">공지하기</h4>
		      </div>
		      <div class="modal-body" id="emlist">
				<!-- 메세지 보내기 -->
				<form id="newmessageform" action="/pineapple/" method="post" style="padding: 30px 15px;">
					<input type="hidden" name="msgSendId" value="${id}">
					<div style="margin: 20px 0px;">
					<input type="hidden" name="msgReceiveId" value="">
					<label for="messagetitleinput">메세지 제목</label>
					<input id="messagetitleinput" name="msgTitle" type="text" class="form-control box1" placeholder="메세지 제목을 입력해 주세요">
					</div>
					<div style="margin: 20px 0px;">
					<label for="messagecontentinput">메세지 내용</label>
					<textarea id="messagecontentinput" name="msgContent" type="text" class="form-control box1" placeholder="메세지 내용을 입력해 주세요" style="height: 200px; resize: none;"></textarea>
					</div>
					<div id="inputidArrArea">
					
					</div>
					<div>
					<button class="btn btn-info" type="button">입력</button>
					</div>
		       </form>
		      </div>
		    </div>
		    
		  </div>
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