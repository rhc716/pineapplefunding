<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>invest Main</title>

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

<!-- 개인.css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

<script type="text/javascript">
$(document).ready(function(){
	//ajax 검색 function 선언
	var ajaxfunction = function(){
		var areacount = 0;
		var checkedfdarea = document.getElementsByName("category").length
		var fdarea = new Array();
 		for(i = 0 ; i < checkedfdarea ; i++){
			if(document.getElementsByName("category")[i].checked == true){
				fdarea[areacount] = document.getElementsByName("category")[i].value;
				areacount++
			}
		}
		var typecount = 0;
		var checkedfdtype = document.getElementsByName("type").length
		var fdtype = new Array();
		for(i = 0 ; i < checkedfdtype ; i++){
			if(document.getElementsByName("type")[i].checked == true){
				fdtype[typecount] = document.getElementsByName("type")[i].value;
				typecount++
			}
		}
		var dividendcount = 0;
		var checkedfddividend = document.getElementsByName("dividend").length
		var fddividend = new Array();
		for(i = 0 ; i < checkedfddividend ; i++){
			if(document.getElementsByName("dividend")[i].checked == true){
				fddividend[dividendcount] = document.getElementsByName("dividend")[i].value;
				dividendcount++
			}
		}
		var statuscount = 0;
		var checkedfdstatus = document.getElementsByName("status").length
		var fdstatus = new Array();
		for(i = 0 ; i < checkedfdstatus ; i++){
			if(document.getElementsByName("status")[i].checked == true){
				fdstatus[statuscount] = document.getElementsByName("status")[i].value;
				statuscount++
			}
		}
		
		var fundingtitlename = $('#fundinglistnameselecttext').val();
		$.ajaxSettings.traditional = true;
			var fundinglistnameselectajax = $.ajax({
				type: 'get',
				url : '/pineapple/investfdchoosemain.invest',
				data: {
					fundingtitlename : fundingtitlename,
					fdarea : fdarea,
					fdtype : fdtype,
					fddividend : fddividend,
					fdstatus : fdstatus
				},
				success : function success(msg){
					$('#fdlist').html(msg)
				},
				error : function error(){
					
				}
			});
	}
	ajaxfunction()
	//검색버튼 클릭시 ajax function 실행
	$('#fundinglistnameselectbtn').click(function(){
		ajaxfunction()
	});
	//검색조건 클릭시 ajax function 실행
	$('.category').click(function(){
		ajaxfunction()
	});
});
</script>

</head>
<body>
<div class="container">
<!--로그인 버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->
<!-- 펀딩 리스트 -->
<div class="row fdlist-main text-center" style="padding: 0px;">
	<div class="col-md-12" id="menubar" style="padding: 0px">
		<div class="col-md-2" style="padding: 0px; text-align: center; margin-left: auto; margin-right: auto;">
			<div class="col-md-12" style="padding: 0px;  border: 1.5px solid #009442; border-radius: 5px; margin-bottom: 20px;">
				<div class="input-group">
	      			<input type="text" class="form-control" id="fundinglistnameselecttext" placeholder="펀딩명 검색하기" style="margin-left: 0.75px 0px 0.75px 0.75px;">
	      				<span class="input-group-btn" style="padding: 0px;">
	        				<button class="btn btn-default" id="fundinglistnameselectbtn" type="button" style="height: 34px;"><span class="glyphicon glyphicon-search"></span></button>
	      				</span>
	    		</div>
			</div>
		
			<div class="col-md-12" id="menuchecklist" style="padding: 0px;  border: 1.5px solid #009442; border-radius: 5px;">
				<form>
					<ul style="font-size:15px; list-style: none; height: 100%; width: 100%; padding: 10px; text-align: left; margin: 0px; border-bottom: 1px solid #d7d7d7;">
						<label style="font-size: 20px;">카테고리</label>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="it"></span><span>IT</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="핀테크"></span><span>핀테크</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="인터넷서비스"></span><span>인터넷서비스</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="문화"></span><span>문화</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="디자인"></span><span>디자인</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="뷰티"></span><span>뷰티</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="의료"></span><span>의료</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="제조"></span><span>제조</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="유통"></span><span>유통</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="category" type="checkbox" value="농수산"></span><span>농수산</span></li>
					</ul>
		 			<ul style="font-size: 15px; list-style: none; height: 100%; width: 100%; padding: 10px; text-align: left; margin: 0px; border-bottom: 1px solid #d7d7d7;">
						<label style="font-size: 20px;">투자형태</label>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="type" type="checkbox" value="주식"></span><span>주식</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="type" type="checkbox" value="채권"></span><span>채권</span></li>
					</ul>
					<ul style="font-size: 15px; list-style: none; height: 100%; width: 100%; padding: 10px; text-align: left; margin: 0px; border-bottom: 1px solid #d7d7d7;">
						<label style="font-size: 20px;">배당수익률</label>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="dividend" type="checkbox" value="1"></span><span>10% 미만</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="dividend" type="checkbox" value="2"></span><span>10%~15%</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="dividend" type="checkbox" value="3"></span><span>15% 이상</span></li>
					</ul>
					<ul style="font-size: 15px; list-style: none; height: 100%; width: 100%; padding: 10px; text-align: left; margin: 0px;">
						<label style="font-size: 20px;">펀딩상태</label>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="status" type="checkbox" value="모집중"></span><span>모집중</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="status" type="checkbox" value="결제모집중"></span><span>결제모집중</span></li>
						<li style="margin-bottom: 5px;"><span style="margin-right: 15px;"><input class="category" name="status" type="checkbox" value="진행중"></span><span>진행중</span></li>
					</ul>
				</form>
			</div>
		</div>
		<div class="col-md-10" style="padding: 0px 20px; margin-bottom: 20px;">
			<!-- carousel : 회전하면서 이미지를 보여주는 것 -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel" style="border: 1.5px solid #009442; padding: 0.75px;">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>
			
			    <!-- 화면에 보여줄 아이템 들어갈 곳 -->
			    <div class="carousel-inner">
			      <div class="item active">
			        <img src="${pageContext.request.contextPath}/resources/img/main/photo1.jpg" alt="Los Angeles" style="width:100%; height:450px;">
			      </div>
			
			      <div class="item">
			        <img src="${pageContext.request.contextPath}/resources/img/main/photo2.jpg" alt="Chicago" style="width:100%; height:450px;">
			      </div>
			    	
			    	<!-- 아이템 추가 가능 -->
			     <!--  <div class="item">
			        <img src="https://www.w3schools.com/bootstrap/ny.jpg" alt="New york" style="width:100%;">
			      </div> -->
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
		  	</div>
		 	<!-- carousel 끝 -->
		</div>
		<div class="col-md-10" style="padding: 0px 10px 0px 10px;">
			<div id="fdlist">
			</div>
		</div>
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>