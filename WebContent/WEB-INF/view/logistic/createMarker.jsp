<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<title>CreateMarker</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
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
						<h1>設定地點</h1>

						<div align=center>
							<table>
								<tr>
									<td>
										<button class="return">回上一頁</button>
									</td>
								</tr>
							</table>
						</div>
						<div align=center>
							<form action="saveMarker.do" method="post" enctype="multipart/form-data">
								<fieldset style="width: 400px">
									<legend>建立地點</legend>
									<table align=center>
										<tr>
											<td>店家名稱: <input type="text" name="name"></td>
										</tr>
										<tr>
											<td>店家地址: <input type="text" name="address"></td>
										</tr>
										<tr>
											<td>店家座標: <input id="fake1" type="text" value="select on map" name="fakelat"
													disabled> <input id="lat" type="hidden" name="lat"></td>

										</tr>
										<tr>
											<td>店家座標: <input id="fake2" type="text" value="select on map" name="fakelng"
													disabled> <input id="lng" type="hidden" name="lng"></td>
										</tr>
										<tr>
											<td>照片: <input type="file" name="uploadFile"/></td>
										</tr>
										<tr>
											<td>簡介: <input type="text" name="brief"></td>
										</tr>
										<tr>
											<td>開始營業: <input id="beginTime" type="text" name="beginTime"
													placeholder="Select your date"></br> <br> 打烊時間: <input id="endTime"
													type="text" name="endTime" placeholder="Select your date"></td>
										</tr>
										<tr>
											<td>類型: <input type="radio" id="bar" name="type" value="bar">
												<label for="bar">酒吧</label> <input type="radio" id="shop" name="type"
													value="shop"> <label for="shop">洋酒專賣</label>
											</td>
										</tr>
										<tr>
											<td><input type="submit" value="送出"></td>
										</tr>
									</table>
								</fieldset>
							</form>
						</div>
					</section>
				</div>
			</section>
		</article>
	</div>



	<script>
		// begin time
		const myInput = document.getElementById("beginTime");
		const fp = flatpickr(myInput, {
			enableTime: true,
			noCalendar: true,
			dateFormat: "H:i",
		});

		// end time
		const myInput2 = document.getElementById("endTime");
		const fp2 = flatpickr(myInput2, {
			enableTime: true,
			noCalendar: true,
			dateFormat: "H:i",
		});

		$(".return").on("click", function () {
			window.location.href = '<c:url value="/ManageBar"/>';
		})
	</script>
	<div id="map"></div>
	<script src="scripts/mapForLocation.js"></script>
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