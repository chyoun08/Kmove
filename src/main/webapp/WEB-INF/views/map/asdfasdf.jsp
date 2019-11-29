<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="bootstrap admin template">
    <meta name="author" content="">
    
    <title>Google Map Autocomplate | Remark Admin Template</title>
    
    <link rel="apple-touch-icon" href="/resources/assets/images/apple-touch-icon.png">
    <link rel="shortcut icon" href="/resources/assets/images/favicon.ico">
    
    <!-- Stylesheets -->
    <link rel="stylesheet" href="/resources/global/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/global/css/bootstrap-extend.min.css">
    <link rel="stylesheet" href="/resources/assets/css/site.min.css">
    
    <!-- Plugins -->
    <link rel="stylesheet" href="/resources/global/vendor/animsition/animsition.css">
    <link rel="stylesheet" href="/resources/global/vendor/asscrollable/asScrollable.css">
    <link rel="stylesheet" href="/resources/global/vendor/switchery/switchery.css">
    <link rel="stylesheet" href="/resources/global/vendor/intro-js/introjs.css">
    <link rel="stylesheet" href="/resources/global/vendor/slidepanel/slidePanel.css">
    <link rel="stylesheet" href="/resources/global/vendor/flag-icon-css/flag-icon.css">
    
    
    <!-- Fonts -->
    <link rel="stylesheet" href="/resources/global/fonts/web-icons/web-icons.min.css">
    <link rel="stylesheet" href="/resources/global/fonts/brand-icons/brand-icons.min.css">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>
    
    <!--[if lt IE 9]>
    <script src="/resources/global/vendor/html5shiv/html5shiv.min.js"></script>
    <![endif]-->
    
    <!--[if lt IE 10]>
    <script src="/resources/global/vendor/media-match/media.match.min.js"></script>
    <script src="/resources/global/vendor/respond/respond.min.js"></script>
    <![endif]-->
    
    <!-- Scripts -->
    <script src="/resources/global/vendor/breakpoints/breakpoints.js"></script>
    <script>
      Breakpoints();
    </script>
    
   <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
   <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css"/>
   <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css"/>

<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
   height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
   height: 500px;
   margin: 0;
   padding: 0;
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
</style>
   
  </head>
  <body class="animsition page-faq">
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega" role="navigation">
    
      <div class="navbar-container container-fluid" style="margin-left: 0px;">
        <!-- Navbar Collapse -->
        <div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">
          <!-- Navbar Toolbar -->
          <ul class="nav navbar-toolbar">
            <li class="nav-item hidden-float" id="toggleMenubar">
              <a class="nav-link" data-toggle="menubar" href="#" role="button">
                <i class="icon hamburger hamburger-arrow-left">
                  <span class="sr-only">Toggle menubar</span>
                  <span class="hamburger-bar"></span>
                </i>
              </a>
            </li>
            <li class="nav-item hidden-sm-down" id="toggleFullscreen">
              <a class="nav-link icon icon-fullscreen" data-toggle="fullscreen" href="#" role="button">
                <span class="sr-only">Toggle fullscreen</span>
              </a>
            </li>
            <li class="nav-item hidden-float">
              <a class="nav-link icon wb-search" data-toggle="collapse" href="#" data-target="#site-navbar-search"
                role="button">
                <span class="sr-only">Toggle Search</span>
              </a>
            </li>
            
          </ul>
          <!-- End Navbar Toolbar -->
    
          <!-- Navbar Toolbar Right -->
          <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">
            <li class="nav-item dropdown">
              <a class="nav-link" data-toggle="dropdown" href="javascript:void(0)" data-animation="scale-up"
                aria-expanded="false" role="button">
                <span class="flag-icon flag-icon-us"></span>
              </a>
              <div class="dropdown-menu" role="menu">
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-gb"></span> English</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-fr"></span> French</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-cn"></span> Chinese</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-de"></span> German</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem">
                  <span class="flag-icon flag-icon-nl"></span> Dutch</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link navbar-avatar" data-toggle="dropdown" href="#" aria-expanded="false"
                data-animation="scale-up" role="button">
                <span class="avatar avatar-online">
                  <img src="/resources/global/portraits/5.jpg" alt="...">
                  <i></i>
                </span>
              </a>
              <div class="dropdown-menu" role="menu">
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon wb-user" aria-hidden="true"></i> Profile</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon wb-payment" aria-hidden="true"></i> Billing</a>
                <a class="dropdown-item" href="javascript:void(0)" role="menuitem"><i class="icon wb-settings" aria-hidden="true"></i> Settings</a>
                <div class="dropdown-divider" role="presentation"></div>
                <a class="dropdown-item" href="/logout" role="menuitem"><i class="icon wb-power" aria-hidden="true"></i> Logout</a>
              </div>
            </li>
            <li class="nav-item dropdown" id="nav_board">
              <a class="nav-link" href="/board" title="board" role="button">
                <i class="icon wb-pencil" aria-hidden="true"></i>
              </a>
            </li>
            <li class="nav-item dropdown" id="nav_map">
              <a class="nav-link" href="/map" title="map" role="button">
                <i class="icon wb-map" aria-hidden="true"></i>
              </a>
            </li>
            <li class="nav-item" id="toggleChat">
              <a class="nav-link" data-toggle="site-sidebar" href="javascript:void(0)" title="Chat"
                data-url="../site-sidebar.tpl">
                <i class="icon wb-chat" aria-hidden="true"></i>
              </a>
            </li>
          </ul>
          <!-- End Navbar Toolbar Right -->
        </div>
        <!-- End Navbar Collapse -->
    
        <!-- Site Navbar Seach -->
        <div class="collapse navbar-search-overlap" id="site-navbar-search">
          <form role="search">
            <div class="form-group">
              <div class="input-search">
                <i class="input-search-icon wb-search" aria-hidden="true"></i>
                <input type="text" class="form-control" name="site-search" placeholder="Search...">
                <button type="button" class="input-search-close icon wb-close" data-target="#site-navbar-search"
                  data-toggle="collapse" aria-label="Close"></button>
              </div>
            </div>
          </form>
        </div>
        <!-- End Site Navbar Seach -->
      </div>
    </nav>    

    <!-- Page -->
    <div class="page">
      <div class="page-header">
        <h1 class="page-title">BOARD</h1>
      </div>

      <div class="page-content container-fluid">

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
    <!-- End Page -->

    <!-- Footer -->
    <footer class="site-footer">
      <div class="site-footer-legal">© 2018 <a href="http://themeforest.net/item/remark-responsive-bootstrap-admin-template/11989202">Remark</a></div>
      <div class="site-footer-right">
        Crafted with <i class="red-600 wb wb-heart"></i> by <a href="https://themeforest.net/user/creation-studio">Creation Studio</a>
      </div>
    </footer>
    <!-- Core  -->
    <script src="/resources/global/vendor/babel-external-helpers/babel-external-helpers.js"></script>
    <script src="/resources/global/vendor/jquery/jquery.js"></script>
    <script src="/resources/global/vendor/popper-js/umd/popper.min.js"></script>
    <script src="/resources/global/vendor/bootstrap/bootstrap.js"></script>
    <script src="/resources/global/vendor/animsition/animsition.js"></script>
    <script src="/resources/global/vendor/mousewheel/jquery.mousewheel.js"></script>
    <script src="/resources/global/vendor/asscrollbar/jquery-asScrollbar.js"></script>
    <script src="/resources/global/vendor/asscrollable/jquery-asScrollable.js"></script>
    <script src="/resources/global/vendor/ashoverscroll/jquery-asHoverScroll.js"></script>
    
    <!-- Plugins -->
    <script src="/resources/global/vendor/switchery/switchery.js"></script>
    <script src="/resources/global/vendor/intro-js/intro.js"></script>
    <script src="/resources/global/vendor/screenfull/screenfull.js"></script>
    <script src="/resources/global/vendor/slidepanel/jquery-slidePanel.js"></script>
    
    <!-- Scripts -->
    <script src="/resources/global/js/Component.js"></script>
    <script src="/resources/global/js/Plugin.js"></script>
    <script src="/resources/global/js/Base.js"></script>
    <script src="/resources/global/js/Config.js"></script>
    
    <script src="/resources/assets/js/Section/Menubar.js"></script>
    <script src="/resources/assets/js/Section/GridMenu.js"></script>
    <script src="/resources/assets/js/Section/Sidebar.js"></script>
    <script src="/resources/assets/js/Section/PageAside.js"></script>
    <script src="/resources/assets/js/Plugin/menu.js"></script>
    
    <script src="/resources/global/js/config/colors.js"></script>
    <script src="/resources/assets/js/config/tour.js"></script>
    <script>Config.set('assets', '../../assets');</script>
    
    <!-- Page -->
    <script src="/resources/assets/js/Site.js"></script>
    <script src="/resources/global/js/Plugin/asscrollable.js"></script>
    <script src="/resources/global/js/Plugin/slidepanel.js"></script>
    <script src="/resources/global/js/Plugin/switchery.js"></script>
    
   <script src="/resources/assets/examples/js/pages/faq.js"></script>

   <script async defer   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA4t3WgOTsDviBlweSdMjEwpRP6-9PNAio&libraries=places&callback=initMap"></script>
   
   <script>

   
   var MAP_VIEW;
   var DEFAULT_MAP_LOCATION = {lat: 37.5701, lng: 126.9769};   //kwanghwamoon
   var MARKER;
   var SEARCHED_MAP_LEVEL = 12;
   
   $(document).ready(function() {

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
  </body>
</html>