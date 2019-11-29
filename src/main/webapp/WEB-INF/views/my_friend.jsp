<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
  <style>
    html,body{
      background-image: url('/resources/img/544750.jpg');
    }
    .container{
      background-color: rgba(0,0,0,0.5) !important;
      color: white;
    }
    .page-content{
      margin-top: 5%;
    }
    .m-body{
      width: 100%;
    }
    .nav-container{
      height: 7.5%;
    }

    .nav-bar{
      height: 100%;
      border-radius: .5rem;
    }

    .reco-friend{
      display: flex;
      color: black;
      background-color: rgba(255,255,255,0.7) !important;
      width: 97%;
      border-radius: .5em;
      margin: auto;
    }
    .profile-photo{
      padding: 10px 0 10px 0;
    }

    /* 종이 스타일 */
    .paper {
      width: 220px;
      margin: 10px 10px 0 0px;
      padding: 15px 15px 0;
      font-size: 11px;
      background: #FFFFFF;
      box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
      border-radius: .5em;
      color: black;
      float:left;
    }

    .paper-content {
      margin: 0 -15px;  /* 양옆을 -15px margin을 주면서 길이를 확장 시킨다.*/
      margin-top: 10px;
      padding: 10px 15px;
      background: #F2F0F0;

      overflow: hidden;
      border-radius: .5em;
    }

    .paper-description {
      margin: 10px 0;
    }

    .paper-link {
      display: block;
      float: left;
    }

    .paper-text {
      float: left;
      width: 150px;
      margin-left: 10px;
    }

    .fri-container{
      width: 100%;
      height: 100%;
      vertical-align: middle;
      text-align: center;
      display: table-cell;
    }
    .container-box{
      display: inline-block;
    }

  </style>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <script src="<c:url value="/resources/js/jquery-3.3.1.slim.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
</head>
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top nav-container">
    <div class="container nav-bar">
      <div class="col-md-3">
        <a class="navbar-brand" href="/sns_page">Start Bootstrap</a>
      </div>
      <div class="input-group col-md-6">
        <input type="text" class="form-control" placeholder="Search for...">
        <span class="input-group-btn">
          <button class="btn btn-secondary" type="button">Go!</button>
        </span>
      </div>
      <div class="collapse navbar-collapse col-md-3" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/sns_page">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
		  	<a class="nav-link" href="/friend">Services</a>
		  </li>
		  <li class="nav-item">
		  	<a class="nav-link" href="/logout">Contact</a>
		  </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container page-content">

    <div class="row m-body">

      <!-- Category -->
      <div class="col-lg-2">
        <h1 class="my-4">Shop Name</h1>
        <div class="list-group">
          <a href="/my_friend" class="list-group-item active">Category 1</a>
          <a href="/friend" class="list-group-item">Category 2</a>
          <a href="#" class="list-group-item">Category 3</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->

      <!-- <div class="col-lg-1">
      </div> -->

      <!-- 친구 추가 리스트 -->
      <div class="col-lg-8">
        <!-- Page Heading -->
        <h1 class="my-4">Page Heading
          <small>Secondary Text</small>
        </h1>

        <!-- Project One -->
        <div class="reco-friend">
          <div class="col-md-6 profile-photo">
            <a href="#">
              <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/300x300" alt="">
            </a>
          </div>
          <div class="col-md-6">
            <br>
            <h3>Project One</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
            <a class="btn btn-primary" href="#">View Project</a>
          </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Project Two -->
        <div class="reco-friend">
          <div class="col-md-6 profile-photo">
            <a href="#">
              <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/300x300" alt="">
            </a>
          </div>
          <div class="col-md-6">
            <br>
            <h3>Project Two</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, odit velit cumque vero doloremque repellendus distinctio maiores rem expedita a nam vitae modi quidem similique ducimus! Velit, esse totam tempore.</p>
            <a class="btn btn-primary" href="#">View Project</a>
          </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Project Three -->
        <div class="reco-friend">
          <div class="col-md-6 profile-photo">
            <a href="#">
              <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/300x300" alt="">
            </a>
          </div>
          <div class="col-md-6">
            <br>
            <h3>Project Three</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, temporibus, dolores, at, praesentium ut unde repudiandae voluptatum sit ab debitis suscipit fugiat natus velit excepturi amet commodi deleniti alias possimus!</p>
            <a class="btn btn-primary" href="#">View Project</a>
          </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Project Four -->
        <div class="reco-friend">

          <div class="col-md-6 profile-photo">
            <a href="#">
              <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/300x300" alt="">
            </a>
          </div>
          <div class="col-md-6">
            <br>
            <h3>Project Four</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, quidem, consectetur, officia rem officiis illum aliquam perspiciatis aspernatur quod modi hic nemo qui soluta aut eius fugit quam in suscipit?</p>
            <a class="btn btn-primary" href="#">View Project</a>
          </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Pagination -->
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
              <span class="sr-only">Previous</span>
            </a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">1</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">2</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">3</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
              <span class="sr-only">Next</span>
            </a>
          </li>
        </ul>

      </div>
      <!-- 친구 추가 리스트 끝 -->

      <div class="col-lg-2"></div>
      <!-- /.col-lg-9 -->
    </div>
    <!-- 바깥 row끝 -->
  </div>
  <!-- container -->

</body>
</html>