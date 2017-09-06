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
<script>
$(document).ready(function(){
	// 펀딩을 선택하는 select option 채워줄 ajax
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/getmyfundinglist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}"}
	});
	// 성공시
	getfundinglist.done(function(msg){
		console.log(msg);
		//펀딩을 선택하는 select option 채워주는 코드 
		for(var i = 0; i<msg.length; i++){
			$('#fdselectlist').append(
				'<option value='+msg[i].fdCode+'>'+msg[i].fdTitle+'</option>'
			);
			
		};	
			
	});	
			

	// 실패시
	getfundinglist.fail(function(){
		alert('ajax통신실패');
	});
	
});
</script>
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
			<!-- 사업분야 입력양식 -->
			<h3>사업분야 입력하기</h3>
			<p id="explanation">
				펀딩별 사업분야를 등록해주시기 바랍니다.
				펀딩별 다양한 사업분야를 등록할 수 있습니다.
			</p>
			<div>
				<form action="/pineapple/insertbizarea.user" method="post">
					<select id="fdselectlist" name="areaFdCode">
					</select>
					<select name="areaName">
						<option value="it">it</option>
						<option value="핀테크">핀테크</option>
						<option value="인터넷서비스">인터넷서비스</option>
						<option value="문화">문화</option>
						<option value="디자인">디자인</option>
						<option value="뷰티">뷰티</option>
						<option value="의료">의료</option>
						<option value="제조">제조</option>
						<option value="유통">유통</option>
						<option value="농수산">농수산</option>
					</select>
					<input type="hidden" name="areaCode">
					<button type="submit" class="btn btn-lg btn-success">등록</button>
				</form>
			</div>
			<br>
			<!-- 사업분야부여 조회 후 출력 -->
			<h3>사업분야 조회하기</h3>
			<p id="explanation">
				자신이 속한 기업별 펀딩들의 사업분야를 조회할 수 있습니다.
				전체 사업분야 리스트를 조회 후, 바로 사업분야를 삭제 할 수 있습니다.
			</p>
			<div>
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr class="info">
							<td>번호</td>
							<td>분야코드</td>
							<td>회사명</td>
							<td>펀딩명</td>
							<td>사업분야명</td>
							<td>삭제</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="allbizarea" items="${allbizarea}" varStatus="numberofallbizarea">
							<tr>
								<td> ${numberofallbizarea.count} </td>
								<td> ${allbizarea.areaCode} </td>
								<td> ${allbizarea.comName} </td>
								<td> ${allbizarea.fdTitle} </td>
								<td><a type="button" class="btn btn-block btn-info disabled">${allbizarea.areaName}</a></td>
								<td>
									<form action="/pineapple/deletebizarea.user" method="post">
										<input type="hidden" name="areaCode" value="${allbizarea.areaCode}">
										<button type="submit" class="btn btn-block btn-danger">삭제</button>
									</form>
								</td>
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