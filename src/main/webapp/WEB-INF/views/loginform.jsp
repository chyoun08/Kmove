<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">

<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/styles.css"/>">
<link href="<c:url value="/resources/css/bootstrap-toggle.min.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/bootstrap-toggle.min.js"/>"></script>

</head>

<body>
	<script>
		$(document).ready(function() {

			$("#password").keydown(function() {
				if (event.keyCode === 13) {
					$("#login_info").click();
				}
				;
			});

			$("#login_info").click(function(e) {
				sendReqeust();
			});
		});

		function sendReqeust() {
			$ .ajax({
				url : "/user/login",
				type : "POST",
				dataType : 'json',
				data : {
					email : $("#email").val(),
					password : $("#password").val()
				},beforeSend : function(xhr) {
					//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
					xhr.setRequestHeader("AJAX", true);
				},success : function(data, status, xhr) { // alertify or another welcome page 이동
					console.log(data);
					if (data>0) {
						alertify.alert('chasebook','환영합니다. SNS 페이지로 이동합니다',
									function() {
										window.location.href = "/board/list?offset=0&limit=3&admin=PUBLIC&searchWord=&userSeq="+data;
								})
					} else {
						alertify.alert('chasebook',
								'Email 혹은 비밀번호를 틀렸습니다!!', function() {
									window.location.href = "/login";
								})
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(data);
					alertify.notify('Opps!! 로그인에 문제가 생겼습니다.', 'error',
							3, function() {
								console.log(jqXHR.responseText);
							});
				}
			});
		}
	</script>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Sign In</h3>
					<div class="d-flex justify-content-end social_icon">
						<span><i class="fab fa-facebook-square"></i></span> <span><i
							class="fab fa-google-plus-square"></i></span> <span><i
							class="fab fa-twitter-square"></i></span>
					</div>
				</div>
				<div class="card-body">
					<!-- <form action="/login" method="post"> -->
					<form id="login_form" method="post">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" name="email" id="email" placeholder="username">
							<div class="invalid-feedback">8-16 자리 영문을 입력하세요.</div>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" name="password" id="password" placeholder="password">
							<div class="invalid-feedback">
								10 이상의 영문,숫자,특수문자를 포함하도록 입력하세요.
							</div>
						</div>
						<div class="input-group form-group">
							<input type="checkbox" data-toggle="toggle" data-on="Remember"
								data-off="Forget" data-onstyle="success" data-offstyle="danger">
							<div class="remember">
								<span>Remember Me</span>
							</div>
						</div>
					</form>
					<div class="form-group">
						<input type="submit" value="Login"
							class="btn float-right login_btn" id="login_info">
					</div>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						<!-- Don't have an account?<a href="/sign">Sign Up</a> -->
						Don't have an account?<a href="/user/signform">Sign Up</a>
					</div>
					<div class="d-flex justify-content-center">
						<a href="#">Forgot your password?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>