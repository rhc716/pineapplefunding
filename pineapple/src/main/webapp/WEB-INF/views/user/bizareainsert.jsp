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
<title>사업분야등록</title>
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
							<td>권한부여코드</td>
							<td>회사명</td>
							<td>펀딩명</td>
							<td>펀딩진행상황</td>
							<td>부여자ID</td>
							<td>피부여자ID</td>
							<td>권한명</td>
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
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<div>
							<a type="button" class="btn btn-info" data-toggle="modal" href="#newfdauthmodal">+ 새로운 펀딩내 권한부여하기</a>
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
							<td>권한부여코드</td>
							<td>회사명</td>
							<td>펀딩명</td>
							<td>펀딩진행상황</td>
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