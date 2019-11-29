<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
  <link rel="stylesheet" href="<c:url value="/resources/css/but-any.css"/>">
  <!--Bootsrap 4 CDN-->
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">

  <!--Custom styles-->
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/styles.css"/>">

  <link href="<c:url value="/resources/css/bootstrap-toggle.min.css"/>" rel="stylesheet">
  <script src="<c:url value="/resources/js/bootstrap-toggle.min.js"/>"></script>
</head>
<body>
<div class="container">
  <div class="d-flex justify-content-center h-100">
  	<div class="wrap">
        <a href="/login" class="button" style="text-decoration: none;">
			<p> 지금 <br><br> 시작하세요! </p>
        </a>
    </div>
  </div>
</div>
</body>
</html>