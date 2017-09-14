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

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />

<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />
<script type="text/javascript">
$(document).ready(function(){
	var getallfundinglist = $.ajax({
		type : "get",
		url : "/pineapple/fundingassignmentlist.invest"
	});
	getallfundinglist.done(function(msg){
		console.log(msg);
		// 펀딩리스트 뿌려줌
		for(var i=0; i<msg.length; i++){
console.log(msg[i].total/msg[i].numberOfShares*100)
if(msg[i].days < 1){
	if(msg[i].total/msg[i].numberOfShares*100 > 99){
		if(msg[i].checkassignment != null){
		$('#adminFdList').append(
				'<tr>'
					+'<td>'+msg[i].fdCode+'</td>'
					+'<td>'+msg[i].fdStatus+'</td>'
      					+'<td>'+msg[i].fdTitle+'</td>'
      					+'<td>'
      						+'<div class="progress">'
						+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
						+'aria-valuemin="0" aria-valuemax="100" style="width:'
						+msg[i].total/msg[i].numberOfShares*100+'%;">'
						+msg[i].total/msg[i].numberOfShares*100+'%'
						+'</div>'
						+'</div>'
					+'</td>'
      					+'<td><a href=\'#\'>'
      					+'<button type="button" class="btn btn-sm btn-warning btn-block disabled">배정완료</button></a></td>'
  					+'</tr>'
		);
		}else{
					$('#adminFdList').append(
							'<tr>'
								+'<td>'+msg[i].fdCode+'</td>'
								+'<td>'+msg[i].fdStatus+'</td>'
		       					+'<td>'+msg[i].fdTitle+'</td>'
		       					+'<td>'
		       						+'<div class="progress">'
									+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
									+'aria-valuemin="0" aria-valuemax="100" style="width:'
									+msg[i].total/msg[i].numberOfShares*100+'%;">'
									+msg[i].total/msg[i].numberOfShares*100+'%'
									+'</div>'
									+'</div>'
								+'</td>'
		       					+'<td><a href=\'/pineapple/fundingassignmentinsertpage.invest?fdCode='+msg[i].fdCode+'\'>'
		       					+'<button type="button" class="btn btn-sm btn-warning btn-block ">배정하기</button></a></td>'
		   					+'</tr>'
					);	
		}
	}else{
			$('#adminFdList').append(
					'<tr>'
						+'<td>'+msg[i].fdCode+'</td>'
						+'<td>'+msg[i].fdStatus+'</td>'
       					+'<td>'+msg[i].fdTitle+'</td>'
       					+'<td>'
       						+'<div class="progress">'
							+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
							+'aria-valuemin="0" aria-valuemax="100" style="width:'
							+msg[i].total/msg[i].numberOfShares*100+'%;">'
							+msg[i].total/msg[i].numberOfShares*100+'%'
							+'</div>'
							+'</div>'
						+'</td>'
       					+'<td><a href="/pineapple/fundingrefundmain.invest?fdCode='+msg[i].fdCode+'">'
       					+'<button type="button" class="btn btn-sm btn-warning btn-block">환불하기</button></a></td>'
   					+'</tr>'
			);
	}

}else{
	$('#adminFdList').append(
			'<tr>'
				+'<td>'+msg[i].fdCode+'</td>'
				+'<td>'+msg[i].fdStatus+'</td>'
     					+'<td>'+msg[i].fdTitle+'</td>'
     					+'<td>'
     						+'<div class="progress">'
					+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
					+'aria-valuemin="0" aria-valuemax="100" style="width:'
					+msg[i].total/msg[i].numberOfShares*100+'%;">'
					+msg[i].total/msg[i].numberOfShares*100+'%'
					+'</div>'
					+'</div>'
				+'</td>'
     					+'<td><a href="#">'
     					+'<button type="button" class="btn btn-sm btn-warning btn-block disabled">결제모집기간</button></a></td>'
 					+'</tr>'
	);
}	
			// 마지막에 더보기 버튼을 추가함
			if(i==msg.length-1){
				$('#adminFdList').append(
					'<tr id="addlistbtnarea">'
					+'<td colspan="5">'
					+'<div class="btns">'
					+'<button id="addlistbtn" onclick="javascript:moreList(this);" value="1" class="btn btn-primary btn-block">더보기</button>'
					+'</div>'
					+'</td>'
					+'</tr>'
 				);
			}
		}
	});
	
	//실패시
	getallfundinglist.fail(function(){
		alert('getallfundinglist ajax통신실패');
	});
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
			<div class="pagetitleandexplainbox"> 
					<h1>배정 관련 펀딩리스트</h1>
			</div>
		    <table class="table table-striped table-bordered table-hover">
          			<thead>
          				<tr class="info">
          					<td>펀딩코드</td>
          					<td>펀딩상태</td>
          					<td>펀딩명</td>
          					<td>모집률</td>
          					<td>배당관련</td>
          				</tr>
          			</thead>
          			<tbody id="adminFdList">
          			<!-- 펀딩목록 들어올 곳 -->
          			
          			</tbody>
        	</table>
<script>
	// 더보기버튼 실행 함수 (ajax 요청)
	function moreList(btn){
		console.log("moreList에서 받은 매개변수 : "+btn);
		console.log("moreList 매개변수로 들어온 (버튼객체)의 value = 페이징 "+btn.value);
	    $.ajax({
	        url : "/pineapple/fundingassignmentaddlist.invest",
	        type : "get",
	        cache : false,
	        dataType: 'json',
	        data : {numberOfRequests : btn.value },
	        success : function(data){
	            console.log(data);
	            
	            if(data.length==0){
	            	// 더 불러올 펀딩 목록이 없는 경우
	            	$('#addlistbtn').attr("class","btn btn-primary btn-block disabled");
	            	$('#addlistbtn').text("더 불러올 펀딩목록이 없습니다");
	            } else {
	            	// 불러올 펀딩 목록이 있는 경우
	            	var content="";
	            	for(var i=0; i<data.length; i++){
		                	if(data[i].days < 1){
		                		if(data[i].total/data[i].numberOfShares*100 > 99){
		                			if(data[i].checkassignment != null){
		                				content +=
		                					'<tr>'
		                						+'<td>'+data[i].fdCode+'</td>'
		                						+'<td>'+data[i].fdStatus+'</td>'
		                	      					+'<td>'+msg[i].fdTitle+'</td>'
		                	      					+'<td>'
		                	      						+'<div class="progress">'
		                							+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
		                							+'aria-valuemin="0" aria-valuemax="100" style="width:'
		                							+data[i].total/data[i].numberOfShares*100+'%;">'
		                							+data[i].total/data[i].numberOfShares*100+'%'
		                							+'</div>'
		                							+'</div>'
		                						+'</td>'
		                	      					+'<td><a href=\'#\'>'
		                	      					+'<button type="button" class="btn btn-sm btn-warning btn-block disabled">배정완료</button></a></td>'
		                	  					+'</tr>'
		                			}else{
		                				content +=
		                								'<tr>'
		                									+'<td>'+data[i].fdCode+'</td>'
		                									+'<td>'+data[i].fdStatus+'</td>'
		                			       					+'<td>'+data[i].fdTitle+'</td>'
		                			       					+'<td>'
		                			       						+'<div class="progress">'
		                										+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
		                										+'aria-valuemin="0" aria-valuemax="100" style="width:'
		                										+data[i].total/data[i].numberOfShares*100+'%;">'
		                										+data[i].total/data[i].numberOfShares*100+'%'
		                										+'</div>'
		                										+'</div>'
		                									+'</td>'
		                			       					+'<td><a href=\'/pineapple/fundingassignmentinsertpage.invest?fdCode='+data[i].fdCode+'\'>'
		                			       					+'<button type="button" class="btn btn-sm btn-warning btn-block ">배정하기</button></a></td>'
		                			   					+'</tr>'

		                			}
		                		}else{
		                			content +=
		                						'<tr>'
		                							+'<td>'+data[i].fdCode+'</td>'
		                							+'<td>'+data[i].fdStatus+'</td>'
		                	       					+'<td>'+data[i].fdTitle+'</td>'
		                	       					+'<td>'
		                	       						+'<div class="progress">'
		                								+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
		                								+'aria-valuemin="0" aria-valuemax="100" style="width:'
		                								+data[i].total/data[i].numberOfShares*100+'%;">'
		                								+data[i].total/data[i].numberOfShares*100+'%'
		                								+'</div>'
		                								+'</div>'
		                							+'</td>'
		                	       					+'<td><a href="/pineapple/fundingrefundmain.invest?fdCode='+data[i].fdCode+'">'
		                	       					+'<button type="button" class="btn btn-sm btn-warning btn-block">환불하기</button></a></td>'
		                	   					+'</tr>'

		                		}

		                	}else{
		                		content +=
		                				'<tr>'
		                					+'<td>'+data[i].fdCode+'</td>'
		                					+'<td>'+data[i].fdStatus+'</td>'
		                	     					+'<td>'+data[i].fdTitle+'</td>'
		                	     					+'<td>'
		                	     						+'<div class="progress">'
		                						+'<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60"'
		                						+'aria-valuemin="0" aria-valuemax="100" style="width:'
		                						+data[i].total/data[i].numberOfShares*100+'%;">'
		                						+data[i].total/data[i].numberOfShares*100+'%'
		                						+'</div>'
		                						+'</div>'
		                					+'</td>'
		                	     					+'<td><a href="#">'
		                	     					+'<button type="button" class="btn btn-sm btn-warning btn-block disabled">결제모집기간</button></a></td>'
		                	 					+'</tr>'

		                	}	
	           		}
	            
	            	// 기존 버튼을 지우고 새로 만들어줄때 value 값을 1 증가시켜서 다음 10개를 불러올 페이징넘버를 기억하게함.
	            	var pagingNum = Number(btn.value) + 1; 
		            content += '<tr id="addlistbtnarea">'
		            	+'<td colspan="5"><div class="btns">'
		            	+'<button type="button" id="addlistbtn" onclick="javascript:moreList(this);"'
		            	+'value="'+pagingNum+'" class="btn btn-primary btn-block">'
		            	+'더보기</button></div></td></tr>"';
		            //console.log("content : "+content);
		            $('#addlistbtnarea').remove();
		            $('#adminFdList').append(content);
		       }
	            
	        }, 
	        error : function(){
	           alert('ajax 통신 실패');
	        }
	   
	});
}

	
//이미지 경로가 잘못되었을때 표시해주는 이미지 
$('img').each(function(n){
	console.log($(this));
	$(this).on( "error", function(){
		$(this).attr("src", "${pageContext.request.contextPath}/resources/img/404alternateimage.jpg");
    });
});
</script>		
	</div>
</div>
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</div>

</body>
</html>