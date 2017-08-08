<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="col-md-6">
		펀딩형태:
		<select id="fdType">
			<option value="채권형">채권형</option>
			<option value="주식형">주식형</option>
		</select><br><br>
		펀딩명:
		<input type="text" class="form-control" id="fdTitle"><br>
		최소투자금액:
		<input type="text" class="form-control" id="minInvestMoney"><br>
		판매주식수:
		<input type="text" class="form-control" id="numberOfShares"><br>
		주당발행가:
		<input type="text" class="form-control" id="issuePrice"><br>
	
	
		오픈일:
		<input type="text" class="form-control" id="openDate"><br>
		마감일:
		<input type="text" class="form-control" id="closeDate"><br>
		최소보장이율:
		<input type="text" class="form-control" id="numberOfShares"><br>
		
	</div>
	<div class="col-md-3">
	</div>
	
	<div class="col-md-3">
	</div>
	<div class="col-md-9">	
		<button>입력완료</button>
	</div>
	
</body>
</html>