<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Checkout example ・ Bootstrap</title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/checkout/">

<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css"/>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">


<style>
html, body {
	background-image: url('<c:url value="/resources/img/544750.jpg"/>');
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.user-form {
	background-color: rgba(255, 255, 255, 0.6) !important;
	border-radius: .5em;
}
</style>
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/form-validation.css"/>" rel="stylesheet">
<script>
		
	$(document).ready(function(){
		
		$("#btn_register").click(function() {
			if (validate()){ 
				sendReqeust(); 
			} else {
				console.log("fail!!/");
			}
		});
		
	});

	function validate() {

		var isUserNameValid = false;
		var isUserEmailValid = false;
		var isUserPasswordValid = false;
		var isUserPassword2Valid = false;

		var patternEng = new RegExp(/[a-zA-Z]/); // all english

		var patternEmail = new RegExp(
				/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

		var patternEngAtListOne = new RegExp(/[a-zA-Z]+/);// + for at least one
		var patternSpeAtListOne = new RegExp(/[~!@#$%^&*()_+|<>?:{}]+/);// + for at least one
		var patternNumAtListOne = new RegExp(/[0-9]+/);// + for at least one

		//userName
		var userNameValue = $("#userName").val();
		var userNameLength = userNameValue.length;

		if (userNameLength > 0) {
			isUserNameValid = true;
		}

		if (isUserNameValid) {
			$("#userName").removeClass("is-invalid");
		} else {
			$("#userName").addClass("is-invalid");
		}

		//userEmail
		var userEmailValue = $("#userEmail").val();
		var userEmailLength = userEmailValue.length;

		if (patternEmail.test(userEmailValue)) {
			isUserEmailValid = true;
		}

		if (isUserEmailValid) {
			$("#userEmail").removeClass("is-invalid");
		} else {
			$("#userEmail").addClass("is-invalid");
		}

		//password

		var userPasswordValue = $("#userPassword").val();
		var userPasswordLength = userPasswordValue.length;

		var userPassword2Value = $("#userPassword2").val();
		//var password2Length = password2Value.length; // no need

		if (patternEngAtListOne.test(userPasswordValue)
				&& patternSpeAtListOne.test(userPasswordValue)
				&& patternNumAtListOne.test(userPasswordValue)) {
			isUserPasswordValid = true;
		} else if (userPasswordLength >= 10) {
			isUserPasswordValid = true;
		}

		if (isUserPasswordValid) {
			$("#userPassword").removeClass("is-invalid");
		} else {
			$("#userPassword").addClass("is-invalid");
		}

		//password confirm
		console.log(userPasswordValue);
		console.log(userPassword2Value);
		if (userPasswordValue = userPassword2Value) {
			isUserPassword2Valid = true;
		}

		if (isUserPassword2Valid) {
			$("#userPassword2").removeClass("is-invalid");
		} else {
			$("#userPassword2").addClass("is-invalid");
		}

		if (isUserNameValid && isUserEmailValid && isUserPasswordValid
				&& isUserPassword2Valid) {
			return true;
		} else {
			return false;
		}
	}

	function sendReqeust() {
		
		$.ajax({
			url : "/user/register",
			type : "POST",
			dataType : 'json',
			data : {
				userName : $("#userName").val(),
				userEmail : $("#userEmail").val(),
				userPassword : $("#userPassword").val(),
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				alertify.alert('Upwiden', '회원가입을 축하합니다. 로그인 페이지로 이동합니다',
						function() {
							window.location.href = "/";
						})
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alertify.notify('Opps!! 회원가입에 문제가 생겼습니다.', 'error', 3,
				function() {
					console.log(jqXHR.responseText);
				});
			}
		});
	}
</script>
</head>
<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<a href="/">
				<img class="d-block mx-auto mb-4" src="<c:url value="/resources/img/bootstrap-solid.svg"/>" alt="" idth="72" height="72">
			</a>
			<div class="user-form">
				<h2>Login form</h2>
				<p class="lead">로그인하여 여러사람들과 다양한 이야기를 나눠보세욧!</p>
			</div>
		</div>

		<div class="container user-form">
			<hr>
			<form method="post" role="form">
				<div class="form-group">
					<label class="sr-only" for="inputName">Name</label> 
					<input type="text" class="form-control" id="userName" name="name" placeholder="Name">
					<div class="invalid-feedback">이름을 입력하세요.</div>
				</div>
				<div class="form-group">
					<label class="sr-only" for="inputEmail">Email</label> 
					<input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Email">
					<div class="invalid-feedback">이메일 주소를 올바르게 입력하세요.</div>
				</div>
				<div class="form-group">
					<label class="sr-only" for="inputPassword">Password</label> 
					<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="Password">
					<div class="invalid-feedback">10 이상의 영문,숫자,특수문자를 포함하도록 입력하세요.</div>
				</div>
				<div class="form-group">
					<label class="sr-only" for="inputPasswordCheck">
						Retype Password</label> 
					<input type="password" class="form-control" id="userPassword2" name="userPassword2" placeholder="Confirm Password">
					<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
				</div>

			</form>
			<button id="btn_register" class="btn btn-primary btn-block">
				회원 가입
			</button>
			<hr>
		</div>


		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2017-2019 Company Name</p>
			<ul class="list-inline">
				<li class="list-inline-item"><a href="/">Privacy</a></li>
				<li class="list-inline-item"><a href="/">Terms</a></li>
				<li class="list-inline-item"><a href="/">Support</a></li>
			</ul>
		</footer>
	</div>
	
</body>
</html>