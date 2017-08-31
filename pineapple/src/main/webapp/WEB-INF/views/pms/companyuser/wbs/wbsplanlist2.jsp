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
		<form action="/pineapple/wbsmsview.pms" method="post">	
			<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
			<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
			<button type="submit" class="btn btn-sm btn-primary">펀딩명 :  ${fdTitle}</button>
		</form><br>
		<form action="/pineapple/wbsform.pms" method="post">	
				<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
				<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
				<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
				<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
				<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
				<button type="submit" class="btn btn-sm btn-primary" name="btn" value="wbslist">마일스톤명 : ${milestoneName}</button>
		</form><br>
			<div class="col-md-1"></div>
				<div class="col-md-7">
					<c:forEach var="list" items="${wbsplan}">
			 			<div class="col-lg-4 well">
				 				<div>
				 				
				 				wbs순서:${list.wbsPlanOrder}<br>
				 				wbs이름 :${list.wbsPlanName}<br>
				 				<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#${list.wbsPlanCode}">수정</button>
				 				<form action="/pineapple/wbsplandetail.pms" method="post">
				 					<button type="submit" class="btn btn-danger btn-sm" name="btn" value="delete">삭제</button>
				 					<button type="submit" class="btn btn-primary btn-sm" name="btn" value="detail">상세정보</button>				 				
					 				<div class="modal fade" id="${list.wbsPlanCode}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-body">
													<label for="wbsplan">WBS수정</label><br>
													작업명:
													<input type="text" class="form-control" name="wbsPlanName" value="${list.wbsPlanName}"/>
													선행작업:
													<input type="number" class="form-control" name="wbsPlanDependency" value="${list.wbsPlanDependency}"/>
													작업기간:
													<input type="number" class="form-control" name="wbsPlanDuration" value="${list.wbsPlanDuration}"/>
													시작일:<br>
													<input type="date" name="wbsPlanStartDate" value="${list.wbsPlanStartDate}"/><br>
													담당자ID:
													<input type="text" class="form-control" name="wbsPlanManager" value="${list.wbsPlanManager}"/><br>
													<input type="hidden" name="wbsPlanCode" value="${list.wbsPlanCode}"/>
													<input type="hidden" class="form-control" name="wbsPlanComCode" value="${list.wbsPlanComCode}">
													<input type="hidden" class="form-control" name="wbsPlanFdCode" value="${list.wbsPlanFdCode}">
													<input type="hidden" class="form-control" name="wbsPlanOrder" value="${list.wbsPlanOrder}">
													<input type="hidden" class="form-control" name="wbsPlanMsCode" value="${list.wbsPlanMsCode}">
													<input type="hidden" class="form-control" name="wbsPlanChange" value="${list.wbsPlanChange}">
													<input type="hidden" readonly="readonly"  name="fdCode" value="${fdCode}">
													<input type="hidden" readonly="readonly"  name="fdTitle" value="${fdTitle}">
													<input type="hidden" readonly="readonly"  name="milestoneCode" value="${milestoneCode}">
													<input type="hidden" readonly="readonly"  name="milestoneName" value="${milestoneName}">
													<input type="hidden" readonly="readonly"  name="msComCode" value="${msComCode}">
													<button type="submit" name="btn" value="update">입력완료</button>
												</div>
											</div>
										</div>
									</div>
								</form>	
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