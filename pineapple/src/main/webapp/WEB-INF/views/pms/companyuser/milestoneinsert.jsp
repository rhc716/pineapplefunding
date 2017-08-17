<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
/* 마일스톤을 만들 펀딩명, 펀딩코드, 회사코드를 불러오는 ajax 요청 */
$(document).ready(function(){
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/selectfundingforinsertmilestone.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "id01@maver.com" }
	});
	
	getfundinglist.done(function(msg){
		console.log(msg);
		
		for(var i = 0; i<msg.length; i++){
			$('#fdselectlist').append(
			// 새로운 변수명을 넣어서 옵션에 회사코드를 함께 저장함
				'<option value="'+msg[i].fdCode+'" comcode="'+msg[i].fdComCode+'">'+msg[i].fdTitle+'</option>'
			);
		}
	});
	getfundinglist.fail(function(){
		alert('ajax통신 실패');
	});
	
	// 옵션 선택시 해당 펀딩의 회사코드를 히든값의 value에서 변경
	$('#fdselectlist').change(function(){
		//console.log($("#fdselectlist option:selected").attr("comcode"));
		$('#msComCode').attr("value",$("#fdselectlist option:selected").attr("comcode"));
		//console.log($('#msComCode').val());
	})
	
	
	// 담당사원 찾기 버튼 클릭시 ajax
	$('#employeebtn').click(function(){
		$('#emlist').html("펀딩내의 권한이 펀딩매니저로 설정된 사원들입니다<br><br>");
		var selectemployee = $.ajax({
			type : "get",
			url : "/pineapple/getemployeeforinsertmilestone.pms",
			/* 펀딩코드로 해당펀딩내의 pm권한의 사원을 조회함 */
			data : {
				fdCode : $("#fdselectlist option:selected").val()
			}
		});
		
		selectemployee.done(function(msg){
			console.log(msg);
			for(var i = 0; i<msg.length; i++){
			$('#emlist').append(
				'<span>아이디 : <b>'+msg[i].emUserId+'</b>'
				+' 회사명 : <b>'+msg[i].emComName+'</b>'
				+' <button type="button"'
				+' class="btn btn-primary btn-sm selectbtn">선택</button><br><br></span>'
				
				
			);
			}
			// 선택버튼 눌렀을시, 해당 아이디를 찾아서 입력창에 넣어줌.
			$('.selectbtn').click(function(){
				//console.log($(this).parent().find("b:eq(0)").text());
				$('#pmid').val($(this).parent().find("b:eq(0)").text());
			});
		});
		
		selectemployee.fail(function(){
			alert('펀딩을 선택해주세요');
		});
	});
	
	
	
});

	




</script>

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
			<span>
				<b> 마일스톤은 관리자 승인전까지 추가 입력 가능하고<br> 모집시작부터는 수정만 가능합니다.</b><br><br>
			</span>
				<form action="/pineapple/addmilestone.pms" method="post" id="mileform">
					펀딩명
					<select name="msFdCode" id="fdselectlist">
					<option value="null">선택해주세요</option>
						<!-- ajax요청으로 목록을 채워줌 -->
					</select><br><br>
					마일스톤 단계
					<input type="number" class="form-control" name="milestoneStep" min="1" max="100"><br>
					마일스톤 담당자 아이디
					<input type="text" class="form-control" name="pm" id="pmid" readonly><br>
					<button type="button" id="employeebtn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
					담당사원찾기</button><br><br>
					마일스톤 이름
					<input type="text" class="form-control" name="milestoneName"><br>
					마일스톤 요약<br>
					<textarea class="form-control" rows="5" name="milestoneSummary"></textarea>
					<input type="hidden" id="msComCode" name="msComCode" value="">
					<button type="submit" class="btn btn-success">입력완료</button>
				</form>
			</div>
			
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">사원조회</h4>
        </div>
        <div class="modal-body" id="emlist">

        </div>
      </div>
      
    </div>
  </div>


			
		<div class="col-md-1"></div>
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>