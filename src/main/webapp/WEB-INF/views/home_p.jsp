<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Blog Home - Start Bootstrap Template</title>

	<!-- Bootstrap core CSS -->
	<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="<c:url value="/resources/css/blog-home.css"/>" rel="stylesheet">
	<!-- <link href="css/styles.css" rel="stylesheet"> -->
	<style>
		html,body{
			background-image: url('/resources/img/544750.jpg');
		}
		h1{
			color: white;
		}
		.blog-body{
			width: 70%;
			margin: auto;
		}
		@media (min-width:576px){
			.contents{
				max-width:288px;
				height: 388px;
			}
		}
		@media (min-width:768px){
			.contents{
				max-width:384px;
				height: 484px;
			}
		}
		@media (min-width:992px){
			.contents{
				max-width:496px;
				height: 696px;
			}
		}
		@media (min-width:1200px){
			.contents{
				max-width:600px;
				height: 800px;
			}
		}
	</style>

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
            <a class="nav-link" href="/friend">MyFriends</a>
          </li>
          <li class="nav-item">
		  	<a class="nav-link" href="/create">Create</a>
		  </li>
		  <li class="nav-item">
		  	<a class="nav-link" href="/logout">LogOut</a>
		  </li>
        </ul>
      </div>
    </div>
  </nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Sidebar Widgets Column -->
			<div class="col-md-2">
				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search for...">
							<span class="input-group-btn">
								<button class="btn btn-secondary" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>
				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">Categories</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li>
										<a href="#">Web Design</a>
									</li>
									<li>
										<a href="#">HTML</a>
									</li>
									<li>
										<a href="#">Freebies</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li>
										<a href="#">JavaScript</a>
									</li>
									<li>
										<a href="#">CSS</a>
									</li>
									<li>
										<a href="#">Tutorials</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">Side Widget</h5>
					<div class="card-body">
						You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
					</div>
				</div>
			</div>
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<div class="blog-body">
					<h1 class="my-4"><!-- Page Heading
						<small>Secondary Text</small> -->
					</h1>

					<!-- Blog Post -->
					<div class="card mb-4 contents">
						<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
						<div class="card-body">
							<h2 class="card-title">Post Title</h2>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
							<a href="#" class="btn btn-primary">Read More &rarr;</a>
						</div>
						<div class="card-footer text-muted">
							Posted on January 1, 2017 by
							<a href="#">Start Bootstrap</a>
						</div>
					</div>

					<!-- Blog Post -->
					<div class="card mb-4 contents">
						<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
						<div class="card-body">
							<h2 class="card-title">Post Title</h2>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
							<a href="#" class="btn btn-primary">Read More &rarr;</a>
						</div>
						<div class="card-footer text-muted">
							Posted on January 1, 2017 by
							<a href="#">Start Bootstrap</a>
						</div>
					</div>

					<!-- Blog Post -->
					<div class="card mb-4 contents">
						<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
						<div class="card-body">
							<h2 class="card-title">Post Title</h2>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
							<a href="#" class="btn btn-primary">Read More &rarr;</a>
						</div>
						<div class="card-footer text-muted">
							Posted on January 1, 2017 by
							<a href="#">Start Bootstrap</a>
						</div>
					</div>

					<!-- Pagination -->
					<ul class="pagination justify-content-center mb-4">
						<li class="page-item">
							<a class="page-link" href="#">&larr; Older</a>
						</li>
						<li class="page-item disabled">
							<a class="page-link" href="#">Newer &rarr;</a>
						</li>
					</ul>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>

</body>

</html>
