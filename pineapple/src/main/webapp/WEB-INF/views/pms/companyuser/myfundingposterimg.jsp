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

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<script>
/* 펀딩 리스트 불러올 ajax */
$(document).ready(function(){
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/getmyfundinglist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "${id}"}
	});
	// 성공시
	getfundinglist.done(function(msg){
		console.log(msg);
		
		//alert(formatDate(msg[0].fdDate));
		for(var i = 0; i<msg.length; i++){
			
			//기존 이미지가 있을때 없을때 다른것을 보여줌
			if(msg[i].posterImg==null){
				var poster = '<br><br><br><span style="color:#300aac;">이미지를 추가해주세요</span>';
			}else{
				
				// 파일이름만 잘라서 절대경로에서 사용하기
				var imgname = msg[i].posterImg.substring(msg[i].posterImg.lastIndexOf("/"), msg[i].posterImg.length); 
				//console.log(imgname);
				var poster = '<img src="${pageContext.request.contextPath}/resources/files'+imgname+'">'; 
				    
			}
			// 펀딩리스트와 포스터 이미지를 myfundinglist에 채워줌, 수정버튼과 모달창을 각각 추가해줌
			$('#myfundinglist').append(
						/* 펀딩리스트 폼, 모달 버튼  */
						'<div class="container-fluid fundinglistposterbox">'
						+'<input type="hidden" readonly="readonly" value="'+msg[i].fdCode+'">'
						+'<div class="fundinglistposterboxtop">'
						+'<b>'+msg[i].fdTitle+'</b><br>'
						+'<div>'+poster+'</div></div>'
						+'<div class="fundinglistposterboxbottom">'
						+'<button type="button" class="btn btn-sm btn-primary"'
						+' data-toggle="modal" data-target="#myModal'+i+'">'
						+'수정'
						+'</button></div></div>'
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
				    	/* 모달내용들어갈곳 (포스터 이미지 추가,수정) */
				    	+'이미지는 가로 300px 세로 150px에 맞춰주세요<br><br><br>'
				    	+'<form action="/pineapple/modifyfundingimage.pms" method="post" enctype="multipart/form-data">'
				    	+'<input type="hidden" name="fdCode" value="'+msg[i].fdCode+'">'
				    	+'<img src="" alt="미리보기"><br><br>'
				    	+'<input type="file" class="getfile" accept="image/*" name="uploadimage"><br>'
						+'<button type="submit" class="btn btn-success">수정완료</button>'
				    	+'</form>'
				    	+'</div>'
				    	+'<div class="modal-footer">'
				    	+'<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>'
				    	+'</div></div></div></div></div>'
				);
			}		
	
			//이미지 업로드 전 미리보기 썸네일
			$('.getfile').change(function(e){
				   var reader = new FileReader();
				   reader.readAsDataURL(e.target.files[0]);
				   console.log($(this));
				   //console.log(e.target.files[0]);
				   // 클릭했을때 해당 모달의 이미지태그의 값을 가져와서 미리보기를 채워줌
				   var imgtag = $(this).parent().find('img');
				   var thisgetfile = $(this).attr("src");
				   reader.onload = function  () {
				       var tempImage = new Image();
				       tempImage.src = reader.result;
				       tempImage.onload = function () {
				            var canvas = document.createElement('canvas');
				            var canvasContext = canvas.getContext("2d");
				            canvas.width = 300; 
				            canvas.height = 150;
				            canvasContext.drawImage(this, 0, 0, 300, 150);
				            var dataURI = canvas.toDataURL("image/jpeg");
				            imgtag.attr("src",dataURI);
				        };
				    };
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
	<div class="col-md-9" id="myfundinglist">
			<div class="pagetitleandexplainbox" style="width: 670px;">
				<h1>펀딩포스터이미지관리</h1>
				<span>
					<b> 펀딩기본정보 수정 및 삭제는 펀딩개설 승인 전까지 가능합니다.</b>
				</span>
			</div>
<!-- 펀딩 리스트 뿌려질 곳 -->
	</div>

</div>

<!-- 풋터 -->
<div>
	<c:import url="/resources/module/footer.jsp"/>
</div>
</div>
</body>
</html>