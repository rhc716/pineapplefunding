<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	
		<div class="col-md-6">
			<div class="border">
				펀딩명:
				<select id="fdType">
					<option value="msFdCode">1번펀딩</option>
					<option value="msFdCode">2번펀딩</option>
				</select><br><br>
				마일스톤 단계:
				<input type="text" class="form-control" id="milestoneStep"><br>
				마일스톤 이름:
				<input type="text" class="form-control" id="milestoneName"><br>
				마일스톤 요약:<br>
				<textarea class="form-control" rows="5" id="milestoneSummary"></textarea>
			</div>
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