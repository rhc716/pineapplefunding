<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>펀딩내 권한부여</title>
</head>
<body>
<div class="container">
<!--최상단 로고 및 로그인 or 로그아웃버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
	<div class="row">
		<div class="col-md-3">
			<c:import url="/resources/module/pmsleftmenu.jsp"/>
		</div>
		<div class="col-md-9">
		<br>
			<!-- 권한 부여자인 권한부여정보 조회 -->
			<div class="pagetitleandexplainbox">
				<h4>${nickname}님이 펀딩내 권한 부여자</h4>
			</div>
			<div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr class="info">
							<td>번호</td>
							<td>권한코드</td>
							<td>회사명</td>
							<td>펀딩명</td>
							<td>펀딩상황</td>
							<td>부여자ID</td>
							<td>피부여자ID</td>
							<td>권한명</td>
							<td>삭제</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="authgiverList" items="${authgiverList}" varStatus="numberofauthgive">
							<tr>
								<td> ${numberofauthgive.count} </td>
								<td> ${authgiverList.authCode} </td>
								<td> ${authgiverList.comName} </td>
								<td> ${authgiverList.fdTitle} </td>
								<td> ${authgiverList.fdStatus} </td>
								<td><a type="button" class="btn btn-block btn-success disabled">${authgiverList.authGiver}</a></td>
								<td> ${authgiverList.authReceiver} </td>
								<td><a type="button" class="btn btn-block btn-danger disabled">${authgiverList.authLevelName}</a></td>
								<td>
									<form action="/pineapple/deletefundingauth.user" method="post">
										<input type="hidden" name="authCode" value="${authgiverList.authCode}">
										<button type="submit" class="btn btn-block btn-danger">삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<div>
							<a type="button" class="btn btn-info" data-toggle="modal" href="#newfdauthmodal${numberofauthgive.count}">+ 새로운 펀딩내 권한부여하기</a>
							<!-- 새로운 권한부여 모달 화면 -->
							<div class="modal fade" id="newfdauthmodal${numberofauthgive.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">${nickname}님의 새로운 권한부여</h4>
							      </div>
							      <div class="modal-body">
							        <form action="/pineapple/addnewfundingauth.user" method="post">
							        	<div class="container_insert">
										  	<div class="form-group">
											    <label for="authFdName">펀딩명</label>
											    <p id="explain">(권한을 부여할 펀딩 이름을 정확히 선택해주세요)</p>
											    <select id="fdselectlist" name="authFdCode" class="form-control">
												    <c:forEach var="fundinglist" items="${fundinglistById}">
												    	<optgroup label="${fundinglist.comName}">
												    		<option value="${fundinglist.fdCode}">${fundinglist.fdTitle}</option>
												    	</optgroup>
												    </c:forEach>
												</select>
										  	</div>
										  	<br>
										  	<div id="authGiverIdinput" class="form-group has-success has-feedback">
												<label class="control-label" for="inputSuccess2">권한부여자ID</label>
												<input type="text" class="form-control" name="authGiver" value="${id}" varia-describedby="inputSuccess2Status" readonly>
												<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
												<span id="inputSuccess2Status" class="sr-only">(success)</span>
											</div>
										  	<br>
										  	<div class="form-group">
										  		<label for="authReceiver">권한피부여자ID</label>
											    <p id="explain">(권한을 부여받을 사원의 ID를 선택해주세요)</p>
											    <select name="authReceiver" id="employeelistonecompany" class="form-control">
												    <c:forEach var="employeelist" items="${allEmployeeInMyCom}" varStatus="emNumber">
										    			<optgroup label="${employeelist.emComName}">
										    				<option value="${employeelist.emUserId}">${employeelist.emUserId}</option>
										    			
										    			</optgroup>
												    </c:forEach>
											    </select>
										  	</div>
											<br>
											<div class="form-group">
										  		<label for="fdAuthLevelCode">펀딩내 권한명</label>
											    <p id="explain">(펀딩내에서 부여할 권한명을 선택해주시기 바랍니다)</p>
											    <select name="fdAuthLevelCode" class="form-control">
											     	<optgroup label="권한명">
													    <c:forEach var="fdauthlevel" items="${fundingauthlevel}">
													    	<option value="${fdauthlevel.authLevelCode}">${fdauthlevel.authLevelName}</option>
													    </c:forEach>
												    </optgroup>
											    </select>
										  	</div>
											<br>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
									        <button type="submit" class="btn btn-info">권한부여</button>
									      </div>
							        </form>
							      </div>
							    </div>
							  </div>
							</div>
						</div>
					</tfoot>
				</table>
				
			</div>
			<!-- 권한 피부여자인 권한부여정보 조회 -->
			<div class="pagetitleandexplainbox">
				<h4>${nickname}님이 펀딩내 권한 피부여자</h4>
			</div>
			<div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr class="info">
							<td>번호</td>
							<td>권한코드</td>
							<td>회사명</td>
							<td>펀딩명</td>
							<td>펀딩상황</td>
							<td>부여자ID</td>
							<td>피부여자ID</td>
							<td>권한명</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="authreceiverList" items="${authreceiverList}" varStatus="numberofauthreceive">
							<tr>
								<td> ${numberofauthreceive.count} </td>
								<td> ${authreceiverList.authCode} </td>
								<td> ${authreceiverList.comName} </td>
								<td> ${authreceiverList.fdTitle} </td>
								<td> ${authreceiverList.fdStatus} </td>
								<td> ${authreceiverList.authGiver}</td>
								<td><a type="button" class="btn btn-block btn-success disabled">${authreceiverList.authReceiver}</a></td>
								<td><a type="button" class="btn btn-block btn-danger disabled">${authreceiverList.authLevelName}</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
<!-- 풋터 -->
<c:import url="/resources/module/footer.jsp"/>
</div>	
</body>
</html>