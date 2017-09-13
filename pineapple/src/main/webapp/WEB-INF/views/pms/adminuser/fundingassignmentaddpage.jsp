<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<div class="col-md-9" id="myfundinglist">
		<div class="pagetitleandexplainbox">
			<h1>배당 펀딩</h1>
			<span>
				<b>배당할 펀딩의 정보를 불러옵니다.</b><br>

			</span>
		</div>
		<table class="table table-striped table-bordered table-hover">
						<tr class="info">
							<th>기업코드</th>
							<th>기업명</th>
						</tr>
<%-- 						<tr>
							<td>${fundingAndComAndMile[0].comCode}</td>
							<td>${fundingAndComAndMile[0].comName}</td>
						</tr> --%>
		</table>
		<table class="table table-striped table-bordered table-hover">
						<tr class="info">
							<th>펀딩코드</th>
							<th>펀딩</th>
							<th>상황</th>
							<th>개설ID</th>
							<th>요청일</th>
							<th>승인여부</th>
							<th>승인일</th>
							<th>승인ID</th>
						</tr>
	<%-- 					<tr>
							<td>${fundingAndComAndMile[0].fdCode}</td>
							<td>${fundingAndComAndMile[0].fdTitle}</td>
							<td>${fundingAndComAndMile[0].fdStatus}</td>
							<td>${fundingAndComAndMile[0].fdPublisher}</td>
							<td>${fundingAndComAndMile[0].fdDate}</td>
							<td>
								<c:if test="${fundingAndComAndMile[0].adminApproval==1}">승인</c:if>
								<c:if test="${fundingAndComAndMile[0].adminApproval!=1}">비승인</c:if>
							</td>
							<td>${fundingAndComAndMile[0].fdApprovalDate}</td>
							<td>${fundingAndComAndMile[0].fdApprovalId}</td>
						</tr> --%>
					</table>
					<table class="table table-striped table-bordered table-hover">
						<tr class="info">
							<th>형태</th>
							<th>발행주식수</th>
							<th>주당발행가</th>
							<th>최저이율</th>
							<th>모집 시작일 ~ 마감일</th>
							<th>프로젝트 시작일 ~ 마감일</th>
						</tr>
<%-- 						<tr>
							<td>${fundingAndComAndMile[0].fdType}</td>
							<td>${fundingAndComAndMile[0].numberOfShares}</td>
							<td>${fundingAndComAndMile[0].issuePrice}</td>
							<td>${fundingAndComAndMile[0].minInvestMoney}</td>
							<td>${fundingAndComAndMile[0].openDate}<br>~${fundingAndComAndMile[0].closeDate}</td>
							<td>${fundingAndComAndMile[0].projectStartDate}<br>~${fundingAndComAndMile[0].projectEndDate}</td>
						</tr> --%>
					</table>
					<div class="row">
						<div class="col-xs-6">		
							<div class="pagetitleandexplainbox"> 
								<h1>보고서파일 리스트</h1>
							</div>
							<!-- 보고서 파일 다운로드 리스트 들어갈 곳 -->
							<div>
								<table class="table" id="myfundingfilelist">
									<tr>
										<td>펀딩명</td>
										<td>보고서명</td>
										<td>보고서확장자</td>
										<td>보고서용량</td>
										<td>다운로드</td>
									</tr>
									<!-- 리스트 뿌려질 곳 -->					
								</table>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="pagetitleandexplainbox"> 
								<h1>투자자 리스트</h1>
							</div>
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr class="info">
										<th>투자자아이디</th>
										<th>구매주식수</th>
										<th>결제여부</th>
										<th>투자일</th>
									</tr>
								</thead>
								<!-- ajax요청으로 목록을 채워줌 -->
								<tbody id="investorlist"> 
											
								</tbody>
							</table>
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