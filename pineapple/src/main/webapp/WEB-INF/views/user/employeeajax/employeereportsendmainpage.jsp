<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	//부트스트랩 새로고침할 때 페이지 유지
	$('#myTab a').click(function(e) {
	  e.preventDefault();
	  $(this).tab('show');
	});
	
	//hash value에 현재 선택된 탭을 저장한다
	$("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
	  var id = $(e.target).attr("href").substr(1);
	  window.location.hash = id;
	});
	
	// 페이지 로드할 때 : 현재 선택된 탭으로 전환
	var hash = window.location.hash;
	$('#myTab a[href="' + hash + '"]').tab('show');
});
</script>
</head>
<body>
	<div class="col-xs-12" style="border: 1.5px solid #009442; border-radius: 5px;">
			<form id="newmessageform" action="/pineapple/investormessagesend.timeline#message" method="post" style="padding: 30px 15px;">
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
</body>
</html>