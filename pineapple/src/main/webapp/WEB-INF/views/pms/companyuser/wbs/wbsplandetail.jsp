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
<script>
		$(function(){
		    $("#insertwbsplanhuman").click(function(){
		    	$('div.modal').modal({
		    		remote : '/pineapple/wbsplaninserthuman.pms'
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
		<div class="col-md-7">
			<form method="get"> 
				<label for="wbsplan">WBS예상계획</label><br>
				펀딩코드:
				<input type="text" class="form-control" name="wbsPlanFdCode" value="${wbsplandetail.wbsPlanFdCode}" readonly>
				마일스톤코드:
				<input type="text" class="form-control" name="wbsPlanMsCode" value="${wbsplandetail.wbsPlanMsCode}" readonly>
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
				<input type="text" class="form-control" name="wbsPlanManager" value="${wbsplandetail.wbsPlanManager}" readonly>
				<!-- 트리거 -->
				<input type="button" class="btn btn-default" id="insertwbsplanhuman" data-toggle="modal" value="인원">
				<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
 					<div class="modal-dialog modal-sm">
   						<div class="modal-content">
    		   				 <!-- remote ajax call이 되는영역 -->
  						</div>
					</div>
				</div>
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