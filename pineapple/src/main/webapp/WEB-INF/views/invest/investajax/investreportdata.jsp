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
		<table class="table" id="myfundingfilelist">
			<tr>
				<td>펀딩명</td>
				<td>보고서명</td>
				<td>보고서확장자</td>
				<td>보고서용량</td>
				<td>다운로드</td>
			</tr>
			<c:forEach var="filelist" items="${fundingreportlist}">
			<tr>
				<td>${filelist.fdTitle}</td>
				<td>${filelist.fdFileName}</td>
				<td>${filelist.fdFileExtension}</td>
				<td class="fdFileSize">${filelist.fdFileSize}</td>
				<td><a href="calldownload.pms?fileFullPath=${filelist.fdFileUploadName}">
				<button type="button" class="btn btn-sm btn-success">다운로드</button></a></td>
			</tr>
			</c:forEach>
		</table>
</body>
</html>