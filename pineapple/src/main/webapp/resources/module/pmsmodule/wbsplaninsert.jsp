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

<style>
[class*="border"] {
  padding: 8px;
  border: 1px solid gray;
  text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div class="border">
			<label for="wbsplan">WBS예상계획</label><br>
			<div class="row">
				<div class="col-md-6">
					WBS순서:
					<input type="text" class="form-control" id="milestoneStep">
				</div>
				<div class="col-md-6">
					작업명:
					<input type="text" class="form-control" id="milestoneName">
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					선행작업
					<input type="text" class="form-control" id="milestoneName">
				</div>
				<div class="col-md-6">
					작업기간
					<input type="text" class="form-control" id="milestoneName">
				</div>	
			</div><br>
			시작일
			<input type="date" id="milestoneName">
			종료일
			<input type="date" id="milestoneName">
		</div>
	</div>
	<div class="col-md-2">
	</div>
</div>
<br><br>
<div class="row">
	<div class="col-md-2">
	</div>
	
		<div class="col-md-4">
			<div class="border">
				<label for="wbsplanhuman">WBS인원예상지출</label><br><br>
				인원수:<br>
				<input type="text"><br>
				총비용:<br>
				<input type="text" id="milestoneName"><br>
				비고:<br>
				<input type="text" id="milestoneName"><br>
			</div><br>
	
			<div class="border">
				<label for="wbsplanhuman">WBS예상장비지출</label><br>
				장비명:<br>
				<input type="text"><br>
				수:<br>
				<input type="text" id="milestoneName"><br>
				단가:<br>
				<input type="text" id="milestoneName"><br>
				총비용:<br>
				<input type="text" id="milestoneName">
			</div><br>
			<div class="border">
				<label for="wbsplanhuman">WBS예상기타지출</label><br>
				비용명:<br>
				<input type="text"><br>
				가격:<br>
				<input type="text" id="milestoneName"><br>
				비고:<br>
				<input type="text" id="milestoneName"><br>
			</div>
		</div>
	<div class="col-md-4">
		<div class="border">
			<label for="wbsplanhuman">WBS시설예상지출</label><br><br>
			시설명:<br>
			<input type="text"><br>
			비용:<br>
			<input type="text" id="milestoneName"><br>
			비고:<br>
			<input type="text" id="milestoneName"><br>
		</div><br>

		<div class="border">
			<label for="wbsplanhuman">WBS예상외주지출</label><br>
			업체명:<br>
			<input type="text"><br>
			비용:<br>
			<input type="text" id="milestoneName"><br>
			비고:<br>
			<input type="text" id="milestoneName">
		</div><br>
		
		<div class="border">
			<label for="wbsplanhuman">WBS예상수익</label><br>
			수익상황:<br>
			<input type="text"><br>
			수익:<br>
			<input type="text" id="milestoneName">
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-8">
	</div>
	<div class="col-md-4">
		<button>입력완료</button>
	</div>
</div>

	
	
</body>
</html>