<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.7/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>

<script type="text/javascript">
$(document).ready(function(param){
		var getfundingdata = $.ajax({
			type : "get",
			url : "/pineapple/investfundingdetail.invest",
			data : {fdCode : ${param.fdCode}}
		});
		$('#fundingqna-tab').click(function(param){
			var getfundingqna = $.ajax({
				type : "get",
				url : "/pineapple/investfundingqna.invest",
				data : {fdCode : ${param.fdCode}}
			});
			getfundingqna.done(function(msg){
				console.log(msg)
				for(var i = 0 ;i < msg.length ; i++ ){
				$('#fundingqnalist').append(
							"<div>Q&A제목 : "+msg[i].qnaTitle+"</div>"+
							"<div>작성자ID : "+msg[i].qnaFdId+"</div>"+
							"<div>Q&A내용 : "+msg[i].qnaFdContent+"</div>"+
							"<div>작성일자 : "+msg[i].qnaFdTime+"</div>"
							);
				}
			});
			getfundingqna.fail(function(){
				alert('두번째 ajax통신실패');
			});
		});
		// 성공시
		getfundingdata.done(function(msg){
			console.log(msg)
			$('#openstoryContent').html('<textarea id="summernote" readonly="readonly" >'
			+msg.openstory+'</textarea>'
			+'<script>'
			+'$(document).ready(function() {'
				+'$(\'#summernote\').summernote();'
			+'});'
		+'<\/script>'
			);
			$('#comValueContent').text(msg.comValue)
		});
		// 실패시
		getfundingdata.fail(function(){
			alert('첫번째 ajax통신실패');
		});
});
</script>
</head>
<body>
	<!-- 펀딩 Tab -->
	<div> 
		<ul id="myTab" class="nav nav-tabs font-j" role="tablist"> 
			<li role="presentation" class="active">
				<a data-target="#openstory" id="openstory-tab" role="tab" data-toggle="tab" aria-controls="openstory" aria-expanded="true">오픈스토리</a>
			</li> 
			<li role="presentation" class="">
				<a data-target="#comValue" role="tab" id="comValue-tab" data-toggle="tab" aria-controls="comValue" aria-expanded="false">기업가치</a>
			</li> 
			<li role="presentation" class="">
				<a data-target="#fundingqna" role="tab" id="fundingqna-tab" data-toggle="tab" aria-controls="fundingqna" aria-expanded="false">펀딩Q&A</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content font-j" style="text-align: center;">
			<div role="tabpanel" class="tab-pane fade active in" id="openstory" aria-labelledby="openstory-tab">
				<div id="openstoryContent"></div>
			</div> 
			<div role="tabpanel" class="tab-pane fade" id="comValue" aria-labelledby="comValue-tab"> 
				<p id="comValueContent"></p> 
			</div> 
			<div role="tabpanel" class="tab-pane fade pd-a-0" id="fundingqna" aria-labelledby="fundingqna-tab"> 
				<h2>펀딩 Q&A</h2>
				<div class="col-xs-12 pd-a-0"style="text-align: center;">
					<div class="col-xs-10 pd-a-0">
					<input type="text" style="width: 100%; height: 100px;" value="질문 내용 적어주세요">
					</div>
					<div class="col-xs-2 pd-a-0 pd-l-10">
					<button class="pd-a-0 bor-defult" style="width: 100%; height: 100px; font-size: 28px;">질문등록하기</button>
					</div>
				</div>
				<div id="fundingqnalist">
				</div>
			</div> 

		</div> 
	</div>
	
	
</body>
</html>