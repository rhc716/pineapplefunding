<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투자자 메세지 list</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

</head>
<script type="text/javascript">
$(document).ready(function(){
	$('[data-toggle="popover"]').popover()
	$('.resultresult').hide();
	$('#receivelist').show();
	$('.messagenav1').click(function(){
		var dataCode = $(this).attr('dataCode');
		if(dataCode == 'sendlist'){
			var investmenttab = $.ajax({ // ajax실행부분
		        type: 'get',
		        url : '/pineapple/investorsendmessage.timeline',
		        success : function success(msg){
		        	$('#sendlist').html(msg);
		        },
		        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
		        error : function error(){
	        	}
			});
		}
		$('.resultresult').hide();
		$('#'+dataCode+'').show();
	});
	$('.contentopen').click(function(){
		var msgCode = $(this).attr('dataCode');
		$('#'+msgCode+'').find('a').addClass('msgcheckno').removeClass('msgcheckok')
		var investmenttab = $.ajax({ // ajax실행부분
	        type: 'get',
	        url : '/pineapple/investormessageopen.timeline',
	        data : {msgCode : msgCode},
	        success : function success(msg){
	        },
	        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
	        error : function error(){
        	}
		});
	});
	$('#messagereceiveidinput').keyup(function(){
		var receiveidselect = $(this).val();
		var receiveidtandd = $(this).attr('dataCode');
		if(receiveidselect == ''){
			console.log('미실행')
			$('#sendreceiveidlist').empty();
		}else{
			var investmenttab = $.ajax({ // ajax실행부분
		        type: 'get',
		        url : '/pineapple/investormessagesendreceiveid.timeline',
		        data : {receiveid : receiveidselect},
		        success : function success(msg){
		        	$('#sendreceiveidlist').html(msg);
		        	$('.receiveidclick').click(function(){
		        		$('#sendreceiveidlist').empty();
		        	});
		        },
		        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
		        error : function error(){
	        	}
			});
		}
	});
});
</script>
<body>
	<div class="col-md-12" style="padding: 0px">
		<div class="col-md-2">
				<ul style="font-size: 15px; list-style: none; height: 100%; width: 100%; border: 1.5px solid #009442; border-radius: 5px; padding: 0px; text-align: center; line-height: 40px;">
					<li class="messagenav" style="margin: 0px; padding: 0.75px;"><a class="messagenav1" dataCode="messagesend" href="#">메세지 보내기</a></li>
					<li class="messagenav" style="margin: 0px; padding: 0.75px;"><a class="messagenav1" dataCode="receivelist" href="#">받은 메세지함</a></li>
					<li class="messagenav" style="margin: 0px; padding: 0.75px;"><a class="messagenav1" dataCode="sendlist" href="#">보낸 메세지함</a></li>
				</ul>
		</div>
		
		<!-- 받은 메세지함 리스트 -->
		<div class="col-md-10 resultresult" id="receivelist" style="border: 1.5px solid #009442; border-radius: 5px;">
		<table class="table" style="margin: 0px;">
			<c:forEach var="myinvestormessage" items="${myinvestormessage}">
			<tbody id="${myinvestormessage.msgCode}" style="text-align: center;">
	 			 	<tr>
	 			 	<td><input type="checkbox" name="${myinvestormessage.msgCode}"></td>
	 			 	<c:choose>
	 			 	<c:when test="${myinvestormessage.msgCheck == 0}">
	 			 	<td><a class="msgcheckok"  href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">보낸 사람 : ${myinvestormessage.name}</a></td>
	 			 	<td><a class="msgcheckok contentopen"  href="#" data-toggle="modal" data-target="#myqna${myinvestormessage.msgCode}" qna-title="${myinvestormessage.msgCode}"  dataCode="${myinvestormessage.msgCode}">${myinvestormessage.msgTitle}</a></td>
	 			 	</c:when>
	 			 	<c:otherwise>
	 			 	<td><a class="msgcheckno" style="color: black;" href="#" data-toggle="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<a>메세지보내기</a><br><a>보낸사람으로 검색</a><br><a>받은사람으로 검색</a>">보낸 사람 : ${myinvestormessage.name}</a></td>
	 			 	<td><a class="msgcheckno contentopen" style="color: black;" href="#" data-toggle="modal" data-target="#myqna${myinvestormessage.msgCode}" qna-title="${myinvestormessage.msgCode}" dataCode="${myinvestormessage.msgCode}">${myinvestormessage.msgTitle}</a></td>
	 			 	</c:otherwise>
	 			 	</c:choose>
	 			 	<td><span style="opacity: 0.5">${myinvestormessage.msgTime}</span></td>
	 			 	</tr>
			</tbody>
			</c:forEach>
		</table>
		</div>
		
		<!-- 보낸 메세지함 리스트 -->
		<div class="col-md-10 resultresult" id="sendlist" style="border: 1.5px solid #009442; border-radius: 5px;">
			
		</div>
		
		
		<!-- 메세지 보내기 -->
		<div class="col-md-10 resultresult" id="messagesend" style="border: 1.5px solid #009442; border-radius: 5px;">
			<form id="newmessageform" action="/pineapple/investormessagesend.timeline" method="post" style="padding: 30px 15px;">
				<div style="margin: 20px 0px;">
				<input type="hidden" name="msgSendId" value="${id}">
				<label for="messagereceiveidinput">받는 사람</label>
				<input id="messagereceiveidinput" name="msgReceiveId" type="text" class="form-control box1" placeholder="받는사람을 정해주세요" dataCode="false">
				<div id="sendreceiveidlist">
				</div>
				</div>
				<div style="margin: 20px 0px;">
				<label for="messagetitleinput">메세지 제목</label>
				<input id="messagetitleinput" name="msgTitle" type="text" class="form-control box1" placeholder="메세지 제목을 입력해 주세요">
				</div>
				<div style="margin: 20px 0px;">
				<label for="messagecontentinput">메세지 내용</label>
				<textarea id="messagecontentinput" name="msgContent" type="text" class="form-control box1" placeholder="메세지 내용을 입력해 주세요" style="height: 200px; resize: none;"></textarea>
				</div>
				<div>
				<button class="btn btn-info" type="submit">입력</button>
				</div>
	        </form>
		</div>
		
		
		<!-- 모달 -->
			<!-- 내용 모달 -->
			<c:forEach var="myinvestormessage" items="${myinvestormessage}">
			<div class="modal fade" id="myqna${myinvestormessage.msgCode}" tabindex="-1" role="dialog" aria-labelledby="myqnaLabel${myinvestormessage.msgCode}" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
			    <div class="modal-header text-lr-center">
				    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				    <h1 class="modal-title" id="myModalLabel${myinvestormessage.msgCode}">질문 내용 수정</h1>
				</div>
				<div class="modal-body">
					<div>${myinvestormessage.msgContent}</div>
			    </div>
			    <div class="modal-footer">
					<button class="qnaupdateform btn btn-default" type="button" data-dismiss="modal" dataCode="${myinvestormessage.msgCode}">수정하기</button>
	       			<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
	      		</div>
			  </div>
			</div>
			</div>
			</c:forEach>
	</div>
</body>
</html>