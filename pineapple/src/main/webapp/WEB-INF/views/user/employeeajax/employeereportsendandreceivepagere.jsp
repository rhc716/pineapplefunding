<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />

<script type="text/javascript">
$(document).ready(function(){
	$('#checkallre').click(function(){
		if($('#checkallre').prop('checked')){
			$('input[name=reportchecked]').prop('checked',true)
		}else{
			$('input[name=reportchecked]').prop('checked',false)
		}
	});
	$('#reportreadok').click(function(){
		$('#checkallre').prop('checked',false)
		var messagecount = 0;
		var messagecheckedlength = $('input[name=reportchecked]').length
		var reportchecklist = new Array();
		for(i = 0 ; i < messagecheckedlength ; i++){
			if(document.getElementsByName("reportchecked")[i].checked == true){
				reportchecklist[messagecount] = document.getElementsByName("reportchecked")[i].value;
				messagecount++
			}
		}
		if(reportchecklist == ''){
			console.log('미실행')
		}else{
		$.ajaxSettings.traditional = true;
		var investmenttab = $.ajax({ // ajax실행부분
	        type: 'get',
	        url : '/pineapple/investorreportcheckok.timeline',
	        data : {reportchecklist : reportchecklist},
	        success : function success(msg){
	        	$('#checkmoneyflowcheck').html(msg)
	        },
	        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
	        error : function error(){
        	}
		});
		}
	});	
	$('#reportreadno').click(function(){
		$('#checkallre').prop('checked',false)
		var messagecount = 0;
		var messagecheckedlength = $('input[name=reportchecked]').length
		var reportchecklist = new Array();
		for(i = 0 ; i < messagecheckedlength ; i++){
			if(document.getElementsByName("reportchecked")[i].checked == true){
				reportchecklist[messagecount] = document.getElementsByName("reportchecked")[i].value;
				messagecount++
			}
		}
		if(reportchecklist == ''){
			console.log('미실행')
		}else{
		$.ajaxSettings.traditional = true;
		var investmenttab = $.ajax({ // ajax실행부분
	        type: 'get',
	        url : '/pineapple/investorreportcheckno.timeline',
	        data : {reportchecklist : reportchecklist},
	        success : function success(msg){
	        	$('#checkmoneyflowcheck').html(msg)
	        },
	        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
	        error : function error(){
        	}
		});
		}
	});	
	$('#reportdelete').click(function(){
		$('#checkallre').prop('checked',false)
		var messagecount = 0;
		var messagecheckedlength = $('input[name=reportchecked]').length
		var reportchecklist = new Array();
		for(i = 0 ; i < messagecheckedlength ; i++){
			if(document.getElementsByName("reportchecked")[i].checked == true){
				reportchecklist[messagecount] = document.getElementsByName("reportchecked")[i].value;
				messagecount++
			}
		}
		if(reportchecklist == ''){
			console.log('미실행')
		}else{
		$.ajaxSettings.traditional = true;
		var investmenttab = $.ajax({ // ajax실행부분
	        type: 'get',
	        url : '/pineapple/investorreportdelete.timeline',
	        data : {reportchecklist : reportchecklist},
	        success : function success(msg){
	        	$('#checkmoneyflowcheck').html(msg)
	        },
	        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
	        error : function error(){
        	}
		});
		}
	});	
});
</script>
</head>
<body>
	<c:set var="checkmoney" value="${moneycontent}"></c:set>
	<c:if test="${Category == 'empreceivemessagelist'}">
	<div class="col-md-12" style="border: 1.5px solid #009442; border-radius: 5px; margin-bottom: 10px">
		<table class="table" style="margin: 0px; text-align: center;">
		<tr>
		<td style="width: 42px"><input id="checkallre" type="checkbox"></td>
		<td><a id="reportdelete" style="color: black;" dataCode="${Category}"><span class="glyphicon glyphicon-trash"></span>체크된 메세지삭제</a></td>
		<td><a id="reportreadok" style="color: black;" dataCode="${Category}"><span class="glyphicon glyphicon-eye-open"></span>읽은 메세지로</a></td>
		<td><a id="reportreadno" style="color: black;" dataCode="${Category}"><span class="glyphicon glyphicon-eye-close"></span>읽지않은 메세지로</a></td>
		<td></td>
		</tr>
		</table>
	</div>
	</c:if>
	<div class="col-xs-12" style="border: 1.5px solid #009442; border-radius: 5px;" id="checkmoneyflowcheck">
		<table class="table" style="margin: 0px;">
			<c:choose>
			<c:when test="${checkmoney.size() < 1}">
			<tbody>
				<tr>
					<td colspan="5">내역이 없습니다.</td>
				</tr>
			</tbody>
			</c:when>
			<c:otherwise>
			<tbody style="text-align: center;" id="investorlist">
					<c:forEach var="moneycontent" items="${moneycontent}">
	 			 	<tr>
	 			 		<td><input name="reportchecked" type="checkbox" value="${moneycontent.reportCode}"></td>
		 			 	<td>${moneycontent.reportSendId}</td>
		 			 	<td>${moneycontent.reportTitle}</td>
		 			 	<td>${moneycontent.reportContent}</td>
		 			 	<td>${moneycontent.reportTime}</td>
	 			 	</tr>
	 			 	</c:forEach>
			</tbody>

			<tbody>
				<tr id="investoraddlistbtnarea" style="text-align: center;">
					<td colspan="5" style="text-align: center;">
						<button type="button" onclick="javascript:investormoreList(this)" id="investoraddlistbtn" value="1" class="btn-block btn btn-primary" dataCode="${Category}">더보기</button>
					</td>
				</tr>
			</tbody>
			</c:otherwise>
			</c:choose>
		</table>
		<script>
		function investormoreList(btn){
			//console.log("moreList에서 받은 매개변수 : "+btn);
			//console.log("moreList 매개변수로 들어온 (버튼객체)의 value = 페이징 "+btn.value);
			var dataCode = $('#investoraddlistbtn').attr('dataCode')
		    $.ajax({
		        url : "/pineapple/reportreceiveandsendlistpageadd.timeline",
		        type : "get",
		        cache : false,
		        dataType: 'json',
		        data : {
		        	Category : dataCode,
		        	numberOfRequests : btn.value },
		        success : function(data){
		            //console.log(data);
		            
		            if(data.length==0){
		            	// 더 불러올 펀딩 목록이 없는 경우
		            	$('#investoraddlistbtn').attr("class","btn btn-primary btn-block disabled");
		            	$('#investoraddlistbtn').text("더 불러올 투자자 목록이 없습니다");
		            } else {
		            	// 불러올 펀딩 목록이 있는 경우
		            	var content="";
		    			for(var i = 0; i<data.length; i++){
		    				var paychecktext = "";
		    				$('#investorlist').append(
		    					'<tr>'
		    						+'<td><input name="reportchecked" type="checkbox" value="'+data[i].reportCode+'"></td>'
		    						+'<td>'+data[i].reportSendId+'</td>'
		    						+'<td>'+data[i].reportTitle+'</td>'
		    						+'<td>'+data[i].reportContent+'</td>'
			    					+'<td>'+data[i].reportTime+'</td>'
			    				+'</tr>'
		    				);
		    			}         
		            	// 기존 버튼을 지우고 새로 만들어줄때 value 값을 1 증가시켜서 다음 10개를 불러올 페이징넘버를 기억하게함.
		            	var pagingNum = Number(btn.value) + 1; 
			            content += 
			            	'<tr id="investoraddlistbtnarea">'
								+'<td colspan="5">'
								+'<button type="button" onclick="javascript:investormoreList(this)" id="investoraddlistbtn" value="'+pagingNum+'" class="btn-block btn btn-primary" dataCode='+dataCode+'>'
								+'더보기</button>'
								+'</td>'
							+'</tr>'
			            //console.log("content : "+content);
			            $('#investoraddlistbtnarea').remove();
			            $('#investorlist').append(content);
			       	}
		            
		        }, 
		        error : function(){
		           alert('ajax 통신 실패..;');
		        }
		   
			});
		}
		</script>
	</div>
</body>
</html>
