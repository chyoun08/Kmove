<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Checkout example ・ Bootstrap</title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/form-validation.css"/>" rel="stylesheet">

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

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
<!-- Alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

<script>
	$(document).ready(function() {
		console.log('ajax들어갔는디요?');
		$("#registerBtn").click(function(e){
			registerRequset();
		});
	});
	
	function registerRequset(){
		var userName = $("#userName").val();
		var userEmail = $("#userEmail").val();
		var userPassword = $("#userPassword").val();
		var userAge = $("#userAge").val();
		var userSex = $(':radio[name="userSex"]:checked').val();
		console.log('USER정보');
		console.log(userName+' '+userEmail+' '+userPassword+' '+userSex+' '+userAge);
		
		$.ajax({
			url : "/user/register",
			type : "POST",
			dataType : 'json',
			data : {
				userName : userName,
				userEmail : userEmail,
				userPassword : userPassword,
				userSex : userSex,
				userAge : userAge
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				alertify.alert('chasebook', '회원가입이 완료되었습니다!!', function() {
					window.location.href = "/";
				})
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alertify.notify('유저정보창 입장에 문제가 생겼습니다.', 'error', 3,
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
			<a href="/"><img class="d-block mx-auto mb-4"
				src="<c:url value="/resources/img/bootstrap-solid.svg"/>" alt="" width="72"
				height="72"></a>
				<!-- <div class="user-form">
					<h2>Chase Book</h2>
					<p class="lead">로그인하여 여러사람들과 다양한 이야기를 나눠보세요우!</p>
				</div> -->
		</div>

		<div class="container user-form">
			<hr>
			<h2>Chase Book</h2>
			<p class="lead">로그인하여 여러사람들과 다양한 이야기를 나눠보세요우!</p>
			<hr>
			<form class="needs-validation" novalidate>
			
				<div class="row">
					
				</div>
				
				<hr class="mb-4">
				
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="firstName">Name</label> 
						<input type="text" class="form-control" id="userName" placeholder="" value="" required>
						<div class="invalid-feedback">Please enter a valid Name.</div>
					</div>
				</div>
				
				<hr class="mb-4">
				
				<div class="mb-3">
					<label for="userEmail">userEmail </label>
					<input type="email" class="form-control" id="userEmail"
						placeholder="you@example.com is your ID">
					<div class="invalid-feedback">Please enter a valid emailaddress.</div>
				</div>
				
				<div class="mb-3">
					<label for="userPassword">Password </label>
					<input type="password" class="form-control" id="userPassword"
						placeholder="Password">
					<div class="invalid-feedback">Please enter a valid password.</div>
				</div>

				<div class="row">
					<div class="col-md-5 mb-3">
						<label for="country">Country</label> <select
							class="custom-select d-block w-100" id="country" required>
							<option value="">Choose...</option>
							<option>United States</option>
							<option>Korea</option>
							<option>Japan</option>
							<option>China</option>
							<option>Russia</option>
						</select>
						<div class="invalid-feedback">Please select a valid country.
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="state">State</label> <select
							class="custom-select d-block w-100" id="state" required>
							<option value="">Choose...</option>
							<option>California</option>
							<option>Seoul</option>
							<option>Incheon</option>
						</select>
						<div class="invalid-feedback">Please provide a valid state.
						</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="userAge">Age</label> 
						<input type="text" class="form-control" id="userAge" placeholder="">
					</div>
				</div>
				<hr class="mb-4">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="same-address"> 
					<label class="custom-control-label" for="same-address">
						개인정보는 보호 받을 수 없습니다.
					</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="save-info">
					<label class="custom-control-label" for="save-info">
						"사용자"는 욕을 하지 않습니다.
					</label>
				</div>
				<hr class="mb-4">

				<h4 class="mb-3">SEX</h4>

				<div class="d-block my-3">
					<div class="custom-control custom-radio">
						<input id="MAN" name="userSex" type="radio" value="MAN"
							class="custom-control-input" checked required>
						<label class="custom-control-label" for="MAN">Man</label>
					</div>
					<div class="custom-control custom-radio">
						<input id="WOMAN" name="userSex" type="radio" value="WOMAN"
							class="custom-control-input" required> 
						<label class="custom-control-label" for="WOMAN">Woman</label>
					</div>
				</div>
				<hr class="mb-4">
			</form>
			<button class="btn btn-primary btn-lg btn-block" type="submit" id="registerBtn">
				Continue to checkout
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
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/form-validation.js"/>"></script>
</body>
</html>