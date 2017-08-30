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
<script>
$(document).ready(function(){
	
//	각각의 권한별로 프로젝트관리 메인화면에서 보여줄 대표정보를 가져오는 ajax요청
	var getprojectinfolist = $.ajax({
		type : "get",
		url : "/pineapple/getprojectinfolist.pms",
		/* 아이디와 권한을 세션에서 받아서 가져옴 */
		data : { userId : "${id}"
				, userLevel : "${level}"}
	});
	
	//성공시
	getprojectinfolist.done(function(msg){
		console.log(msg);
	});
	
	//실패시
	/* getprojectinfolist.fail(function(){
		alert('ajax통신 실패');
	}); */
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
	로그인 안할시 페이지 접근 막을것
		<c:if test="${level eq '기업회원'}">
			<div class="pagetitleandexplainbox">
				<h2>기업회원용 프로젝트관리</h2>
			</div> 
            <div class="col-sm-12">
                <div class="col-xs-12 col-sm-8"><br>
                    <h2>${nickname}</h2>
                    <p><strong>직급 :</strong> ${rank} </p>
                    <p><strong>회사 : </strong> Read</p>
                    <p><strong>모집 & 진행중인 펀딩 : </strong>
                        <span class="tags">html5</span> 
                    </p>
                </div>
            </div>            
            <div class="col-xs-12 divider text-center pmsmainboxbottom">
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong> 20,7K </strong></h2>                    
                    <p><small>총 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>245</strong></h2>                    
                    <p><small>모집중인 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>43</strong></h2>                    
                    <p><small>진행중인 펀딩수</small></p>
                </div>
            </div>
		</c:if>
		<c:if test="${level eq '투자자'}">
			<div class="pagetitleandexplainbox">
				<h2>투자자용 프로젝트관리</h2>
			</div> 
            <div class="col-sm-12">
                <div class="col-xs-12 col-sm-8"><br>
                    <h2>${nickname}</h2>
                    <p><strong>사전예약중 펀딩 : </strong>
                        <span class="tags">html5</span> 
                    </p>
                    <p><strong>투자중인 펀딩 : </strong>
                        <span class="tags">html5</span> 
                    </p>
                </div>
            </div>            
            <div class="col-xs-12 divider text-center pmsmainboxbottom">
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong> 20,7K </strong></h2>                    
                    <p><small>총투자금액</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>245</strong></h2>                    
                    <p><small>총배당금액</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>43</strong></h2>                    
                    <p><small>총투자건수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>43</strong></h2>                    
                    <p><small>진행중인투자건수</small></p>
                </div>
                 <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>43</strong></h2>                    
                    <p><small>진행중인펀딩의투자금액</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>43</strong></h2>                    
                    <p><small>진행중인펀딩의배당금액</small></p>
                </div>
            </div>
		</c:if>
		<c:if test="${level eq '관리자'}">
			<div class="pagetitleandexplainbox">
				<h2>관리자용 프로젝트관리</h2>
			</div> 
			<div class="col-sm-12">
                <div class="col-xs-12 col-sm-8"><br>
                    <h2>${nickname}</h2>
                    <p><strong>총 회원수</strong>  </p>
                    <p><strong>총 회사수</strong>  </p>
                    <p><strong>총 투자자수</strong>  </p>
                    <p><strong>총 기업회원수</strong>  </p>
                    <p><strong>총 방문자수</strong>  </p>
                    <p><strong>오늘 방문자수</strong>  </p>
                </div>
              
              <br><br>
              <br><br>
                회원 권한 비율 그래프 들어갈 곳<br><br>
                
                방문객 추이 그래프 들어갈 곳
            </div>            
            <div class="col-xs-12 divider text-center pmsmainboxbottom">
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong> 20,7K </strong></h2>                    
                    <p><small>총펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>245</strong></h2>                    
                    <p><small>모집중인 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>43</strong></h2>                    
                    <p><small>진행중인 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>43</strong></h2>                    
                    <p><small>총수수료수익금</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>43</strong></h2>                    
                    <p><small>오늘발생수수료수익금</small></p>
                </div>
            </div>
		</c:if>
		
		    	
	</div>
	
	
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>