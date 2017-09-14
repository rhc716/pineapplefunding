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
					+'<button type="submit" class="btn btn-danger  minibtn deletematerial" value="'+msg.wbsplanfacility[i].wpfCode+'">삭제</button>'
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
				<div class="col-md-4">
					<form  action="/pineapple/wbsplanoutlist.pms" method="post">
						<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
						<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
						<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
						<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
						<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
						<input type="hidden"name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}">
						<button type="submit" class="btn btn-primary">외주 상세보기</button>
					</form>
				</div>
				<div class="col-md-4">
					<form action="/pineapple/wbsplanetclist.pms" method="post">
						<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
						<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
						<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
						<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
						<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
						<input type="hidden"name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}">
						<button type="submit" class="btn btn-primary">기타 상세보기</button>	
					</form>
				</div>
				<div class="col-md-4">
					<form action="/pineapple/wbsplanincomelist.pms" method="post">
						<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
						<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
						<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
						<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
						<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
						<input type="hidden"name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}">
						<button type="submit" class="btn btn-primary">수입 상세보기</button>
					</form>		
				</div>	
			</div>
			
			
			
			
			
			<!-- 모달 -->
			<div class="modal fade" id="inserthuman" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			<!-- 모달창 본문내용 -->				      
			      <div class="modal-body">
			        <form action="/pineapple/wbsplanhumaninsert.pms" method="post">
			        <!-- 기본적으로 들어가는 wbs예상코드 펀딩코드 마일스톤코드 회사코드를 입력되는곳 -->
			        	<label for="wbsplanhuman" id="wbsplanhuman">WBS예상인원 지출</label><br>
						
		          	<!-- 여기서부터는 직접 입력하는곳 --> 
			           	인원수:
			            <input type="number" class="form-control" name="wphNoPeople">
					         총비용:
			          	<input type="number" class="form-control" name="wphCost">
			          	비고:
			          	<input type="text" class="form-control" name="wphRemarks">
			          	사용일:
			          	<input type="date" class="form-control" name="wphDate">
			          	<br>
			          	<button type="submit">입력완료</button>
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
			        <form action="/pineapple/wbsplanmaterialinsert.pms" method="post">
			        	<label for="wbsplanmaterial">WBS예상장비 지출</label><br>
			        	<input type="hidden" class="form-control" name="wpmWpCode" value="${wbsplandetail.wbsPlanCode}">
			        	<input type="hidden" class="form-control" name="wpmFdCode" value="${wbsplandetail.wbsPlanFdCode}">
			        	<input type="hidden" class="form-control" name="wpmMsCode" value="${wbsplandetail.wbsPlanMsCode}">
			           	<input type="hidden" class="form-control" name="wpmComCode" value="${wbsplandetail.wbsPlanComCode}">
			           	장비명:
			            <input type="text" class="form-control" name="wpmName">
			          	비용:
			          	<input type="number" class="form-control" name="wpmCost">
			          	비고:
			          	<input type="text" class="form-control" name="wpmRemarks">
			          	사용일:
			          	<input type="date" class="form-control" name="wpmDate">
			          	<br>
			          	<button type="submit">입력완료</button>
			        </form>
			      </div>
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="insertfacility" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-body">
			        <form action="/pineapple/wbsplanfacilityinsert.pms" method="post">
			        	<label for="wbsplanfacility">WBS예상시설 지출</label><br>
			       	<input type="hidden" class="form-control" name="wpfWpCode" value="${wbsplandetail.wbsPlanCode}">
			        	<input type="hidden" class="form-control" name="wpfFdCode" value="${wbsplandetail.wbsPlanFdCode}">
			        	<input type="hidden" class="form-control" name="wpfMsCode" value="${wbsplandetail.wbsPlanMsCode}">
			           	<input type="hidden" class="form-control" name="wpfComCode" value="${wbsplandetail.wbsPlanComCode}">
			           	시설명:
			            <input type="text" class="form-control" name="wpfName">
			          	가격:
			          	<input type="number" class="form-control" name="wpfCost">
			          	비고:
			          	<input type="text" class="form-control" name="wpfRemarks">
			          	시작일:
			          	<input type="date" class="form-control" name="wpfStartDate">
			          	종료일:
			          	<input type="date" class="form-control" name="wpfEndDate"><br>
			          	<button type="submit">입력완료</button>
			        </form>
			      </div>				     
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="insertout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">예상 외주 지출 입력</h5>
			      </div>
			      <div class="modal-body">
			        <form action="/pineapple/wbsplanoutinsert.pms" method="post">
			        	<input type="hidden" class="form-control" name="wpoWpCode" value="${wbsplandetail.wbsPlanCode}">
			        	<input type="hidden" class="form-control" name="wpoFdCode" value="${wbsplandetail.wbsPlanFdCode}">
			        	<input type="hidden" class="form-control" name="wpoMsCode" value="${wbsplandetail.wbsPlanMsCode}">
			           	<input type="hidden" class="form-control" name="wpoComCode" value="${wbsplandetail.wbsPlanComCode}">
			           	외주업체명:
			            <input type="text" class="form-control" name="wpoOutComName">			    
			          	비용:
			          	<input type="number" class="form-control" name="wpoCost">
			          	비고:
			          	<input type="text" class="form-control" name="wpoRemarks">
			          	시작일:
			          	<input type="date" class="form-control" name="wpoStartDate">
			          	종료일:
			          	<input type="date" class="form-control" name="wpoEndDate"><br>
			          	<button type="submit">입력완료</button>
			        </form>
			      </div>				     
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="insertetc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">예상 기타 지출 입력</h5>
			      </div>
			      <div class="modal-body">
			        <form action="/pineapple/addwbsplanetc.pms" method="post">
			        	<input type="hidden" class="form-control" name="wpeWpCode" value="${wbsplandetail.wbsPlanCode}">
			        	<input type="hidden" class="form-control" name="wpeFdCode" value="${wbsplandetail.wbsPlanFdCode}">
			        	<input type="hidden" class="form-control" name="wpeMsCode" value="${wbsplandetail.wbsPlanMsCode}">
			           	<input type="hidden" class="form-control" name="wpeComCode" value="${wbsplandetail.wbsPlanComCode}">
			           	용도:
			            <input type="text" class="form-control" name="wpePurpose">
			          	비용:
			          	<input type="number" class="form-control" name="wpeCost">
			          	비고:
			          	<input type="text" class="form-control" name="wpeRemarks">
			          	시작일:
			          	<input type="date" class="form-control" name="wpeStartDate">
			          	종료일:
			          	<input type="date" class="form-control" name="wpeEndDate"><br>
			          	<button type="submit">입력완료</button>
			        </form>
			      </div>				      
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="insertincome" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">예상 수입 입력</h5>
			      </div>
			      <div class="modal-body">
			        <form action="/pineapple/wbsplanincomeinsert.pms" method="post">
			        	<input type="hidden" class="form-control" name="wpiWpCode" value="${wbsplandetail.wbsPlanCode}">
			        	<input type="hidden" class="form-control" name="wpiFdCode" value="${wbsplandetail.wbsPlanFdCode}">
			        	<input type="hidden" class="form-control" name="wpiMsCode" value="${wbsplandetail.wbsPlanMsCode}">
			        	<input type="hidden" class="form-control" name="wpiComCode" value="${wbsplandetail.wbsPlanComCode}">
			           	수익사유:
			            <input type="text" class="form-control" name="wpiReason">
			          	수익:
			          	<input type="number" class="form-control" name="wpiIncome">
			          	시작일:
			          	<input type="date" class="form-control" name="wpiStartDate">
			          	종료일:
			          	<input type="date" class="form-control" name="wpiEndDate"><br>
			          	<button type="submit">입력완료</button>
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