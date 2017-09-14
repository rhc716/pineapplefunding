<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<script>

$(document).ready(function(){
	 $('#inserthumanBtn').click(function(){	
		if($('#wphNoPeople').val() !="") {
			if($('#wphCost').val() !=""){
				if($('#wphRemarks').val() !=""){
					if($('#wphDate').val() !=""){
						$('#humanform').submit();
					 }else{
						 alert('사용일을 입력해주세요');
					 }
				 }else{
					 alert('비고를 입력해주세요');
				 }
			 }else{
				 alert('비용을 입력해주세요');
			 }
		 }else{
			 alert('인원수를 입력해주세요');
		 }
	 })
	 $('#insertmaterialBtn').click(function(){	
		if($('#wpmName').val() !="") {
			if($('#wpmCost').val() !=""){
				if($('#wpmRemarks').val() !=""){
					if($('#wpmDate').val() !=""){
						$('#materialform').submit();
					 }else{
						 alert('사용일을 입력해주세요');
					 }
				 }else{
					 alert('비고를 입력해주세요');
				 }
			 }else{
				 alert('비용을 입력해주세요');
			 }
		 }else{
			 alert('장비명을 입력해주세요');
		 }
	 })
	 $('#insertfacilityBtn').click(function(){	
		if($('#wpfName').val() !="") {
			if($('#wpfCost').val() !=""){
				if($('#wpfRemarks').val() !=""){
					if($('#wpfDate').val() !=""){
						$('#facilityform').submit();
					 }else{
						 alert('사용일을 입력해주세요');
					 }
				 }else{
					 alert('비고를 입력해주세요');
				 }
			 }else{
				 alert('비용을 입력해주세요');
			 }
		 }else{
			 alert('시설명을 입력해주세요');
		 }
	 })
	 $('#insertoutBtn').click(function(){	
		if($('#wpoOutComName').val() !="") {
			if($('#wpoCost').val() !=""){
				if($('#wpoRemarks').val() !=""){
					if($('#wpoDate').val() !=""){
						$('#outform').submit();
					 }else{
						 alert('사용일을 입력해주세요');
					 }
				 }else{
					 alert('비고를 입력해주세요');
				 }
			 }else{
				 alert('비용을 입력해주세요');
			 }
		 }else{
			 alert('외주업체명을 입력해주세요');
		 }
	 })
	 $('#insertetcBtn').click(function(){	
		if($('#wpePurpose').val() !="") {
			if($('#wpeCost').val() !=""){
				if($('#wpeRemarks').val() !=""){
					if($('#wpeDate').val() !=""){
						$('#etcform').submit();
					 }else{
						 alert('사용일을 입력해주세요');
					 }
				 }else{
					 alert('비고를 입력해주세요');
				 }
			 }else{
				 alert('비용을 입력해주세요');
			 }
		 }else{
			 alert('용도를 입력해주세요');
		 }
	 })
	 $('#insertincomeBtn').click(function(){	
		if($('#wpiReason').val() !="") {
			if($('#wpiIncome').val() !=""){
				if($('#wpiDate').val() !=""){
						$('#incomeform').submit();
				}else{
					alert('수익일을 입력하세요');
				}
			}else{
				alert('수익을 입력하세요');
			}
		}else{
			alert('수익사유를 입력하세요');
		}
				
	 })
	//wbs코드로 humanlist받아옴
	var getwbsplanlist = $.ajax({
		type : "get",
		url : "/pineapple/wbsplanlistview.pms",
		data : { wbsplancode : "${wbsplancode}" }
	})

	getwbsplanlist.done(function(msg){
		console.log(msg);
		$('#wbscode').append(msg.wbsplan.wbsPlanCode)
		$('#wbsname').append(msg.wbsplan.wbsPlanName)
		$('#wbsdependency').append(msg.wbsplan.wbsPlanDependency)
		$('#wbsduration').append(msg.wbsplan.wbsPlanDuration)
		$('#wbsstartdate').append(msg.wbsplan.wbsPlanStartDate)
		$('#wbsmanager').append(msg.wbsplan.wbsPlanManager)
		$('#wbsplanhuman').append(
				'<input type="hidden"name="wbsPlanCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wphWpCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wphFdCode" value="'+msg.wbsplan.wbsPlanFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wphMsCode" value="'+msg.wbsplan.wbsPlanMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wphComCode" value="'+msg.wbsplan.wbsPlanComCode+'">'
		)
		$('#wbsplanmaterial').append(
				'<input type="hidden"name="wbsPlanCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpmWpCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpmFdCode" value="'+msg.wbsplan.wbsPlanFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpmMsCode" value="'+msg.wbsplan.wbsPlanMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpmComCode" value="'+msg.wbsplan.wbsPlanComCode+'">'
		)
		$('#wbsplanfacility').append(
				'<input type="hidden"name="wbsPlanCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpfWpCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpfFdCode" value="'+msg.wbsplan.wbsPlanFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpfMsCode" value="'+msg.wbsplan.wbsPlanMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpfComCode" value="'+msg.wbsplan.wbsPlanComCode+'">'
		)
		$('#wbsplanout').append(
				'<input type="hidden"name="wbsPlanCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpoWpCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpoFdCode" value="'+msg.wbsplan.wbsPlanFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpoMsCode" value="'+msg.wbsplan.wbsPlanMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpoComCode" value="'+msg.wbsplan.wbsPlanComCode+'">'
		)
		$('#wbsplanetc').append(
				'<input type="hidden"name="wbsPlanCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpeWpCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpeFdCode" value="'+msg.wbsplan.wbsPlanFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpeMsCode" value="'+msg.wbsplan.wbsPlanMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpeComCode" value="'+msg.wbsplan.wbsPlanComCode+'">'
		)
		$('#wbsplanincome').append(
				'<input type="hidden"name="wbsPlanCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpiWpCode" value="'+msg.wbsplan.wbsPlanCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpiFdCode" value="'+msg.wbsplan.wbsPlanFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpiMsCode" value="'+msg.wbsplan.wbsPlanMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wpiComCode" value="'+msg.wbsplan.wbsPlanComCode+'">'
		)

			
		for(var i = 0; i<msg.wbsplanhuman.length; i++){
			$('#humanlist').append(
					'<tr>'
					+'<td>'+msg.wbsplanhuman[i].wphNoPeople+'</td>'
					+'<td>'+msg.wbsplanhuman[i].wphCost+'</td>'
					+'<td>'+msg.wbsplanhuman[i].wphRemarks+'</td>'	
					+'<td>'+msg.wbsplanhuman[i].wphDate+'</td>'	
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deletehuman" value="'+msg.wbsplanhuman[i].wphCode+'">삭제</button>'
					+'</td>'
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
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deletematerial" value="'+msg.wbsplanmaterial[i].wpmCode+'">삭제</button>'
					+'</td>'
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
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deletefacility" value="'+msg.wbsplanfacility[i].wpfCode+'">삭제</button>'
					+'</td>'
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
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deleteout" value="'+msg.wbsplanout[i].wpoCode+'">삭제</button>'
					+'</td>'
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
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deleteetc" value="'+msg.wbsplanetc[i].wpeCode+'">삭제</button>'
					+'</td>'
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsplanincome.length; i++){
			$('#incomelist').append(
					'<tr>'
					+'<td>'+msg.wbsplanincome[i].wpiReason+'</td>'
					+'<td>'+msg.wbsplanincome[i].wpiIncome+'</td>'
					+'<td>'+msg.wbsplanincome[i].wpiDate+'</td>'	
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deleteincome" value="'+msg.wbsplanincome[i].wpiCode+'">삭제</button>'
					+'</td>'
					+'</tr>'
			)
		}
		
		
			
			
			$('.deletehuman').click(function () {
				var answer = confirm("삭제하시겠습니까?")
				if (answer) {
					var ss = $(this).val();
					var test = $.ajax({
						type : "post",
						url : "/pineapple/wbsplanhumandelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wphCode : ss }
					}); 
					test.done(function(){
						location.reload();
						alert('삭제완료')
					})
					test.fail(function(){
						location.reload();
						alert('삭제실패')
					})
				}else{
				}
			});
			$('.deletematerial').click(function () {
				var answer = confirm("삭제하시겠습니까?")
				if (answer) {
					var ss = $(this).val();
					var test = $.ajax({
						type : "post",
						url : "/pineapple/wbsplanmaterialdelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wpmCode : ss }
					}); 
					test.done(function(){
						location.reload();
						alert('삭제완료')
					})
					test.fail(function(){
						location.reload();
						alert('삭제실패')
					})
				}else{
				}
			});
			
			$('.deletefacility').click(function () {
				var answer = confirm("삭제하시겠습니까?")
				if (answer) {
					var ss = $(this).val();
					var test = $.ajax({
						type : "post",
						url : "/pineapple/wbsplanfacilitydelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wpfCode : ss }
					}); 
					test.done(function(){
						location.reload();
						alert('삭제완료')
					})
					test.fail(function(){
						location.reload();
						alert('삭제실패')
					})
				}else{
				}
			});
			$('.deleteout').click(function () {
				var answer = confirm("삭제하시겠습니까?")
				if (answer) {
					var ss = $(this).val();
					var test = $.ajax({
						type : "post",
						url : "/pineapple/wbsplanoutdelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wpoCode : ss }
					}); 
					test.done(function(){
						location.reload();
						alert('삭제완료')
					})
					test.fail(function(){
						location.reload();
						alert('삭제실패')
					})
				}else{	
				}
			});
			$('.deleteetc').click(function () {
				var answer = confirm("삭제하시겠습니까?")
				if (answer) {
					var ss = $(this).val();
					var test = $.ajax({
						type : "post",
						url : "/pineapple/wbsplanetcdelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wpeCode : ss }
					}); 
					test.done(function(){
						location.reload();
						alert('삭제완료')
					})
					test.fail(function(){
						location.reload();
						alert('삭제실패')
					})
				}else{
				}
			});
			$('.deleteincome').click(function () {
				var answer = confirm("삭제하시겠습니까?")
				if (answer) {
					var ss = $(this).val();
					var test = $.ajax({
						type : "post",
						url : "/pineapple/wbsplanincomedelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wpiCode : ss }
					}); 
					test.done(function(){
						location.reload();
						alert('삭제완료')
					})
					test.fail(function(){
						location.reload();
						alert('삭제실패')
					})
				}else{
				}
			});
		})
	})
	
	

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
			<label for="wbsplan">WBS예상계획</label><br>
				
					<div class="row">
						<div class=col-md-3>
							<div class="panel panel-default">
								<div class="panel-heading">WBS코드</div>
								<div class="panel-body" id="wbscode"></div>
							</div>
						</div>
						<div class=col-md-3>
							<div class="panel panel-default">
								<div class="panel-heading">작업명</div>
								<div class="panel-body" id="wbsname"></div>
							</div>
						</div>
						<div class=col-md-3>
							<div class="panel panel-default">
								<div class="panel-heading">선행작업</div>
								<div class="panel-body" id="wbsdependency"></div>
							</div>
						</div>
					</div>
			 		<div class="row">
						<div class=col-md-3>
							<div class="panel panel-default">
								<div class="panel-heading">작업기간</div>
								<div class="panel-body" id="wbsduration"></div>
							</div>
						</div>
						<div class=col-md-3>
							<div class="panel panel-default">
								<div class="panel-heading">시작일</div>
								<div class="panel-body" id="wbsstartdate"></div>
							</div>
						</div>
						<div class=col-md-3>
							<div class="panel panel-default">
								<div class="panel-heading">담당자ID</div>
								<div class="panel-body" id="wbsmanager"></div>
							</div>
						</div> 
					</div> 
			<!-- 트리거 각각의 모달창으로 이동한다 -->
			상세정보 입력:
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inserthuman">인원</button>				
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertmaterial">장비</button>	
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertfacility">시설</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertout">외주</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertetc">기타</button>	
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertincome">수입</button><br>
			<br>
			<div class="row">
				<div class="col-md-6 boder">
					<table id="humanlist">
						 <tr>
							 <th>인원수</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </table>
				</div>
				<div class="col-md-6 boder">
					<table id="materiallist">
						 <tr>
							 <th>장비명</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </table>
				</div>
			</div><br>
			<div class="row">
				<div class="col-md-6 boder">
					<table id="facilitylist">
						 <tr>
							 <th>시설명</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </table>
				</div>
				<div class="col-md-6 boder">
					<table id="outlist">
						 <tr>
							 <th>업체명</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </table>
				</div>
			</div><br>
			<div class="row">
				<div class="col-md-6 boder">
					<table id="etclist">
						 <tr>
							 <th>용도</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </table>
				</div>
				<div class="col-md-6 boder">
					<table id="incomelist">
						 <tr>
							 <th>수익사유</th>
							 <th>수익</th>
							 <th>수익일</th>
						 </tr>
					 </table>
				</div>
			</div><br>
			
			
			
			
			
			<!-- 모달 -->
			<div class="modal fade" id="inserthuman" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			<!-- 모달창 본문내용 -->				      
			      <div class="modal-body">
			        <form id="humanform" action="/pineapple/wbsplanhumaninsert.pms" method="post">
			        <!-- 기본적으로 들어가는 wbs예상코드 펀딩코드 마일스톤코드 회사코드를 입력되는곳 -->
			        	<label for="wbsplanhuman" id="wbsplanhuman">WBS예상인원 지출</label><br>
						
		          	<!-- 여기서부터는 직접 입력하는곳 --> 
			           	인원수:
			            <input type="number" class="form-control" id="wphNoPeople" name="wphNoPeople">
					         총비용:
			          	<input type="number" class="form-control" id="wphCost" name="wphCost">
			          	비고:
			          	<input type="text" class="form-control" id="wphRemarks" name="wphRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wphDate" name="wphDate">
			          	<br>
			          	<input id="inserthumanBtn" type="button" class="button_insert signupbtn" value="입력완료">
			        </form>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 장비모달 -->
			<div class="modal fade" id="insertmaterial" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-body">
			        <form  id="materialform"action="/pineapple/wbsplanmaterialinsert.pms" method="post">
			        	<label for="wbsplanmaterial" id="wbsplanmaterial">WBS예상장비 지출</label><br>
			           	장비명:
			            <input type="text" class="form-control" id="wpmName" name="wpmName">
			          	비용:
			          	<input type="number" class="form-control" id="wpmCost" name="wpmCost">
			          	비고:
			          	<input type="text" class="form-control" id="wpmRemarks" name="wpmRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wpmDate" name="wpmDate">
			          	<br>
			          	<input id="insertmaterialBtn" type="button" class="button_insert signupbtn" value="입력완료">
			        </form>
			      </div>
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="insertfacility" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-body">
			        <form id="facilityform"action="/pineapple/wbsplanfacilityinsert.pms" method="post">
			        	<label for="wbsplanfacility" id="wbsplanfacility">WBS예상시설 지출</label><br>
			           	시설명:
			            <input type="text" class="form-control" id="wpfName" name="wpfName">
			          	가격:
			          	<input type="number" class="form-control" id="wpfCost"name="wpfCost">
			          	비고:
			          	<input type="text" class="form-control" id="wpfRemarks"name="wpfRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wpfDate"name="wpfDate">
			      		<br>
			          	<input id="insertfacilityBtn" type="button" class="button_insert signupbtn" value="입력완료">
			        </form>
			      </div>				     
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="insertout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-body">
			        <form id="outform"action="/pineapple/wbsplanoutinsert.pms" method="post">
			        <label for="wbsplanout" id="wbsplanout">WBS예상외주 지출</label><br>
			           	외주업체명:
			            <input type="text" class="form-control" id="wpoOutComName"name="wpoOutComName">			    
			          	비용:
			          	<input type="number" class="form-control" id="wpoCost"name="wpoCost">
			          	비고:
			          	<input type="text" class="form-control" id="wpoRemarks"name="wpoRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wpoDate"name="wpoDate">
			          	<br>
			          	<input id="insertoutBtn" type="button" class="button_insert signupbtn" value="입력완료">
			        </form>
			      </div>				     
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="insertetc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-body">
			        <form id="etcform" action="/pineapple/addwbsplanetc.pms" method="post">
			        	<label for="wbsplanetc" id="wbsplanetc">WBS예상기타 지출</label><br>
			           	용도:
			            <input type="text" class="form-control" id="wpePurpose"name="wpePurpose">
			          	비용:
			          	<input type="number" class="form-control" id="wpeCost"name="wpeCost">
			          	비고:
			          	<input type="text" class="form-control" id="wpeRemarks"name="wpeRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wpeDate"name="wpeDate">
			         	<br>
			          	<input id="insertetcBtn" type="button" class="button_insert signupbtn" value="입력완료">
			        </form>
			      </div>				      
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="insertincome" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-body">
			        <form id="incomeform"action="/pineapple/wbsplanincomeinsert.pms" method="post">
			        	<label for="wbsplanincome" id="wbsplanincome">WBS예상 수익</label><br>
			           	수익사유:
			            <input type="text" class="form-control" id="wpiReason"name="wpiReason">
			          	수익:
			          	<input type="number" class="form-control" id="wpiIncome"name="wpiIncome">
			          	수익일:
			          	<input type="date" class="form-control" id="wpiDate"name="wpiDate">
			          	<br>
			          	<input id="insertincomeBtn" type="button" class="button_insert signupbtn" value="입력완료">
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