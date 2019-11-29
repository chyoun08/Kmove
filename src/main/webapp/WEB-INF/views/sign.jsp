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

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet">


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

</head>
<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<a href="/"><img class="d-block mx-auto mb-4"
				src="<c:url value="/resources/img/bootstrap-solid.svg"/>" alt="" width="72"
				height="72"></a>
				<div class="user-form">
			<h2>Login form</h2>
			<p class="lead">로근인하여 여러사람들과 다양한 이야기를 나눠보세요!</p></div>
		</div>

		<div class="container user-form">
			<h4 class="mb-3">Billing address</h4>
			<form class="needs-validation" novalidate>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="firstName">First name</label> 
						<input type="text" class="form-control" id="firstName" placeholder="" value="" required>
						<div class="invalid-feedback">Valid first name is required.
						</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="email">Email </label>
					<input type="email" class="form-control" id="email"
						placeholder="you@example.com">
					<div class="invalid-feedback">Please enter a valid email
						address for shipping updates.</div>
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
						<input type="text" class="form-control" id="userAge" placeholder="" value="" required>
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

				<h4 class="mb-3">성별</h4>

				<div class="d-block my-3">
					<div class="custom-control custom-radio">
						<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
						<label class="custom-control-label" for="credit">Man</label>
					</div>
					<div class="custom-control custom-radio">
						<input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required> 
						<label class="custom-control-label" for="debit">Woman</label>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="cc-name">Name on card</label> <input type="text"
							class="form-control" id="cc-name" placeholder="" required>
						<small class="text-muted">Full name as displayed on card</small>
						<div class="invalid-feedback">Name on card is required</div>
					</div>
					<div class="col-md-6 mb-3">
						<label for="cc-number">Credit card number</label> <input
							type="text" class="form-control" id="cc-number" placeholder=""
							required>
						<div class="invalid-feedback">Credit card number is required
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 mb-3">
						<label for="cc-expiration">Expiration</label> <input type="text"
							class="form-control" id="cc-expiration" placeholder="" required>
						<div class="invalid-feedback">Expiration date required</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="cc-cvv">CVV</label> <input type="text"
							class="form-control" id="cc-cvv" placeholder="" required>
						<div class="invalid-feedback">Security code required</div>
					</div>
				</div>
				<hr class="mb-4">
			</form>
			<button class="btn btn-primary btn-lg btn-block" type="submit">
				Continue to checkout
			</button>
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
	<script src="<c:url value="/resources/js/jquery-3.3.1.slim.min.js"/>"></script>
	<script>
		window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/form-validation.js"/>"></script>
</body>
</html>