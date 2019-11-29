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

<title>SNS_Page</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/blog-home.css"/>" rel="stylesheet">
<style>
html, body {
	background-image: url("<c:url value="/resources/img/544750.jpg"/>");
}

#map {
	height: 100%;
}

.place{
   padding: 3px;
}
.place_nm{
   font-size: 18px;
   font-weight: bold;
   margin-bottom: 5px;
}
.place_address{
   margin-bottom: 5px;
}
/* ???? */
.pac-container {
    z-index: 9999;
}
.container-body{
	height:1200px;
	width:100%;
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

</style>

<script>

var MAP_VIEW;
var DEFAULT_MAP_LOCATION = {lat: 37.5701, lng: 126.9769};   //kwanghwamoon
var MARKER;
var SEARCHED_MAP_LEVEL = 12;

	$(document).ready(function() {
		
        $('.outer-menu').hover(function () {
            $(this).find('.inner-menu').css('display', 'block');
        }, function () {
            $(this).find('.inner-menu').css('display', 'none');
        });
        
        $("#btnAddPlace").click(function(){
            $("#addPlaceModal").modal("show");
         });
        
	});
	   function initMap(){
		   
		      MAP_VIEW = new google.maps.Map(document.getElementById("map"), {
		           center: DEFAULT_MAP_LOCATION,
		             scrollwheel: false,
		             zoom: 8
		        });
		      
		   
		      var input = document.getElementById("inputSearch");
		         
		      var autocomplete = new google.maps.places.Autocomplete(input);
		        
		        autocomplete.bindTo('bounds', MAP_VIEW);
		   
		        MARKER = new google.maps.Marker({
		          map: MAP_VIEW
		        });
		        
		        google.maps.event.addListener(MARKER, 'click', function() {
		          INFO_WINDOW.open(MAP_VIEW, MARKER);
		        });
		        
		        google.maps.event.addListener(autocomplete, 'place_changed', function() {

		          //INFO_WINDOW.close();
		          var place = autocomplete.getPlace();
		          if (!place.geometry) {
		               return;
		          }

		          if (place.geometry.viewport) {
		               MAP_VIEW.fitBounds(place.geometry.viewport);
		          } else {
		               MAP_VIEW.setCenter(place.geometry.location);
		               MAP_VIEW.setZoom(SEARCHED_MAP_LEVEL);
		          }

		          // Set the position of the marker using the place ID and location.
		          MARKER.setPlace(/** @type {!google.maps.Place} */ ({
		               placeId: place.place_id,
		               location: place.geometry.location
		          }));
		          MARKER.setVisible(true);
		         
		          
		          var place_html = 
		             '<div class="place" ' +
		                'data-place_id="' + place.place_id + '" ' +
		                'data-place_lat="' + place.geometry.location.lat() + '" ' +
		                'data-place_lng="' + place.geometry.location.lng() + '">' +
		             '   <div class="place_nm">' + place.name + '</div>' +
		             '   <div class="place_address">' + place.formatted_address + '</div>' +
		             '   <button type="button" class="btn btn-xs btn-primary btnAddPlace">추가</button>' +
		             '</div>';

		          INFO_WINDOW = new google.maps.InfoWindow({
		                content: place_html
		          });

		          INFO_WINDOW.open(MAP_VIEW, MARKER);

		          google.maps.event.addListener(INFO_WINDOW,'domready', add_place_event_handler);
		          
		        });
		   }
		   
		   function add_place_event_handler(){

		      $(".btnAddPlace").click(function(){

		         var place_id = $(this).closest(".place").data("place_id");
		         var place_lat = $(this).closest(".place").data("place_lat");
		         var place_lng = $(this).closest(".place").data("place_lng");
		         var place_nm = $(this).closest(".place").find(".place_nm").html();
		         var place_address = $(this).closest(".place").find(".place_address").html();

		         console.log("place_id : " + place_id);
		         console.log("place_lat : " + place_lat);   
		         console.log("place_lng : " + place_lng);   
		         console.log("place_nm : " + place_nm);   
		         console.log("place_address : " + place_address);   
		         
		         //INFO_WINDOW.close();
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
	<div class="container-body">
		<div>
			<button id="btnAddPlace" class="btn btn-sm btn-primary btn-outline" type="button">장소 추가</button>
                
            <!-- Modal insert-->
            <div class="modal fade" id="addPlaceModal" aria-hidden="false" aria-labelledby="addPlacetModalTitle" role="dialog" tabindex="-1">
               <div class="modal-dialog modal-simple">
                  <form class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="addPlaceModalTitle">장소 추가</h4>
                     </div>
                     <div class="modal-body">
                        <div class="row">
                           <div class="col-xl-12 form-group">
                              <input id="inputSearch" type="text" class="form-control" name="title" placeholder="검색어를 입력하세요.">
                           </div>
                           <div class="col-xl-12 form-group" style="height: 500px;">
                              <div id="map"></div>
                           </div>
                           <div class="col-md-12 float-right">
                              <button id="btnAddPlaceInsert" class="btn btn-sm btn-primary btn-outline" data-dismiss="modal" type="button">등록</button>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <!-- End Modal -->
			
		</div>
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

	<!-- Bootstrap core JavaScript -->\
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
	
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUJWZs4cfbXps1_cx8k3VT_axB83t6iGM&libraries=places&callback=initMap"
		async defer></script>

</body>

</html>