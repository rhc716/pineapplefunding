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
			<div class="col-md-7">
				<label for="wbsplan">WBS예상계획</label><br>
				펀딩명:
				<input type="text" class="form-control" name="wbsPlanFdCode" value="${wbsplandetail.fdTitle}" readonly>
				마일스톤명:
				<input type="text" class="form-control" name="wbsPlanMsCode" value="${wbsplandetail.milestoneName}" readonly>
				WBS코드:
				<input type="text" class="form-control" name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}" readonly>
				WBS순서:
				<input type="text" class="form-control" name="wbsPlanOrder" value="${wbsplandetail.wbsPlanOrder}" readonly>
				작업명:
				<input type="text" class="form-control" name="wbsPlanName" value="${wbsplandetail.wbsPlanName}" readonly>
				선행작업:
				<input type="text" class="form-control" name="wbsPlanDependency" value="${wbsplandetail.wbsPlanDependency}" readonly>
				작업기간:
				<input type="text" class="form-control" name="wbsPlanDuration" value="${wbsplandetail.wbsPlanDuration}" readonly>
				시작일:<br>
				<input type="text" name="wbsPlanStartDate" value="${wbsplandetail.wbsPlanStartDate}" readonly><br>
				담당자ID:
				<input type="text" class="form-control" name="wbsPlanManager" value="${wbsplandetail.wbsPlanManager}" readonly><br>
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
					<div class="col-md-4">
						<form action="/pineapple/wbsplanhumanlist.pms" method="post">
							<input type="hidden"name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}">
							<button type="submit" class="btn btn-primary">인원 상세보기</button>	
						</form>
					</div>
					<div class="col-md-4">
						<form action="/pineapple/wbsplanmateriallist.pms" method="post">
							<input type="hidden"name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}">
							<button type="submit" class="btn btn-primary">장비 상세보기</button>	
						</form>
					</div>
					<div class="col-md-4">
						<form action="/pineapple/wbsplanfacilitylist.pms" method="post">
							<input type="hidden"name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}">
							<button type="submit" class="btn btn-primary">시설 상세보기</button>	
						</form>
					</div>
				</div><br>
				<div class="row">
					<div class="col-md-4">
						<form  action="/pineapple/wbsplanoutlist.pms" method="post">
							<input type="hidden"name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}">
							<button type="submit" class="btn btn-primary">외주 상세보기</button>
						</form>
					</div>
					<div class="col-md-4">
						<form action="/pineapple/wbsplanetclist.pms" method="post">
							<input type="hidden"name="wbsPlanCode" value="${wbsplandetail.wbsPlanCode}">
							<button type="submit" class="btn btn-primary">기타 상세보기</button>	
						</form>
					</div>
					<div class="col-md-4">
						<form action="/pineapple/wbsplanincomelist.pms" method="post">
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
				        	<label for="wbsplanhuman">WBS예상인원 지출</label><br>
				        	<input type="hidden" class="form-control" name="wphWpCode" value="${wbsplandetail.wbsPlanCode}">
				        	<input type="hidden" class="form-control" name="wphFdCode" value="${wbsplandetail.wbsPlanFdCode}">
				        	<input type="hidden" class="form-control" name="wphMsCode" value="${wbsplandetail.wbsPlanMsCode}">
				        	<input type="hidden" class="form-control" name="wphComCode" value="${wbsplandetail.wbsPlanComCode}">
			          	<!-- 여기서부터는 직접 입력하는곳 --> 
				           	인원수:
				            <input type="number" class="form-control" name="wphNoPeople">
						         총비용:
				          	<input type="number" class="form-control" name="wphCost">
				          	비고:
				          	<input type="text" class="form-control" name="wphRemarks">
				          	시작일:
				          	<input type="date" class="form-control" name="wphStartDate">
				          	종료일:
				          	<input type="date" class="form-control" name="wphEndDate"><br>
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
						         수:
				          	<input type="number" class="form-control" name="wpmNo">
				          	단가:
				          	<input type="number" class="form-control" name="wpmCostPerNo">
				          	총비용:
				          	<input type="number" class="form-control" name="wpmCost">
				          	비고:
				          	<input type="text" class="form-control" name="wpmRemarks">
				          	시작일:
				          	<input type="date" class="form-control" name="wpmStartDate">
				          	종료일:
				          	<input type="date" class="form-control" name="wpmEndDate"><br>
				          	<button type="submit">입력완료</button>
				        </form>
				      </div>
				    </div>
				  </div>
				</div>
				<div class="modal fade" id="insertfacility" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">예상 시설 지출 입력</h5>
				      </div>
				      <div class="modal-body">
				        <form action="/pineapple/wbsplanfacilityinsert.pms" method="post">
				        	<input type="hidden" class="form-control" id="wpfWpCode" value="${wbsplandetail.wbsPlanCode}">
				        	<input type="hidden" class="form-control" id="wpfFdCode" value="${wbsplandetail.wbsPlanFdCode}">
				        	<input type="hidden" class="form-control" id="wpfMsCode" value="${wbsplandetail.wbsPlanMsCode}">
				           	<input type="hidden" class="form-control" id="wpfComCode" value="${wbsplandetail.wbsPlanComCode}">
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
				        <form action="/pineapple/wbsplanetcinsert.pms" method="post">
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
	</div>
<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>