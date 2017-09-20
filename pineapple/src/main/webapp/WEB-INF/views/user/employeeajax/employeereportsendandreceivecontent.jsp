<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	 			 		<td><input name="reportchecked" type="checkbox"  value="${moneycontent.reportCode}"></td>
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
</body>
</html>