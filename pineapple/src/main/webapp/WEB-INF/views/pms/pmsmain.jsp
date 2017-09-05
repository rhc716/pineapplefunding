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

<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>


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
		// 관리자 권한
		if($('#userlevel').val()=="관리자"){
			$('#totalUserCount').append(msg[0].totalUserCount+'명');
			$('#totalComCount').append(msg[0].totalComCount+'명');
			$('#totalInvestorUserCount').append(msg[0].totalInvestorUserCount+'명');
			$('#totalComUserCount').append(msg[0].totalComUserCount+'명');
			
			$('#totalFundingCount').append(msg[1].totalFundingCount);
			$('#totalRecruitingFundingCount').append(msg[1].totalRecruitingFundingCount);
			$('#totalRequestFundingCount').append(msg[1].totalRequestFundingCount);
			$('#totalProceedingFundingCount').append(msg[1].totalProceedingFundingCount);
		
			// 도넛차트 
			var Canvas = document.getElementById("donut");
			// 차트위에 색상목록 글씨 폰트사이즈
			Chart.defaults.global.defaultFontSize = 25;
			var colors = [
				  ['rgba(101, 187, 166, 1)', 'rgba(101, 187, 166, 0.4)'],
				  ['rgba(108, 185, 189, 1)', 'rgba(108, 185, 189, 0.4)']
				  ];
			
			var pieColors = [
				  colors[0][0],
				  colors[1][0]
				  ];
			
			var chartData = {
			    labels: ["투자자회원", "기업회원"]
				, datasets: [{
			            data: [msg[0].totalInvestorUserCount, msg[0].totalComUserCount],
			            borderWidth: 2,
			            hoverBorderWidth: 10,
			            hoverBackgroundColor: pieColors,
			            hoverBorderColor: pieColors,
			            backgroundColor: ["#5b6777", "#fac513"]
			        		}]
			};

			var pieChart = new Chart(Canvas, {
			  type: 'pie',
			  data: chartData
			});
			
		// 기업회원 권한
		} else if($('#userlevel').val()=="기업회원"){
			for(var i=0; i<msg[1].length; i++){
				$('#comName').append("<i class=\"glyphicon glyphicon-user green\"/> "
									+msg[1][i].comList[0].comName+"사의 "
									+msg[1][i].comList[0].emDepartment+"소속 "
									+msg[1][i].comList[0].rankName+"<br>");
			}
			$('#fdTotalCount').append(msg[0].fdTotalCount);
			$('#fdRecruitingCount').append(msg[0].fdRecruitingCount);
			$('#fdProceedingCount').append(msg[0].fdProceedingCount);
			
			for(var j=0; j<msg[2].length; j++){
				// 리스트가 어떻게 들어왔는지 출력해봄
				// console.log(msg[2][j].fundingAndFdAuthList[0]);
				var fdlist = msg[2][j].fundingAndFdAuthList[0];
				
				if(fdlist.authLevelName!=null){
					// 펀딩내 권한부여가 있는 회원일때
					$('#fdAuth').append("<i class=\"glyphicon glyphicon-briefcase\"/>"
										+fdlist.emComName+"사의 "
										+fdlist.fdTitle+"의 "
										+fdlist.authLevelName+"권한<br>");
				}
				
				if(fdlist.fdStatus=="모집중" 
						|| fdlist.fdStatus=="결제모집중" ){
					// 모집중인 펀딩
					$('#recruitingFd').append("<i class=\"glyphicon glyphicon-piggy-bank gold\"/> "
											+fdlist.emComName+"사의 "
											+fdlist.fdTitle+"<br>");
				} else {
					// 진행중인 펀딩
					$('#proceedingFd').append("<i class=\"glyphicon glyphicon-piggy-bank gold\"/> "
											+fdlist.emComName+"사의 "
											+fdlist.fdTitle+"<br>");
				}
			}
		// 투자자 권한
		} else if($('#userlevel').val()=="투자자") {
			//console.log(msg[0][0].fdList[0])
			for(var i=0; i<msg[0].length; i++){
				var investFdList = msg[0][i].fdList[0];
				
				//결제전 펀딩목록
				if(investFdList.fdStatus=="모집중" 
						|| investFdList.fdStatus=="결제모집중") {
					$('#bookingFd').append("<i class=\"glyphicon glyphicon-piggy-bank gold\"/> "
											+investFdList.fdTitle
											+" <i class=\"glyphicon glyphicon-menu-left\"/>"
											+investFdList.fdType
											+investFdList.purchaseShares
											+"주 <i class=\"glyphicon glyphicon-menu-right\"/>"
											+"<br>");
					
				//결제후 펀딩목록	
				} else if(investFdList.fdStatus=="진행중") {
					$('#investingFd').append("<i class=\"glyphicon glyphicon-piggy-bank gold\"/> "
											+investFdList.fdTitle
											+" <i class=\"glyphicon glyphicon-menu-left\"/>"
											+investFdList.fdType
											+investFdList.purchaseShares
											+"주 <i class=\"glyphicon glyphicon-menu-right\"/>"
											+"<br>");
				}
			}
			
			//금액에 콤마찍어주는 함수			
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}

			$('#totalInvestMoney').append(numberWithCommas(msg[1][0].totalInvestMoney)+"원");
			$('#totalInvestmentCount').append(msg[1][0].totalInvestmentCount);
			$('#proceedingInvestmentCount').append(msg[1][0].proceedingInvestmentCount);
			$('#proceedingFdInvestMoney').append(numberWithCommas(msg[1][0].proceedingFdInvestMoney)+"원");
		}
	});
	
	//실패시
	getprojectinfolist.fail(function(){
		alert('ajax통신 실패');
	});

});
</script>
<!-- css -->
<style> p {margin: 0px;} small{  font-size: 15px; } </style>
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
	<input type="hidden" id="userlevel" value="${level}">
<!----------------------------------기업회원일때 ------------------------------------->	
		<c:if test="${level eq '기업회원'}">
			<div class="pagetitleandexplainbox">
				<h2>기업회원용 프로젝트관리</h2>
			</div> 
            <div class="col-sm-12 pmsmainpagecontent">
                <div class="col-xs-12 col-sm-12"><br>
                    <h2>${nickname}</h2>
                    <table class="table">
						<tr>
						  <td><p><strong>회사 직급 부서</strong></p></td>
						  <td><b id="comName"></b></td>
						</tr>
						<tr>
						  <td><p><strong>펀딩내 권한</strong></p></td>
						  <td><b id="fdAuth"></b></td>
						</tr>
						<tr>
						  <td><p><strong>모집중인 펀딩</strong></p></td>
						  <td><b id="recruitingFd"></b></td>
						</tr>
						<tr>
						  <td><p><strong>진행중인 펀딩</strong></p></td>
						  <td><b id="proceedingFd"></b></td>
						</tr>
					</table>
                </div>
            </div>            
            <div class="col-xs-12 divider text-center pmsmainboxbottom">
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="fdTotalCount"></strong></h2>                    
                    <p><small>총 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="fdRecruitingCount"></strong></h2>                    
                    <p><small>모집중인 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="fdProceedingCount"></strong></h2>                    
                    <p><small>진행중인 펀딩수</small></p>
                </div>
            </div>
		</c:if>
<!----------------------------------투자자일때 ------------------------------------->		
		<c:if test="${level eq '투자자'}">
			<div class="pagetitleandexplainbox">
				<h2>투자자용 프로젝트관리</h2>
			</div> 
            <div class="col-sm-12">
                <div class="col-xs-12 col-sm-12 pmsmainpagecontent"><br>
                    <h2>${nickname}</h2>
                    <table class="table">
						<tr>
						  <td><p><strong>사전예약중 펀딩(결제전)</strong></p></td>
						  <td><b id="bookingFd"></b></td>
						</tr>
						<tr>
						  <td><p><strong>진행중인 펀딩(결제후)</strong></p></td>
						  <td><b id="investingFd"></b></td>
						</tr>
					</table>
                </div>
            </div>            
            <div class="col-xs-12 divider text-center pmsmainboxbottom">
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="totalInvestMoney"></strong></h2>                    
                    <p><small>총투자누적금액</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="totalInvestmentCount"></strong></h2>                    
                    <p><small>총투자건수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="proceedingInvestmentCount"></strong></h2>                    
                    <p><small>진행중인투자건수</small></p>
                </div>
                 <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="proceedingFdInvestMoney"></strong></h2>                    
                    <p><small>진행중인펀딩의투자금액</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>준비중</strong></h2>                    
                    <p><small>총배당금액</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>준비중</strong></h2>                    
                    <p><small>진행중인펀딩의배당금액</small></p>
                </div>
            </div>
		</c:if>
<!----------------------------------관리자일때 ------------------------------------->				
		<c:if test="${level eq '관리자'}">
			<div class="pagetitleandexplainbox">
				<h2>관리자용 프로젝트관리</h2>
			</div> 
			<div class="col-sm-12">
                <div class="col-xs-6 col-sm-6 pmsmainpagecontent"><br>
                    <h2>${nickname}</h2>
                    <table class="table">
						<tr>
						  <td><p><strong>총 회원수</strong></p></td>
						  <td><b id="totalUserCount"></b></td>
						</tr>
						<tr>
						  <td><p><strong>총 투자회원수</strong></p></td>
						  <td><b id="totalInvestorUserCount"></b></td>
						</tr>
						<tr>
						  <td><p><strong>총 기업회원수</strong></p></td>
						  <td><b id="totalComUserCount"></b></td>
						</tr>
						<tr>
						  <td><p><strong>총 회사수</strong></p></td>
						  <td><b id="totalComCount"></b></td>
						</tr>
						<tr>
						  <td><p><strong>총 방문자수</strong></p></td>
						  <td><b id="">준비중</b></td>
						</tr>
						<tr>
						  <td><p><strong>오늘 방문자수</strong></p></td>
						  <td><b id="">준비중</b></td>
						</tr>
					</table>
					<!-- 도넛차트 -->
               		<canvas class="donut" id="donut" width="250" height="250" style="padding:80px 80px; margin-top:-70px;"></canvas>
               		<br>
	               		 방문객 추이 그래프 들어갈 곳
	                <br>
                </div>
              	<div class="col-xs-6 col-sm-6 pmsmainpagecontent"><br>
               		<!-- 펀딩목록 들어올 곳 -->
               		
               	</div>
            </div>   
            <div class="col-xs-12 divider text-center pmsmainboxbottom">
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="totalFundingCount"></strong></h2>                    
                    <p><small>총펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="totalRecruitingFundingCount"></strong></h2>                    
                    <p><small>모집중인 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="totalRequestFundingCount"></strong></h2>                    
                    <p><small>개설요청중인 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong id="totalProceedingFundingCount"></strong></h2>                    
                    <p><small>진행중인 펀딩수</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>준비중</strong></h2>                    
                    <p><small>총수수료수익금</small></p>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">
                    <h2><strong>준비중</strong></h2>                    
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