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
/* 펀딩 리스트 불러올 ajax */
$(document).ready(function(){
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/getmymilestonelist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}"}
	});
	// 성공시
	getfundinglist.done(function(msg){
		console.log(msg);
		
		//alert(formatDate(msg[0].fdDate));
		
		//마일스톤리스트를 mymilestonelist에 채워줌, 수정버튼,삭제버튼 모달창을 추가해줌.
		var msgleng = msg.length;
		for(var i = 0; i<msgleng; i++){
			if(msg[i].fdStatus == "개설요청"){ // 개설요청중 -> 수정, 삭제 버튼이 나오게 함
				$('#mymilestonelist').append(
					'<tr>'
						+'<td><a>'+msg[i].fdTitle+'</a></td>'
						+'<td>'+msg[i].milestoneName+'</td>'
						+'<td>'+msg[i].pm+'</td>'
						+'<td>'+msg[i].milestoneStep+'</td>'
						+'<td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal'+i+'">수정</button></td>'
						+'<td><button type="button" class="btn btn-sm btn-danger deletebtn">삭제</button></td>'
						+'<input type="hidden" value="'+msg[i].milestoneCode+'">'
					+'</tr>'
				);
			
				$('#modalarea').append(
						/* 모달 */
						'<div class="modal fade" id="myModal'+i+'" tabindex="-1" role="dialog"'
						+'aria-labelledby="myModalLabel'+i+'" aria-hidden="true">'
				 		+'<div class="modal-dialog">'
				    	+'<div class="modal-content">'
				    	+'<div class="modal-header">'
				    	+'<button type="button" class="close"'
				    	+'data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
				    	+'<h4 class="modal-title" id="myModalLabel'+i+'">Modal title</h4>'
				    	+'</div>'
				    	+'<div class="modal-body">'
				    	/* 모달내용들어갈곳 (마일스톤수정) */
				    	+'<form action="/pineapple/modifymilestone.pms" method="post">'
				    	+'마일스톤 단계'
				    	+'<input type="number" class="form-control" name="milestoneStep" min="1" max="100" value="'+msg[i].milestoneStep+'"><br>'
				    	+'마일스톤 담당자 아이디'
				    	+'<input type="hidden" value="'+msg[i].fdCode+'">'
				    	+'<input type="text" class="form-control" name="pm" id="pmid'+i+'" value="'+msg[i].pm+'" readonly><br>'
				    	+'<button type="button" class="btn btn-primary btn-sm employeebtn" data-toggle="modal" data-target="#myModal">'
				    	+'담당사원찾기</button><br><br>'
				    	+'마일스톤 이름'			    	
				    	+'<input type="text" class="form-control" name="milestoneName" value="'+msg[i].milestoneName+'"><br>'
				    	+'마일스톤 요약<br>'
				    	+'<textarea class="form-control" rows="5" name="milestoneSummary">'+msg[i].milestoneSummary+'</textarea><br>'
				    	+'<input type="hidden" name="milestoneCode" value="'+msg[i].milestoneCode+'">'
				    	+'<button type="submit" class="btn btn-success">수정완료</button>'
				    	+'</form>'
				    	+'</div>'
				    	+'<div class="modal-footer">'
				    	+'<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>'
				    	+'</div></div></div></div>'
				);
			} else { // 펀딩개설요청이 지난 상태는 -> 수정버튼만 사용하게 함
				$('#mymilestonelist').append(
					'<tr>'
						+'<td><a>'+msg[i].fdTitle+'</a></td>'
						+'<td>'+msg[i].milestoneName+'</td>'
						+'<td>'+msg[i].pm+'</td>'
						+'<td>'+msg[i].milestoneStep+'</td>'
						+'<td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal'+i+'">수정</button></td>'
						+'<td><button type="button" class="btn btn-sm btn-danger disabled">삭제</button></td>'
					+'</tr>'
					
				
				);
				$('#modalarea').append(
					/* 모달 */
					'<div class="modal fade" id="myModal'+i+'" tabindex="-1" role="dialog"'
					+'aria-labelledby="myModalLabel'+i+'" aria-hidden="true">'
			 		+'<div class="modal-dialog">'
			    	+'<div class="modal-content">'
			    	+'<div class="modal-header">'
			    	+'<button type="button" class="close"'
			    	+'data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
			    	+'<h4 class="modal-title" id="myModalLabel'+i+'">Modal title</h4>'
			    	+'</div>'
			    	+'<div class="modal-body">'
			    	/* 모달내용들어갈곳 (마일스톤수정) */
			    	+'<form action="/pineapple/modifymilestone.pms" method="post">'
			    	+'마일스톤 단계'
			    	+'<input type="number" class="form-control" name="milestoneStep" min="1" max="100" value="'+msg[i].milestoneStep+'"><br>'
			    	+'마일스톤 담당자 아이디'
			    	+'<input type="hidden" value="'+msg[i].fdCode+'">'
			    	+'<input type="text" class="form-control" name="pm" id="pmid'+i+'" value="'+msg[i].pm+'" readonly><br>'
			    	+'<button type="button" class="btn btn-primary btn-sm employeebtn" data-toggle="modal" data-target="#myModal">'
			    	+'담당사원찾기</button><br><br>'
			    	+'마일스톤 이름'			    	
			    	+'<input type="text" class="form-control" name="milestoneName" value="'+msg[i].milestoneName+'"><br>'
			    	+'마일스톤 요약<br>'
			    	+'<textarea class="form-control" rows="5" name="milestoneSummary">'+msg[i].milestoneSummary+'</textarea><br>'
			    	+'<input type="hidden" name="milestoneCode" value="'+msg[i].milestoneCode+'">'
			    	+'<button type="submit" class="btn btn-success">수정완료</button>'
			    	+'</form>'
			    	+'</div>'
			    	+'<div class="modal-footer">'
			    	+'<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>'
			    	+'</div></div></div></div>'	
				);
			}
		}
	
		
		// 담당사원 찾기 버튼 클릭시 ajax
		$('.employeebtn').click(function(){
			//선택한 아이디를 담아줄 input의 아이디값을 변수에 저장해줌
			//console.log($(this).parent().find("input:eq(2)").attr("id"));
			var savewhere = $(this).parent().find("input:eq(2)").attr("id");
			//히든값으로 담아놓은 해당 펀딩코드를 가져옴
			//console.log($(this).parent().find("input:eq(1)").val());
			$('#emlist').html("펀딩내의 권한이 펀딩매니저로 설정된 사원들입니다<br><br>");
			var selectemployee = $.ajax({
				type : "get",
				url : "/pineapple/getemployeeforinsertmilestone.pms",
				/* 펀딩코드로 해당펀딩내의 pm권한의 사원을 조회함 */
				data : {
					fdCode : $(this).parent().find("input:eq(1)").val()
				}
			});
			//성공시
			selectemployee.done(function(msg){
				console.log(msg);
				for(var i = 0; i<msg.length; i++){
					// PM권한의 사원리스트를 emlist에 선택버튼과 함께 채워줌
					$('#emlist').append(
						'<span>아이디 : <b>'+msg[i].emUserId+'</b>'
						+' 회사명 : <b>'+msg[i].emComName+'</b>'
						+' <button type="button"'
						+' class="btn btn-primary btn-sm selectbtn">선택</button><br><br></span>'
						
						
					);
				}
				
				// 선택버튼 눌렀을시 선택한 아이디를 첫번째 모달창의 input에 넣어줌
				$('.selectbtn').click(function(){
					// console.log($(this).parent().find("b:eq(0)").text());
					$('[id='+savewhere+']').val($(this).parent().find("b:eq(0)").text());
					$('#myModal').modal('hide');				
				});
			});
			//실패시
			selectemployee.fail(function(){
				alert('ajax통신 실패');
			});
		});
		
		
				
		// 마일스톤 삭제버튼 클릭시 삭제 ajax
		$('.deletebtn').click(function(){
			var answer = confirm("삭제하시겠습니까?")
			if (answer) {
			    //예
				// 삭제해줄 마일스톤코드를 찾아서 whatdelete에 넣어줌
				var whatdelete = $(this).parent().parent().find('input').val();
				console.log(whatdelete);
				var fundingdelete = $.ajax({
					type : "get",
					url : "/pineapple/removemilestone.pms",
					/* 삭제해줄 펀딩코드를 전송 */
					data : { delMsCode : whatdelete }
				});
				//ajax 통신 성공시
				fundingdelete.done(function(){
					alert('마일스톤이 삭제되었습니다');
					location.reload();
				});
				//ajax 통신 실패시
				fundingdelete.fail(function(){
					alert('ajax통신 실패');
				});
			}
			else {
			    //아니오
			}
		});
		
		
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
			<h1>마일스톤조회</h1>
			<span>
				<b> 마일스톤 삭제는 펀딩개설 승인 전까지만 가능합니다.</b>
			</span>
		</div>
		<table class="table" id="mymilestonelist">
			<tr>
				<td>펀딩명</td>
				<td>마일스톤명</td>
				<td>담당PM아이디</td>
				<td>마일스톤단계</td>
				<td>수정버튼</td>
				<td>삭제버튼</td>
			</tr>
			<!-- 마일스톤 리스트 뿌려질 곳 -->						
		</table>
	</div>
	
		<!-- 모달뿌려질곳  -->
		<div id="modalarea">
		</div>

	
	
	
  <!-- 담당사원 찾기용 Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    

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

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>