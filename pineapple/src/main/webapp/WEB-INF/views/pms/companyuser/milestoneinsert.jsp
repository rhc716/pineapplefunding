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
		url : "/pineapple/getfundingforinsertmilestone.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}"}
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
				$('#myModal').modal('hide');
			});
		});
		
		selectemployee.fail(function(){
			alert('펀딩을 선택해주세요');
			document.location.reload();
		});
	});
	
	
	
	
	// 현재 있는 마일스톤 단계를 보기 위해 펀딩선택시 해당 펀딩의 마일스톤 리스트를 가져옴
	$('#fdselectlist').change(function(){
		// console.log($("#fdselectlist option:selected").val());
		// 옵션이 바뀌면 값도 지워줌
		$('#milestoneStep').val("");
		$('#existmilestone').val("");
		var getmilestonelistoffunding = $.ajax({
			type : "get",
			url : "/pineapple/getmilestonelistoffunding.pms",
		 	/* 선택한 옵션에서 펀딩코드를 가져와서 보내줌 */
			data : { fdCode : $("#fdselectlist option:selected").val()}
		});
		
			// 이미 존재하는 마일스톤단계를 existmilestone에 채워줌
			getmilestonelistoffunding.done(function(msg){
				var content = "";
				for(var i=0; i<msg.length; i++){
					content += msg[i].milestoneStep+", ";
				}
				$('#existmilestone').val(content);
			});
	})
	
	
//	마일스톤 단계 중복검사 ajax요청
	$('#milestoneStep').blur(function(){
		$.ajax({ 
            type: "get",
            url : "/pineapple/milestonestepcheck.pms",
            data : {milestoneStep : $('#milestoneStep').val()
            	, msFdCode : $("#fdselectlist option:selected").val()
            	
            },
            success : function(ic){ 
            	console.log(ic);
            	
            	// 공백일때 -> 마일스톤단계 중복검사 결과가 없을때 -> 사용가능
            	if (ic=='') {
            		console.log("사용가능");
            		$('#existmilestone').css("color", "#008000");
            		$('#existmilestone').val("사용 가능한 마일스톤단계입니다");
            		$('#checkresult').val("yes");
            	// 공백이 아닐때 -> 마일스톤단계 중복검사 결과가 있을때 -> 사용불가능
            	} else {
            		console.log("사용불가능");
            		$('#existmilestone').css("color", "red");
            		$('#existmilestone').val("사용 불가능한 마일스톤단계입니다");
            		$('#milestoneStep').val('');
            		$('#checkresult').val("no");
            	}		
            	
            }, 
            error : function error(){
            	alert('펀딩명과 마일스톤단계를 입력해주세요');	
            }
    	});
	});
				
	
	
	// submit 버튼을 누를때 유효성 검사
	
	$('#submitbtn').click(function(){
		console.log($("#fdselectlist option:selected").val());
		if($("#fdselectlist option:selected").val()=="null"){
			alert('펀딩을 선택해주세요');
		}else{
			if($('#milestoneStep').val()==""){
				alert('마일스톤 단계를 입력해주세요');
			}else{
				if($('#checkresult').val()=="yes"){
					if($('#pmid').val()!=""){
						if($('#milestoneName').val()!=""){
								$('#mileform').submit();
						}else{
							alert('마일스톤명을 입력해주세요');
						}
					}else{
						alert('담당사원을 선택해야합니다');
					}
				}else{
					alert('마일스톤단계의 중복검사를 통과해야 합니다');
				}
				
			}
		}
			
		
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
		<div class="pagetitleandexplainbox">
			<h1>마일스톤생성</h1>
			<span>
				<b> 마일스톤은 관리자 승인전까지 추가 입력 가능하고<br> 모집시작부터는 수정만 가능합니다.</b>
			</span>
		</div>		
			<div class="panel panel-default">
				<div class="panel-body form-horizontal payment-form">
					<form action="/pineapple/addmilestone.pms" method="post" id="mileform">
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">펀딩명</label>
		                        <div class="col-sm-9">
									<select name="msFdCode" id="fdselectlist">
									<option value="null">선택해주세요</option>
										<!-- ajax요청으로 목록을 채워줌 -->
									</select> 
								</div>
	                    </div>
	                    <div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">마일스톤 단계</label>
		                        <div class="col-sm-9">
									<input type="number" id="milestoneStep" class="form-control" name="milestoneStep" min="1" max="100">
									<input type="hidden" id="checkresult" value="no">
								</div>
								
	                   	</div>
						
						<div class="form-group">
							<label for="description" class="col-sm-3 control-label">현재 생성된 마일스톤 단계</label>
									<div class="col-sm-9">
										<input type="text" id="existmilestone" class="form-control" readonly>
									</div>	
						</div>
						
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">마일스톤 담당자 아이디</label>
		                        <div class="col-sm-9">
									<input type="text" class="form-control" name="pm" id="pmid" readonly>
								</div>
	                   	</div>
	                   	<div class="form-group">
		                   	<div class="col-sm-12 text-right">
								<button type="button" id="employeebtn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
									담당사원찾기
								</button>
							</div>
						</div>
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">마일스톤 이름</label>
		                        <div class="col-sm-9">
						<input type="text" class="form-control" id="milestoneName" name="milestoneName">
								</div>
	                   	</div>
						<div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">마일스톤 요약</label>
		                        <div class="col-sm-9">
						<textarea class="form-control" rows="5" id="milestoneSummary" name="milestoneSummary"></textarea>
								</div>
	                   	</div>
						<input type="hidden" id="msComCode" name="msComCode" value="">
						<div class="form-group">
		                        <div class="col-sm-12 text-right">
		                            <button type="button" id="submitbtn" class="btn btn-success preview-add-button">
		                            	입력완료
		                            </button>
	                            </div>
	                   	</div>
					</form>
				</div>
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
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>
</body>
</html>