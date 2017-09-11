<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBulC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/js/leftmenu.js"></script>
<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />

<body>

<!-- 분기를 통해 권한별 왼쪽 메뉴를 다르게 해줌 -->

<!-- 기업회원일 경우 -->
<c:if test="${level eq '기업회원'}">
	<nav id="mysidebarmenu" class="amazonmenu">
		<ul>
			<li><a href="">펀딩관리</a>
				<ul>
			  		<li><a href="/pineapple/fundinginsert.pms">펀딩개설</a></li>
			  		<li><a href="/pineapple/myfundinglistpage.pms">펀딩조회</a></li>
			  		<li><a href="/pineapple/myfundingdetaillist.pms">펀딩상세정보관리</a></li>
			  		<li><a href="/pineapple/getbizareapage.user">펀딩사업분야관리</a></li>
			  		<li><a href="/pineapple/myfundingposterimgpage.pms">펀딩포스터이미지관리(업로드)</a></li>
			  		<li><a href="/pineapple/myfundingdividendplan.pms">펀딩배당계획관리</a></li>
			  		<li><a href="/pineapple/myfundinginvestorlistpage.pms">펀딩투자자조회</a></li>
				</ul>
			</li>
			<li><a href="">마일스톤관리</a>
				<ul>
					<li><a href="/pineapple/milestoneinsert.pms">마일스톤생성</a></li>
					<li><a href="/pineapple/mymilestonelist.pms">마일스톤조회</a></li>
				</ul>
			</li>
			<li><a href="">WBS관리</a>
				<ul>
					<li><a href="/pineapple/wbsplanlistpage.pms">WBS관리</a></li>
					<li><a href="">WBS승인</a></li>
				</ul>
			</li>
			<li><a>보고서관리</a>
				<ul>
					<li><a href="/pineapple/fundingfileuploadpage.pms">보고서업로드</a></li>
					<li><a href="/pineapple/fundingfilelistpage.pms">보고서조회(다운로드)</a></li>
				</ul>
			</li>
			<li><a>배당하기</a></li>
			<li><a href="/pineapple/fundingauth.user">펀딩내권한부여</a></li>
	
		</ul>
	</nav>
</c:if>
<!-- 투자자일 경우 -->
<c:if test="${level eq '투자자'}">
	<nav id="mysidebarmenu" class="amazonmenu">
		<ul>
			<li><a href="">펀딩관리</a></li>
			<li><a href="">마일스톤보기</a></li>
			<li><a href="">WBS보기</a></li>
			<li><a href="">배당내역보기</a></li>
		</ul>
	</nav>
</c:if>

<!-- 관리자일 경우 -->
<c:if test="${level eq '관리자'}">
	<nav id="mysidebarmenu" class="amazonmenu">
		<ul>
			<li><a href="/pineapple/fundingtotalview.pms">펀딩관리</a></li>
			<li><a href="">마일스톤보기</a></li>
			<li><a href="">WBS보기</a></li>
			<li><a href="">배당내역보기</a></li>
		</ul>
	</nav>
</c:if>
</body>
</html>