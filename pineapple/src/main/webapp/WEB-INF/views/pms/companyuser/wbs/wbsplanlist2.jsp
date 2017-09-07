<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- css lsk -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lsk.css" />

<!-- 구글차트  -->
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
 <script>
 
/* 마일스톤 리스트 불러올 ajax */
$(document).ready(function(){
	var message = "${message}";
		if(message!="") alert(message);
	
	var wbsplanlist = $.ajax({
		type : "post",
		url : "/pineapple/Wbsplanlist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { milestoneCode : "${milestoneCode}" }
	});
	// 성공시
	wbsplanlist.done(function(msg){
	
		console.log(msg);
		
		
		/* 날짜를 yyyy-mm-dd 형태로 바꿔주는 함수 */
		function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) month = '0' + month;
		    if (day.length < 2) day = '0' + day;

		    return [year, month, day].join(',');
		}
		
	
		/* for(var l = 0; l<msg.length; l++){
			$('.wbsdc').append(
			'<option value="'+msg[l].wbsPlanName+'">'+msg[l].wbsPlanName+'</option>'
			)
		} */
		 	google.charts.load('current', {'packages':['gantt']});
		    google.charts.setOnLoadCallback(drawChart);


		    function drawChart() {

		      var data = new google.visualization.DataTable();
		      data.addColumn('string', 'Task ID');
		      data.addColumn('string', 'Task Name');
		      data.addColumn('date', 'Start Date');
		      data.addColumn('date', 'End Date');
		      data.addColumn('number', 'Duration');
		      data.addColumn('number', 'Percent Complete');
		      data.addColumn('string', 'Dependencies');
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
		      	
               

		     
			 	/* 		'<div class="col-lg-4 well">'
		 				+'<div>'
		 				+'wbs이름 :'+msg[i].wbsPlanName+'<br>'
		 				+'<button type="button" class="btn btn-info btn-sm" >수정</button>'
		 				+'<form action="/pineapple/wbsplandetail.pms" method="post">'
		 				+'<button type="submit" class="btn btn-danger btn-sm" name="btn" value="delete">삭제</button>'
		 				+'<button type="submit" class="btn btn-primary btn-sm" name="btn" value="detail">상세정보</button>'				 				
		 				+'<div class="modal fade" id="'+msg[i].wbsPlanCode+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'
		 				+'<div class="modal-dialog" role="document">'
		 				+'<div class="modal-content">'
		 				+'<div class="modal-body">'
		 				+'<label for="wbsplan">WBS수정</label><br>'
		 				+'작업명:'
		 				+'<input type="text" class="form-control" name="wbsPlanName2" value="'+msg[i].wbsPlanName+'" readonly/>'
		 				+'<input type="text" class="form-control" name="wbsPlanName" value="'+msg[i].wbsPlanName+'"/>'
		 				+'선행작업:'
		 				+'<input type="text" class="form-control" name="wbsPlanDependency2" value="'+msg[i].wbsPlanDependency+'" readonly/>'
		 				+'<select name="wbsPlanDependency" class="wbsdc">'
		 				+'<option value="없음"> 없음</option>'
		 				+'</select><br>'
		 				+'작업기간:'
		 				+'<input type="number" class="form-control" name="wbsPlanDuration2" value="'+msg[i].wbsPlanDuration+'"readonly/>'
		 				+'<input type="number" class="form-control" name="wbsPlanDuration" value="'+msg[i].wbsPlanDuration+'"/>'
		 				+'시작일:<br>'
		 				+'<input type="date" name="wbsPlanStartDate2" value="'+msg[i].wbsPlanStartDate+'"readonly/><br>'
		 				+'<input type="date" name="wbsPlanStartDate" value="'+msg[i].wbsPlanStartDate+'"/><br>'
		 				+'담당자ID:'
		 				+'<input type="text" class="form-control" name="wbsPlanManager2" value="'+msg[i].wbsPlanManager+'"readonly/><br>'
		 				+'<input type="text" class="form-control" name="wbsPlanManager" value="'+msg[i].wbsPlanManager+'"/><br>'
		 				+'<input type="hidden" name="wbsPlanCode" value="'+msg[i].wbsPlanCode+'"/>'
		 				+'<input type="hidden" class="form-control" name="wbsPlanComCode" value="'+msg[i].wbsPlanComCode+'">'
		 				+'<input type="hidden" class="form-control" name="wbsPlanFdCode" value="'+msg[i].wbsPlanFdCode+'">'
		 				+'<input type="hidden" class="form-control" name="wbsPlanOrder" value="'+msg[i].wbsPlanOrder+'">'
		 				+'<input type="hidden" class="form-control" name="wbsPlanMsCode" value="'+msg[i].wbsPlanMsCode+'">'
		 				+'<input type="hidden" class="form-control" name="wbsPlanChange" value="'+msg[i].wbsPlanChange+'">'
		 				+'<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">'
		 				+'<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">'
		 				+'<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">'
		 				+'<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">'
		 				+'<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">'
		 				+'<button type="submit" name="btn" value="update">입력완료</button>'
		 				+'</div>'
		 				+'</div>'
		 				+'</div>'
		 				+'</div>'
		 				+'</form>'
		 				+'</div>'
		 				+'</div>'
				); */
		      	
		      	
		      	
		      	
		      	
		      	
		      /* 차트를 그릴때에 버튼도 함께 그려넣어줌  */
		      $('#chart_btnarea').append(
	    		 	'<div style="height:42px; padding-top:6px;">'
	    		 	+msg[s].wbsPlanName
	    		 	+'<form action="/pineapple/wbsplandetail.pms" method="post">'
	    		  	+'<button type="submit" class="btn btn-primary btn-sm" name="btn" value="detail">상세정보</button>'		
	    		  	+'<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#'+msg[s].wbsPlanCode+'">수정</button>'
	    		  	+'<button type="submit" class="btn btn-danger btn-sm" name="btn" value="delete">삭제</button>'
	 				+'<div class="modal fade" id="'+msg[s].wbsPlanCode+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'
	 				+'<div class="modal-dialog" role="document">'
	 				+'<div class="modal-content">'
	 				+'<div class="modal-body">'
	 				+'<label for="wbsplan">WBS수정</label><br>'
	 				+'작업명:'
	 				+'<input type="text" class="form-control" name="wbsPlanName2" value="'+msg[s].wbsPlanName+'" readonly/>'
	 				+'<input type="text" class="form-control" name="wbsPlanName" value="'+msg[s].wbsPlanName+'"/>'
	 				+'선행작업:'
	 				+'<input type="text" class="form-control" name="wbsPlanDependency2" value="'+msg[s].wbsPlanDependency+'" readonly/>'
	 				+'<select name="wbsPlanDependency" class="wbsdc">'
	 				+'<option value="없음"> 없음</option>'
	 				+'</select><br>'
	 				+'작업기간:'
	 				+'<input type="number" class="form-control" name="wbsPlanDuration2" value="'+msg[s].wbsPlanDuration+'"readonly/>'
	 				+'<input type="number" class="form-control" name="wbsPlanDuration" value="'+msg[s].wbsPlanDuration+'"/>'
	 				+'시작일:<br>'
	 				+'<input type="date" name="wbsPlanStartDate2" value="'+msg[s].wbsPlanStartDate+'"readonly/><br>'
	 				+'<input type="date" name="wbsPlanStartDate" value="'+msg[s].wbsPlanStartDate+'"/><br>'
	 				+'담당자ID:'
	 				+'<input type="text" class="form-control" name="wbsPlanManager2" value="'+msg[s].wbsPlanManager+'"readonly/><br>'
	 				+'<input type="text" class="form-control" name="wbsPlanManager" value="'+msg[s].wbsPlanManager+'"/><br>'
	 				+'<input type="hidden" name="wbsPlanCode" value="'+msg[s].wbsPlanCode+'"/>'
	 				+'<input type="hidden" class="form-control" name="wbsPlanComCode" value="'+msg[s].wbsPlanComCode+'">'
	 				+'<input type="hidden" class="form-control" name="wbsPlanFdCode" value="'+msg[s].wbsPlanFdCode+'">'
	 				+'<input type="hidden" class="form-control" name="wbsPlanOrder" value="'+msg[s].wbsPlanOrder+'">'
	 				+'<input type="hidden" class="form-control" name="wbsPlanMsCode" value="'+msg[s].wbsPlanMsCode+'">'
	 				+'<input type="hidden" class="form-control" name="wbsPlanChange" value="'+msg[s].wbsPlanChange+'">'
	 				+'<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">'
	 				+'<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">'
	 				+'<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">'
	 				+'<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">'
	 				+'<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">'
	 				+'<button type="submit" name="btn" value="update">입력완료</button>'
	 				+'</div>'
	 				+'</div>'
	 				+'</div>'
	 				+'</div>'
	 				+'</form>'
	    		  	+'</div>'
		    		 
		      );
		      
		      }
		      var options = {
		        height: 275
		      };

		      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

		      chart.draw(data, options);
		    } 
	});
	// 실패시
	wbsplanlist.fail(function(){
		alert('ajax통신실패');
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
	<div class="col-xs-3">
		<c:import url="/resources/module/pmsleftmenu.jsp"/>
	</div>
	<div class="col-xs-9">
		<div class="row">
			<div class="col-xs-3">
				<div id="sidetree">
		   			<div class="treeheader">
					</div>
			    		<ul id="tree">
				    		<div id="sidetreecontrol">
			    			</div>
			        		<li>	        		
			            		<strong><a href="/pineapple/wbsplanlistpage.pms">펀딩</a></strong>	   
			            			<form action="/pineapple/wbsmsview.pms" method="post">	
										<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
										<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
				            			<input type=submit value="${fdTitle}" class="submitLink">
				               		</form>
			            		</ul>
					       	</li>
					       	<li>
					       	<strong>마일스톤:${milestoneName}</strong>
					       		<form action="/pineapple/wbsform.pms" method="post">	
									<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
									<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
									<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
									<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
									<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
									<ul>
						       		<input type=submit value="WBS예상입력" name="btn" class="submitLink">
						       		</ul>
						       		<ul>
						       		<input type=submit value="WBS예상리스트" name="btn" class="submitLink">
						       		</ul>
						       		<ul>
						       		<input type=submit value="WBS실제입력" name="btn" class="submitLink">
						       		</ul>
						       		<ul>
						       		<input type=submit value="WBS실제리스트" name="btn" class="submitLink">
						       		</ul>
						       	</form>
					       	</li>
					    </ul>
					</div>
				</div>
				<div class="col-xs-9">
					<div class="col-xs-8">
						<!-- wbs리스트 부분  -->
						<div class="row" id="mywbsplanlist">
						</div>
						<!-- 차트뿌려지는곳 -->
						<div class="row" id="chart_div">
						</div>
					</div>
					<div class="col-xs-4" id="chart_btnarea">
					<!-- 차트에 맞는 버튼이 들어올 곳 -->
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