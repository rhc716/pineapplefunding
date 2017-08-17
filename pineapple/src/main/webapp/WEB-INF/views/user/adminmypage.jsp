<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 MyPage</title>
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

<!-- css lbr -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lbr.css" />
</head>
<body>
<!--로그인 버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<!-- 사이트관리자마이페이지 Tab bar -->
	<div class="container"> 
		<ul id="myTab" class="nav nav-tabs" role="tablist"> 
			<li role="presentation" class="active">
				<a data-target="#investorinfo" id="investorinfo-tab" role="tab" data-toggle="tab" aria-controls="investorinfo" aria-expanded="true">내정보</a>
			</li> 
			<li role="presentation" class="">
				<a data-target="#timeline" role="tab" id="timeline-tab" data-toggle="tab" aria-controls="timeline" aria-expanded="false">타임라인</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#fundingqna" role="tab" id="fundingqna-tab" data-toggle="tab" aria-controls="fundingqna" aria-expanded="false">펀딩Q&A</a>
			</li>
			<li role="presentation" class="">
				<a data-target="#message" role="tab" id="message-tab" data-toggle="tab" aria-controls="message" aria-expanded="false">메세지</a>
			</li>  
			<li role="presentation" class="">
				<a data-target="#investmemt" role="tab" id="investmemt-tab" data-toggle="tab" aria-controls="investmemt" aria-expanded="false">투자내역</a>
			</li>  
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="investorinfo" aria-labelledby="investorinfo-tab">
				<div class="row">
					<div class="col-md-2">
						<p>내정보</p>
					</div>
					<div class="col-md-10">
						<br>
						<div>
							${level} 아이디 : ${id}<br>
							${level} 닉네임 : ${nickname}<br>
							${level} 권한 : ${level}<br>
						</div>
						<br>
						<div>
							<form action="/pineapple/userdetailinsert.user">
								<button type="submit" class="btn btn-info">상세정보입력</button>
								<p id="explain">(회원상세정보를 입력해주시기 바랍니다)</p>
							</form>
						</div>
						<br><br>
						<p>내계좌정보</p>
						<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr class="info">
									<td>증권사</td>
									<td>계좌번호</td>
									<td>계좌이름</td>
									</tr>
								</thead>
						<c:forEach var="useraccount" items="${user.account}">
							
								<tbody>
									<tr>
										<td> ${useraccount.secCompany} </td>
										<td> ${useraccount.accountNumber} </td>
										<td> ${useraccount.accountNickname} </td>
									</tr>
								</tbody>
						</c:forEach>
						</table>
					</div>
				</div>			
				
			</div> 
			<div role="tabpanel" class="tab-pane fade" id="timeline" aria-labelledby="timeline-tab"> 
				<p>타임라인</p> 
			</div>
			<div role="tabpanel" class="tab-pane fade" id="fundingqna" aria-labelledby="fundingqna-tab"> 
				<p>펀딩Q&A</p> 
			</div>
			<div role="tabpanel" class="tab-pane fade" id="message" aria-labelledby="message-tab"> 
				<p>메세지</p> 
			</div>
			<div role="tabpanel" class="tab-pane fade" id="investmemt" aria-labelledby="investmemt-tab"> 
				<p>내투자 및 배당금</p> 
			</div>
		</div> 
	</div>
<!-- 풋터 -->
<c:import url="/resources/module/footer.jsp"/>
</body>
</html>