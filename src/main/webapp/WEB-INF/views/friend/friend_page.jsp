<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.chasebook3.www.model.User"%>
<%
	int userSeq = 0;
	if (session.getAttribute("user") != null) {
		userSeq = ((User) session.getAttribute("user")).getUserSeq();
	}
	
	User user = (User)session.getAttribute("user");
	
	String search = request.getParameter("search");
%>
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
    
    .okay-friend{
    	margin: auto;
	    font-size: 15px;
	    color: white;
	    border-radius: 15rem;
	    width: 25px;
	    background: aqua;
    }

  </style>
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
  <script src="<c:url value="/resources/js/jquery-3.3.1.slim.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
  
<script>
	var totalSize = 0;
	var SEARCH_WORD="";
	var bstart = <%=request.getParameter("offset") %>;	//limit
	var bend = <%=request.getParameter("limit") %>;	//list
	var size = <%=request.getAttribute("size") %>
	
	var pageCountPerBlock = 10;	//
	var totalListItemCount=0;	//전체 list갯수
	var currentPageIndex=1;
	$(document).ready(function() {
		
		friendButtonActive();
		
		$("#searchFriendBtn").click(function(e){
			var searchWord = $("#searchFriend").val();
	         
	         if( searchWord != "" ){
	            SEARCH_WORD = searchWord;
	         }else{
	            SEARCH_WORD = "";
	         }
	         
	         console.log(searchWord);
	         
	         friendList();
		});
	});
	
	function rejectFriend(friUserID){
		$.ajax({
			type : 'post',
			url : '/friend/reject',
			dataType : 'json',
			data : {
				userID: <%=userSeq%>,
				fuserID: friUserID
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) {
				if(data){
					friendList();
				}else{
					alertify.notify('Opps!! 친구 거절 과정에 문제가 발생했습니다.',
							'error',3);
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				if (jqXHR.responseText == "timeout") {
					window.location.href = "/login"
				} else {
					alertify.notify('Opps!! 친구 거절 과정에 알 수 없는 애러가 발생했습니다.',
							'error', //'error','warning','message'
							3, //-1
							function() {
								console.log(jqXHR.responseText);
							});
				}
			}
		});
	}
	
	function applyFriend(friUserID){
		$.ajax({
			type : 'post',
			url : '/friend/apply',
			dataType : 'json',
			data : {
				userID: <%=userSeq%>,
				fuserID: friUserID
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) {
				if(data){
					friendList();
				}else{
					alertify.notify('Opps!! 친구수락에 문제가 발생했습니다.',
							'error',3);
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				if (jqXHR.responseText == "timeout") {
					window.location.href = "/login"
				} else {
					alertify.notify('Opps!! 친구 수락 과정에 알 수 없는 오류가 발생했습니다.',
							'error', //'error','warning','message'
							3, //-1
							function() {
								console.log(jqXHR.responseText);
							});
				}
			}
		});
	}
	
	function friendButtonActive(){
		$("#searchPublicBoard").keydown(function() {
			  if (event.keyCode == 13){
				  $("#searchPublicBoardBtn").click();
			  }
		});
	}
	
	function friendList(){
		window.location.href = "/friend/list?offset=0&limit=5&userSeq=<%=userSeq%>&searchWord="+SEARCH_WORD;
	}

	function friendListTotalCnt() {

		$.ajax({
			type : 'get',
			url : '/friend/list/totalCnt',
			dataType : 'json',
			data : {
				searchWord : SEARCH_WORD
			},
			beforeSend : function(xhr) {
				//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
				xhr.setRequestHeader("AJAX", true);
			},
			success : function(data, status, xhr) {
				totalSize = data;
				console.log(data + 'data값');
				console.log(totalSize);
				var totalEnd = bstart + bend;
				if (totalSize == totalEnd) {
					size = 0;
					boardButtonActive();
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				if (jqXHR.responseText == "timeout") {
					window.location.href = "/login"
				} else {
					alertify.notify('Opps!! 글 전체 갯수 조회 과정에 문제가 생겼습니다.',
							'error', //'error','warning','message'
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
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top nav-container">
    <div class="container nav-bar">
      <div class="col-md-3">
        <a class="navbar-brand" href="/board/list?offset=0&limit=3&searchWord=">Start Bootstrap</a>
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
            <a class="nav-link" href="/board/list?offset=0&limit=3&searchWord=">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
		  	<a class="nav-link" href="/friend/list?offset=0&limit=5&userSeq=<%=userSeq%>&searchWord=">Services</a>
		  </li>
		  <li class="nav-item">
		  	<a class="nav-link" href="/user/logout">Contact</a>
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
          <a href="/friend/myfriends?offset=0&limit=5&userSeq=<%=userSeq%>&searchWord="
          		class="list-group-item">My Friend</a>
          <a href="/friend/list?offset=0&limit=5&userSeq=<%=userSeq%>&searchWord=" 
          		class="list-group-item active">FriendPlus</a>
          <a href="/friend/rejects?offset=0&limit=5&userSeq=<%=userSeq%>&searchWord=" 
          		class="list-group-item">FriendReject</a>
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

        <!-- 나에게 친구 추가 신청 목록 -->
        <div class="friend-plus">
          <div class="row">
            <div class="fri-container">
              <div class="container-box">

				<c:forEach var="user" items="${requestList}">
	                <!--reco-fr one -->
	                <div class="paper"> 
	                  <div class="paper-holder"> 
	                    <a href="#"><img width="190" src="http://placekitten.com/190/182"></a> 
	                  </div>
	                  <p class="paper-description">${user.userName}</p> 
	                  <div class="paper-content"> 
	                    <p class="paper-text">${user.userSex}</p>
	                    <p class="paper-text">${user.userAge}</p>
	                    <p class="paper-text">
	                    	<a class="okay-friend" href="javascript:void(0)" 
	                    		onclick="applyFriend(${user.userSeq})">Okay
	                    	</a>
	                    	<a class="okay-friend" href="javascript:void(0)" 
	                    		onclick="rejectFriend(${user.userSeq})">X
	                    	</a>
                    	</p>
	                  </div> 
	                </div>
                </c:forEach>

              </div>
            </div>
          </div>

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

          <hr>
        </div>
        <!-- 나에게 친구 추가 신청 목록 끝 -->

		<c:forEach var="user" items="${friendList}">
	        <!-- Project One -->
	        <div class="plus-friend">
		        <div class="reco-friend">
		          <div class="col-md-5 profile-photo">
		            <a href="#">
		              <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/300x300" alt="">
		            </a>
		          </div>
		          <div class="col-md-7">
		            <br>
		            <h3>${user.userName}</h3>
		            <p>${user.userSex}</p>
		            <p>${user.userAge}</p>
		            <a class="btn btn-primary" href="#">친구 신청</a>
		          </div>
		        </div>
		        <hr>
	        </div>
	        <!-- /.row -->
        </c:forEach>

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