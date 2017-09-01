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
				<div class="col-md-7">
					<form action="/pineapple/wbsplaninsert.pms" method="post">
						<label for="wbsplan">WBS예상계획</label><br>
						WBS순서:
						<input type="number" class="form-control" name="wbsPlanOrder">
						작업명:
						<input type="text" class="form-control" name="wbsPlanName">
						선행작업:
						<input type="number" class="form-control" name="wbsPlanDependency">
						작업기간:
						<input type="number" class="form-control" name="wbsPlanDuration">
						시작일:<br>
						<input type="date" name="wbsPlanStartDate"><br>
						담당자ID:
						<input type="text" class="form-control" name="wbsPlanManager">
						<!-- 회사코드 펀딩코드 마일스톤 코드 받아와서 입력 -->
						<input type="hidden" class="form-control" name="wbsPlanComCode" value="${msComCode}">
						<input type="hidden" class="form-control" name="wbsPlanFdCode" value="${fdCode}">
						<input type="hidden" class="form-control" name="wbsPlanMsCode" value="${milestoneCode}">
						<button type="hidden" class="btn btn-success">입력완료</button>
					</form>
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