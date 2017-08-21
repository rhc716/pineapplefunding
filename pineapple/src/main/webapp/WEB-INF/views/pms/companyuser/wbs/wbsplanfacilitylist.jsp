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

<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />

 
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
			<div class="col-md-1"></div>
				<div class="col-md-7">
					<c:forEach var="list" items="${wbsplanfacilityllist}">
		 				<div class="col-md-4 well">
							<div>
								시설명 = ${list.wpfName}<br>
								가격 = ${list.wpfCost}<br>
								비고 <br>=<br>${list.wpfRemarks}<br>
								<div class="row">
									<div class="col-md-5">
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${list.wpfCode}">수정</button>
									</div>
									<div class="col-md-5">
										<form action="/pineapple/wbsplanfacilitydelete.pms" metod="post">
											<input type="hidden" class="form-control" name="wpfWpCode" value="${list.wpfWpCode}">
											<input type="hidden" class="form-control" name="wpfCode" value="${list.wpfCode}">
											<button type="submit" class="btn btn-danger">삭제</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- 모달 -->
						<div class="modal fade" id="${list.wpfCode}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						<!-- 모달창 본문내용 -->				      
						      <div class="modal-body">
						        <form action="/pineapple/wbsplanfacilityupdate.pms" method="post">
						        	<label for="wbsplanmaterial">WBS예상시설 지출</label><br>
						        	<!-- wph수정하기 위한 코드를 가져감 -->
						        	<input type="hidden" class="form-control" name="wpfCode" value="${list.wpfCode}">
						        	<!-- 수정 완료후 다시 페이지 불러오기 위해 wp코드가져감 -->
						        	<input type="hidden" class="form-control" name="wpfWpCode" value="${list.wpfWpCode}">
					          	<!-- 여기서부터는 직접 입력하는곳 --> 
						           	시설명:
						            <input type="text" class="form-control" name="wpfName" value="${list.wpfName}">
						          	가격:
						          	<input type="number" class="form-control" name="wpfCost" value="${list.wpfCost}">
						          	비고:
						          	<input type="text" class="form-control" name="wpfRemarks" value="${list.wpfRemarks}">
						          	시작일:
						          	<input type="date" class="form-control" name="wpfStartDate" value="${list.wpfStartDate}">
						          	종료일:
						          	<input type="date" class="form-control" name="wpfEndDate" value="${list.wpfEndDate}"><br>
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