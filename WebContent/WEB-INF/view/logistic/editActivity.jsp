<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>CreateActivity</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>	<noscript>
		<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		body {
			margin: 0px auto;
		}

		table {
			border-collapse: collapse;
		}

		td {
			border: 1px solid black;
		}

		div {
			margin: 0px auto;
		}

		fieldset {
			text-align: center;
			width: 1200px;
		}

		#map {
			height: 600px;
			width: 600px;
		}


		.showEachMap {
			width: auto;
			display: block;
			margin: 0 auto;
			/*网页中内容居中显示*/
			padding: 5px;
			font-size: 9pt;
			/* 9pt的字体是没有锯齿的  */
			height: auto;
			/*因整个div部分，会有一部分动态显示或者隐藏，所以将高度设为auto*/
		}

		#hiddenx {
			display: none;
		}

		.hideMap {
			display: none;
		}

		.hiddenBtn {
			background-color: grey;

			text-align: center;
			margin: 0 auto;
			display: block;

			text-decoration: none;
			padding-top: 10px;
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

<body align=center class="is-preload">
	<div id="page-wrapper">
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<h1>編輯活動</h1>

						<div id="idiv" align=center>
							<form action="updateActivity.do" method="post" enctype="multipart/form-data">
								<fieldset style="width: 500px">
									<legend>編輯活動</legend>
									<c:forEach var="Activity" items="${activity}" varStatus="status">
										<h3 id="ih3" style="margin: 10px 10px 0px 10px; display: inline-block"><input
												type="text" name="name" value="${Activity.name}"></h3>
										<p id="ip" align="right"
											style="color: red; margin: 10px 20px 10px 70px; display: inline">
											<input type="radio" id="party" name="type" value="party" check=""><label
												for="party">派對</label>
											<input type="radio" id="show" name="type" value="show" check=""> <label
												for="show">酒展</label></p>

										<p style="margin: 5px"><input id="beginTime" type="text" name="beginTime"
												value="${Activity.beginTime}"> ~ <input id="endTime" type="text"
												name="endTime" value="${Activity.endTime}"></p>
										<p style="margin: 5px"><input type="text" name="address"
												value="${Activity.address}" style="width:350px"></p>
										<p>參加人數上限:
											<input type="text" name="targetNum" style="width:100px"
												value="${Activity.targetNum}"> /內建人數:
											<input type="text" name="actualNum" style="width:100px"
												value="${Activity.actualNum}">
										</p>
										<p>地圖位置: <button id="Bhidden" type="button">確認地圖</button><img id="smallok"
												src="images/ok.jpg" style="visibility:collapse">

											<input id="lat" type="hidden" name="lat" value="${Activity.lat}">

											<input id="lng" type="hidden" name="lng" value="${Activity.lng}">
										</p>
										<div class="showEachMap">
											<div id="hidden" class="hideMap">
												<div id="map" style="width:500px;height:500px;background:red"></div>
											</div>
										</div>
										<img alt="" src="images/${Activity.img}">
										<input type="file" name="uploadFile"/>
										<p><input type="text" value="${Activity.brief}" style="width:400px;height:250px"
												name="brief"></p>
										<input type="hidden" name="preUrl" value="${preUrl}">
										<input type="hidden" name="activityId" value="${Activity.activityId}">
										<input type="submit" value="確認">
										<script>
											var type = ${ Activity.type }
											if (type = 'party') {
												console.log("it's party");
												document.getElementById('party').checked = true;
											} else if (type = 'show') {
												console.log("it's show");
												document.getElementById('show').checked = true;
											}
											var newLat = document.getElementById('lat');
											var newLng = document.getElementById('lng');

										</script>
									</c:forEach>
								</fieldset>
							</form>
						</div>

					</section>
				</div>
			</section>
		</article>
	</div>
	<script>
		var preUrl = "${preUrl}";
		console.log(preUrl);

		$('#Bhidden').on('click', function () {
			console.log('start');
			if ($('#hidden').css('display') == 'none') {
				console.log('try to show');
				showTargetMap();
				console.log('reload done: ');
			} else if ($('#hidden').css('display') == 'block') {
				console.log('try to hide');
				hideTargetMap();
			}
		});

		function showTargetMap() {
			document.getElementById('hidden').style.display = "block";
		};
		function hideTargetMap() {
			document.getElementById('hidden').style.display = "none";
		};
		//小OK顯示
		$('#map').on("click", function () {
			checkMap()
		});
		function checkMap() {
			console.log("checkMap");
			var ok = document.getElementById("smallok")
			var checklat = document.getElementById("lat")
			if (checklat.value != 0) {
				ok.style.visibility = 'visible';
			}
		}



		// begin time
		const myInput = document.getElementById("beginTime");
		const fp = flatpickr(myInput, {
			enableTime: true,
			dateFormat: "yy/m/d H:i",
			maxDate: new Date().fp_incr(14), // 14 days from now
			minDate: "today",
			minTime: "16:00",
			maxTime: "22:00"
		});

		// end time
		const myInput2 = document.getElementById("endTime");
		const fp2 = flatpickr(myInput2, {
			enableTime: true,
			dateFormat: "yy/m/d H:i",
			maxDate: new Date().fp_incr(14), // 14 days from now
			minDate: "today",
			minTime: "16:00",
			maxTime: "22:00"
		});

		$("#manage").on("click", function () {
			var userId = this.id
			window.location.href = '<c:url value="/queryActivity.do"/>?userId=5645';
		})
		$("#cancel").on("click", function () {
			CancelLocating();
			cancelLocating = true;
			console.log('click on cancel locating');
		})
	</script>

	<script src="./scripts/MapStyle.js"></script>
	<script src="./scripts/mapForLocation.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E&libraries=geometry&callback=initMap"></script>
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