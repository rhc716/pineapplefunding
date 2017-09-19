<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>사업분야등록</title>
<!-- 파비콘 -->
<link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.ico">

<!-- table 검색정렬기능 css-->
<style type="text/css">	
	.filterable {
	    margin-top: 15px;
	}
	.filterable .panel-heading .pull-right {
	    margin-top: -20px;
	}
	.filterable .filters input[disabled] {
	    background-color: transparent;
	    border: none;
	    cursor: auto;
	    box-shadow: none;
	    padding: 0;
	    height: auto;
	}
	.filterable .filters input[disabled]::-webkit-input-placeholder {
	    color: #369;
	}
	.filterable .filters input[disabled]::-moz-placeholder {
	    color: #369;
	}
	.filterable .filters input[disabled]:-ms-input-placeholder {
	    color: #369;
	}
	
</style>
<script type="text/javascript">
/*
table 검색정렬 기능
*/
$(document).ready(function(){
    $('.filterable .btn-filter').click(function(e){
    	e.preventdefault;
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
    	e.preventdefault;
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
       
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
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
		<br>
			<!-- 사업분야 입력양식 -->
			<h3>사업분야 입력하기</h3>
			<p id="explanation">
				펀딩별 사업분야를 등록해주시기 바랍니다.
				펀딩별 다양한 사업분야를 등록할 수 있습니다.
			</p>
			<div>
				<form action="/pineapple/insertbizarea.user" method="post">
					<select name="areaFdCode" class="form-control">
					    <c:forEach var="fundinglist" items="${fundinglistById}">
					    	<optgroup label="${fundinglist.comName}">
					    		<option value="${fundinglist.fdCode}">${fundinglist.fdTitle}</option>
					    	</optgroup>
					    </c:forEach>
					</select>
					<br>
					<select name="areaName" class="form-control">
						<option value="it">it</option>
						<option value="핀테크">핀테크</option>
						<option value="인터넷서비스">인터넷서비스</option>
						<option value="문화">문화</option>
						<option value="디자인">디자인</option>
						<option value="뷰티">뷰티</option>
						<option value="의료">의료</option>
						<option value="제조">제조</option>
						<option value="유통">유통</option>
						<option value="농수산">농수산</option>
					</select>
					<br>
					<button type="submit" class="btn btn-block btn-success">등록</button>
				</form>
			</div>
			<br>
			<!-- 사업분야부여 조회 후 출력 -->
			<h3>사업분야 조회하기</h3>
			<p id="explanation">
				자신이 속한 기업별 펀딩들의 사업분야를 조회할 수 있습니다.
				전체 사업분야 리스트를 조회 후, 바로 사업분야를 삭제 할 수 있습니다.
			</p>
			<div class="panel panel-primary filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">사업분야 조회</h3>
	                <div class="pull-right">
	                    <button class="btn btn-xs btn-warning btn-filter"><span class="glyphicon glyphicon-filter"></span>검색정렬</button>
	                </div>
	            </div>
	            <br>
				<table class="table">
					<thead>
						<tr class="filters">
							<th><input type="text" class="form-control" placeholder="#" disabled></th>
							<th><input type="text" class="form-control" placeholder="분야코드" disabled></th>
							<th><input type="text" class="form-control" placeholder="기업명" disabled></th>
							<th><input type="text" class="form-control" placeholder="펀딩명" disabled></th>
							<th><input type="text" class="form-control" placeholder="사업분야명" disabled></th>
							<th><input type="text" class="form-control" placeholder="삭제" disabled></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="allbizarea" items="${allbizarea}" varStatus="numberofallbizarea">
							<tr>
								<td> ${numberofallbizarea.count} </td>
								<td> ${allbizarea.areaCode} </td>
								<td> ${allbizarea.comName} </td>
								<td> ${allbizarea.fdTitle} </td>
								<td><a type="button" class="btn btn-block btn-info disabled">${allbizarea.areaName}</a></td>
								<td>
									<form action="/pineapple/deletebizarea.user" method="post">
										<input type="hidden" name="areaCode" value="${allbizarea.areaCode}">
										<button type="submit" class="btn btn-block btn-danger">삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
<!-- 풋터 -->
<c:import url="/resources/module/footer.jsp"/>
</div>	
</body>
</html>