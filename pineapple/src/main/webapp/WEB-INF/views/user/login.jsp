<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

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
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js" ></script>
<meta name="google-signin-client_id" content="1043815859348-qtd7un8g91iuhr8kroat71uph0k48b15.apps.googleusercontent.com"></meta>
</head>
<body class="container">
<br><br><br>
	<!-- 다른 사이트 로그인 -->
	<div class="row">
		<div class="col-xs-3"></div>
		<div class="col-xs-6">
		<!-- 구글+ 로그인 -->
		 <div id="gConnect">
		    <a id="signin-button" class="btn btn-block"></a>
		  </div>
		  <div id="authOps" style="display:none">
		    <h2>User is now signed in to the app using Google+</h2>
		    <button id="signOut" onclick="auth2.signOut()">Sign Out</button>
		    <p>If the user chooses to disconnect, the app must delete all stored
		    information retrieved from Google for the given user.</p>
		    <button id="disconnect" >Disconnect your Google account from this app</button>
		
		    <h2>User's profile information</h2>
		    <div id="profile"></div>
		
		    <h2>User's friends that are visible to this app</h2>
		    <div id="visiblePeople"></div>
		
		    <h2>Authentication Logs</h2>
		    <pre id="authResult"></pre>
		  </div>
		  <div id="loaderror">
		    This section will be hidden by jQuery. If you can see this message, you
		    may be viewing the file rather than running a web server.<br />
		    The sample must be run from http or https. See instructions at
		    <a href="https://developers.google.com/+/quickstart/javascript">
		    https://developers.google.com/+/quickstart/javascript</a>.
		  </div>
		<script type="text/javascript">
		var auth2 = {};
		var helper = (function() {
		  return {
		    /**
		     * Hides the sign in button and starts the post-authorization operations.
		     *
		     * @param {Object} authResult An Object which contains the access token and
		     *   other authentication information.
		     */
		    onSignInCallback: function(authResult) {
		      $('#authResult').html('Auth Result:<br/>');
		      for (var field in authResult) {
		        $('#authResult').append(' ' + field + ': ' +
		            authResult[field] + '<br/>');
		      }
		      if (authResult.isSignedIn.get()) {
		        $('#authOps').show('slow');
		        $('#gConnect').hide();
		        helper.profile();
		        helper.people();
		      } else {
		          if (authResult['error'] || authResult.currentUser.get().getAuthResponse() == null) {
		            // There was an error, which means the user is not signed in.
		            // As an example, you can handle by writing to the console:
		            console.log('There was an error: ' + authResult['error']);
		          }
		          $('#authResult').append('Logged out');
		          $('#authOps').hide('slow');
		          $('#gConnect').show();
		      }
		      console.log('authResult', authResult);
		    },
		    /**
		     * Calls the OAuth2 endpoint to disconnect the app for the user.
		     */
		    disconnect: function() {
		      // Revoke the access token.
		      auth2.disconnect();
		    },
		    /**
		     * Gets and renders the list of people visible to this app.
		     */
		    people: function() {
		      gapi.client.plus.people.list({
		        'userId': 'me',
		        'collection': 'visible'
		      }).then(function(res) {
		        var people = res.result;
		        $('#visiblePeople').empty();
		        $('#visiblePeople').append('Number of people visible to this app: ' +
		            people.totalItems + '<br/>');
		        for (var personIndex in people.items) {
		          person = people.items[personIndex];
		          $('#visiblePeople').append('<img src="' + person.image.url + '">');
		        }
		      });
		    },
		    /**
		     * Gets and renders the currently signed in user's profile data.
		     */
		    profile: function(){
		      gapi.client.plus.people.get({
		        'userId': 'me'
		      }).then(function(res) {
		        var profile = res.result;
		        console.log(profile);
		        $('#profile').empty();
		        $('#profile').append(
		            $('<p><img src=\"' + profile.image.url + '\"></p>'));
		        $('#profile').append(
		            $('<p>Hello ' + profile.displayName + '!<br />Tagline: ' +
		            profile.tagline + '<br />About: ' + profile.aboutMe + '</p>'));
		        if (profile.emails) {
		          $('#profile').append('<br/>Emails: ');
		          for (var i=0; i < profile.emails.length; i++){
		            $('#profile').append(profile.emails[i].value).append(' ');
		          }
		          $('#profile').append('<br/>');
		        }
		        if (profile.cover && profile.coverPhoto) {
		          $('#profile').append(
		              $('<p><img src=\"' + profile.cover.coverPhoto.url + '\"></p>'));
		        }
		      }, function(err) {
		        var error = err.result;
		        $('#profile').empty();
		        $('#profile').append(error.message);
		      });
		    }
		  };
		})();
		/**
		 * jQuery initialization
		 */
		$(document).ready(function() {
		  $('#disconnect').click(helper.disconnect);
		  $('#loaderror').hide();
		  if ($('meta')[0].content == 'YOUR_CLIENT_ID') {
		    alert('This sample requires your OAuth credentials (client ID) ' +
		        'from the Google APIs console:\n' +
		        '    https://code.google.com/apis/console/#:access\n\n' +
		        'Find and replace YOUR_CLIENT_ID with your client ID.'
		    );
		  }
		});
		/**
		 * Handler for when the sign-in state changes.
		 *
		 * @param {boolean} isSignedIn The new signed in state.
		 */
		var updateSignIn = function() {
		  console.log('update sign in state');
		  if (auth2.isSignedIn.get()) {
		    console.log('signed in');
		    helper.onSignInCallback(gapi.auth2.getAuthInstance());
		  }else{
		    console.log('signed out');
		    helper.onSignInCallback(gapi.auth2.getAuthInstance());
		  }
		}
		/**
		 * This method sets up the sign-in listener after the client library loads.
		 */
		function startApp() {
		  gapi.load('auth2', function() {
		    gapi.client.load('plus','v1').then(function() {
		      gapi.signin2.render('signin-button', {
		          scope: 'https://www.googleapis.com/auth/plus.login',
		          fetch_basic_profile: false });
		      gapi.auth2.init({fetch_basic_profile: false,
		          scope:'https://www.googleapis.com/auth/plus.login'}).then(
		            function (){
		              console.log('init');
		              auth2 = gapi.auth2.getAuthInstance();
		              auth2.isSignedIn.listen(updateSignIn);
		              auth2.then(updateSignIn);
		            });
		    });
		  });
		}
		</script>
		<script src="https://apis.google.com/js/client:platform.js?onload=startApp"></script>
		</div>
		<div class="col-xs-3"></div>
	</div>
	<br><br>
	<!-- 파인애플펀딩 로그인 -->
	<div class="row">
		<div class="col-xs-3"></div>
		<div class="col-xs-6">
			<p>로그인</p>
			<form id="loginForm" action="/pineapple/login.user" class="login_form" method="post">
				<br>
				<div class="form-group">
					<input type="text" class="form-control" name="id" value="id01@maver.com"><br>
					<input type="password" class="form-control" name="pw" value="asdf1234">
				</div>
				<br>
				<button id="loginBtn" type="submit" class="btn btn-primary btn-block" >로그인</button>
				<br>
				<div class="login_down">
					<a href="/pineapple/userinsert.user" class="btn btn-sm btn-default">회원가입</a>
					<a class="btn btn-sm btn-default">ID/PW찾기</a>
				</div>
				<br>
			</form>
			<br><br><br><br>
			<div>
				<form id="loginForm" action="/pineapple/login.user" method="post">
					<input type="hidden" name="id" value="admin">
					<input type="hidden" name="pw" value="asdf1234">
					<button type="submit" class="btn btn-block btn-success" style="float:left; padding:10px 10px;">관리자 로그인</button>
				</form>
			</div>
			<br><br><br>
			<div>
				<form id="loginForm" action="/pineapple/login.user"  method="post">
					<input type="hidden" name="id" value="id02@maver.com">
					<input type="hidden" name="pw" value="asdf1234">
					<button type="submit" class="btn btn-block btn-info" style="float:left; padding:10px 10px;">투자자 로그인</button>
				</form>
			</div>
			<br><br><br>
			<div>
				<form id="loginForm" action="/pineapple/login.user"  method="post">
					<input type="hidden" name="id" value="id01@maver.com">
					<input type="hidden" name="pw" value="asdf1234">
					<button type="submit" class="btn btn-block btn-warning" style="float:left; padding:10px 10px;">기업회원 로그인</button>
				</form>
			</div>
		</div>
		<div class="col-xs-3"></div>
	</div>
	<br>
</body>
</html>