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
	 $('#btn').click(function(){
		if($('#userId').val()==2){ // submit 유효성 검사후 수동으로 해줌. 
			if($('#pw').val()==1){
				if($('#nickname').val()==1){
					if($('#name').val().length < 1){
						alert('이름을 입력해주세요');
					} else {
						$('#form').submit();
					}
			    } else {
			        alert('닉네임 중복체크를 해주세요');
			    }
			} else {
			    alert('비밀번호 중복체크를 해주세요');
			}
		} else {
			alert('아이디 중복체크를 해주세요');
		}
	 });
 });
 
 //취소버튼 누르면 메인으로
 $(document).ready(function(){
	 $('#btn_cancel').click(function(){
		location.href = '/';
	 });
});

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
                			$('#idch').css("color", "#FF0000")
                			$('#idch').text('이미 존재하는 이메일입니다.');
                			$('#userId').val('');
                			$('#userId').focus();
                	},
                //만약 해당 페이지에 값을 성공적으로 보냈다면 페이지를 ic 라는 매개변수로 받아 id = 'idch' 구역에 ic를 출력하겠다. 
                error : function error(){ 
                		$('#idch').html(in_id +"는 사용 가능한 이메일입니다.");
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
		/*
		if(temp == 1){
			$.ajax({ // ajax실행부분
	            type : "post",
	            url : "./checkpw.jsp",
	            data : {pw1 : $('#pw').val(), pw2 : $('#pw2').val()},
	            success : function(pc){ $('#pwch2').html(pc); },
	            error : function error(){ alert('시스템 문제발생');}
	        });
		}else{
			alert("비밀번호는 6~20자의 영,숫자,특수문자가 모두 포함되어야 합니다");
		}
		*/
   });
});

//닉네임(2~20자,한,영,숫자,특문) 검사와 중복 확인
 $(document).ready(function(){
	$('#nick').blur(function(){
		var temp = 0;
		var in_nick = $('#nick').val();
		var re = /^[0-9a-zA-Z가-힣]{2,20}$/;
	    
       	if(!re.test(in_nick)) {
    		temp = 1;
        }
// 닉네임 검사 통과시 중복확인용 ajax실행
		/*
        if(temp==0){
        	$.ajax({ // ajax실행부분
                type: "post",
                url : "./checknick.jsp",
                data : {nick : $('#nick').val()},
                success : function(nc){ $('#nickch').html(nc);},
                error : function error(){ alert('시스템 문제발생');}
            });
        }else{
        	alert("닉네임은 6~20자의 영,숫자,한글을 사용 가능합니다");
        }
        */
    });
});
</script>
</head>
<body class="container">
	<span class="topnamebar" ><h2>회원가입</h2></span>
	<div class="row">
		<div class="col-xs-3"></div>
		<div class="col-xs-6 form_page">
			<form id="form" action="/addUserForm.user" name="userinput" method="post" style="border:1px solid #ccc">
				<div class="container_insert">
			    <label for="levelCode">권한</label>
			    <br>
			    &nbsp&nbsp관리자&nbsp&nbsp<input id="levelCode" type="radio" class="input_insert" name="levelCode" value=1>
			    &nbsp&nbsp기업회원&nbsp&nbsp<input id="levelCode" type="radio" class="input_insert" name="levelCode" value=2>
			    &nbsp&nbsp투자자&nbsp&nbsp<input id="levelCode" type="radio" class="input_insert" name="levelCode" value=3>
			    <br><br>
			    <label for="userId">이메일 아이디</label>
			    <p id="explain"> (정확한 이메일 아이디를 입력해주시기 바랍니다.)</p>
			    <input id="userId" type="text" class="input_insert" type="text" name="userId" placeholder="Enter email id" maxlength="20">
				<span id="idch"> <input type="hidden" value="0" id="userId" name="userId"/></span>
				<br><br>
			    <label for="pw">비밀번호</label>
			    <p id="explain"> (비밀번호는 6~20자의 영,숫자,특수문자가 모두 포함되어야 합니다)</p>
			    <input id="pw" type="password" name="pw" class="input_insert" placeholder="Enter Password">
			    <span id="pwch"> </span>
			    <br><br>
			    <label><b>비밀번호확인</b></label>
			    <input id="pw2" type="password" name="pw2" class="input_insert" placeholder="Repeat Password" >
			    <span id="pwch2"> <input type="hidden" value="0" id="use_pw2" name="use_pw2"/></span>
			    <br><br>
			    <label for="name">이름</label>
			    <input id="name" type="text" name="name" class="input_insert" placeholder="Enter name" maxlength="40">
			    <br><br>
			    <label for="nickname">닉네임</label>
			    <p id="explain"> (닉네임은 6~20자의 영,숫자,한글을 사용 가능합니다)</p>
			    <input id="nickname" type="text" name="nickname" class="input_insert" placeholder="Enter nickname" maxlength="20">
			    <span id="nickch"> <input type="hidden" value="0" id="use_nick" name="use_nick"/></span>
			    <div class="clearfix">
			       <input id="btn_cancel" type="button" class="button_insert cancelbtn" value="취소">
			       <input id="submitBtn" type="submit" class="button_insert signupbtn" value="가입">
			    </div>
			  </div>
			</form>
		</div>
		<div class="col-xs-3"></div>
	</div>
</body>
</html>