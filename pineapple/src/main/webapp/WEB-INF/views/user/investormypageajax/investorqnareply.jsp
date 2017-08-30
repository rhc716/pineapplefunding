<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투자자 MyPage</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ehj.css" />

</head>
<body>
<c:set var="reply" value="${investorqnareplylist}"></c:set>
<c:choose>
	<c:when test="${reply.size() == 0}">
		<span class="glyphicon glyphicon-menu-right"></span>
		<span class="reply-title"></span>
		<div class="replycontentnull">등록된 답변이 없습니다.</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="QnareData" items="${investorqnareplylist}">
			<span class="glyphicon glyphicon-menu-right"></span>
			<span class="replyidandtime">${QnareData.qnaReId}&nbsp;&nbsp;${QnareData.qnaReTime}</span>
			<c:choose>
			<c:when test="${QnareData.qnaReId == id}">
			<span class="replyupanddel">
				&nbsp;&nbsp;<a class="qnareupdate" id="qnareupdate${QnareData.qnaReCode}" data-toggle="modal" data-target="#myqnare${QnareData.qnaReCode}" qna-title="${QnareData.qnaFdCode}">수정하기</a>
				&nbsp;&nbsp;<a href="/pineapple/investorqnareplydelete.invest?qnaReCode=${QnareData.qnaReCode}">삭제하기</a>
			</span>
			</c:when>
			</c:choose>	
			<div class="qnareplycontent">${QnareData.qnaReContent}</div>
			<div class="modal fade" id="myqnare${QnareData.qnaReCode}" tabindex="-1" role="dialog" aria-labelledby="myqnareLabel${QnareData.qnaReCode}" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-lr-center">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h1 class="modal-title" id="myModalreLabel${QnareData.qnaReCode}">답변 내용 수정</h1>
						</div>
					<div class="modal-body">
						<form id="qnareform${QnareData.qnaReCode}" action="/pineapple/investorqnarelyupdate.invest" method="post">
							<div class="form-group">
								<input type="hidden" name="qnaReCode" value="${QnareData.qnaReCode}">
								<textarea class="form-control" id="qnaupdatecontent" name="qnaReContent" rows="3" style="width: 100%; height: 100px; resize: none;" placeholder="수정할 내용을 입력해주세요">${QnareData.qnaReContent}</textarea>
							</div>
							<div class="modal-footer">
								<button class="qnareupdateform btn btn-default" id="${QnareData.qnaReCode}" type="button" data-dismiss="modal">수정하기</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
							</div>
						</form>
					</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
</body>
</html>