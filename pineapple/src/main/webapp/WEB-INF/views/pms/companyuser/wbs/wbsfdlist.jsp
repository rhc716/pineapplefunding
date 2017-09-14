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
/* 펀딩 리스트 불러올 ajax */
$(document).ready(function(){
	var message = "${message}";
	if(message!="") alert(message);
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/wbsfundinglist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}" }
	});
	//인서트내용
	$('#dp').hide();
	$('#sd').hide();
	
	$('.modal').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	});
	
	 $("#dependency").click(function(){
	        $("#dp").show();       	
	        $('#sd').hide();	
	        $('#wbssd').val(null);
	    });
	 $("#startdate").click(function(){
	        $('#sd').show();
	        $('#dp').hide();
	        $('#mywbslist').val(null);
	    });
	 //인서트내용
	// 성공시
	getfundinglist.done(function(msg){
		console.log(msg);
		$('#mymslistselect').html('')
		$('#chart_div').html('')
		$('#chart_btnarea').html('')
		$('#mymslistselect').append(
				'<select name="wbsPlanMsCode" id="mymslist">'
				+'<option>마일스톤 선택</option>'
				+'</select>'
				
			);
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
		
		//alert(formatDate(msg[0].fdDate));
		//펀딩리스트를 myfundinglist에 채워줌 // 수정버튼과 모달창, 삭제버튼을 만들어줌
		for(var i = 0; i<msg.length; i++){
			
				$('#myfundinglist').append(
						'<option value="'+msg[i].fdCode+'">'+msg[i].fdTitle+'</option><br>'
				);
		}
			
	});
	// 실패시
	getfundinglist.fail(function(){
		alert('ajax통신실패');
	});
	
	

});

//펀딩리스트에서 select 로 펀딩이 변경되면 마일스톤 리스트 변경하는 ajax
$(document).on("change","select[name='wbsPlanFdCode']",function(){
	var wbsPlanMsCode = $.ajax({
		type : "post",
		url : "/pineapple/WbsMs.pms",
		/* 바뀐펀딩코드로 검색 */
		data : { fdCode : $(this).val() }
	});
	var wbsfdinsert = $(this).val();
	console.log(wbsfdinsert);
	$('#insertbtn').html('');
	$('#wbsfdinsert').html('');
	$('#wbsfdinsert').append(
		'<input type="hidden" name="wbsPlanFdCode" value="'+wbsfdinsert+'">'
	);
	// 성공시
	wbsPlanMsCode.done(function(msg){
		console.log(msg);
		$('#mymslistselect').html('');
		$('#chart_div').html('');
		$('#chart_btnarea').html('');
		$('#mymslistselect').append(
				'<select name="wbsPlanMsCode" id="mymslist">'
				+'<option>마일스톤 선택</option>'
				+'</select>'
				
			);
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
		
		//alert(formatDate(msg[0].fdDate));
		//펀딩리스트를 myfundinglist에 채워줌 // 수정버튼과 모달창, 삭제버튼을 만들어줌
		for(var i = 0; i<msg.length; i++){
			
				$('#mymslist').append(
					'<option value="'+msg[i].milestoneCode+'">'+msg[i].milestoneName+'</option><br>'
				);
		}
		
	});
	// 실패시
	wbsPlanMsCode.fail(function(){
		alert('ajax통신실패');
	});
});

$(document).on("change","select[name='wbsPlanMsCode']",function(){
		var wbsplanlist = $.ajax({
			type : "post",
			url : "/pineapple/Wbsplanlist.pms",
			/* 바뀐마일스톤이름으로 검색 */
			data : { milestoneCode : $(this).val() }
		});
		$('#insertbtn').html('');
		var wbsmsinsert = $(this).val();
		console.log(wbsmsinsert);
		
		$('#wbsmsinsert').html('')
		$('#wbsmsinsert').append(
			'<input type="hidden" name="wbsPlanMsCode" value="'+wbsmsinsert+'">'
			)
		// 성공시
		wbsplanlist.done(function(msg){
			$('#chart_div').html('')
			$('#chart_btnarea').html('')
			console.log(msg);
			
            $('#wbslistselect').html('')
            $('#wbslistselect').append(
                    '<select name="wbsPlanDependency" id="mywbslist2">'
                    +'<option value=null>wbs 선택</option>'
                    +'</select>'
                    
                );

			
			
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
			      	
		                
                  
                    $('#mywbslist2').append(
                            '<option value="'+msg[s].wbsPlanName+'">'+msg[s].wbsPlanName+'</option><br>'
                        );

                    
			      	
			      	
			      	
			      /* 차트를 그릴때에 버튼도 함께 그려넣어줌  */
			      $('#chart_btnarea').append(
		    		 	'<div style="height:30px; padding-top:6px;">'
		    		 	+'<span>작업명 : </span>'+msg[s].wbsPlanName
		    		 	+' <form action="/pineapple/wbsplandetail.pms" method="post" style="display:inline;">'
		    		 	+'<input type="hidden" name="wbsPlanCode" value="'+msg[s].wbsPlanCode+'"/>'
		    		  	+'<button type="submit" class="btn btn-primary btn-sm" name="btn" value="detail">상세정보</button>'		
		    		  	+'</form>'
		    		  	+'<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#'+msg[s].wbsPlanCode+'">수정</button>'
		    		  	+' <form action="/pineapple/wbsplandelete.pms" method="post" style="display:inline;">'
		    		  	+'<input type="hidden" name="wbsPlanCode" value="'+msg[s].wbsPlanCode+'"/>'
		    		  	+'<button type="submit" class="btn btn-danger btn-sm" name="btn" value="delete">삭제</button>'
		    		  	+'</form>'
		 				+'<div class="modal fade" id="'+msg[s].wbsPlanCode+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'
		 				+'<div class="modal-dialog" role="document">'
		 				+'<div class="modal-content">'
		 				+'<div class="modal-body">'
		 				+' <form action="/pineapple/wbsplanupdate.pms" method="post" style="display:inline;">'
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
		 				+'</form>'
		 				+'</div>'
		 				+'</div>'
		 				+'</div>'
		 				+'</div>'
		    		  	+'</div>'
		    		  	
		    		  	
			      );
			    
			      }
			      for(var s = 0; s<msg.length; s++){
				      $('.wbsdc').append(
		                        '<option value="'+msg[s].wbsPlanName+'">'+msg[s].wbsPlanName+'</option><br>'
		                    );
			      }
			      $('#insertbtn').append(
                          '<button type="button" data-toggle="modal" data-target="#insert">WBS생성</button>'
                   
			    		 
                      );
			      
			      var options = {
			        height: 400,
			        gantt: {
			            trackHeight: 30
			          }
			      };

			      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

			      chart.draw(data, options);
			      
			  /*     google.visualization.events.addListener(chart, 'select', selectHandler);
			      
			      function selectHandler() {
			    	  
			    	  
			    	  $('#chart_str').html('')
			    	  var selection = chart.getSelection();
			    	  
			    	  var message = '';
			    	  
			    	  
			    	  for (var i = 0; i < selection.length; i++){
			    		  var item = selection[i];
			    		  var name = data.getFormattedValue(item.row, 1);			    		
			    		  var startdate = data.getFormattedValue(item.row, 2);	
			    		  var duration  = data.getFormattedValue(item.row, 4);	
			    			
			    		  console.log(duration)
			    	  }
			    	  $('#chart_str').append(
			    			  '작업명:'+name+'<br>'
			    			  +'시작일:'+formatDate(startdate)+'<br>'
			    			  +'작업기간'+duration+'<br>'
			    			  );
			      } */
			     
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
	<div class="col-md-3">
		<c:import url="/resources/module/pmsleftmenu.jsp"/>
	</div>
	<div class="row">
		<div class="col-md-3">
			<h3>펀딩리스트</h3>
			<div>
				<select name="wbsPlanFdCode" id="myfundinglist">
					<option>펀딩 선택</option>
				</select>
			</div>
	<!-- 펀딩 리스트 뿌려질 곳 -->
		</div>
		<div class="col-md-3" >
			<h3>마일스톤리스트</h3>
				<div id="mymslistselect">
				</div>
	<!-- 마일스톤 리스트 뿌려질 곳 -->
		</div>

		<!-- 차트와 버튼 뿌려질곳 -->
		<br><br><br>
			<div class="row">
				<div class="col-xs-8">
					<div class="col-xs-8">
						<!-- wbs리스트 부분  -->

						<!-- 차트뿌려지는곳 -->
						<div class="row" id="chart_div">
						</div>
					</div>
					<div class="col-xs-4" id="chart_btnarea">
					<!-- 차트에 맞는 버튼이 들어올 곳 -->
					</div>
				<div class="col-xs-8" id="insertbtn">
					
				</div>
			</div><br><br>
			
					
						<div class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					 		<div class="modal-dialog" role="document">
						 		<div class="modal-content">
							 		<div class="modal-body">
							 		<form action="/pineapple/wbsplaninsert.pms" method="post">
										<label for="wbsplan">WBS예상계획</label><br>
										<div id="wbsfdinsert">
										</div>
										<div id="wbsmsinsert">
										</div>
										작업명:
										<input type="text" class="form-control" name="wbsPlanName">
										<div id="dp">
											선행작업:<br>
											<div id="wbslistselect">
	               							</div>
	               						</div>
	               						<div id="sd">
               								시작일:<br>
											<input type="date" name="wbsPlanStartDate" id="wbssd"><br>
										</div>
										<a class="lskbtn"id="dependency">선행작업</a>
										<a class="lskbtn"id="startdate">시작일</a>
										작업기간:
										<input type="number" class="form-control" name="wbsPlanDuration">
										
										담당자ID:
										<input type="text" class="form-control" name="wbsPlanManager">
										<!-- 회사코드 펀딩코드 마일스톤 코드 받아와서 입력 -->
										<button type="hidden" class="btn btn-success">입력완료</button>
									</form>
							 		</div>
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