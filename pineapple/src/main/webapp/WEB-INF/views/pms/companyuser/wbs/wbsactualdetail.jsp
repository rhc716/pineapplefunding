<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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

<!-- css lsk -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lsk.css" />

<script>

$(document).ready(function(){
	 $('#inserthumanBtn').click(function(){	
		if($('#wdhNoPeople').val() !="") {
			if($('#wdhCost').val() !=""){
				if($('#wdhRemarks').val() !=""){
					if($('#wdhDate').val() !=""){
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
		if($('#wdmName').val() !="") {
			if($('#wdmCost').val() !=""){
				if($('#wdmRemarks').val() !=""){
					if($('#wdmDate').val() !=""){
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
		if($('#wdfName').val() !="") {
			if($('#wdfCost').val() !=""){
				if($('#wdfRemarks').val() !=""){
					if($('#wdfDate').val() !=""){
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
		if($('#wdoOutComName').val() !="") {
			if($('#wdoCost').val() !=""){
				if($('#wdoRemarks').val() !=""){
					if($('#wdoDate').val() !=""){
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
		if($('#wdePurpose').val() !="") {
			if($('#wdeCost').val() !=""){
				if($('#wdeRemarks').val() !=""){
					if($('#wdeDate').val() !=""){
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
		if($('#wdiReason').val() !="") {
			if($('#wdiIncome').val() !=""){
				if($('#wdiDate').val() !=""){
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
	 console.log("${wbsActualCode}")
	//wbs코드로 actual받아옴
	var getwbsactuallist = $.ajax({
		type : "get",
		url : "/pineapple/wbsactuallistview.pms",
		data : { wbsActualCode : "${wbsActualCode}" }
	})

	getwbsactuallist.done(function(msg){
		console.log(msg);
		var stat
		if(msg.wbsactual.wbsActualEndDate==null){
			$('#wbsstat').append('진행중')
			$('#detailinsert').append(
					'상세정보 입력:'
						+'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inserthuman">인원</button>'				
						+'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertmaterial">장비</button>'	
						+'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertfacility">시설</button>'
						+'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertout">외주</button>'
						+'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertetc">기타</button>'
						+'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertincome">수입</button><br>'
				)
				$('#copper').append(
				'<button type="submit" class="btn btn-success" id="copperwbs" value="'+msg.wbsactual.wbsActualCode+'">WBS완료</button>'
				)
				
			
		}else if(msg.wbsactual.wbsActualApprovalDate==null){
			$('#wbsstat').append('승인대기중')
			$('#copper').append(
					'<div class="panel panel-default">'
					+'<div class="panel-heading">종료일</div>'
					+'<div class="panel-body" id="wbsenddate">'+msg.wbsactual.wbsActualEndDate+'</div>'
				)
		}else{
			$('#wbsstat').append('완료')
			$('#copper').append(
					'<div class="panel panel-default">'
					+'<div class="panel-heading">종료일</div>'
					+'<div class="panel-body" id="wbsenddate">'+msg.wbsactual.wbsActualEndDate+'</div>'
				)
		}
		
		$('#wbscode').append(msg.wbsactual.wbsActualCode)
		$('#wbsname').append(msg.wbsactual.wbsActualName)
		$('#wbsstartdate').append(msg.wbsactual.wbsActualStartDate)
		$('#wbsmanager').append(msg.wbsactual.wbsActualWriteManager)
		
		
		$('#wbsdailyhuman').append(
				'<input type="hidden"name="wbsActualCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdhwdCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdhFdCode" value="'+msg.wbsactual.wbsActualFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdhMsCode" value="'+msg.wbsactual.wbsActualMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdhComCode" value="'+msg.wbsactual.wbsActualComCode+'">'
		)
		$('#wbsdailymaterial').append(
				'<input type="hidden"name="wbsActualCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdmwdCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdmFdCode" value="'+msg.wbsactual.wbsActualFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdmMsCode" value="'+msg.wbsactual.wbsActualMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdmComCode" value="'+msg.wbsactual.wbsActualComCode+'">'
		)
		$('#wbsdailyfacility').append(
				'<input type="hidden"name="wbsActualCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdfwdCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdfFdCode" value="'+msg.wbsactual.wbsActualFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdfMsCode" value="'+msg.wbsactual.wbsActualMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdfComCode" value="'+msg.wbsactual.wbsActualComCode+'">'
		)
		$('#wbsdailyout').append(
				'<input type="hidden"name="wbsActualCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdowdCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdoFdCode" value="'+msg.wbsactual.wbsActualFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdoMsCode" value="'+msg.wbsactual.wbsActualMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdoComCode" value="'+msg.wbsactual.wbsActualComCode+'">'
		)
		$('#wbsdailyetc').append(
				'<input type="hidden"name="wbsActualCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdewdCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdeFdCode" value="'+msg.wbsactual.wbsActualFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdeMsCode" value="'+msg.wbsactual.wbsActualMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdeComCode" value="'+msg.wbsactual.wbsActualComCode+'">'
		)
		$('#wbsdailyincome').append(
				'<input type="hidden"name="wbsActualCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdiwdCode" value="'+msg.wbsactual.wbsActualCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdiFdCode" value="'+msg.wbsactual.wbsActualFdCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdiMsCode" value="'+msg.wbsactual.wbsActualMsCode+'">'
		       	+'<input type="hidden" class="form-control" name="wdiComCode" value="'+msg.wbsactual.wbsActualComCode+'">'
		)

			
		for(var i = 0; i<msg.wbsdailyhuman.length; i++){
			$('#humanlist').append(
					'<tr>'
					+'<td>'+msg.wbsdailyhuman[i].wdhNoPeople+'</td>'
					+'<td>'+msg.wbsdailyhuman[i].wdhCost+'</td>'
					+'<td>'+msg.wbsdailyhuman[i].wdhRemarks+'</td>'	
					+'<td>'+msg.wbsdailyhuman[i].wdhDate+'</td>'	
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deletehuman" value="'+msg.wbsdailyhuman[i].wdhCode+'">삭제</button>'
					+'</td>'
					+'</tr>'
			)
	
		}	
		for(var i = 0; i<msg.wbsdailymatrial.length; i++){
			$('#materiallist').append(
					'<tr>'
					+'<td>'+msg.wbsdailymatrial[i].wdmName+'</td>'
					+'<td>'+msg.wbsdailymatrial[i].wdmCostPerNo+'</td>'
					+'<td>'+msg.wbsdailymatrial[i].wdmRemarks+'</td>'	
					+'<td>'+msg.wbsdailymatrial[i].wdmDate+'</td>'	
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deletematerial" value="'+msg.wbsdailymatrial[i].wdmCode+'">삭제</button>'
					+'</td>'
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsdailyfacility.length; i++){
			$('#facilitylist').append(
					'<tr>'
					+'<td>'+msg.wbsdailyfacility[i].wdfName+'</td>'
					+'<td>'+msg.wbsdailyfacility[i].wdfCost+'</td>'
					+'<td>'+msg.wbsdailyfacility[i].wdfRemarks+'</td>'	
					+'<td>'+msg.wbsdailyfacility[i].wdfDate+'</td>'	
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deletefacility" value="'+msg.wbsdailyfacility[i].wdfCode+'">삭제</button>'
					+'</td>'
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsdailyout.length; i++){
			$('#outlist').append(
					'<tr>'
					+'<td>'+msg.wbsdailyout[i].wdoOutComName+'</td>'
					+'<td>'+msg.wbsdailyout[i].wdoCost+'</td>'
					+'<td>'+msg.wbsdailyout[i].wdoRemarks+'</td>'	
					+'<td>'+msg.wbsdailyout[i].wdoDate+'</td>'	
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deleteout" value="'+msg.wbsdailyout[i].wdoCode+'">삭제</button>'
					+'</td>'
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsdailyetc.length; i++){
			$('#etclist').append(
					'<tr>'
					+'<td>'+msg.wbsdailyetc[i].wdePurpose+'</td>'
					+'<td>'+msg.wbsdailyetc[i].wdeCost+'</td>'
					+'<td>'+msg.wbsdailyetc[i].wdeRemarks+'</td>'	
					+'<td>'+msg.wbsdailyetc[i].wdeDate+'</td>'	
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deleteetc" value="'+msg.wbsdailyetc[i].wdeCode+'">삭제</button>'
					+'</td>'
					+'</tr>'
			)
		}
		for(var i = 0; i<msg.wbsdailyincome.length; i++){
			$('#incomelist').append(
					'<tr>'
					+'<td>'+msg.wbsdailyincome[i].wdiReason+'</td>'
					+'<td>'+msg.wbsdailyincome[i].wdiIncome+'</td>'
					+'<td>'+msg.wbsdailyincome[i].wdiDate+'</td>'	
					+'<td class="minitd">'
					+'<button type="submit" class="btn btn-danger  minibtn deleteincome" value="'+msg.wbsdailyincome[i].wdiCode+'">삭제</button>'
					+'</td>'
					+'</tr>'
			)
		}
		
		
			
		
			$('#copperwbs').click(function () {
				var answer = confirm("WBS를 완료하시겠습니까?")
				if (answer) {
					var ss = $(this).val();
					var test = $.ajax({
						type : "post",
						url : "/pineapple/updatecopperwbs.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wbsActualCode : ss }
					}); 
					test.done(function(){
						location.reload();
						alert('WBS를 완료하였습니다.')
					})
					test.fail(function(){
						location.reload();
						alert('WBS완료를 실패하였습니다.')
					})
				}else{
				}
			});
			
		
			$('.deletehuman').click(function () {
				var answer = confirm("삭제하시겠습니까?")
				if (answer) {
					var ss = $(this).val();
					var test = $.ajax({
						type : "post",
						url : "/pineapple/wbsdailyhumandelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wdhCode : ss }
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
						url : "/pineapple/wbsdailymaterialdelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wdmCode : ss }
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
						url : "/pineapple/wbsdailyfacilitydelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wdfCode : ss }
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
						url : "/pineapple/wbsdailyoutdelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wdoCode : ss }
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
						url : "/pineapple/wbsdailyetcdelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wdeCode : ss }
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
						url : "/pineapple/wbsdailyincomedelete.pms",
						/* 아이디 세션에서 받아서 가져옴 */
						data : { wdiCode : ss }
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
			<label for="wbsdaily">WBS실제</label><br>
				
					<div class="row">
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">WBS코드</div>
								<div class="panel-body" id="wbscode"></div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">작업명</div>
								<div class="panel-body" id="wbsname"></div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">상태</div>
								<div class="panel-body" id="wbsstat"></div>
							</div>
						</div>
					</div>
			 		<div class="row">
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">시작일</div>
								<div class="panel-body" id="wbsstartdate"></div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">담당자ID</div>
								<div class="panel-body" id="wbsmanager"></div>
							</div>
						</div> 
						<div class="col-md-3" id="copper">
							
						</div>
						
					</div> 
			<!-- 트리거 각각의 모달창으로 이동한다 -->
			<div id="detailinsert">
				
			</div>
			<br>
			<div class="row">
				<div class="col-md-6 boder listgroup">
					<table id="humanlist">
						 <tr>
							 <th>인원수</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </table>
				</div>
				<div class="col-md-6 boder listgroup">
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
				<div class="col-md-6 boder listgroup">
					<table id="facilitylist">
						 <tr>
							 <th>시설명</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </table>
				</div>
				<div class="col-md-6 boder listgroup">
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
				<div class="col-md-6 boder listgroup">
					<table id="etclist">
						 <tr>
							 <th>용도</th>
							 <th>비용</th>
							 <th>비고</th>
							 <th>사용일</th>
						 </tr>
					 </table>
				</div>
				<div class="col-md-6 boder listgroup">
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
			        <form id="humanform" action="/pineapple/wbsdailyhumaninsert.pms" method="post">
			        <!-- 기본적으로 들어가는 wbs예상코드 펀딩코드 마일스톤코드 회사코드를 입력되는곳 -->
			        	<label for="wbsdailyhuman" id="wbsdailyhuman">WBS예상인원 지출</label><br>
						
		          	<!-- 여기서부터는 직접 입력하는곳 --> 
			           	인원수:
			            <input type="number" class="form-control" id="wdhNoPeople" name="wdhNoPeople">
					         총비용:
			          	<input type="number" class="form-control" id="wdhCost" name="wdhCost">
			          	비고:
			          	<input type="text" class="form-control" id="wdhRemarks" name="wdhRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wdhDate" name="wdhDate">
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
			        <form  id="materialform"action="/pineapple/wbsdailymaterialinsert.pms" method="post">
			        	<label for="wbsdailymaterial" id="wbsdailymaterial">WBS예상장비 지출</label><br>
			           	장비명:
			            <input type="text" class="form-control" id="wdmName" name="wdmName">
			          	비용:
			          	<input type="number" class="form-control" id="wdmCost" name="wdmCost">
			          	비고:
			          	<input type="text" class="form-control" id="wdmRemarks" name="wdmRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wdmDate" name="wdmDate">
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
			        <form id="facilityform"action="/pineapple/wbsdailyfacilityinsert.pms" method="post">
			        	<label for="wbsdailyfacility" id="wbsdailyfacility">WBS예상시설 지출</label><br>
			           	시설명:
			            <input type="text" class="form-control" id="wdfName" name="wdfName">
			          	가격:
			          	<input type="number" class="form-control" id="wdfCost"name="wdfCost">
			          	비고:
			          	<input type="text" class="form-control" id="wdfRemarks"name="wdfRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wdfDate"name="wdfDate">
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
			        <form id="outform"action="/pineapple/wbsdailyoutinsert.pms" method="post">
			        <label for="wbsdailyout" id="wbsdailyout">WBS예상외주 지출</label><br>
			           	외주업체명:
			            <input type="text" class="form-control" id="wdoOutComName"name="wdoOutComName">			    
			          	비용:
			          	<input type="number" class="form-control" id="wdoCost"name="wdoCost">
			          	비고:
			          	<input type="text" class="form-control" id="wdoRemarks"name="wdoRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wdoDate"name="wdoDate">
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
			        <form id="etcform" action="/pineapple/addwbsdailyetc.pms" method="post">
			        	<label for="wbsdailyetc" id="wbsdailyetc">WBS예상기타 지출</label><br>
			           	용도:
			            <input type="text" class="form-control" id="wdePurpose"name="wdePurpose">
			          	비용:
			          	<input type="number" class="form-control" id="wdeCost"name="wdeCost">
			          	비고:
			          	<input type="text" class="form-control" id="wdeRemarks"name="wdeRemarks">
			          	사용일:
			          	<input type="date" class="form-control" id="wdeDate"name="wdeDate">
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
			        <form id="incomeform"action="/pineapple/wbsdailyincomeinsert.pms" method="post">
			        	<label for="wbsdailyincome" id="wbsdailyincome">WBS예상 수익</label><br>
			           	수익사유:
			            <input type="text" class="form-control" id="wdiReason"name="wdiReason">
			          	수익:
			          	<input type="number" class="form-control" id="wdiIncome"name="wdiIncome">
			          	수익일:
			          	<input type="date" class="form-control" id="wdiDate"name="wdiDate">
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