<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.chasebook3.www.model.User"%>
<%
	int userSeq = 0;
	if (session.getAttribute("user") != null) {
		userSeq = ((User) session.getAttribute("user")).getUserSeq();
	}
	
	User user = (User)session.getAttribute("user");
	String admin = user.getUserAdmin();
	
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

<!-- Smart Editor -->
<script type="text/javascript" src="<c:url value="/resources/editor/js/HuskyEZCreator.js"/>"
charset="utf-8"></script>
<script type="text/javascript" src="<c:url value="/resources/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"/>"
	charset="utf-8"></script>

<title>SNS_Page</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/blog-home.css"/>" rel="stylesheet">
<style>
html, body {
	background-image: url("<c:url value="/resources/img/544750.jpg"/>");
}

h1 {
	color: white;
}

.blog-body {
	width: 70%;
	margin: auto;
}

@media ( min-width :576px) {
	.contents {
		max-width: 288px;
		height: 388px;
	}
	.modal-dialog {
		max-width: 900px;
		margin: 1.75rem auto;
	}
}

@media ( min-width :768px) {
	.contents {
		max-width: 576px;
		height: 510px;
	}
	.contents>img {
		max-width: 450px !important;
		max-height: 300px !important;
	}
}

@media ( min-width :992px) {
	.contents {
		max-width: 750px;
		height: 660px;
	}
	.contents>img {
		max-width: 300px !important;
		max-height: 200px !important;
	}
}

@media ( min-width :1200px) {
	.contents {
		max-width: 900px;
		height: 800px;
	}
	.contents-header {
		width: 100%;
		height: 70px;
		background-color: #c8c8c8;
		color: black;
	}
	.contents-body {
		background-color: white;
		width: 100%;
		height: 680px;
		border-radius: .5rem;
	}
	.contents-footer {
		width: 100%;
		height: 50px;
		padding: .75rem 1.25rem;
		background-color: rgba(0, 0, 0, .03);
		border-top: 1px solid rgba(0, 0, 0, .125);
	}
	.headers-container {
		width: 100%;
		margin: auto;
		margin-top: 10px;
	}
	.headers-container>h1 {
		margin: auto;
		width: 100%;
	}
	iframe {
		width: 100% !important;
		height: 600px !important;
	}
	#smart_editor2_content {
		height: 500px !important;
	}
	.se2_input_area {
		height: 400px !important;
	}
}
</style>
<script>
	var totalSize = 0;
	
	var bstart = <%=request.getParameter("start") %>;	//offset
	var bend = <%=request.getParameter("end") %>;	//list
	var size = <%=request.getAttribute("size") %>
	
	var pageCountPerBlock = 10;	//
	var totalListItemCount=0;	//전체 list갯수
	var currentPageIndex=1;
	
	$(document).ready(function() {

		/* $("#password").keydown(function() {
			  if (event.keyCode == 13) 
		}); */
		console.log(size+'size진입전'+totalSize);
		boardCnt();
		console.log(size+'size진입후'+totalSize);
		boardButtonActive();
		
		$("#insertBoardBtn").click(function(e) {
			oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
			sendReqeustCreate();
		});
		
		$("#boardPrevious").click(function(e){
			bstart = bstart - 3;
			if(bstart<0){
				bstart = 0;
			}
			boardList();
		});
		
		$("#boardDelete").click(function(e){
			boardDelete();
		});
		
		$("#boardUpdate").click(function(e){
			boardUpdate();
		});
		
		$("#boardNext").click(function(e){
			bstart = bstart + 3;
			boardList();
		});
	});
	
	function boardButtonActive(){
		console.log(size+'size');
		if(bstart<1){
			console.log(bstart+"값 if구문성공");
			$("#boardPreviousBox").addClass("disabled");
		}else{
			console.log(bstart+"값 if구문실패");
			$("#boardPreviousBox").removeClass("disabled");
		}
		
		if(size<3){
			$("#boardNextBox").addClass("disabled");
		}else{
			$("#boardNextBox").removeClass("disabled");
		}
	}
	
	function sendReqeustCreate() {
		$.ajax({
			url : "/board/insert",
			type : "POST",
			dataType : 'json',
			data : {
				userSeq : $("#userSeq").val(),
				title : $("#boardTitle").val(),
				/* content : $("#boardContents").val() */
				content : $("#textAreaContent").val()
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				alertify.alert('chasebook', '게시글이 작성되었습니다!!', function() {
					window.location.href = "/board/sns_page?start=0&end=3";
				})
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alertify.notify('Opps!! 로그인에 문제가 생겼습니다.', 'error', 3,
						function() {
							console.log(jqXHR.responseText);
						});
			}
		});
	}
	
	function boardList(){
		window.location.href = "/board/sns_page?start="+bstart+"&end="+bend;
	}
	
	function boardDelete(){
		$.ajax({
			url : "/board/delete",
			type : "POST",
			dataType : 'json',
			data : {
				boardID : $("#boardID").val(),
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				alertify.alert('chasebook', '게시글이 삭제되었습니다!!', function() {
					window.location.href = "/board/sns_page?start=0&end=3";
				})
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alertify.notify('삭제에 문제가 생겼습니다!!', 'error', 3,
						function() {
							console.log(jqXHR.responseText);
						});
			}
		});
	}
	
	function boardUpdate(){
		$.ajax({
			url : "/board/update",
			type : "POST",
			dataType : 'json',
			data : {
				boardID : $("#boardID").val(),
				title : $("#boardTitle").val(),
				content : $("boardContent").val(),
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) {
				if(data){
				alertify.alert('chasebook', '게시글이 삭제되었습니다!!', function() {
					window.location.href = "/board/sns_page?start=0&end=3";
				})
				}else{
					alertify.alert('chasebook','게시글 삭제 실패!!',function(){
						window.location.href="/board/sns_page?start=0&end=3";
					});
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alertify.notify('삭제에 문제가 생겼습니다!!', 'error', 3,
						function() {
							console.log(jqXHR.responseText);
						});
			}
		});
	}
	
	function boardCnt(){
		$.ajax({
			url : "/board/totalCnt",
			type : "GET",
			dataType : 'json',
			beforeSend : function(xhr) {
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) {
				totalSize = data;
				var totalEnd = bstart+bend;
				if(totalSize == totalEnd){
					size = 0;
					boardButtonActive();
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alertify.notify('List 갯수 문제가 생겼습니다!!', 'error', 3,
						function() {
							console.log(jqXHR.responseText);
						});
			}
		});
	}
</script>
</head>

<body>

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top nav-container">
		<div class="container nav-bar">
			<div class="col-md-3">
				<a class="navbar-brand" href="/sns_page">Start ChaseBook</a>
			</div>
			<div class="input-group col-md-6">
				<input type="text" class="form-control" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-secondary" type="button">Go!</button>
				</span>
			</div>
			<div class="collapse navbar-collapse col-md-3" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/board/sns_page?start=0end=3"> Home <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/friend">MyFriends</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#insertModal"
						data-toggle="modal" id="createBoard"> Create </a></li>
					<%-- <%if(((User)session.getAttribute("user")).getUserAdmin().equals("amdin")){%> --%>
					<%if(admin.equals("ADMIN")){ %>
					<li class="nav-item"><a class="nav-link" href="/user/logout">Admin</a>
					</li>
					<%} %>
					<li class="nav-item"><a class="nav-link" href="/user/logout">LogOut</a>
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
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
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
									<li><a href="#">Web Design</a></li>
									<li><a href="#">HTML</a></li>
									<li><a href="#">Freebies</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">JavaScript</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">Tutorials</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">Side Widget</h5>
					<div class="card-body">You can put anything you want inside
						of these side widgets. They are easy to use, and feature the new
						Bootstrap 4 card containers!</div>
				</div>
			</div>
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<!-- 게시글 목록 -->
				<div class="blog-body">
					<h1 class="my-4">
						<!-- Page Heading
						<small>Secondary Text</small> -->
					</h1>

					<!-- Blog Post 최대 3개만 넣기 -->
					<!-- <div class="card mb-4 contents">
						<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
						<div class="card-body">
							<h2 class="card-title">Post Title</h2>
							<p class="card-text">
								Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
								quis soluta, a laboriosam. Dicta expedita corporis animi vero
								voluptate voluptatibus possimus, veniam magni quis!
							</p>
							<a href="#" class="btn btn-primary">Read More &rarr;</a>
						</div>
						<div class="card-footer text-muted">
							<span id="userName">Start Bootstrap</span>
						</div>
					</div> -->

					<c:forEach var="board" items="${boardList}">
						<!-- Blog Post 최대 3개만 넣기 -->
						<div class="card mb-4 contents">
							<input type="hidden" name="boardID" id="boardID"
								value="${board.boardID}" />
							<div class="contents-header text-center">
								<div class="headers-container">
									<h1 style="color: black;">${board.title}</h1>
								</div>
							</div>
							<div class="contents-body container-fluid">
								<div class="container">${board.content}
								</div>
							</div>
							<div class="contents-footer text-muted">
								<span>${board.userName}</span>
								<c:set var="buserSeq" value="${board.userSeq}" />
								<c:set var="userSeq" value="${user.userSeq}" />
								<c:if test="${buserSeq eq userSeq}">
									<button id="boardDelete">delete</button>
									<button id="boardUpdate">update</button>
								</c:if>
							</div>
						</div>
					</c:forEach>

					<!-- Pagination -->
					<ul class="pagination justify-content-center mb-4">
						<li class="page-item" id="boardPreviousBox"><a
							class="page-link" href="#" id="boardPrevious">&larr; Older</a></li>
						<li class="page-item" id="boardNextBox"><a class="page-link"
							href="#" id="boardNext">Newer &rarr;</a></li>
					</ul>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- The Insert Modal -->
	<div class="modal fade" id="insertModal" role="dialog">
		<!-- Modal -->
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 900px;">
				<div class="modal-header contents-header">
					<h4>게시글 작성</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<input type="hidden" name="userSeq" id="userSeq" value=<%=userSeq%> />
				<div class="modal-body contents-body container-fluid">
					<input class="form-control" type="text" id="boardTitle">
					<div style="width: 100%; height: 100%;">
						<textarea style="width: 100%; height: 100%;" name="content"
							id="textAreaContent" cols="80"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" name="insertBoardBtn"
						id="insertBoardBtn">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- The Update Modal -->
	<div class="modal fade" id="updateModal" role="dialog">
		<!-- Modal -->
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 900px;">
				<div class="modal-header contents-header">
					<h4>게시글 작성</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body contents-body container-fluid">
					<input class="form-control" type="text" id="updateBoardTitle">
					<div style="width: 100%; height: 100%;">
						<textarea style="width: 100%; height: 100%;" name="content"
							id="textAreaContent" cols="80"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" name="insertBoardBtn"
						id="insertBoardBtn">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="py-3 bg-dark">
		<div class="container">
			<div class="text-center text-white">ChaseBook &copy; Enjoy!
				2019</div>
			<div class="text-right text-white">
				<a class="text-white" href="/support">Support</a>
			</div>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->

	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>

	<!-- Naver Smart Editor 2 -->
	<script>
  var oEditors = [];
  nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "textAreaContent",
      sSkinURI: "/resources/editor/SmartEditor2Skin.html",
      fCreator: "createSEditor2"
  });
   
  //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
  function submitContents(elClickedObj) {
      // 에디터의 내용이 textarea에 적용된다.
      oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
   
      // 에디터의 내용에 대한 값 검증은 이곳에서
      // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    
      try {
          elClickedObj.form.submit();
      } catch(e) {
       
      }
  }
   
  // textArea에 이미지 첨부
  function pasteHTML(filepath){
		var sHTML = '<img src="<%=request.getContextPath()%>/resources/editor/upload/'+ filepath + '">';
			oEditors.getById["textAreaContent"].exec("PASTE_HTML", [ sHTML ]);
		}
	</script>

</body>

</html>
