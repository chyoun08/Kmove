<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.chasebook3.www.model.User"%>
<%
	int userSeq = 0;
	if (session.getAttribute("user") != null) {
		userSeq = ((User) session.getAttribute("user")).getUserSeq();
	}
	String search = request.getParameter("search");
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
<script type="text/javascript" src="<c:url value="/resources/editor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
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

.row{
	height: 100%;
}

.blog-body {
	width: 70%;
	margin: auto;
}

.contents-detail{
	overflow: scroll;
	width: 100%; 
	height: 100%;
}

.outer-menu {
    float: left;
    width: 100px; height: 20px;
    line-height: 20px;	/*line의 높이 즉 해당 박스의 line의 위에서부터의 높이*/
    padding: 10px 0;
    position: relative;
    text-align: center;

    font-size: 13px;
    font-weight: bold;

    z-index: 9999;	/*겹쳐졌을대 해당순위 최대치*/
}

.outer-menu:hover { background: #E1DFDF; } /*해당객체 마우스를 댈 경우*/

.inner-menu {
    display: none;
    background: #FFFFFF;
    margin-top: 10px;
    width: 100%;

    border-top: 1px solid #cccaca;	/*해당 객체 맨윗부분의 border(선)값*/
    box-shadow: 0 2px 4px rgba(34,25,25,0.5);	/*해당객체 구현시 그림자 출력*/
}

.inner-menu a {
    display: block;
    padding: 5px 10px; /*위, 오른쪽, 아래, 왼쪽 순서대로됨*/
    z-index: 5000;
}

.inner-menu a:hover { background: #E1DFDF; }

.modal-header .close{
	margin: -1rem 0 0 0 ;
	
}
.modal-footer{
    display: block;
}

.comment-text{
	width: 104%;
    height: 60px;
    display: flex;
}

.comment-text>input{
	height: 100%;
	width: 83%;
}

.comment-text>span>button{
	height: 100%;
	font-size: 18px;
	width: 65px;
}

.comment-list{
	height: 588px;
    width: 104%;
    background: aliceblue;
    overflow: scroll;
}

.comment-list > .table td{
	padding: 0;
}

.comment-list > .comment-detail > .comment-detail-user > ul{
	padding-left: 0px;
	margin-bottom: 0px;
	list-style: none;
    margin-top: 10px;
}

.comment-detail{
	width: 100%;
    min-height: 90px;
    display: flex;
    background: aliceblue;
    border-bottom: 1px solid darkgray;
}

.comment-detail-box{
	width: 65%;
    min-height: 100%;
}

.comment-detail-text{
	background: white;
    border-radius: 7px;
    margin: 10px 0px 10px 10px;
    min-height: 80%;
}

.comment-detail-count{
	width: 15%;
    font-size: 30px;
    padding-top: 20px;
    height: 100%;
    text-align: center;
    display: grid;
}

.img-responsive{

	float: none;
	margin: 0 auto;
	width: 100%;
	height: 50%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
	
}

#detailModalTitle{
	margin:auto;
}

@media ( min-width :576px) {
	.contents {
		max-width: 288px;
		height: 388px;
	}
	
	.modal-dialog {
		max-width: 1200px;
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
		color: black;
		padding: .75rem 1.25rem;
	    margin-bottom: 0;
	    background-color: rgba(0, 0, 0, .03);
	    border-bottom: 1px solid rgba(0, 0, 0, .125);
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
	
	.contents-footer>span{
		float: right;
	}
	
	.headers-container {
		width: 100%;
		margin: auto;
	}
	.headers-container>h1 {
		margin: auto;
		width: 100%;
	}
	iframe {
		width: 100% !important;
		height: 600px !important;
	}
	#smart_editor2{
		height: 550px !important;
	}
	#smart_editor2_content {
		height: 500px !important;
	}
	.se2_input_area {
		height: 450px !important;
	}
	.card img{
		max-width: 400px;
	}
	.contents-comment{
		background-color: rgba(0, 0, 0, .1);
		padding-left: 1px;
	}
	iframe > iframe{
		hegith: 400px !important;
	}
}
</style>

<script>
	var totalSize = 0;
	var SEARCH_WORD="";
	var bstart = <%=request.getParameter("offset") %>;	//limit
	var bend = <%=request.getParameter("limit") %>;	//list
	var size = <%=request.getAttribute("size") %>;
	var admin = '<%=request.getParameter("admin")%>' + "";
	console.log(admin);
	
	var pageCountPerBlock = 10;	//
	var totalListItemCount=0;	//전체 list갯수
	var currentPageIndex=1;
	
	$(document).ready(function() {
		
        $('.outer-menu').hover(function () {
            $(this).find('.inner-menu').css('display', 'block');
        }, function () {
            $(this).find('.inner-menu').css('display', 'none');
        });
        
		console.log('진입전'+totalSize);
		boardListTotalCnt();
		console.log('진입후'+totalSize);
		boardButtonActive();
		
		$("#insertBoardBtn").click(function(e) {
			oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
			sendReqeustCreate();
		});
		
		$("#userProfileBtn").click(function(e){
			sendUserProfile();	
		});
		
		$("#boardPrevious").click(function(e){
			bstart = bstart - 3;
			if(bstart<0){
				bstart = 0;
			}
			boardList();
		});
		
		$("#boardNext").click(function(e){
			bstart = bstart + 3;
			boardList();
		});
		
		$("#updateBoardBtn").click(function(e){
			boardUpdate();
		});
		
		$("#closeDetailModalBtn").click(function(e){
			location.reload();
		});
		
		$("#searchPublicBoardBtn").click(function(e){
			var searchWord = $("#searchPublicBoard").val();
	         
	         if( searchWord != "" ){
	            SEARCH_WORD = searchWord;
	         }else{
	            SEARCH_WORD = "";
	         }
	         
	         console.log(searchWord);
	         
	         boardList();
		});
		
		$("#commentInsertBtn").click(function(e){
			commentInsert();
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
		
		$("#searchPublicBoard").keydown(function() {
			  if (event.keyCode == 13){
				  $("#searchPublicBoardBtn").click();
			  }
		});
	}
	
	function sendUserProfile(){
		$.ajax({
			url : "/user/updateProfile",
			type : "POST",
			dataType : 'json',
			data : {
				userSeq : <%=userSeq%>
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				alertify.alert('chasebook', '댓글 등록이 완료되었습니다!!', function() {
					window.location.href = "/user/updateProfile?userSeq="+<%=userSeq%>;
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
	
	function commentInsert(){
		$.ajax({
			url : "/comment/insert",
			type : "POST",
			dataType : 'json',
			data : {
				userID : <%=userSeq%>,
				boardID : $("#dboardID").val(),
				comments : $("#commentInsertTEXT").val()
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				alertify.alert('chasebook', '댓글 등록이 완료되었습니다!!', function() {
					console.log('댓글작성 완료');
					detailCommentDetail(data);
				})
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alertify.notify('댓글 등록에 문제가 생겼습니다.', 'error', 3,
						function() {
							console.log(jqXHR.responseText);
						});
			}
		});
	}
	
	function sendReqeustCreate() {
		$.ajax({
			url : "/board/insert",
			type : "POST",
			dataType : 'json',
			data : {
				userSeq : $("#userSeq").val(),
				title : $("#boardTitle").val(),
				content : $("#textAreaContent").val()
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				alertify.alert('chasebook', '게시글이 작성되었습니다!!', function() {
					//window.location.href = "/board/sns_page?start=0&end=3&searchWord="+"";
					window.location.href = "/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PUBLIC&searchWord=";
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
		window.location.href = "/board/list?offset="+bstart+"&limit="+bend+"&admin="+admin+"&searchWord="+SEARCH_WORD;
	}
	
	function boardDelete(deleteBoardID){
		$.ajax({
			url : "/board/delete",
			type : "POST",
			dataType : 'json',
			data : {
				boardID : deleteBoardID
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) { // alertify or another welcome page 이동
				alertify.alert('chasebook', '게시글이 삭제되었습니다!!', function() {
					window.location.href = "/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PUBLIC&searchWord=";
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
	
	function updateBoardView(updateBoardID){
		console.log('boardUpdateView 호출'+updateBoardID);
		$.ajax({
			url : "/board/detail",
			type : "GET",
			dataType : 'json',
			data : {
				boardID : updateBoardID
			}, beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX",true);
			}, success : function(data, status, xhr){
				console.log('updateModal success 호출완료');
				updateBoardDetail(data);
				$("#updateModal").modal();
			}, error : function(jqXHR, textStatus, errorThrown){
				alertify.notify('Detail Form받기에 문제가 생겼습니다!','error',3,
						function(){console.log(jqXHR.responseText);
				});
			}
		});
	}
	
	var updateCount = 0;
	
	function updateBoardDetail(board){
		console.log(updateCount+'updateCount');
		var utitle = board.title;
		var ucontent = board.content + " ";
		var updateBoardID = board.boardID;
		$('#updateModalTitle').val(utitle);
		$('#updateModalContent').val(ucontent);
		$('#updateModalBoardID').val(updateBoardID);
		if(updateCount>0){
			console.log($('#updateModal-body').children($("iframe")).last()+'----------'+updateCount);
			$('#updateModal-body').children($("iframe")).last().remove()
		}
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "updateModalContent",
			sSkinURI: "/resources/editor/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
		updateCount++;
	}
	
	function boardUpdate(){
		$.ajax({
			url : "/board/update",
			type : "POST",
			dataType : 'json',
			data : {
				boardID : $("#updateBoardID").val(),
				title : $("#updateModalTitle").val(),
				content : $("#updateModalContent").val()
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) {
				if(data){
				alertify.alert('chasebook', '게시글이 삭제되었습니다!!', function() {
					window.location.href = "/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PUBLIC&searchWord=";
				})
				}else{
					alertify.alert('chasebook','게시글 삭제 실패!!',function(){
						window.location.href="/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PUBLIC&searchWord=";
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
	
	function boardListTotalCnt(){
	      
	      $.ajax(
	      {
	           type : 'get',
	           url : '/board/list/totalCnt',
	           dataType : 'json',
	           data : 
	         {
	            searchWord: SEARCH_WORD
	         },
	           beforeSend : function(xhr){
	               //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
	               xhr.setRequestHeader("AJAX", true);
	           },
	           success : function(data, status, xhr) {
	        	   totalSize = data;
	        	   console.log(data+'data값');
	        	   console.log(totalSize);
					var totalEnd = bstart+bend;
					if(totalSize == totalEnd){
						size = 0;
						boardButtonActive();
					}
	           }, 
	           error: function(jqXHR, textStatus, errorThrown) 
	           { 
	              if( jqXHR.responseText == "timeout" ){
	                 window.location.href = "/login"
	              }else{
	                 alertify.notify(
	                     'Opps!! 글 전체 갯수 조회 과정에 문제가 생겼습니다.', 
	                     'error', //'error','warning','message'
	                     3, //-1
	                     function(){
	                        console.log(jqXHR.responseText); 
	                     }
	                  );
	              }
	           }
	       });
	   }
	
	function detailBoardView(detailBoardID){
		detailCommentViewSend(detailBoardID);
		detailBoardViewSend(detailBoardID);
	}
	
	function detailCommentViewSend(detailBoardID){
		console.log('우효! comment 겟또다제!');
		$.ajax({
			url : "/comment/detail",
			type : "GET",
			dataType : 'json',
			data : {
				boardID : detailBoardID
			}, beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX",true);
			}, success : function(data, status, xhr){
				detailCommentDetail(data);
			}, error : function(jqXHR, textStatus, errorThrown){
				alertify.notify('댓글 불러오기에 문제가 생겼습니다!','error',3,
						function(){console.log(jqXHR.responseText);
				});
			}
		});
	}
	
	function detailCommentDetail(list){
		console.log('comment list 출력');
		var currentUserID = <%=userSeq%>
		console.log(currentUserID+'userID');
		$("#comment-list").html("");
		for(var i=0;i<list.length;i++){
			var commentID = list[i].commentID;
			var boardID = list[i].boardID;
			var userID = list[i].userID;
			var comments = list[i].comments;
			var commentCount = list[i].comment_count;
			var userName = list[i].userName;
			var userProfileUrl = list[i].userProfileURL;
			var commentDate = list[i].cegDt;
			var commentHtml = ''
			+'<div class="comment-detail">'
				+'<div class="comment-detail-user" style="width: 20%; text-align: center; height:100%;">'
					+'<ul>'
						+'<li style="background:black; height:100%;">'
							+'<img src="/resources/img/544750.jpg" class="img-responsive">'
						+'</li>'
						+'<li>'+userName+'</li>'
						+'<li style="font-size:10px;">'+commentDate+'</li>'
					+'</ul>'
				+'</div>'
				+'<div class="comment-detail-box">'
					+'<div class="comment-detail-text">'
						+'<div>'
							+comments
						+'</div>'
					+'</div>'
				+'</div>'
				+'<div class="comment-detail-count">'
				+'<a href="javascript:void(0)" onclick="plusComment('+commentID+')">'
					+commentCount+'</a>';
			if(userID==currentUserID){
				commentHtml = commentHtml
					+'<a href="javascript:void(0)" onclick="deleteComment('+commentID+')" style="margin: auto;'
					+'font-size: 15px; color: white; border-radius: 15rem; width: 25px; background: aqua;">'
						+'X</a>'
						+'</div>'+'</div>';
			}else{
				commentHtml = commentHtml +'</div>'+'</div>';
			}
			$("#comment-list").append(commentHtml);
		}
		$("#commentInsertTEXT").val('');
	}
	
	function plusComment(commentID){
		$.ajax({
			url : "/comment/plus",
			type : "POST",
			dataType : 'json',
			data : {
				commentID : commentID
			}, beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX",true);
			}, success : function(data, status, xhr){
				if(data){
					detailCommentViewSend($("#dboardID").val());
				}else{
					alertify.notify('댓글 좋아요 실패!!','error',3);
				}
			}, error : function(jqXHR, textStatus, errorThrown){
				alertify.notify('댓글 좋아요에 문제가 생겼습니다!','error',3,
						function(){console.log(jqXHR.responseText);
				});
			}
		});
	}
	
	function deleteComment(commentID){
		$.ajax({
			url : "/comment/delete",
			type : "POST",
			dataType : 'json',
			data : {
				commentID : commentID
			}, beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX",true);
			}, success : function(data, status, xhr){
				if(data){
					detailCommentViewSend($("#dboardID").val());
				}else{
					alertify.notify('댓글불러오기 실패!!','error',3);
				}
			}, error : function(jqXHR, textStatus, errorThrown){
				alertify.notify('댓글 불러오기에 문제가 생겼습니다!','error',3,
						function(){console.log(jqXHR.responseText);
				});
			}
		});
	}
	
	function detailBoardViewSend(detailBoardID){
		$.ajax({
			url : "/board/detail",
			type : "GET",
			dataType : 'json',
			data : {
				boardID : detailBoardID
			}, beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX",true);
			}, success : function(data, status, xhr){
				console.log('detail success 호출완료');
				$("#detailModal").modal();
				detailBoardDetail(data);
			}, error : function(jqXHR, textStatus, errorThrown){
				alertify.notify('Detail Form받기에 문제가 생겼습니다!','error',3,
						function(){console.log(jqXHR.responseText);
				});
			}
		});
	}
	
	function detailBoardDetail(board){
		$('#detailModalTitle').html("");
		$('#detailModalContent').html("");
		$("#detailDate").html("");
		$("#detailUserName").html("");
		$("#detailCount").html("");
		
		var dtitle = board.title;
		var dcontent = board.content;
		var dboardID = board.boardID;
		var duserSeq = board.userSeq;
		var dDate = board.regDt;
		var dUserName = board.userName;
		var dReadCount = board.readCount;
		console.log(dboardID+'board아뒤');
		
		$('#detailModalTitle').append(dtitle);
		$('#detailModalContent').append(dcontent);
		$("#duserSeq").val(duserSeq);
		$("#dboardID").val(dboardID);
		$("#detailDate").append(dDate);
		$("#detailUserName").append(dUserName);
		$("#detailCount").append(dReadCount);
	}
	
</script>
</head>

<body>

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top nav-container">
		<div class="container nav-bar">
			<div class="col-md-3">
				<a class="navbar-brand" href="/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PUBLIC&searchWord=">Start ChaseBook</a>
			</div>
			<div class="input-group col-md-6">
				<input type="text" class="form-control" placeholder="Search for..." id="searchPublicBoard">
				<span class="input-group-btn">
					<button class="btn btn-secondary" type="button" id="searchPublicBoardBtn">Go!</button>
				</span>
			</div>
			<div class="collapse navbar-collapse col-md-3" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PUBLIC&searchWord="> Home <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item">
						<a class="nav-link" href="/friend/list?offset=0&limit=5&userSeq=<%=userSeq%>&searchWord=">
							MyFriends
						</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#insertModal"
						data-toggle="modal" id="createBoard"> Create </a></li>
					<li class="nav-item">
						<ul class="outer-menu"> 
							<li>
								<a href="#">Map</a>
								<ul class="inner-menu">
			                        <li><a href="/map/simple">SimpleMap</a></li> 
			                        <li><a href="/map/marker">Marker</a></li>
			                        <li><a href="/map/cluster">Cluster</a></li>
			                        <li><a href="/map/infoWindow">InfoWindow</a></li>
			                        <li><a href="/map/clickLatLng">ClickLatLng</a></li>
			                        <li><a href="/map/googleMapAutoComplete">GoogleMapAutoComplete</a></li>
		                        </ul>
	                        </li>
	                    </ul>
					</li>
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
				<!-- Category -->
			      <div class="col-lg-2">
			        
			      </div>
				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header" style="text-align:center;">
						<img src="/resources/img/man.png" style="width:150px; height:200px;">
					</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-12">
								<ul class="list-unstyled mb-0">
									<li class="list-group">
									<button class="btn btn-secondary" type="button" id="userProfileBtn">
											UserProfile
										</button>
			          <a href="/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PUBLIC&searchWord="
			          		class="list-group-item">Public Board</a>
			          <a href="/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PROTECT&searchWord=" 
			          		class="list-group-item">Friend Board</a>
			          <a href="/board/list?offset=0&limit=3&userSeq=<%=userSeq%>&admin=PRIVATE&searchWord=" 
			          		class="list-group-item">My Board</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header" style="text-align:center">Side Widget</h5>
					<div class="card-body">
						<p>이곳은 광고가 들어올 예정인 곳입니다.</p>
						<p style="text-align:center">광고문의 바랍니다.</p>
						<p style="text-align:center">010-XXXX-XXXX</p>
					</div>
				</div>
			</div>
			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<!-- 게시글 목록 -->
				<div class="blog-body">

					<c:forEach var="board" items="${boardList}">
						<!-- Blog Post 최대 3개만 넣기 -->
						<div class="card mb-4 contents">
							<div class="contents-header text-center">
								<div class="headers-container">
									<h1 style="color: black;">${board.title}</h1>
								</div>
							</div>
							<div class="contents-body container-fluid" style="overflow: scroll;">
								<div class="container" style="margin-top: 5px; margin-bottom: 5px;">
									${board.content}
								</div>
							</div>
							<div class="contents-footer text-muted">
								<c:set var="bouserSeq" value="${board.userSeq}" />
								<c:set var="buserSeq" value="${user.userSeq}" />
								<c:if test="${bouserSeq eq buserSeq}">
									<a href="javascript:void(0)" onclick="boardDelete(${board.boardID})">
										 Delete 
									</a>
									<a href="javascript:void(0)" onclick="updateBoardView(${board.boardID})">
										Update
									</a>
								</c:if>
								<a href="javascript:void(0)" onclick="detailBoardView(${board.boardID})"
									data-toggle="modal">
									 View 
								</a>
								<span>조회수 ${board.readCount}</span>
								<span>작성일 ${board.regDt}&nbsp &nbsp </span>
								<span>${board.userName} &nbsp &nbsp </span>
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
	<!-- End Insert Modal -->

	<!-- The Update Modal -->
	<div class="modal fade" id="updateModal" role="dialog">
		<!-- Modal -->
		<div class="modal-dialog">
			<input type="hidden" id="updateModalBoardID" value=0/>
			<!-- Modal content-->
			<div class="modal-content" style="width: 900px;">
				<div class="modal-header contents-header">
					<h4>게시글 작성</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body contents-body container-fluid">
					<input class="form-control" type="text" id="updateModalTitle" name="updateModalTitle">
					<!-- <div id = "textareaPapa"style="width: 100%; height: 100%;">
					</div> -->
					<div id="updateModal-body" style="width: 100%; height: 100%;">
						<textarea style="width: 100%; height: 100%;" name="content"
							id="updateModalContent" cols="80">Hellow</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" name="updateBoardBtn"
						id="updateBoardBtn">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Update Modal -->
	
	<!-- The Detail Modal -->
	<div class="modal fade" id="detailModal" role="dialog">
		<!-- Modal -->
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 1200px;">
				<input type="hidden" name="duserSeq" id="duserSeq">
				<input type="hidden" name="dboardID" id="dboardID">
				<div class="modal-header contents-header">
					<h2 id="detailModalTitle">Default Title</h2>
					<button id="closeDetailModalBtn" type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body contents-body container-fluid">
					<div class="row">
						<div class="col-sm-8 contents-detail" id="detailModalContent">
							Default Content
						</div>
						<div class="col-sm-4 contents-comment">
							<div class="comment-list" id="comment-list">
								<div class="comment-detail">
									<div class="comment-detail-user" style="width: 20%; text-align: center; height:100%;">
										<ul>
											<li style="background:black; height:100%;">
												<img src="/resources/img/544750.jpg" class="img-responsive">
											</li>
											<li>UserName</li>
											<li style="font-size:10px;">Date</li>
										</ul>
									</div>
									<div class="comment-detail-box">
										<div class="comment-detail-text">
											<div>
												<p>Comment</p>
											</div>
										</div>
									</div>
									<div class="comment-detail-count">
										123
									</div>
								</div>
							</div>
							<div class="comment-text">
								<textarea id="commentInsertTEXT" class="form-control" placeholder="댓글 남기기"></textarea>
								<span class="input-group-btn">
									<button class="btn btn-secondary" type="button" id="commentInsertBtn">입력
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<span id="detailUserName" style="float: left;">어드민</span>
					<span id="detailCount" style="float: right;">0</span>
					<span style="float: right;"> &nbsp 조회수 &nbsp </span>
					<span id="detailDate" style="float: right;">2019</span>
				</div>
			</div>
		</div>
	</div>
	<!-- End Detail Modal -->

	<!-- Footer -->
	<footer class="py-3 bg-dark">
		<div class="container">
			<div class="text-center text-white">
				ChaseBook &copy; Enjoy! 2019
			</div>
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
      document.getElementById("textAreaContent").value; //를 이용해서 처리한다.
    
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