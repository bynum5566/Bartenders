<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單搜尋</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>


body {
	margin:0;
	padding:0;
	background: url("/Bartenders/images/BarImgOrderUser.png") no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
#container{
border:2px green solid;
height:600px;
width:50%;

margin:0 auto;
}
.mapDiv {
	height: 600px;
	width: 800px;
	float:left;
	
}
</style>

</head>

<body>
<br>
<br>
<br>
<br>
	<h1 align=center style="color:white;font-size:48px">訂單搜尋</h1>
			<div id="container">
				<div id="map" class="mapDiv" align=center></div>
				<button id="btn" style="width:60px;height:30px;">搜尋</button>
			</div>

	<script>
		$('#btn').on('click', function(){
			var prefix = 'logistic/OrderSearch';
			reloadMarkers(prefix,1);
			getMarkers(prefix,1);
		})
	</script>

	<script src="../scripts/MapStyle.js"></script>
	<script src="../scripts/mapForOrder.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	
</body>
</html>