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
			$('#fdlistgroup').append(
				'<tr>'
				+'<td><button class="list-group-item" onclick="javascript:fdbtnclick(this)"' 
				+'value="'+msg[i].fdCode+'">'+msg[i].fdTitle+'</button></td>'
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
	#fdlistgroup,#wbslistgroup{
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
				<h4>
					<b>펀딩 <i class="glyphicon glyphicon-triangle-right"></i> 
					마일스톤<i class="glyphicon glyphicon-triangle-right"></i> 
					WBS계획</b><br>
					순서대로 선택해주세요
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4">
				<div class="pagetitleandexplainbox">
					<h4>
						<b>펀딩</b>
					</h4>
				</div>
				<div id="fdlistgroup">
				</div>
			</div>
			<div class="col-xs-4">
				<div class="pagetitleandexplainbox">
					<h4>
						<b>마일스톤</b>
					</h4>
				</div>
				<div id="mslistgroup">
				</div>
			</div>
			<div class="col-xs-4">
				<div class="pagetitleandexplainbox">
					<h4>
						<b>WBS계획</b>
					</h4>
				</div>
				<div id="wbslistgroup">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="pagetitleandexplainbox">
				<h4>
					<b>WBS 계획차트</b>
				</h4>
			</div>
			<div id="chart_div">
				
			</div>
		</div>
		<div class="row">
			<div class="pagetitleandexplainbox">
				<h2 align="center">
					WBS 상세투입요소
				</h2>
				<h4>WBS를 선택해주세요</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 boder listgroup">
				<div class="pagetitleandexplainbox">
					<h4 align="center">
						인원
					</h4>
				</div>
				<table>
					<thead>
						 <tr>
							 <th>인원수</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </thead>
					 <tbody id="humanlist">
					 
					 </tbody>
				 </table>
			</div>
			<div class="col-md-6 boder listgroup">
				<div class="pagetitleandexplainbox">
					<h4 align="center">
						장비
					</h4>
				</div>
				<table>
					<thead>
						 <tr>
							 <th>장비명</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </thead>
					 <tbody id="materiallist">
					 </tbody>
				 </table>
			</div>
		</div><br>
		<div class="row">
			<div class="col-md-6 boder listgroup">
				<div class="pagetitleandexplainbox">
					<h4 align="center">
						시설
					</h4>
				</div>
				<table>
					<thead>
						 <tr>
							 <th>시설명</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </thead>
					 <tbody id="facilitylist">
					 </tbody>
				 </table>
			</div>
			<div class="col-md-6 boder listgroup">
				<div class="pagetitleandexplainbox">
					<h4 align="center">
						외주
					</h4>
				</div>
				<table>
					<thead>
						 <tr>
							 <th>업체명</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </thead>
					 <tbody id="outlist">
					 
					 </tbody>
				 </table>
			</div>
		</div><br>
		<div class="row">
			<div class="col-md-6 boder listgroup">
				<div class="pagetitleandexplainbox">
					<h4 align="center">
						기타
					</h4>
				</div>
				<table>
					 <thead>
						 <tr>
							 <th>용도</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </thead>
					 <tbody id="etclist">
					 
					 </tbody>
				 </table>
			</div>
			<div class="col-md-6 boder listgroup">
				<div class="pagetitleandexplainbox">
					<h4 align="center">
						수익
					</h4>
				</div>
				<table>
					<thead>
						 <tr>
							 <th>수익사유</th>
							 <th>수익</th>
							 <th>수익일</th>
						 </tr>
					 </thead>
					 <tbody id="incomelist">
					 
					 </tbody>
				 </table>
			</div>
		</div><br>
		
	</div>
</div>



<script>
// 펀딩을 선택시 마일스톤 리스트를 가져오는 ajax 
function fdbtnclick(btn){
	console.log("선택한 펀딩코드 : "+btn.value);
	var getmilestonelist = $.ajax({
		type : "get",
		url : "/pineapple/getmilestonelistoffunding.pms",
		data : { fdCode : btn.value }
	});
	//성공시
	getmilestonelist.done(function(msg){
		console.log(msg);
		// 받아온 마일스톤 목록이 없을때
		if(msg.length==0){
			$('#mslistgroup').html(
				'<button class="list-group-item active">목록이 없습니다</button>'
			);
			$('#wbslistgroup').html(
				'<button class="list-group-item active">목록이 없습니다</button>'
			);
		} else {
			//받아온 마일스톤 목록이 있을때
			//내용한번 리셋후 리스트를 채워넣음
			$('#mslistgroup').html('');
			$('#wbslistgroup').html('');
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
		url : "/pineapple/Wbsplanlist.pms",
		/* 마일스톤으로 검색 */
		data : { milestoneCode : btn.value }
	});
	// 성공시
	wbsplanlist.done(function(msg){

		console.log(msg);
		    
	 	// 받아온 WBSPLAN 목록이 없을때
		if(msg.length==0){
			$('#wbslistgroup').html(
				'<button class="list-group-item active">목록이 없습니다</button>'
			);
		} else {
			//받아온 WBSPLAN 목록이 있을때
			//내용한번 리셋후 리스트를 채워넣음
			$('#wbslistgroup').html('');
			for(var i=0; i<msg.length; i++){
				$('#wbslistgroup').append(
					'<button class="list-group-item" onclick="javascript:wbsplanbtnclick(this)"' 
					+'value="'+msg[i].wbsPlanCode+'">'+msg[i].wbsPlanName+'</button>'
				);
			}
		}
		
		
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

}

// WBSPLAN 선택시 이벤트 함수

function wbsplanbtnclick(btn){
	console.log(btn.value);
	// 버튼 누를때마다 초기화 시키고 목록을 다시 불러옴.
	$('#humanlist').html("");
	$('#materiallist').html("");
	$('#facilitylist').html("");
	$('#outlist').html("");
	$('#etclist').html("");
	$('#incomelist').html("");
	var getwbsplanlist = $.ajax({
		type : "get",
		url : "/pineapple/wbsplanlistview.pms",
		data : { wbsplancode : btn.value }
	});

	getwbsplanlist.done(function(msg){
	
		for(var i = 0; i<msg.wbsplanhuman.length; i++){
			$('#humanlist').append(
					'<tr>'
					+'<td>'+msg.wbsplanhuman[i].wphNoPeople+'</td>'
					+'<td>'+msg.wbsplanhuman[i].wphCost+'</td>'
					+'<td>'+msg.wbsplanhuman[i].wphRemarks+'</td>'	
					+'<td>'+msg.wbsplanhuman[i].wphDate+'</td>'	
					+'</tr>'
			)
	
		}	
		for(var i = 0; i<msg.wbsplanmaterial.length; i++){
			$('#materiallist').append(
					'<tr>'
					+'<td>'+msg.wbsplanmaterial[i].wpmName+'</td>'
					+'<td>'+msg.wbsplanmaterial[i].wpmCost+'</td>'
					+'<td>'+msg.wbsplanmaterial[i].wpmRemarks+'</td>'	
					+'<td>'+msg.wbsplanmaterial[i].wpmDate+'</td>'	
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsplanfacility.length; i++){
			$('#facilitylist').append(
					'<tr>'
					+'<td>'+msg.wbsplanfacility[i].wpfName+'</td>'
					+'<td>'+msg.wbsplanfacility[i].wpfCost+'</td>'
					+'<td>'+msg.wbsplanfacility[i].wpfRemarks+'</td>'	
					+'<td>'+msg.wbsplanfacility[i].wpfDate+'</td>'	
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsplanout.length; i++){
			$('#outlist').append(
					'<tr>'
					+'<td>'+msg.wbsplanout[i].wpoOutComName+'</td>'
					+'<td>'+msg.wbsplanout[i].wpoCost+'</td>'
					+'<td>'+msg.wbsplanout[i].wpoRemarks+'</td>'	
					+'<td>'+msg.wbsplanout[i].wpoDate+'</td>'	
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsplanetc.length; i++){
			$('#etclist').append(
					'<tr>'
					+'<td>'+msg.wbsplanetc[i].wpePurpose+'</td>'
					+'<td>'+msg.wbsplanetc[i].wpeCost+'</td>'
					+'<td>'+msg.wbsplanetc[i].wpeRemarks+'</td>'	
					+'<td>'+msg.wbsplanetc[i].wpeDate+'</td>'	
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsplanincome.length; i++){
			$('#incomelist').append(
					'<tr>'
					+'<td>'+msg.wbsplanincome[i].wpiReason+'</td>'
					+'<td>'+msg.wbsplanincome[i].wpiIncome+'</td>'
					+'<td>'+msg.wbsplanincome[i].wpiDate+'</td>'	
					+'</tr>'
			)
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