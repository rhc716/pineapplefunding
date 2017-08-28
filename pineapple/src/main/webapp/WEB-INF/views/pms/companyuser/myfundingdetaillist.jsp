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
$(document).ready(function(){
	var getfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/getmyfundingdetaillist.pms",
		/* 아이디 세션에서 받아서 가져옴 */
		data : { userId : "id01@maver.com" }
	});
	// 성공시
	getfundinglist.done(function(msg){
		console.log(msg);
		
		/* 날짜를 yyyy-mm-dd 형태로 바꿔주는 함수 */
		function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) month = '0' + month;
		    if (day.length < 2) day = '0' + day;

		    return [year, month, day].join('-');
		}
		
		//alert(formatDate(msg[0].fdDate));
		var msgleng = msg.length;
		
		//펀딩상세리스트를 myfundinglist에 채워줌 // 수정버튼을 넣어서 수정모달창을 띄워주게함
		for(var i = 0; i<msgleng; i++){
				$('#myfundinglist').append(
						/* 펀딩리스트 폼, 모달 버튼  */
						'<div class="container-fluid fundinglistbox">'
						+'<input type="hidden" readonly="readonly" value="'+msg[i].fdCode+'">'
						+'<div class="fundinglistboxtop">'
						+'<h3>'+msg[i].fdTitle+'</h3><br>'
						+'<b>펀딩상태 : '+msg[i].fdStatus+'</b><br>펀딩개설자 : '+msg[i].fdPublisher
						+'개설요청일 : '+formatDate(msg[i].fdDate)+'</div>'
						+'<div class="fundinglistboxbottom">'
						+'<button type="button" class="btn btn-sm btn-primary"'
						+' data-toggle="modal" data-target="#myModal'+i+'">'
						+'펀딩상세 수정</div></div>'
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
				    	+'<form action="/pineapple/modifyfundingdetail.pms" method="post">'		    
				    	+'<input type="hidden" value="'+msg[i].fdDetailCode+'" name="fdDetailCode">'
				    	/* summernote api 추가되는곳 */
				    	+'오픈스토리'
						+'<textarea id="summernote'+i+'" name="openstory" class="form-control">'+msg[i].openstory+'</textarea><br>'
						+'기업가치'
						+'<input type="text" class="form-control" name="comValue" value="'+msg[i].comValue+'"><br>'				
						+'<button type="submit" class="btn btn-success">수정완료</button>'
				    	+'</form>'
				    	+'</div>'
				    	+'<div class="modal-footer">'
				    	+'<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>'
				    	+'</div></div></div></div></div>'
				);
			
				$('#myfundinglist').append(
						'<script>'
						+'$(document).ready(function() {'
						      +'$(\'#summernote'+i+'\').summernote();'
						+'});'
						+'<\/script>'
				);		
		
		
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
	<div class="col-md-9" id="myfundinglist">
		<span>
			<b> 펀딩상세내용은 투자자들에게 펀딩에 대해 상세하게 설명해주는 내용을 작성해주시면 됩니다. </b><br>
			<b> 오픈스토리는 상세한 설명이 들어가는 글 형식입니다 </b><br>
			<b> 기업가치는 금액으로 산정된 회사가치를 나타냅니다 </b><br><br>
		</span>
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