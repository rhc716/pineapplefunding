<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />

<!-- css rhc -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rhc.css" />

<!-- css lbr -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lbr.css" />

<script>

// 가입정보 유효성검사

$(document).ready(function(){
	 $('#submitBtn').click(function(){
		 if($('#levelCode').val())!=''){
			if($('#inputSuccess2').val()!=''){ // submit 유효성 검사후 수동으로 해줌. 
				if($('#pw2').val()!=''){
					if($('#name').val()!=''){
						if($('#nickname').val()!=''){
							if($('#userAgreeCheck')==''){
								alert('사이트 약관에 동의 해주세요');
							} else {
								$('#form').submit();
							}
						} else {
							alert('닉네임 중복체크를 해주세요');
						}
				    } else {
				        alert('이름을 입력해주세요');
				    }
				} else {
				    alert('비밀번호 중복체크를 해주세요');
				}
			} else {
				alert('아이디 중복체크를 해주세요');
			}
	 	} else {
	 		alert('권한을 선택해주세요')
	 	}
	 });
 });
 
 //취소버튼 누르면 메인으로
 $(document).ready(function(){
	 $('#btn_cancel').click(function(){
		location.href = '/';
	 });
});

 //권한선택 유효성 검사
/* 
 $(document).ready(function() {
	 $('#levelCode').mouseover(function(){
		 var temp = 0;
		 var in_level = $('#levelCode').val();
		 var check = /^(IS NOT NULL);
		 if(!check.test(in_level)){
				//유효하지 않을때
				 temp = 1;
				 $('#levelHelp').text('권한을 선택해주시기 바랍니다');
		 } else {
			 //유효할때
			 temp = 0;
			 $('#levelHelp').hide();
		 }
	 });
		 
 });
*/ 
 //이메일아이디 (영문,숫자만) 검사와 중복확인
 $(document).ready(function() { 
	$('#userId').blur(function() {
        var temp = 0;
		var in_id = $('#userId').val();
		var check = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(!check.test(in_id)) {
			//유효하지 않을때
			temp = 1;
		} else {
			//유효할때
			temp = 0;
		}
		    	
// 아이디 검사 통과시 중복확인용 ajax실행
        if(temp==0){
        	$.ajax({ // ajax실행부분
                type: "post",
                url : "checkId.user",
                data : {userId : in_id},
                success : function(ic){ 
                			$('#idch').css("color", "#FF0000");
                			$('#idch').text('이미 존재하는 이메일입니다.');
                			$('#userId').val('');
                			$('#userId').focus();
                	},
                //만약 해당 페이지에 값을 성공적으로 보냈다면 페이지를 ic 라는 매개변수로 받아 id = 'idch' 구역에 ic를 출력하겠다. 
                error : function error(){
                		$('#emailCheck').hide();
                		$('#emailSuccess').show();
                		document.getElementById("inputSuccess2").readOnly = true;
                		$("#inputSuccess2").val(in_id);
                		
                	}
        	});
        } else {
        	$('#idch').css("color", "#FF0000");
			$('#idch').text('유효한 이메일을 입력해주시기 바랍니다.');
        	$('#userId').val('');
			$('#userId').focus();
        }
	});
   });

 
//비밀번호 유효성 검사 통과시 일치 확인
//영문 숫자 특문 6~20자
$(document).ready(function(){
	$('#pw').blur(function(){
		var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{6,20}$/i;
		var in_pw = $('#pw').val();
		if(!check.test(in_pw)){
			//비번이 유효하지 않을때
			$("#pwch").css("color", "#FF0000");
			$('#pwch').text('비밀번호가 유효하지 않습니다');
		} else {
			//비번이 유효할때
			$("#pwch").css("color", "#008000");
			$('#pwch').text('비밀번호를 사용 가능합니다');
		}
		
   });
	
	$('#pw2').blur(function(){
		var check = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{6,20}$/i;
		var in_pw = $('#pw').val();
		var temp = 0;
		if(!check.test(in_pw)){
			temp = 0; //비번이 유효하지 않을때
		} else {
			temp = 1; //비번이 유효할때
		}
		
		if(temp == 1){
			$.ajax({ // ajax실행부분
	            type : "post",
	            url : "checkPw.user",
	            data : {pw1 : $('#pw').val(), pw2 : $('#pw2').val()},
	            success : function(pc){
	            	if(pc.pw1 == pc.pw2){
	            		$('#pwch2').css('color', '#008000');
	            		$('#pwch2').text('비밀번호가 일치합니다');
	            	}else{
	            		$('#pwch2').css('color', '#FF0000');
	            		$('#pwch2').text('비밀번호가 불일치합니다');
	            		$('#pwch2').val('');
	        			$('#pwch2').focus();
	            	}
	            	
	            },
	            error : function error(){ alert('시스템 문제발생');}
	        });
		}else{
			alert("비밀번호는 6~20자의 영,숫자,특수문자가 모두 포함되어야 합니다");
		}
		
   });
});

//닉네임(2~20자,한,영,숫자,특문) 검사와 중복 확인
 $(document).ready(function(){
	$('#nickname').blur(function(){
		var in_nick = $('#nickname').val();
		//var re = /^[0-9a-zA-Z가-힣]{2,20}$/;
		
// 닉네임 검사 통과시 중복확인용 ajax실행
       
       	$.ajax({ // ajax실행부분
               type: "post",
               url : "checkNick.user",
               data : {nickname : in_nick},
               success : function(nc){ 
               	$('#nickch').css("color", "#FF0000");
       			$('#nickch').text('이미 존재하는 닉네임입니다');
       			$('#nickname').val('');
       			$('#nickname').focus();
               	},
               error : function error(){ 
               	$('#nickch').css("color", "#008000");
       			$('#nickch').text('닉네임을 사용할 수 있습니다');
              	}
           });
        }else{
        	alert("닉네임은 6~20자의 영,숫자,한글을 사용 가능합니다");
        }
        
    });
});
</script>
</head>
<body class="container">
	<span class="topnamebar" ><h2>회원가입</h2></span>
	<div class="row">
		<div class="col-xs-3"></div>
		<div class="col-xs-6 form_page">
			<form id="form" action="userinsert.user" name="userinput" method="post" style="border:1px solid #ccc">
				<div class="container_insert">
				    <label for="levelCodeChoice">권한</label>
				    <p id="explain">(권한을 선택해주시기 바랍니다)</p>
				    &nbsp&nbsp기업회원&nbsp&nbsp<input id="levelCode" type="radio" class="checkbox-inline" name="levelCode" value=2>
				    &nbsp&nbsp투자자&nbsp&nbsp<input id="levelCode" type="radio" class="checkbox-inline" name="levelCode" value=3>
				    <span id="levelHelp" class="sr-only"></span>
				    <br><br>
				    <div id="emailSuccess" class="form-group has-success has-feedback" hidden="hidden">
						<label class="control-label" for="inputSuccess2">이메일 사용 가능</label>
						<input type="text" class="form-control" id="inputSuccess2" name="inputSuccess2" varia-describedby="inputSuccess2Status">
						<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
						<span id="inputSuccess2Status" class="sr-only">(success)</span>
					</div>
					<div id="emailCheck" class="form-group">
					    <label class="control-label" for="exampleInputEmail1">이메일 아이디</label>
					    <p id="explain"> (정확한 이메일 아이디를 입력해주시기 바랍니다)</p>
					    <input id="userId" type="text" class="form-control" type="text" name="userId" placeholder="Enter email id">
				  		<span id="idch"><input type="hidden" value="0" id="userIdValue0" name="userIdValue0"/></span>
					<br>
				  	</div>
				  	<div class="form-group">
					    <label for="exampleInputPassword1">비밀번호</label>
					    <p id="explain">(비밀번호는 6~20자의 영,숫자,특수문자가 모두 포함되어야 합니다)</p>
					    <input id="pw" type="password" name="pw" class="form-control" placeholder="Enter Password">
					    <span id="pwch"></span>
					    <br><br>
					    <label><b>비밀번호확인</b></label>
					    <input id="pw2" type="password" name="pw2" class="form-control" placeholder="Repeat Password" >
					    <span id="pwch2"> <input type="hidden" value="0" id="use_pw2" name="use_pw2"/></span>
				    <br>
				  	</div>
				  	<div>
				  		<label for="name">이름</label>
					    <input id="name" type="text" name="name" class="form-control" placeholder="Enter name" maxlength="40">
					</div>
					<br>
					<div>
				    	<label for="nickname">닉네임</label>
					    <p id="explain"> (닉네임은 6~20자의 영,숫자,한글을 사용 가능합니다)</p>
					    <input id="nickname" type="text" name="nickname" class="form-control" placeholder="Enter nickname" maxlength="20">
					    <span id="nickch"> <input type="hidden" value="0" id="use_nick" name="use_nick"/></span>
					</div>
					<br>
					<div id="userAgree" class="checkbox">
					    <label for="userAgree">
					    	<input id="userAgreeCheck" name="userAgreeCheck" type="checkbox">사이트 약관 동의
					    </label>
					</div>
					<br>
					<div class="clearfix">
					    <input id="btn_cancel" type="button" class="button_insert cancelbtn" value="취소">
					    <input id="submitBtn" type="button" class="button_insert signupbtn" value="가입">
				   	</div>
				</div>
			</form>
		</div>
		<div class="col-xs-3"></div>
	</div>
</body>
</html>