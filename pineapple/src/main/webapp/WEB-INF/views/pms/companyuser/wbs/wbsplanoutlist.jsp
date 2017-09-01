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
			<div class="col-md-3">
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
			               
				       	</li>
				 	</ul>
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
				       	<li>
					       	<strong>WBS코드  :${wbsplancode}</strong>
								<ul>
								<form action="/pineapple/wbsplanhumanlist.pms" method="post">	
									<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
									<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
									<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
									<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
									<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
									<input type="hidden" readonly="readonly"  name="wbsPlanCode" value="${wbsplancode}">
						       		<input type=submit value="인원상세" class="submitLink">
					       		</form>
					       		<form action="/pineapple/wbsplanmateriallist.pms" method="post">	
									<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
									<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
									<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
									<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
									<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
									<input type="hidden" readonly="readonly"  name="wbsPlanCode" value="${wbsplancode}">
						       		<input type=submit value="장비상세" class="submitLink">
					       		</form>
					       		<form action="/pineapple/wbsplanfacilitylist.pms" method="post">
									<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
									<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
									<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
									<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
									<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
									<input type="hidden" readonly="readonly"  name="wbsPlanCode" value="${wbsplancode}">
						       		<input type=submit value="시설상세" class="submitLink">
					       		</form>
					       		<form  action="/pineapple/wbsplanoutlist.pms" method="post">
									<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
									<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
									<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
									<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
									<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
									<input type="hidden" readonly="readonly"  name="wbsPlanCode" value="${wbsplancode}">
						       		<input type=submit value="외주상세" class="submitLink">
					       		</form>
					       		<form action="/pineapple/wbsplanetclist.pms" method="post">	
									<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
									<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
									<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
									<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
									<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
									<input type="hidden" readonly="readonly"  name="wbsPlanCode" value="${wbsplancode}">
						       		<input type=submit value="기타상세" class="submitLink">
					       		</form>
					       		<form action="/pineapple/wbsplanincomelist.pms" method="post">	
									<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
									<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
									<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
									<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
									<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
									<input type="hidden" readonly="readonly"  name="wbsPlanCode" value="${wbsplancode}">
						       		<input type=submit value="수입상세" class="submitLink">
					       		</form>
					       		</ul>
				       	</li>
				    </ul>
				</div>
			</div>
				<div class="col-md-7">
					<c:forEach var="list" items="${wbsplanoutlist}">
		 				<div class="col-md-4 well">
							<div>
								외주업체명 = ${list.wpoOutComName}<br>
								비용 = ${list.wpoCost}<br>
								비고 = ${list.wpoRemarks}<br>
								<div class="row">
									<div class="col-md-5">
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${list.wpoCode}">수정</button>
									</div>
									<div class="col-md-5">
										<form action="/pineapple/wbsplanoutdelete.pms" metod="post">
											<input type="hidden" class="form-control" name="wpoWpCode" value="${list.wpoWpCode}">
											<input type="hidden" class="form-control" name="wpoCode" value="${list.wpoCode}">
											<button type="submit" class="btn btn-danger">삭제</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- 모달 -->
						<div class="modal fade" id="${list.wpoCode}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						<!-- 모달창 본문내용 -->				      
						      <div class="modal-body">
						        <form action="/pineapple/wbsplanoutupdate.pms" method="post">
						        	<label for="wbsplanmaterial">WBS예상외주 지출</label><br>
						        	<!-- wph수정하기 위한 코드를 가져감 -->
						        	<input type="hidden" class="form-control" name="wpoCode" value="${list.wpoCode}">
						        	<!-- 수정 완료후 다시 페이지 불러오기 위해 wp코드가져감 -->
						        	<input type="hidden" class="form-control" name="wpoWpCode" value="${list.wpoWpCode}">
					          	<!-- 여기서부터는 직접 입력하는곳 --> 	
					          		외주업체명:
						            <input type="text" class="form-control" name="wpoOutComName" value="${list.wpoOutComName}" >			    
						          	비용:
						          	<input type="number" class="form-control" name="wpoCost" value="${list.wpoCost}">
						          	비고:
						          	<input type="text" class="form-control" name="wpoRemarks" value="${list.wpoRemarks}">
						          	시작일:
						          	<input type="date" class="form-control" name="wpoStartDate" value="${list.wpoStartDate}">
						          	종료일:
						          	<input type="date" class="form-control" name="wpoEndDate" value="${list.wpoEndDate}"><br>
						          	<button type="submit">수정하기</button>
						        </form>
						      </div>
						    </div>
						  </div>
						</div>		
					</c:forEach>
				</div>
			<div class="col-md-1"></div>
		</div>
	</div>

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>