<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Invest Funding Qna</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

</head>
<body>
<c:forEach var="QnaData" items="${fundingqna}">
	<div class="col-xs-12 funding-qna">
		<div class="col-xs-12 funding-qnaid">
			<span class="funding-qnaidandtime">${QnaData.qnaFdId}&nbsp;&nbsp;${QnaData.qnaFdTime}</span>
			<c:choose>
			<c:when test="${QnaData.qnaFdId == id}">
			<span class="funding-qnaupanddel">
				&nbsp;&nbsp;<a class="qnaupdate" id="qnaupdate${QnaData.qnaCode}" data-toggle="modal" data-target="#myqna${QnaData.qnaCode}" qna-title="${QnaData.qnaFdCode}">수정하기</a>
				&nbsp;&nbsp;<a href="/pineapple/investqnadelete.invest?fdCode=${QnaData.qnaFdCode}&qnaCode=${QnaData.qnaCode}">삭제하기</a>
			</span>
			</c:when>
			</c:choose>
		</div>
		<div class="col-xs-12 funding-title">Q&A제목 : <span id="qnatitle${QnaData.qnaCode}">${QnaData.qnaFdTitle}</span></div>
		<div class="col-xs-12 funding-content">Q&A내용 : <span id="qnacontent${QnaData.qnaCode}">${QnaData.qnaFdContent}</span></div>
		<div class="replyall">
			<a class="col-xs-1 reply-main" id="${QnaData.qnaCode}" data-toggle="collapse" href="#collapseExample${QnaData.qnaCode}" aria-expanded="false" aria-controls="collapseExample${QnaData.qnaCode}">
			답글보기
			</a>
			<div class="col-xs-11"></div>
			<div class="col-xs-12 collapse" id="collapseExample${QnaData.qnaCode}">
				<div class="col-xs-12 collapse-main">
					<form id="answerform" action="/pineapple/investanswer.invest?fdCode=${QnaData.qnaFdCode}" method="post">
						<div class="col-xs-8">
							<input name="reQnaCode" type="hidden" value="${QnaData.qnaCode}">
							<input name="qnaReId" type="hidden" value="${id}">
							<textarea class="form-control" name="qnaReContent" style="width: 100%; height: 100px; resize: none;" rows="3" placeholder="답변을 입력해주세요"></textarea>
						</div>
						<div class="col-xs-4 collapsereply-btn">
							<button class="collapsereplyanswerbtn btn btn-info" id="answerbtn">답변등록하기</button>
						</div>
					</form>
				</div>
				<div class="col-xs-12 replycontent qnaCode_${QnaData.qnaCode}">
		  		</div>
			</div>
		</div>
		<div class="modal fade" id="myqna${QnaData.qnaCode}" tabindex="-1" role="dialog" aria-labelledby="myqnaLabel${QnaData.qnaCode}" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
			    <div class="modal-header text-lr-center">
				    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				    <h1 class="modal-title" id="myModalLabel${QnaData.qnaCode}">질문 내용 수정</h1>
				</div>
				<div class="modal-body">
					<form id="qnaform${QnaData.qnaCode}" action="/pineapple/investqnaupdate.invest?fdCode=${QnaData.qnaFdCode}" method="post">
						<div class="form-group">
							<input type="hidden" name="qnaCode" value="${QnaData.qnaCode}">
							<input type="hidden" name="qnaFdCode" value="${QnaData.qnaFdCode}">
							<input class="form-control modalqnareplytitle" id="qnaupdatetitle"  name="qnaFdTitle" type="text"  placeholder="수정할 제목을 입력해주세요"value="${QnaData.qnaFdTitle}">
							<textarea class="form-control modalqnareplycontent" id="qnaupdatecontent" name="qnaFdContent" rows="3" placeholder="수정할 내용을 입력해주세요">${QnaData.qnaFdContent}</textarea>
						</div>
						<div class="modal-footer">
							<button class="qnaupdateform btn btn-default" id="${QnaData.qnaCode}" type="button" data-dismiss="modal">수정하기</button>
			       			<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
			      		</div>
					</form>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</c:forEach>
</body>
</html>