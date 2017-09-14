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
				data : { fdCode : $("#selectfd option:selected").val()
				}
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
				
				$('#investorlist').append(
						'<tr id="addlistbtnarea">'
							+'<td colspan="4">'
							// 버튼에 value를 넣어서 페이징 (numberOfRequests)으로 활용한다.
							+'<button type="button" onclick="javascript:moreList(this)" id="addlistbtn" value="1" class="btn-block btn btn-primary">'
							+'더보기</button>'
							+'</td>'
						+'</tr>'
				);
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
	
		
	
	//공지하기 유효성검사
	//제목은 4글자 이상
	$('#messagetitleinput').blur(function(){
		if($('#messagetitleinput').val().length < 4){
			$('#msgchecktext').css("color","#FF0000");
			$('#msgchecktext').val('제목을 4글자 이상 입력해주세요');
			$('#msgcheck').val("0");
		} else {
			$('#msgchecktext').css("color","#008000");
			$('#msgchecktext').val('사용할 수 있는 제목입니다');
		}
	});
	
	$('#messagecontentinput').focus(function(){
		if($('#messagetitleinput').val().length < 4){
			$('#msgchecktext').css("color","#FF0000");
			$('#msgchecktext').val('제목을 먼저 작성해주세요');
			$('#msgcheck').val("0");
			$('#messagetitleinput').focus();
		}
	});
	//내용은 10글자 이상
	$('#messagecontentinput').blur(function(){
		if($('#messagecontentinput').val().length < 10){
			$('#msgchecktext').css("color","#FF0000");
			$('#msgchecktext').val('내용은 10글자 이상 작성해주세요');
			$('#msgcheck').val("0");
		} else {
			$('#msgchecktext').css("color","#008000");
			$('#msgchecktext').val('메세지를 보낼 수 있습니다');
			$('#msgcheck').val("1");
		}
	});
	
	
	
	// 공지하기에서 입력 버튼을 눌렀을때 펀딩코드를 가져와서 펀딩코드에 해당하는 모든 투자자에게 메세지를 보내는 ajax요청
	$('#messagesubmitbtn').click(function(){
		if($('#msgcheck').val()=="1"){
			var answer = confirm("메세지를 보내시겠습니까?")
			if (answer) {
				var sendmessageallinvestors = $.ajax({
					type : "post",
					url : "/pineapple/sendmessageallinvestors.pms",
					data : { fdCode : $("#selectfd option:selected").val()
						,msgTitle : $('#messagetitleinput').val()
						,msgContent : $('#messagecontentinput').val()
						,msgSendId : "${id}"
					}
				});
				
				//성공시 성공여부를 출력해줌
				sendmessageallinvestors.done(function(msg){
					// 메세지 보내기 몇명 성공했는지 alert로 띄워주고
					alert(msg);
					// 모달안의 내용을 초기화해주고 닫아줌
					$('#messagetitleinput').val("");
					$('#messagecontentinput').val("");
					$('#myModal').modal('hide');
				});
				
				//실패시
				sendmessageallinvestors.fail(function(){
					alert('sendmessageallinvestors ajax통신실패');
				});
			}
		} else {
			alert('메세지를 보내려면 제목과 내용을 입력해주셔야 합니다');
		}
		
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
					<input id="messagetitleinput" name="msgTitle" type="text" class="form-control box1" placeholder="제목에 공지임을 밝혀주세요">
					</div>
					<div style="margin: 20px 0px;">
					<label for="messagecontentinput">메세지 내용</label>
					<textarea id="messagecontentinput" name="msgContent" class="form-control box1" placeholder="메세지 내용을 입력해 주세요" style="height: 200px; resize: none;"></textarea>
					</div>
					<div>
						<input type="hidden" id="msgcheck" value="0">
						<input type="text" class="form-control" id="msgchecktext" readonly><br>
						<button id="messagesubmitbtn" class="btn btn-info" type="button">입력</button>
					</div>
		       </form>
		      </div>
		    </div>
		    
		  </div>
		</div>
		
	</div>
</div>
<script>
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

// 더보기버튼 실행 함수 (ajax 요청)
function moreList(btn){
	console.log("moreList에서 받은 매개변수 : "+btn);
	console.log("moreList 매개변수로 들어온 (버튼객체)의 value = 페이징 "+btn.value);
    $.ajax({
        url : "/pineapple/getfundinginvestorlist.pms",
        type : "get",
        cache : false,
        dataType: 'json',
        data : {
        	fdCode : $("#selectfd option:selected").val()
        	,numberOfRequests : btn.value },
        success : function(data){
            console.log(data);
            
            if(data.length==0){
            	// 더 불러올 펀딩 목록이 없는 경우
            	$('#addlistbtn').attr("class","btn btn-primary btn-block disabled");
            	$('#addlistbtn').text("더 불러올 투자자 목록이 없습니다");
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
	            	'<tr id="addlistbtnarea">'
						+'<td colspan="4">'
						+'<button type="button" onclick="javascript:moreList(this)" id="addlistbtn" value="'+btn.value+1+'" class="btn-block btn btn-primary">'
						+'더보기</button>'
						+'</td>'
					+'</tr>'
	            //console.log("content : "+content);
	            $('#addlistbtnarea').remove();
	            $('#investorlist').append(content);
	       	}
            
        }, 
        error : function(){
           alert('ajax 통신 실패');
        }
   
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