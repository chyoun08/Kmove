<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 마커가 여러개있는 집합을 cluster라고한다 -->

<!DOCTYPE html>
<html>
<head>
<title>Cluster Map</title>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet">

<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Alertify -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

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

				lat : 36,
				lng : 128

			};

			var uluru = {
				lat : 37.55,
				lng : 126.85
			};

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 6,
				center : astana
			});
			
			// The marker, positioned at Uluru
			var marker = new google.maps.Marker({
				position : uluru,
				map : map
			});
			
			google.maps.event.addListener(map, 'click', function(event) {
				console.log(event.latLng.lat());
				console.log(event.latLng.lng());
			});
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4eURa0MXTxs_4dwb3HmTrUCDVTvGIEaQ&callback=initMap">
		
	</script>
</body>
</html>