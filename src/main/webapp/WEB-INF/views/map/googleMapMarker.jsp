<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Maker Map</title>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
 * element that contains the map. 
 * 빨간 마크가 생성된다.*/
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
		function initMap() {
			// The location of Uluru
			var uluru = {
				lat : -25.344,
				lng : 131.036
			};
			var uluru2 = {
				lat : -24.344,
				lng : 131.001
			};
			// The map, centered at Uluru
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 4,
				center : uluru
			});
			// The marker, positioned at Uluru
			var marker = new google.maps.Marker({
				position : uluru,
				map : map
			});
			// The marker, positioned at Uluru2
			var marker2 = new google.maps.Marker({
				position : uluru2,
				map : map
			});
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUJWZs4cfbXps1_cx8k3VT_axB83t6iGM&callback=initMap"
		async defer></script>
</body>
</html>