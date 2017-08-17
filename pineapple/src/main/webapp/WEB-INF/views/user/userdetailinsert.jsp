<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원상세정보입력</title>
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

<!-- css lbr -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lbr.css" />
<script>
//가입정보 유효성검사
	$(document).ready(function(){
		 $('#submitBtn').click(function(){	// submit 버튼을 누르면 유효성 검사후 수동으로 submit 해줌.
				if($('#phoneFront3').val() != ''){  
					if($('#phoneRest8').val() != ''){
						if($('#postalCode').val() != ''){
							if($('#address').val() == ''){
								alert('주소를 입력 해주세요');
							} else {
								$('#form').submit();
				    		} 
						} else {
				        	alert('우편번호를 입력해주세요');
					    }
					} else {
					    alert('전화번호 뒤 8자리를 입력 해주세요');
					}
				} else {
					alert('전화번호 앞 3자리를 입력 해주세요');
				}
		 });
	});	
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //다음 주소 찾기 api 사용
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postalCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullRoadAddr;
                document.getElementById('address').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<script>
$(document).ready(function(){
	//전화번호 앞 3자리 유효성 검사(숫자만 입력될 수 있도록)
	$('#phoneFront3').blur(function(){
		var check = /^(?=.*[0-9]).{3}$/i;
		var in_name = $('#phoneFront3').val();
		if(!check.test(in_name)){
			//전화번호 앞 3자리가 유효하지 않을때
			$("#phch1").css("color", "#FF0000");
			$('#phch1').text('전화번호 앞 3자리가 유효하지 않습니다');
		} else {
			//전화번호 앞 3자리가 유효할때
			$("#phch1").css("color", "#008000");
			$('#phch1').text('전화번호 앞 3자리를 사용할 수 있습니다');
		}
	});
	//전화번호 뒤 8자리 숫자 유효성 검사(숫자만 8자리 입력) 
	$('#phoneRest8').blur(function(){
		var check = /^(?=.*[0-9]).{8}$/i;
		var in_name = $('#phoneRest8').val();
		if(!check.test(in_name)){
			//전화번호 뒤 8자리가 유효하지 않을때
			$("#phch2").css("color", "#FF0000");
			$('#phch2').text('전화번호 뒤 8자리가 유효하지 않습니다');
		} else {
			//전화번호 뒤 8자리가 유효할때
			$("#phch2").css("color", "#008000");
			$('#phch2').text('전화번호 뒤 8자리를 사용할 수 있습니다');
		}
	});
});
</script>
</head>
<body>
<!--로그인 버튼 -->
	<c:import url="/resources/module/toploginandlogo.jsp"/>
<!-- 상단메뉴 -->
	<c:import url="/resources/module/topmenu.jsp"/>
<!-- 본문 -->

	<span class="topnamebar" ><h2>회원상세정보입력</h2></span>
	<div class="row">
		<div class="col-xs-3"></div>
		<div class="col-xs-6 form_page">
			<form id="form" action="/pineapple/userdetailinsert.user" name="userdetail" method="post" style="border:1px solid #ccc">
				<div class="container_insert">
				    <div id="emailSuccess" class="form-group has-success has-feedback">
						<label class="control-label" for="inputSuccess2">${level}아이디</label>
						<input type="text" class="form-control" id="userDetailId" name="userDetailId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
						<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
						<span id="inputSuccess2Status" class="sr-only">(success)</span>
					</div>
					<br>
				  	<div class="form-group">
					    <label for="phoneFront3">전화번호앞3자리</label>
					    <p id="explain">(전화번호 앞3자리는 3자리의 숫자로 입력해야합니다)</p>
					    <p><input type="text" id="phoneFront3" name="phoneFront3" maxlength="3" class="form-control" placeholder="전화번호 앞 3자리 입력"></p>
					    <span id="phch1"></span>
				  	</div>
				  	<div class="form-group">
					    <p id="explain">(전화번호 뒤8자리는 -없이 8자리의 숫자로 입력해야합니다)</p>
					    <p><input type="text" id="phoneRest8" name="phoneRest8" maxlength="8" class="form-control" placeholder="전화번호 뒤 8자리 입력"></p>
					    <span id="phch2"></span>
				  	</div>
					<br>
					<div>
				    	<label for="postalCodeInput">우편번호</label>
					    <p id="explain">(주소를 정확히 입력해 주시기 바랍니다)</p>
					    <input type="text" id="postalCode" name="postalCode" placeholder="우편번호">
						<input type="button" id="findPostalCode" onclick="sample4_execDaumPostcode()" value="우편번호찾기"><br>
						<input type="text" id="address" name="address" placeholder="도로명주소">
						<input type="text" id="address" name="address" placeholder="나머지주소">
						<span id="guide" style="color:#999"></span>
					</div>
					<br>
					<div class="clearfix">
					    <input id="cancelBtn" type="reset" class="button_insert cancelbtn" value="취소">
					    <input id="submitBtn" type="button" class="button_insert signupbtn" value="입력">
				   	</div>
				</div>
			</form>
		</div>
		<div class="col-xs-3"></div>
	</div>
 
<!-- 풋터 -->
	<c:import url="/resources/module/footer.jsp"/>
</body>
</html>