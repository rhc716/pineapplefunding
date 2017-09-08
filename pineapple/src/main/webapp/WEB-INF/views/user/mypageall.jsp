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
	$(document).ready(function(){
		//회원탈퇴요청시, 다시한번 의사 확인 후 요청 처리
		$('#useroutrequestBtn').click(function(){
			confirm('탈퇴요청을 하시겠습니까?');
		});
		$('#useroutCancleBtn').click(function(){
			confirm('탈퇴요청을 취소 하시겠습니까?');
		});
		//탈퇴시 비밀번호 확인 ajax 요청
		$('#submitpwcheckBtn').click(function(){
			if($('#inputpw').val() != ''){
				var inputuserpw = $('#inputpw').val();
				var changeUserDetailAjax = $.ajax({ // ajax실행부분
									        type: "get",
									        url : "/pineapple/useroutpwcheck.user",
									        data : {useroutpw : inputuserpw},
									        success : function success(op){
								        		if(op == 1){
								        			$('#useroutPwCheck').hide();
								        			$('#useroutRequest').show();
								        		} else {
								        			$('#useroutch').css('color', '#FF0000');
								        			$('#useroutch').text('비밀번호가 일치하지 않습니다. 다시 한번 입력해주시기 바랍니다.')
								        		}
									        },
									        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
									        error : function error(){
									        		alert('비밀번호 확인 오류');
									        }
										});
			};
		});
		
		//회원상세정보 보기 모달에서 회원상세정보 수정하기를 클릭할 경우, 상세정보를 수정하는 모달을 보여줘서 수정 처리(모달 교체 코드)
		$('#userdetailmodifyBtn').click(function(){
			$('#userdetailcheckModal').modal("hide");
			$('#userdetailmodifyModal').modal("show");
			//수정하기 모달 화면 교체되면서 수정전 회원상세정보 조회 후 뿌려주기
			var in_userId = $('#userDetailIdChange').val();
			var changeUserDetailAjax = $.ajax({ // ajax실행부분
								        type: "get",
								        url : "/pineapple/.user",
								        data : {userId : in_userId},
								        //만약 데이터를 ajax를 통해 불러오지 못할 경우 오류 메세지 출력
								        error : function error(){
								        		alert('회원상세정보 불러오기 오류');
								        }
									});
			//ajax를 통해 조회한 계좌 정보를 모달창 수정페이지 각 입력값으로 넣어준다
			changeUserDetailAjax.done(function(ic){
				console.log(ic);
				$('#phoneFront3Change').val(ic.phoneFront3);
				$('#phoneRest8Change').val(ic.phoneRest8);
	    		$('#postalCodeChange').val(ic.postalCode);
	    		$('#addressChange').val(ic.address);
	    		$('#address2Change').val(ic.address2);
			});
		});
	
		//회원상세정보 수정하기 모달 화면에서 수정하기 버튼을 클릭할 경우 발생할 이벤트 설정(회원상세정보 수정 form 유효성 검사 후 수동 submit)
		$('#userDetailChangeSubmitBtn').click(function(){	// submit 버튼을 누르면 유효성 검사후 수동으로 submit 해준다
			if($('#phoneFront3Change').val() != ''){  
				if($('#phoneRest8Change').val() != ''){
					if($('#postalCodeChange').val() != ''){
						if($('#addressChange').val != ''){
							if($('#address2Change').val() == ''){
								alert('나머지 주소를 입력 해주세요');
							} else {
								$('#userDetailChangeform').submit();
				    		}
						} else {
							alert('주소를 입력해주세요')
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
		$('#phoneFront3Change').blur(function(){
			var check = /^(?=.*[0-9]).{3}$/i;
			var in_name = $('#phoneFront3Change').val();
			if(!check.test(in_name)){
				//전화번호 앞 3자리가 유효하지 않을때
				$("#phch1Change").css("color", "#FF0000");
				$('#phch1Change').text('전화번호 앞 3자리가 유효하지 않습니다');
			} else {
				//전화번호 앞 3자리가 유효할때
				$("#phch1Change").css("color", "#008000");
				$('#phch1Change').text('전화번호 앞 3자리를 사용할 수 있습니다');
			}
		});
		//전화번호 뒤 8자리 숫자 유효성 검사(숫자만 8자리 입력) 
		$('#phoneRest8Change').blur(function(){
			var check = /^(?=.*[0-9]).{8}$/i;
			var in_name = $('#phoneRest8Change').val();
			if(!check.test(in_name)){
				//전화번호 뒤 8자리가 유효하지 않을때
				$('#phch2Change').css("color", "#FF0000");
				$('#phch2Change').text('전화번호 뒤 8자리가 유효하지 않습니다');
			} else {
				//전화번호 뒤 8자리가 유효할때
				$('#phch2Change').css("color", "#008000");
				$('#phch2Change').text('전화번호 뒤 8자리를 사용할 수 있습니다');
			}
		});
	});
		//취소버튼 누르면 마이페이지 메인으로
		 $(document).ready(function(){
			 $('#cancelBtn').click(function(){
				location.href = '/pineapple/mypage.user';
			 });
		});
	//새로운 비밀번호 유효성 검사 통과시 일치 확인
	//영문 숫자 특문 6~20자
	$(document).ready(function(){
		$('#newpw1').blur(function(){
			var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{6,20}$/i;
			var in_pw = $('#newpw1').val();
			if(!check.test(in_pw)){
				//비번이 유효하지 않을때
				$("#newpwch1").css("color", "#FF0000");
				$('#newpwch1').text('새로운 비밀번호가 유효하지 않습니다');
			} else {
				//비번이 유효할때
				$("#newpwch1").css("color", "#008000");
				$('#newpwch1').text('새로운 비밀번호를 사용 가능합니다');
			}
	    });
		
		$('#newpw2').blur(function(){
			var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{6,20}$/i;
			var in_pw = $('#newpw2').val();
			var temp = 0;
			if(!check.test(in_pw)){
				temp = 0; //비번이 유효하지 않을때
			} else {
				temp = 1; //비번이 유효할때
			}
			//새로운 비밀번호 유효성 통과 후 비밀번호 재확인 기능
			if(temp == 1){
				var newpwajax = $.ajax({ // ajax실행부분
						            type : "post",
						            url : "/pineapple/checkNewPw.user",
						            data : {newpw1 : $('#newpw1').val(), newpw2 : $('#newpw2').val()},
						            success : function(pc){
						            	if(pc.newpw1 == pc.newpw2){
						            		$('#newpwch2').css('color', '#008000');
						            		$('#newpwch2').text('비밀번호가 일치합니다');
						            	}else{
						            		$('#newpwch2').css('color', '#FF0000');
						            		$('#newpwch2').text('비밀번호가 불일치합니다');
						            		$('#newpw2').val('');
						        			$('#newpw2').focus();
						            	}
						            	
						            },
						            error : function error(){ alert('시스템 문제발생');}
						        });
							} else {
								$('#newpwch2').css('color', '#FF0000');
			            		$('#newpwch2').text('비밀번호는 6~20자의 영,숫자,특수문자가 모두 포함되어야 합니다');
			            		$('#newpw2').val('');
			            		$('#newpw2').focus();
							}
			//새로운 비밀번호 유효성 검사 후 회원정보 update
			newpwajax.done(function(){
				$('#submitnewpwBtn').click(function(){
					$('#newpwform').submit();
					alert('비밀번호 변경 완료. 다음 로그인부터 새로운 비밀번호로 로그인 해주세요.');
				});
			});
		});
	});
</script>
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
                document.getElementById('postalCodeChange').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addressChange').value = fullRoadAddr;
                document.getElementById('address2Change').value = '';

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
<!-- 마이페이지 내정보 공통모듈-->
	<div class="row">
		<div class="col-md-2">
			<br>
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
				<a type="submit" class="btn btn-info btn-block" data-toggle="modal" href="#userdetailcheckModal">회원상세정보보기</a>
				<p id="explain">(회원상세정보를 확인하려면 클릭해주시기 바랍니다)</p>
			</div>
			<!-- 회원상세정보 보기 모달 화면 구현 -->
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
						    <p><input type="text" id="postalCode" name="postalCode" value="${userdetail.postalCode}" readonly="readonly"></p>
							<input type="text" id="address" name="address" value="${userdetail.address}" readonly="readonly">&nbsp
							<input type="text" id="address2" name="address2" value="${userdetail.address2}" readonly="readonly">
							<span id="guide" style="color:#999"></span>
						</div>
						<br>
				      </div>
			      </div>
		       	  <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        <button id="userdetailmodifyBtn" type="button" class="btn btn-primary">수정하기</button>
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
      					<form id="userDetailChangeform" action="/pineapple/userdetailmodify.user" name="userdetail" method="post" style="border:1px solid #ccc">
							<div class="container_insert">
							    <div id="emailSuccess" class="form-group has-success has-feedback">
									<label class="control-label" for="inputSuccess2">${nickname}님의 아이디</label>
									<input type="text" class="form-control" id="userDetailIdChange" name="userDetailId" value="${id}" varia-describedby="inputSuccess2Status" readonly="readonly">
									<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
									<span id="inputSuccess2Status" class="sr-only">(success)</span>
								</div>
								<br>
							  	<div class="form-group">
								    <label for="phoneFront3">전화번호앞3자리</label>
								    <p id="explain">(전화번호 앞3자리는 3자리의 숫자로 입력해야합니다)</p>
								    <p><input type="text" id="phoneFront3Change" name="phoneFront3" maxlength="3" class="form-control"></p>
								    <span id="phch1Change"></span>
							  	</div>
							  	<div class="form-group">
								    <p id="explain">(전화번호 뒤8자리는 -없이 8자리의 숫자로 입력해야합니다)</p>
								    <p><input type="text" id="phoneRest8Change" name="phoneRest8" maxlength="8" class="form-control"></p>
								    <span id="phch2Change"></span>
							  	</div>
								<br>
								<div>
							    	<label for="postalCodeInput">우편번호</label>
								    <p id="explain">(주소를 정확히 입력해 주시기 바랍니다)</p>
								    <input type="text" id="postalCodeChange" name="postalCode">
									<input type="button" id="findPostalCode" onclick="sample4_execDaumPostcode()" value="우편번호찾기"><br>
									<input type="text" id="addressChange" name="address">
									<input type="text" id="address2Change" name="address2" placeholder="나머지 주소">
									<span id="guide" style="color:#999"></span>
								</div>
								<br>
						      </div>
						      <div class="modal-footer">
						        <button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						        <button id="userDetailChangeSubmitBtn" type="button" class="btn btn-primary">수정하기</button>
						      </div>
				      	</form>
				    </div>
				  </div>
				</div>
			</div>
			<!-- 회원상세정보입력버튼(상세정보 최초 입력시 필요) -->
			<div>
			<form action="/pineapple/userdetailinsert.user">
				<button type="submit" class="btn btn-info btn-block">상세정보입력</button>
				<p id="explain">(회원상세정보를 입력해주시기 바랍니다. 최초입력 후에는 수정하기만 가능합니다)</p>
			</form>
			</div>
		</div>	
	</div>
	<!-- 마이페이지에서 비밀번호 수정 기능 구현 -->
	<br>
	<div>
		<div class="row">
			<div class="col-md-2">
				<p>비밀번호수정</p>
			</div>
			<div class="col-md-10">
				<br>
				<p id="explain">새로운 비밀번호를 입력해주세요. 비밀번호는 6~20자의 영,숫자,특수문자가 모두 포함되어야 합니다</p>
				<form id="newpwform" action="/pineapple/changepw.user" method="post">
					<input type="password" id="newpw1" name="newpw1" class="form-control" placeholder="새로운 비밀번호">
					<span id="newpwch1"></span><br>
					<input type="password" id="newpw2" name="newpw2" class="form-control" placeholder="새로운 비밀번호 재입력">
					<span id="newpwch2"></span><br>
					<input id="submitnewpwBtn" type="button" class="button_insert signupbtn btn-block" value="변경">
				</form>
			</div>
		</div>
	</div>
	<!-- 회원탈퇴요청 -->
	<br>
	<div>
		<div class="row">
			<div class="col-md-2">
				<p>회원탈퇴요청</p>
			</div>
			<div class="col-md-10">
				<br>
				<c:choose>
					<c:when test="${empty userLogin.uDelTime}">
						<div id="useroutPwCheck">
							<p id="explain">비밀번호 확인 후 회원탈퇴요청을 할 수 있습니다.</p>
							<input type="password" id="inputpw" name="inputpw" class="form-control" placeholder="Enter Password Correctly">
							<span id="useroutch"></span><br>
							<input id="submitpwcheckBtn" type="button" class="button_insert signupbtn btn-block" value="비밀번호 확인">
						</div>
						<div id="useroutRequest" hidden>
							<p id="explain">비밀번호 확인이 완료되었습니다. 회원탈퇴요청을 하시려면 아래 회원탈퇴버튼을 클릭해 주시기 바랍니다.</p>
							<form action="/pineapple/useroutrequest.user" method="get">
								<button id="useroutrequestBtn" type="submit" class="btn btn-danger btn-block">회원탈퇴</button>
							</form>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<a class="btn btn-block btn-warning disabled">탈퇴요청완료</a><br>
							<p id="explain">회원탈퇴요청 취소는 탈퇴요청 후 6개월 동안만 가능합니다.</p>
							<form action="/pineapple/useroutCancel.user" method="get">
								<button id="useroutCancleBtn" type="submit" class="btn btn-warning btn-block">회원탈퇴취소</button>
							</form>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>		
</body>
</html>