<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mypage 공통모듈</title>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//가입정보 유효성검사
	$(document).ready(function(){
		//모달에서 회원상세정보 수정하기를 클릭할 경우, 상세정보를 수정하는 모달을 보여줘서 수정 처리(모달 교체 코드)
		$('#userdetailmodifyBtn').click(function(){
			$('#userdetailcheckModal').modal("hide");
			$('#userdetailmodifyModal').modal("show");
		});
		//모달 shown 이벤트 설정
		$('#userdetailmodifyModal').on("shown.bs.modal", function() {
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
		
		//취소버튼 누르면 마이페이지 메인으로
		 $(document).ready(function(){
			 $('#cancelBtn').click(function(){
				location.href = '/pineapple/mypage.user';
			 });
		});
	});	
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
</head>
<body>
<!-- 본문 -->
<!-- 마이페이지 내정보 공통모듈-->
	<div class="row">
		<div class="col-md-2">
			<p>내정보</p>
		</div>
		<div class="col-md-10">
			<br>
			<div>
				${rank} 아이디 : ${id}<br>
				${rank} 닉네임 : ${nickname}<br>
				${rank} 권한 : ${level} - ${rank}<br>
			</div>
			<!-- 상세정보 입력한 경우는 더이상 입력 불가(마이페이지메인으로 리다이렉트됨), 확인만 가능 -->
			<div>
				<button type="submit" class="btn btn-info btn-block" data-toggle="modal" data-target="#userdetailcheckModal">회원상세정보보기</button>
				<p id="explain">(회원상세정보를 확인하려면 클릭해주시기 바랍니다)</p>
			</div>
			<!-- userdetailcheckModal -->
			<div class="modal fade" id="userdetailcheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">${nickname}님 상세정보확인</h4>
			      </div>
			      <div id="userdetailmodalbody" class="modal-body">
				      <div class="container_insert">
					    <div id="emailSuccess" class="form-group has-success has-feedback">
							<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
							<input type="text" class="form-control" id="userDetailId" name="userDetailId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
							<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
							<span id="inputSuccess2Status" class="sr-only">(success)</span>
						</div>
						<br>
					  	<div class="form-group">
						    <label for="phoneFront3">전화번호앞3자리</label>
						    <p><input type="text" id="phoneFront3" name="phoneFront3" maxlength="3" class="form-control" value="${userdetail.phoneFront3}" readonly="readonly"></p>
					  	</div>
					  	<div class="form-group">
					  	 	<label for="phoneFront3">전화번호뒤8자리</label>
						    <p><input type="text" id="phoneRest8" name="phoneRest8" maxlength="8" class="form-control" value="${userdetail.phoneRest8}" readonly="readonly"></p>
					  	</div>
						<br>
						<div>
					    	<label for="postalCodeInput">주소</label>
						    <input type="text" id="postalCode" name="postalCode" value="${userdetail.phoneRest8}" readonly="readonly">
							<input type="text" id="address" name="address" value="${userdetail.address}" readonly="readonly">
							<span id="guide" style="color:#999"></span>
						</div>
						<br>
				      </div>
			      </div>
		       	  <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        <button id="userdetailmodifyBtn" type="button" class="btn btn-primary" href="/pineapple/userdetailmodify.user">수정하기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 회원정보 수정하기(모달화면 교체를 통한 수정) -->
			<div class="modal fade" id="userdetailmodifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">${nickname}님 상세정보수정</h4>
			        <p id="explain">(수정할 내용을 입력하고 수정 버튼을 누르세요)</p>
			      </div>
			      <div class="modal-body">
      					<form id="form" action="/pineapple/userdetailmodify.user" name="userdetail" method="post" style="border:1px solid #ccc">
							<div class="container_insert">
							    <div id="emailSuccess" class="form-group has-success has-feedback">
									<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
									<input type="text" class="form-control" id="userDetailId" name="userDetailId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
									<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="inputSuccess2Status" class="sr-only">(success)</span>
								</div>
								<br>
							  	<div class="form-group">
								    <label for="phoneFront3">전화번호앞3자리</label>
								    <p id="explain">(전화번호 앞3자리는 3자리의 숫자로 입력해야합니다)</p>
								    <p><input type="text" id="phoneFront3" name="phoneFront3" maxlength="3" class="form-control" value="${userdetail.phoneFront3}"></p>
								    <span id="phch1"></span>
							  	</div>
							  	<div class="form-group">
								    <p id="explain">(전화번호 뒤8자리는 -없이 8자리의 숫자로 입력해야합니다)</p>
								    <p><input type="text" id="phoneRest8" name="phoneRest8" maxlength="8" class="form-control" value="${userdetail.phoneRest8}"></p>
								    <span id="phch2"></span>
							  	</div>
								<br>
								<div>
							    	<label for="postalCodeInput">우편번호</label>
								    <p id="explain">(주소를 정확히 입력해 주시기 바랍니다)</p>
								    <input type="text" id="postalCode" name="postalCode" value="${userdetail.postalCode}">
									<input type="button" id="findPostalCode" onclick="sample4_execDaumPostcode()" value="우편번호찾기"><br>
									<input type="text" id="address" name="address" value="${userdetail.address}">
									<input type="text" id="address" name="address" placeholder="나머지 주소">
									<span id="guide" style="color:#999"></span>
								</div>
								<br>
						      </div>
						      <div class="modal-footer">
						        <button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						        <button id="submitBtn" type="button" class="btn btn-primary" href="/pineapple/userdetailmodify.user">수정하기</button>
						      </div>
				      	</form>
				    </div>
				  </div>
				</div>
			</div>
			<!-- 회원상세정보입력버튼 -->
			<div>
			<form action="/pineapple/userdetailinsert.user">
				<button type="submit" class="btn btn-info btn-block">상세정보입력</button>
				<p id="explain">(회원상세정보를 입력해주시기 바랍니다. 최초입력 후에는 수정하기만 가능합니다)</p>
			</form>
			</div>
		</div>	
	</div>		
</body>
</html>