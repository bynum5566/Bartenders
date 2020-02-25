<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>CreateActivity</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" /></noscript>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		.container {
			margin: auto;
			border: 2px black solid;
			width: 800px;
			height: 800px;

		}

		.mapDiv {
			height: 600px;
			width: 600px;
			display: inline-block;
		}

		.chooseType {
			border: 2px black solid;
			width: 150px;
			height: 400px;
			display: inline-block;
			vertical-align: top;
			padding: 5px;
			margin: 15px;

		}

		label {
			display: block;
			vertical-align: top;
		}

		input {
			display: inline-block;
			vertical-align: top;
		}

		.date {
			width: 130px;
		}
	</style>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
	.small {
		display: flex;
		align-self: center;
	}

	.small a {
		font-size: 16px;
		font-weight: 400;
		color: #888;
		font-family: 111.otf;
	}

	.small a+a {
		margin-left: 15px;
	}
</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<h1 align=center>地圖搜尋</h1>
						<div align=center>
							<label>輸入地址<input id="address" type="text" style="width:500px"
									value="103台北市大同區承德路三段49號"></label><button id="addressBtn"
								onclick="getInput()">確認</button>
							<button id="autoAddressBtn" onclick="autoLocating()">自動定位</button>
						</div>
						<div align=center>
							<button id="shop" class="search">查詢洋酒專賣</button>
							<button id="bar" class="search">查詢酒吧</button>
							<button id="show" class="search">查詢酒展</button>
							<button id="party" class="search">查詢派對</button>
							<button class="return">回上一頁</button>
						</div>
						<div class="container" align=center>
							<div id="map" class="mapDiv"></div>
							<div id="choose" class="chooseType">
								<!-- 
			<form action="searchMarker.do" method="post">
				<label>搜尋類型:</label>
				<label><input type="checkbox" name="type" value="bar">酒吧</label>
				<label><input type="checkbox" name="type" value="shop">專賣店</label>
				<label><input type="checkbox" name="type" value="show">酒展</label>
				<label><input type="checkbox" name="type" value="party">派對</label>
				
				<hr>
				<label><input type="submit"  value="查詢"></label>
			</form>
			<br>
			<br>
			<br>
			 -->
								<form class="formBox">
									<label>搜尋類型:</label>
									<label><input type="checkbox" class="multi" name="type2" value="bar">酒吧</label>
									<label><input type="checkbox" class="multi" name="type2" value="shop">專賣店</label>
									<label><input type="checkbox" class="multi" name="type2" value="show">酒展</label>
									<label><input type="checkbox" class="multi" name="type2" value="party">派對</label>
									<br>
									<label><button type="button" onclick="chooseType()">查詢</button></label>
								</form>
								<hr>
								<form class="formBox">
									<label>搜尋日期:</label>
									<label><input id="beginTime" class="date" type="text" name="beginTime"
											placeholder="開始時間"></label>
									<br>
									<label><input id="endTime" class="date" type="text" name="endTime"
											placeholder="結束時間"></label>
									<br>
									<label><button type="button" onclick="chooseDate()">查詢</button></label>
								</form>

							</div>
						</div>

					</section>
				</div>
			</section>
		</article>
	</div>
	<script>
		//按類型複合搜尋
		function chooseType() {
			console.log('this is script button');
			var list = [];
			var box = document.getElementsByClassName('multi');
			console.log('all boxes: ', box);
			for (var i = 0; i < box.length; i++) {
				if (box[i].checked == true) {
					console.log('checked: ', box[i].value);
					list.push(box[i].value);
				}

			}
			console.log('list contain:', list);
			for (var i = 0; i < list.length; i++) {
				reloadMarkers('ActivityType', list[i]);
			}
			for (var i = 0; i < list.length; i++) {
				getMarkers('ActivityType', list[i]);
			}
		}

		//按時間複合搜尋
		function chooseDate() {
			var list = [];
			var beginTime = document.getElementById('beginTime');
			var endTime = document.getElementById('endTime');
			console.log('時間區隔為', beginTime.value, ' ~ ', endTime.value)

			var biginDate = new Date(beginTime.value);
			console.log(typeof biginDate);
			console.log(typeof today);
			var beginDiff = (biginDate - today) / 1000 / 60;
			console.log('時間差為', beginDiff, '分')
		}

		//日期選擇器
		// begin time
		var today = new Date();
		var current = today.getHours() + ':' + today.getMinutes();
		console.log('current time: ', today.getMonth() + 1 + '/' + today.getDate() + ' ' + today.getHours() + ':' + today.getMinutes());
		const myInput = document.getElementById("beginTime");
		const fp = flatpickr(myInput, {
			enableTime: true,
			dateFormat: "yy/m/d H:i",
			maxDate: new Date().fp_incr(14), // 14 days from now
			minDate: "today",
			minTime: current,
			time_24hr: true
		});

		// end time
		const myInput2 = document.getElementById("endTime");
		const fp2 = flatpickr(myInput2, {
			enableTime: true,
			dateFormat: "yy/m/d H:i",
			maxDate: new Date().fp_incr(14), // 14 days from now
			minDate: "today",
			minTime: current,
			time_24hr: true
		});

		//地址按鈕
		var locationLat;
		var locationLng;
		async function getInput() {
			var address = document.getElementById('address').value

			//等fetch做完再繼續
			await fetch('https://maps.googleapis.com/maps/api/geocode/json?address=' + address + '&key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E').then(
				function (response) {
					return response.json();
				}).then(function (JSONdata) {
					console.log('this is data results: ', JSONdata.results);
					//console.log("this is location's latlng: ", JSONdata.address_components);
					var all = JSONdata.results.forEach(function (item) {
						locationLat = item.geometry.location.lat;
						locationLng = item.geometry.location.lng;

					})
				});//fetch結束
			console.log("指定位置", locationLat, '; ', locationLng);
			relocate(locationLat, locationLng);
		}

		//個別類型搜尋
		$('.search').on('click', function () {
			var type = this.id;
			var prefix = 'ActivityType';
			reloadMarkers(prefix, type);
			getMarkers(prefix, type);
		})

		$(".return").on("click", function () {
			window.location.href = '<c:url value="/ManageActivity"/>';
		})

	</script>
	<script src="scripts/MapStyle.js"></script>
	<script src="scripts/mapForSingleMapWithMarker.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
	<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	</body>

</html>