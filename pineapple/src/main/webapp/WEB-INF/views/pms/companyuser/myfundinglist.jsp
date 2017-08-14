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
		url : "/pineapple/selectmyfundinglist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "id01@maver.com" }
	});
	// 성공시
	getfundinglist.done(function(msg){
		console.log(msg);
		//var sysdate = new Date(msg[i].fdDate).toLocaleDateString();
		//console.log(sysdate); 
		var msgleng = msg.length;
		for(var i = 0; i<msgleng; i++){
			var sysdate = new Date(msg[i].fdDate).toLocaleDateString();
			if(msg[i].fdStatus == "개설요청"){ // 개설요청중 -> 수정, 삭제 버튼이 나오게 함
				$('#myfundinglist').append(
						/* 펀딩리스트 폼, 모달 버튼  */
						'<div class="container-fluid fundinglistbox">'
						+'<input type="hidden" readonly="readonly" value="'+msg[i].fdCode+'">'
						+'<div class="fundinglistboxtop">'
						+'<h3>펀딩명 : '+msg[i].fdTitle+'</h3><br>'
						+'<b>펀딩상태 : '+msg[i].fdStatus+'</b><br>펀딩개설자 : '+msg[i].fdPublisher
						+'개설요청일 : '+sysdate+'</div>'
						+'<div class="fundinglistboxbottom">'
						+'<button class="btn btn-sm btn-success fundingdetailbtn" type="button">'
						+'펀딩상세 </button> '
						+'<button type="button" class="btn btn-sm btn-primary"'
						+' data-toggle="modal" data-target="#myModal'+i+'">'
						+'수정'
						+'</button> <button class="btn btn-sm btn-danger deleterequestbtn" type="button">'
						+'삭제</button></div></div>'
						/* 모달 */
						+'<div class="modal fade" id="myModal'+i+'"'+' tabindex="-1" role='
						+'"dialog" aria-labelledby="myModalLabel'+i+'" aria-hidden="true">'
				 		+'<div class="modal-dialog">'
				    	+'<div class="modal-content">'
				    	+'<div class="modal-header">'
				    	+'<button type="button" class="close"'
				    	+'data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
				    	+'<h4 class="modal-title" id="myModalLabel'+i+'">Modal title</h4>'
				    	+'</div>'
				    	+'<div class="modal-body">'
				    	/* 모달내용들어갈곳 (펀딩수정) */
				    	+'<form>'
				    	+'펀딩형태'
						+'<select name="fdType">'
						+'<option value="채권">채권</option>'
						+'<option value="주식">주식</option>'
						+'</select><br><br>'
						+'펀딩명'
						+'<input type="text" class="form-control" name="fdTitle" value="'+msg[i].fdTitle+'"><br>'
						+'최소투자금액'
						+'<input type="text" class="form-control" name="minInvestMoney" value="'+msg[i].minInvestMoney+'"><br>'
						+'판매주식수'
						+'<input type="text" class="form-control" name="numberOfShares" value="'+msg[i].numberOfShares+'"><br>'
						+'주당발행가'
						+'<input type="text" class="form-control" name="issuePrice" value="'+msg[i].issuePrice+'"><br>'	
						+'오픈일'
						+'<input type="text" class="form-control" name="openDate" value="'+new Date(msg[i].openDate).toLocaleDateString()+'"><br>'
						+'마감일'
						+'<input type="text" class="form-control" name="closeDate" value="'+new Date(msg[i].closeDate).toLocaleDateString()+'"><br>'
						+'최소보장이율'
						+'<input type="text" class="form-control" name="numberOfShares" value="'+msg[i].numberOfShares+'"><br>'
						+'프로젝트 시작일'
						+'<input type="text" class="form-control" name="projectStartDate" value="'+new Date(msg[i].projectStartDate).toLocaleDateString()+'"><br>'
						+'프로젝트 마감일'
						+'<input type="text" class="form-control" name="projectEndDate" value="'+new Date(msg[i].projectEndDate).toLocaleDateString()+'"><br>'
						+'<!-- 펀딩 포스터 이미지 업로드'
						+'<input type="file" class="form-control" name="imageUpload"><br> -->'
						+'<button type="submit" class="btn btn-success">수정완료</button>'
				    	+'</form>'
				    	+'</div>'
				    	+'<div class="modal-footer">'
				    	+'<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>'
				    	+'</div></div></div></div></div>'
				);
			} else { // 모집중 혹은 그 이상 -> 펀딩상세 버튼만 만듦
				$('#myfundinglist').append(
						/* 펀딩리스트 폼, 모달 버튼  */
						'<div class="container-fluid fundinglistbox">'
						+'<input type="hidden" value="'+msg[i].fdCode+'">'
						+'<div class="fundinglistboxtop">'
						+'<h3>펀딩명 : '+msg[i].fdTitle+'</h3><br>'
						+'<b>펀딩상태 : '+msg[i].fdStatus+'</b><br>펀딩개설자 : '+msg[i].fdPublisher
						+'개설요청일 : '+sysdate+'</div>'
						+'<div class="fundinglistboxbottom">'
						// 삭제요청 -> 클래스 fundingdetailbtn 인 버튼 클릭시
						// 상위dom의 fundinglistbox의 input type hidden의 fdCode로 ajax 통신
						+'<button class="btn btn-sm btn-success fundingdetailbtn" type="button">'
						+'펀딩상세</button></div></div>'
				);
			}
		}
	
		//펀딩 삭제클릭시 ajax
		$('.deleterequestbtn').click(function(){
			var answer = confirm("삭제하시겠습니까?")
			if (answer) {
			    //예
				// 삭제해줄 펀딩코드를 찾아서 whatdelete에 넣어줌
				var whatdelete = $(this).parent().parent().find('input').val();
				console.log(whatdelete);
				var fundingdelete = $.ajax({
					type : "get",
					url : "/pineapple/deletefunding.pms",
					/* 삭제해줄 펀딩코드를 전송 */
					data : { delfdCode : whatdelete }
				});
				//ajax 통신 성공시
				fundingdelete.done(function(){
					alert('펀딩이 삭제되었습니다');
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
		
		//펀딩상세 클릭시 ajax
		$('.deleterequestbtn').click(function(){
				// 상세자료를 입력해줄 펀딩코드를 찾아서 whatfd에 넣어줌
				var whatfd = $(this).parent().parent().find('input').val();
				console.log(whatdelete);
				var fundingdelete = $.ajax({
					type : "get",
					url : "/pineapple/deletefunding.pms",
					/* 상세 입력 해줄 펀딩코드를 전송 */
					data : { delfdCode : whatfd }
				});
				//ajax 통신 성공시
				fundingdelete.done(function(){
					
				});
				//ajax 통신 실패시
				fundingdelete.fail(function(){
					alert('ajax통신 실패');
				});
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
			<div class="col-md-1">
			</div>
				<div class="col-md-7" id="myfundinglist">
<!-- 펀딩 리스트 뿌려질 곳 -->
					
<!-- 펀딩 리스트 뿌려질 곳 -->
				</div>
	</div>
	
			<div class="col-md-1">
			</div>

</div>

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>