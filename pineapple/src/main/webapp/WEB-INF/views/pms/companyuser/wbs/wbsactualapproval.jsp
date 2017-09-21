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

<!-- css lsk -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lsk.css" />


<!-- 구글차트  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
	h1, h4 {
		text-align: center;
	}
	.pagetitleandexplainbox {
		padding:0px 0px !important;
	}
	.morebtn{
		text-align: center;
		padding: 10px 40%;
	}
	#fdlistgroup{
		height: 300px;
		overflow: scroll;
		overflow-x: hidden;
	}
</style>

<script type="text/javascript">
$(document).ready(function(){

	
	$('.modal').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	});

	 //인서트내용

	//(마감, 모집실패 제외) 펀딩 리스트를 불러오는  ajax
	var getallfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/getmyfundinglist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}"}
	});
	
	//성공시 펀딩 리스트를 뿌려줌
	getallfundinglist.done(function(msg){
		console.log(msg);
		
		$('#mymslistselect').html('')
		$('#chart_div').html('')
		$('#chart_btnarea').html('')
		$('#mymslistselect').append(
				'<select name="acmscode" id="mymslist">'
				+'<option>마일스톤 선택</option>'
				+'</select>'
				
			);
		
		for(var i=0; i<msg.length; i++){
			$('#fdlistgroup').append(
				'<button class="list-group-item" onclick="javascript:fdbtnclick(this)"' 
				+'value="'+msg[i].fdCode+'">'+msg[i].fdTitle+'</button>'
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
		<div class="pagetitleandexplainbox">
			<h4>
				<b>펀딩 <i class="glyphicon glyphicon-triangle-right"></i> 
				마일스톤</b><br>
				순서대로 선택해주세요
			</h4>
		</div>
		<div class="row">
			<div class="col-xs-5">
				<div class="pagetitleandexplainbox"> 
					<h1>펀딩</h1>
				</div>
			</div>
			<div class="col-xs-2"></div>
			<div class="col-xs-5">
				<div class="pagetitleandexplainbox"> 
					<h1>마일스톤</h1>
				</div>
			</div>
		</div>
		<!-- 펀딩,마일스톤,wbs계획 리스트 들어갈 곳 -->
		<div class="row">
			<div class="col-xs-5">
				<div class="pagetitleandexplainbox"> 
					<div class="list-group" id="fdlistgroup">
					</div>
				</div>
			</div>
			<div class="col-xs-2"></div>
			<div class="col-xs-5">
				<div class="pagetitleandexplainbox"> 
					<div class="list-group" id="mslistgroup">
						<button class="list-group-item active">펀딩을 선택해주세요</button>
					</div>
				</div>
			</div>
			
		</div>
		<div class="pagetitleandexplainbox">
			<h2 align="center">
				승인 요청중인 WBS
			</h2>
			<h4>마일스톤을 선택해주세요</h4>
		</div>
		<div class="pagetitleandexplainbox">
				<div class="boder listgroup">
					<table id="approvallist">
						 <tr>
							 <th>WBS코드</th>
							 <th>WBS이름</th>
							 <th>시작일</th>
							 <th>종료일</th>
							 <th>승인</th>
							 <th>취소</th>
						 </tr>
					 </table>
				</div>
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



// 펀딩을 선택시 마일스톤 리스트를 가져오는 ajax 
function fdbtnclick(btn){
	console.log("선택한 펀딩코드 : "+btn.value);
	var getmilestonelist = $.ajax({
		type : "get",
		url : "/pineapple/getmilestonelistoffunding.pms",
		data : { fdCode : btn.value }
	});
	var wbsfdinsert = btn.value;
	$('#wbsfdinsert').html('');
	$('#wbsfdinsert').append(
		'<input type="hidden" name="wbsActualFdCode" value="'+wbsfdinsert+'">'
	);
	//성공시
	getmilestonelist.done(function(msg){
		console.log(msg);

		$('#mscode').append(
				'<input type="hidden" name="wbsActualMsCode" value="'+msg[0].msComCode+'"/>'
				)
		
		
		$('#mymslistselect').html('');
		$('#chart_div').html('');
		$('#chart_btnarea').html('');
		$('#mymslistselect').append(
				'<select name="wbsActualMsCode" id="mymslist">'
				+'<option>마일스톤 선택</option>'
				+'</select>'
				
			);
		// 받아온 마일스톤 목록이 없을때
		if(msg.length==0){
			$('#mslistgroup').html(
				'<button class="list-group-item active">목록이 없습니다</button>'
			);
		} else {
			//받아온 마일스톤 목록이 있을때
			//내용한번 리셋후 리스트를 채워넣음
			$('#mslistgroup').html('');
			for(var i=0; i<msg.length; i++){
				$('#mslistgroup').append(
					'<button class="list-group-item" onclick="javascript:msbtnclick(this)"' 
					+'value="'+msg[i].milestoneCode+'">'+msg[i].milestoneName+'</button>'
				);
			}
		}
	});
	
	//실패시
	getmilestonelist.fail(function(){
		
	});
	
	
}


//마일스톤 선택시 WBS 예상 간트차트를 띄워주고 WBS 계획별 목록을 보여줌
function msbtnclick(btn){
	console.log(btn.value);
	var wbsplanlist = $.ajax({
		type : "post",
		url : "/pineapple/Wbsactuallist.pms",
		/* 마일스톤으로 검색 */
		data : { milestoneCode : btn.value }
	});
	
	console.log(wbsmsinsert);
	
	var wbsmsinsert = btn.value;
	console.log(wbsmsinsert);
	
	
	// 성공시
	wbsplanlist.done(function(msg){
		console.log(msg);
		for(i=0; msg.length>i; i++){
			if(msg[i].wbsActualEndDate!=null&&msg[i].wbsActualApprovalDate==null){
				$('#approvallist').append(
						'<tr>'
						 +'<td>'+msg[i].wbsActualCode+'</td>'
						 +'<td>'+msg[i].wbsActualName+'</td>'
						 +'<td>'+msg[i].wbsActualStartDate+'</td>'
						 +'<td>'+msg[i].wbsActualEndDate+'</td>'
						 +'<td class="minitd">'
						 +'<button type="submit" class="btn btn-info  minibtn" id="approvalbtn" value="'+msg[i].wbsActualCode+'">WBS승인</button>'
						 +'</td>'
						 +'<td class="minitd">'
						 +'<button type="submit" class="btn btn-danger  minibtn" id="noapprovalbtn" value="'+msg[i].wbsActualCode+'">WBS취소</button>'
						 +'</td>'
						 +'</tr>'
				)
			}
		}
		

		$('#approvalbtn').click(function () {
			var answer = confirm("WBS를 승인하시겠습니까?")
			if (answer) {
				var ss = $(this).val();
				var test = $.ajax({
					type : "post",
					url : "/pineapple/approvalupdate.pms",
					/* 아이디 세션에서 받아서 가져옴 */
					data : { wbsActualCode : ss }
				}); 
				test.done(function(){
					location.reload();
					alert('WBS를 승인하였습니다.')
				})
				test.fail(function(){
					location.reload();
					alert('WBS승인을 실패하였습니다.')
				})
			}else{
			}
		});
		$('#noapprovalbtn').click(function () {
			var answer = confirm("WBS완료를 취소하시겠습니까?")
			if (answer) {
				var ss = $(this).val();
				var test = $.ajax({
					type : "post",
					url : "/pineapple/noapprovalupdate.pms",
					/* 아이디 세션에서 받아서 가져옴 */
					data : { wbsActualCode : ss }
				}); 
				test.done(function(){
					location.reload();
					alert('WBS완료를 취소하였습니다.')
				})
				test.fail(function(){
					location.reload();
					alert('WBS완료취소를 실패하였습니다.')
				})
			}else{
			}
		});
	
				
	});
	
	
	// 실패시
	wbsplanlist.fail(function(){
		alert('wbsplanlist ajax통신실패');
	});

}

// WBSPLAN 선택시 이벤트 함수

function wbsplanbtnclick(btn){
	console.log(btn);
}


</script>
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>