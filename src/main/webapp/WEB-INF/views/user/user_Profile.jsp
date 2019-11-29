<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.chasebook3.www.model.User"%>
<%
	int userSeq = 0;
	if (session.getAttribute("user") != null) {
		userSeq = ((User) session.getAttribute("user")).getUserSeq();
	}
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Checkout example ・ Bootstrap</title>
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/form-validation.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.3.1.slim.min.js"/>"></script>
<script> 
	window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
</script>
<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value="/resources/js/form-validation.js"/>"></script>

<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
	
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

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

<script>

$(document).ready(function() {
	console.log('start');
	$("#imageUpdates").click(function(e) {
		e.stopPropagation();	//부모쪽으로 가는 e막기
		e.preventDefault();	//추가적인 e 막기
		console.log('okey');
		profileInsert();
	});
});

function profileInsert(){
    console.log("profileInsert진입");
    
    var userSeqs = <%=userSeq%>;
    console.log('userSeqs값 출력'+userSeqs);
    console.log(typeof userSeqs);
 	var formData = new FormData();
    formData.append("userSeqs", userSeqs);
    formData.append("file", $("#imgAttach")[0].files[0]);
    
	$.ajax({
		type : 'post',
		url : '/user/updateImage',
		dataType : 'json',
		data : formData,
		contentType : false, // forcing jQuery not to add a Content-Type header for you, otherwise, the boundary string will be missing from it
		processData : false, // otherwise, jQuery will try to convert your FormData into a string, which will fail.
		beforeSend : function(xhr) {

			//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
			xhr.setRequestHeader("AJAX", true);
		},
		success : function(data, status, xhr) {

			if (data==1) {
				alertify.alert('사진이 등록되었습니다.', function() {
					window.location.href = "/myPage";

				});
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			if (jqXHR.responseText == "timeout") {
				window.location.href = "/login"
			} else {
				alertify.notify('Opps!! 사진 등록 과정에 문제가 생겼습니다.', 'error', //'error','warning','message'
				3, //-1
				function() {
					console.log(jqXHR.responseText);
				});
			}

		}
	});
}
</script>
</head>

<body class="bg-light">
<script>
function loadImgs(value){
	if(value.files && value.files[0]) 
	{
		var reader = new FileReader();

		reader.onload = function (e) {
			$('#loadImginsert').attr('src', e.target.result);
		}
	
		reader.readAsDataURL(value.files[0]);
	}
}
</script>
	<div class="container">
		<div class="py-5 text-center">
			<a href="/"><img class="d-block mx-auto mb-4"
				src="<c:url value="/resources/img/bootstrap-solid.svg"/>" alt=""
				width="72" height="72"></a>
		</div>

		<div class="container user-form">
			<hr>
			<h2>Chase Book</h2>
			<p class="lead">사용자 정보</p>
			<hr>
			<form class="needs-validation" novalidate>

				<div class="row">
					<!-- General Information -->
	               <div class="add-listing-box edit-info mrg-bot-25 padd-bot-30 padd-top-25">
                     <div class="listing-box-header" id="imgFileUploadInsertWrapper">
                        <div class="avater-box" id="alterImage">
                        <img id= "loadImginsert" src="${user.profileImageUrl}" style="width:200px; height:200px;"
                        	 alt="/resources/img/544750.jpg" />
                        <div class="upload-btn-wrapper">
                          <input type="file" id="imgAttach" name="imgAttach" onchange="loadImgs(this);">
                        </div>
                        </div>
                        <hr class="mb-4">
                        <button id="imageUpdates">수정하기</button>
                     </div>
                     </div>
				</div>

				<hr class="mb-4">

				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="firstName">Name</label>
						<div class="form-control" id="userName">${user.userName}</div>
					</div>
				</div>

				<hr class="mb-4">

				<div class="mb-3">
					<label for="userEmail">userEmail </label>
					<div class="form-control" id="userEmail">${user.userEmail}</div>
				</div>

				<div class="mb-3">
					<label for="userPassword">Password </label>
					<div class="form-control" id="userEmail">${user.userPassword}</div>
				</div>

				<div class="row">
					<div class="col-md-5 mb-3">
						<label for="country">Country</label>
						<div class="form-control" id="country">Korea</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="state">State</label>
						<div class="form-control" id="city">Seoul</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="userAge">Age</label>
						<div class="form-control" id="userAge">userAge</div>
					</div>
				</div>
				<hr class="mb-4">
				<div class="custom-control custom-checkbox">
					<label class="custom-control-label" for="same-address">
						개인정보는 보호 받을 수 없습니다. </label>
				</div>
				<div class="custom-control custom-checkbox">
					<label class="custom-control-label" for="save-info"> "사용자"는
						욕을 하지 않습니다. </label>
				</div>
				<hr class="mb-4">

				<h4 class="mb-3" style="text-align: center;">SEX</h4>

				<div class="d-block my-3">
					<h1 style="text-align: center;">${user.userSex}</h1>
				</div>
				<hr class="mb-4">
			</form>
			<button class="btn btn-primary btn-lg btn-block" type="submit">
				Continue to checkout</button>
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