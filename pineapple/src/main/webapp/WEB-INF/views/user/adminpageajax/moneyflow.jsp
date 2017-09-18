<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function(){
		var changeAccountAjax = $.ajax({ // ajax실행부분
	        type: "get",
	        url : "/pineapple/moneyflowall.timeline",
	        success : function success(msg){
	        	$('#moneyflowcontentreal').html(msg);
	        },
	        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
	        error : function error(){
	    	}
		});
		$('.moneyflowcate').click(function(){
			var mfCategory = $(this).attr('dataCode');
			var changeAccountAjax = $.ajax({ // ajax실행부분
		        type: "get",
		        url : "/pineapple/moneyflowall.timeline",
		        data : {mfCategory : mfCategory,
		        		numberOfRequests : 0},
		        success : function success(msg){
		        	$('#moneyflowcontentreal').html(msg);
		        },
		        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
		        error : function error(){
		    	}
			});
		});
	});
</script>
</head>
<body>
	<div class="col-xs-2">
				<ul style="font-size: 15px; list-style: none; height: 100%; width: 100%; border: 1.5px solid #009442; border-radius: 5px; padding: 0px; text-align: center; line-height: 40px;">
					<li style="margin: 0px; padding: 0.75px;"><a class="moneyflowcate" dataCode="2" href="#">환불내역조회</a></li>
					<li style="margin: 0px; padding: 0.75px;"><a class="moneyflowcate" dataCode="1" href="#">입금내역조회</a></li>
					<li style="margin: 0px; padding: 0.75px;"><a class="moneyflowcate" dataCode="3" href="#">배정내역조회</a></li>
					<li style="margin: 0px; padding: 0.75px;"><a class="moneyflowcate" dataCode="4" href="#">수수료 조회</a></li>
				</ul>
	</div>
	<div class="col-xs-9" id="moneyflowcontentreal">
		
	</div>
</body>
</html>