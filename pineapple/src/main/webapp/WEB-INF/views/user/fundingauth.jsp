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
<title>펀딩내 권한부여</title>

<!-- 파비콘 -->
<link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.ico">
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
			<!-- 권한 부여자인 권한부여정보 조회 -->
			<div class="pagetitleandexplainbox">
				<h4>${nickname}님이 펀딩내 권한 부여자</h4>
			</div>
			<div class="panel panel-primary filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">권한을 부여한 목록 조회</h3>
	                <div class="pull-right">
	                    <button class="btn btn-xs btn-warning btn-filter"><span class="glyphicon glyphicon-filter"></span>검색정렬</button>
	                </div>
	            </div>
	            <br>
				<table class="table">
					<thead>
						<tr class="filters">
							<th><input type="text" class="form-control" placeholder="#" disabled></th>
							<th><input type="text" class="form-control" placeholder="권한코드" disabled></th>
							<th><input type="text" class="form-control" placeholder="회사명" disabled></th>
							<th><input type="text" class="form-control" placeholder="펀딩명" disabled></th>
							<th><input type="text" class="form-control" placeholder="펀딩상황" disabled></th>
							<th><input type="text" class="form-control" placeholder="부여자ID" disabled></th>
							<th><input type="text" class="form-control" placeholder="피부여자ID" disabled></th>
							<th><input type="text" class="form-control" placeholder="권한명" disabled></th>
							<th><input type="text" class="form-control" placeholder="삭제" disabled></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="authgiverList" items="${authgiverList}" varStatus="numberofauthgive">
						<tr>
							<td> ${numberofauthgive.count} </td>
							<td> ${authgiverList.authCode} </td>
							<td> ${authgiverList.comName} </td>
							<td> ${authgiverList.fdTitle} </td>
							<td> ${authgiverList.fdStatus} </td>
							<td><a type="button" class="btn btn-block btn-success disabled">${authgiverList.authGiver}</a></td>
							<td> ${authgiverList.authReceiver} </td>
							<td><a type="button" class="btn btn-block btn-danger disabled">${authgiverList.authLevelName}</a></td>
							<td>
								<form action="/pineapple/deletefundingauth.user" method="post">
									<input type="hidden" name="authCode" value="${authgiverList.authCode}">
									<button type="submit" class="btn btn-block btn-danger">삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
						<tr>
							<a type="button" class="btn btn-md btn-success btn-block" data-toggle="modal" href="#newfdauthmodal${numberofauthgive.count}">+ 새로운 펀딩내 권한부여하기</a>
						</tr>
							<br>
							<!-- 새로운 권한부여 모달 화면 -->
							<div class="modal fade" id="newfdauthmodal${numberofauthgive.count}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">${nickname}님의 새로운 권한부여</h4>
							      </div>
							      <div class="modal-body">
							        <form action="/pineapple/addnewfundingauth.user" method="post">
							        	<div class="container_insert">
										  	<div class="form-group">
											    <label for="authFdName">펀딩명</label>
											    <p id="explain">(권한을 부여할 펀딩 이름을 정확히 선택해주세요)</p>
											    <select id="fdselectlist" name="authFdCode" class="form-control">
												    <c:forEach var="fundinglist" items="${fundinglistById}">
												    	<optgroup label="${fundinglist.comName}">
												    		<option value="${fundinglist.fdCode}">${fundinglist.fdTitle}</option>
												    	</optgroup>
												    </c:forEach>
												</select>
										  	</div>
										  	<br>
										  	<div id="authGiverIdinput" class="form-group has-success has-feedback">
												<label class="control-label" for="inputSuccess2">권한부여자ID</label>
												<input type="text" class="form-control" name="authGiver" value="${id}" varia-describedby="inputSuccess2Status" readonly>
												<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
												<span id="inputSuccess2Status" class="sr-only">(success)</span>
											</div>
										  	<br>
										  	<div class="form-group">
										  		<label for="authReceiver">권한피부여자ID</label>
											    <p id="explain">(권한을 부여받을 사원의 ID를 선택해주세요)</p>
											    <select name="authReceiver" id="employeelistonecompany" class="form-control">
												    <c:forEach var="employeelist" items="${allEmployeeInMyCom}" varStatus="emNumber">
										    			<optgroup label="${employeelist.emComName}">
										    				<option value="${employeelist.emUserId}">${employeelist.emUserId}</option>
										    			
										    			</optgroup>
												    </c:forEach>
											    </select>
										  	</div>
											<br>
											<div class="form-group">
										  		<label for="fdAuthLevelCode">펀딩내 권한명</label>
											    <p id="explain">(펀딩내에서 부여할 권한명을 선택해주시기 바랍니다)</p>
											    <select name="fdAuthLevelCode" class="form-control">
											     	<optgroup label="권한명">
													    <c:forEach var="fdauthlevel" items="${fundingauthlevel}">
													    	<option value="${fdauthlevel.authLevelCode}">${fdauthlevel.authLevelName}</option>
													    </c:forEach>
												    </optgroup>
											    </select>
										  	</div>
											<br>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
									        <button type="submit" class="btn btn-info">권한부여</button>
									      </div>
							        </form>
							      </div>
							    </div>
							  </div>
							</div>
					</tfoot>
				</table>
			</div>
			<!-- 권한 피부여자인 권한부여정보 조회 -->
			<div class="pagetitleandexplainbox">
				<h4>${nickname}님이 펀딩내 권한 피부여자</h4>
			</div>
			<div class="panel panel-primary filterable">
	            <div class="panel-heading">
	                <h3 class="panel-title">권한을 부여받은 목록 조회</h3>
	                <div class="pull-right">
	                    <button class="btn btn-xs btn-warning btn-filter"><span class="glyphicon glyphicon-filter"></span>검색정렬</button>
	                </div>
	            </div>
	            <br>
				<table class="table">
					<thead>
						<tr class="filters">
							<th><input type="text" class="form-control" placeholder="#" disabled></th>
							<th><input type="text" class="form-control" placeholder="권한코드" disabled></th>
							<th><input type="text" class="form-control" placeholder="회사명" disabled></th>
							<th><input type="text" class="form-control" placeholder="펀딩명" disabled></th>
							<th><input type="text" class="form-control" placeholder="펀딩상황" disabled></th>
							<th><input type="text" class="form-control" placeholder="부여자ID" disabled></th>
							<th><input type="text" class="form-control" placeholder="피부여자ID" disabled></th>
							<th><input type="text" class="form-control" placeholder="권한명" disabled></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="authreceiverList" items="${authreceiverList}" varStatus="numberofauthreceive">
							<tr>
								<td> ${numberofauthreceive.count} </td>
								<td> ${authreceiverList.authCode} </td>
								<td> ${authreceiverList.comName} </td>
								<td> ${authreceiverList.fdTitle} </td>
								<td> ${authreceiverList.fdStatus} </td>
								<td> ${authreceiverList.authGiver}</td>
								<td><a type="button" class="btn btn-block btn-success disabled">${authreceiverList.authReceiver}</a></td>
								<td><a type="button" class="btn btn-block btn-danger disabled">${authreceiverList.authLevelName}</a></td>
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