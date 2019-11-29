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
		$(document).ready(function() {
			getMapData();
		});

		function initMap() {

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 3,
				center : {
					lat : -28.024,
					lng : 140.887
				}
			});

			// Create an array of alphabetical characters used to label the markers.
			var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

			var markers = locations.map(function(location, i) {
				return new google.maps.Marker({
					position : location,
					label : labels[i % labels.length]
				});
			});

			// Add a marker clusterer to manage the markers.
			var markerCluster = new MarkerClusterer( map, markers, {
						imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
					});
		}
		var locations = [];

		function getMapData() {

			$.ajax({
				type : 'get',
				url : '/map/clusterAjaxJsonService',
				dataType : 'json',
				beforeSend : function(xhr) {
					//xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
					xhr.setRequestHeader("AJAX", true);
				},
				success : function(data, status, xhr) {
					//		                   console.log("------------------");
					//		                   console.log(data);
					locations = data;
					initMap();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					if (jqXHR.responseText == "timeout") {
						window.location.href = "/login"
					} else {
						alertify.notify('Opps!! 글 Map data를 받는 과정에 문제가 생겼습니다.',
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
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUJWZs4cfbXps1_cx8k3VT_axB83t6iGM&callback=initMap"
		async defer></script>
</body>
</html>