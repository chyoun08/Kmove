<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 마커가 여러개있는 집합을 cluster라고한다 -->

<!DOCTYPE html>
<html>
<head>
<title>Cluster Map</title>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
   height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}
</style>
</head>
<body>
   <div id="map"></div>
   <script>
      var map;
      function initMap() {
         
         var astana = {
               
                      lat : 51.1587134,
                      lng : 71.4666985
               
         };
         
         var astana2 = {
               lat : 53.1587134,
                  lng : 71.4666985 
         }
         var map = new google.maps.Map(
               document.getElementById('map'),{
                  zoom:6,
                  center : astana
               });
         
         var marker = new google.maps.Marker({
          position : astana,
          map: map
         });
         
         var marker2 = new google.maps.Marker({
            position : astana2,
            map: map
           });
         
      var contentString = 
          '<div id="content">'+
          '<div id="siteNotice">'+
          '</div>'+
          '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
          '<div id="bodyContent">'+
          '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
          'sandstone rock formation in the southern part of the '+
          'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
          'south west of the nearest large town, Alice Springs; 450&#160;km '+
          '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
          'features of the Uluru - Kata Tjuta National Park. Uluru is '+
          'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
          'Aboriginal people of the area. It has many springs, waterholes, '+
          'rock caves and ancient paintings. Uluru is listed as a World '+
          'Heritage Site.</p>'+
          '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
          'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
          '(last visited June 22, 2009).</p>'+
          '</div>'+
          '</div>';
          
          var infowindow = new google.maps.InfoWindow({
             content: contentString
          });
          
          marker.addListener('click', function(){
           infowindow.open(map,marker);  
          });
          
          var contentString2 = 
              '<div class="card" style="width:200px">' +
             '<img class="card-img-top" src="/resources/img/544750.jpg" alt="Card image" width="200px;">' +
             '<div class="card-body">' +
             '<h4 class="card-title">John Doe</h4>' +
             '<p class="card-text">Some example text.</p>' +
             '<a href="#" class="btn btn-primary">See Profile</a>' +
             '</div>' +
             '</div>';
             var infowindow2 = new google.maps.InfoWindow({
                content: contentString2
             });
             
             marker2.addListener('click', function(){
              infowindow2.open(map,marker2);  
             });
      }
      
      
            
   </script>
   <script 
   	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4eURa0MXTxs_4dwb3HmTrUCDVTvGIEaQ&callback=initMap">
   </script>
</body>
</html>