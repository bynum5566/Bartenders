<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/add_editView.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/style.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/mobile-style.css">
<title>Add new ticket</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css" rel="stylesheet"></link>

</head>

<body>
	<div class="outwrap">
		<div class="inwrap">
			<h1>新增票券</h1>
			<form action="<c:url value="/addTkPD"></c:url>" method="POST" enctype="multipart/form-data">
				<table>
					<tr>
						<td><label>商品名稱</label></td>
						<td><input class="bt0" name="pdNm" type="text" required="required"></td>
					</tr>
					<tr>
						<td><label>商品數量</label></td>
						<td><input class="bt0" name="pdStk" id="pdamount" type="number" min="1" required="required"></td>
					</tr>
					<tr>
						<td><label>商品價格</label></td>
						<td><input class="bt0" name="pdPri" id="pdprice" type="number" min="1" required="required"></td>
					</tr>
					<tr>
						<td><label>Tag1</label></td>
						<td><input class="bt0" name="pdTg1" type="text" max="10"></td>
					</tr>
					<tr>
						<td><label>Tag2</label></td>
						<td><input class="bt0" name="pdTg2" type="text" max="10"></td>
					</tr>
					<tr>
						<td><label>Tag3</label></td>
						<td><input class="bt0" name="pdTg3" type="text" max="10"></td>
					</tr>
					<tr>
						<td><label>商品詳細</label></td>
						<td><textarea class="bt0" name="pdDta"></textarea></td>
					</tr>
					<tr>
						<td><label>商品圖片</label></td>
						<td>
<!-- 							<div class="dropzone"> -->
<!-- 								<div class="info"></div> -->
<!-- 							</div> -->
<!-- 							<input id="imgPlace" name="pdImg" class="image-url" /> -->
							<div id="imgs">
								<div id="img1">
									<div class="dropzone1">
										<div class="info1"></div>
									</div>
									<input id="imgPlace001" name="pdImg" class="image-url"/>
									<script type="text/javascript" src="/Bartenders/JS/imgur1-1.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/uploadPd1.js"></script>
								</div>
								<div id="img2">
									<div class="dropzone2">
										<div class="info2"></div>
									</div>
									<input id="imgPlace002" name="pdImg2" class="image-url"/>
									<script type="text/javascript" src="/Bartenders/JS/imgur2.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/uploadPd2.js"></script>
								</div>
								<div id="img3">
									<div class="dropzone3">
										<div class="info3"></div>
									</div>
									<input id="imgPlace003" name="pdImg3" class="image-url"/>
									<script type="text/javascript" src="/Bartenders/JS/imgur3.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/uploadPd3.js"></script>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="setT2"><label>票券有效期間</label></td>
						<td><input name="setTKTime" id="setB1" class="dateRange2 form-control" type="text" required="required" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input class="bt0" id="setTt1" name="tm" type="radio" value="1" checked required onfocus="showT1()">
							<label for="setTt1">設定自動上架時間</label>
							<br><input class="bt0" id="setTt2" name="tm" type="radio" value="2" onfocus="showT2()">
							<label for="setTt2">設定自動上/下架時間</label>
						</td>
					</tr>
					<tr id="setA" class="sho">
						<td class="setT1"><label>上架時間</label></td>
						<td><input name="setTimeAct" id="setA1" class="dateRange form-control" type="text" /></td>
					</tr>
					<tr id="setB" class="nosho">
						<td class="setT2"><label>上架下架時間</label></td>
						<td><input name="setTimeNon" id="setB1" class="dateRange2 form-control" type="text" /></td>
					</tr>
					<tr>
						<td colspan="2" id="bT">
							<button onclick="location.href = '/Bartenders/Dashboard.TkProducts';" class="bT">回上頁</button>
							<button class="bT" onClick="history.go(0);">重填</button>
							<input class="bT" type="submit" value="新增票券" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<%@ include file="menu.jsp"%>


	<script>
		/* Imgur Upload Script */
// 		(function (root, factory) {
// 			"use strict";
// 			if (typeof define === 'function' && define.amd) {
// 				define([], factory);
// 			} else if (typeof exports === 'object') {
// 				module.exports = factory();
// 			} else {
// 				root.Imgur = factory();
// 			}
// 		}(this, function () {
// 			"use strict";
// 			var Imgur = function (options) {
// 				if (!this || !(this instanceof Imgur)) {
// 					return new Imgur(options);
// 				}

// 				if (!options) {
// 					options = {};
// 				}

// 				if (!options.clientid) {
// 					throw 'Provide a valid Client Id here: https://api.imgur.com/';
// 				}

// 				this.clientid = options.clientid;
// 				this.endpoint = 'https://api.imgur.com/3/image';
// 				this.callback = options.callback || undefined;
// 				this.dropzone = document.querySelectorAll('.dropzone');
// 				this.info = document.querySelectorAll('.info');

// 				this.run();
// 			};

// 			Imgur.prototype = {
// 				createEls: function (name, props, text) {
// 					var el = document.createElement(name), p;
// 					for (p in props) {
// 						if (props.hasOwnProperty(p)) {
// 							el[p] = props[p];
// 						}
// 					}
// 					if (text) {
// 						el.appendChild(document.createTextNode(text));
// 					}
// 					return el;
// 				},
// 				insertAfter: function (referenceNode, newNode) {
// 					referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
// 				},
// 				post: function (path, data, callback) {
// 					var xhttp = new XMLHttpRequest();

// 					xhttp.open('POST', path, true);
// 					xhttp.setRequestHeader('Authorization', 'Client-ID ' + this.clientid);
// 					xhttp.onreadystatechange = function () {
// 						if (this.readyState === 4) {
// 							if (this.status >= 200 && this.status < 300) {
// 								var response = '';
// 								try {
// 									response = JSON.parse(this.responseText);
// 								} catch (err) {
// 									response = this.responseText;
// 								}
// 								callback.call(window, response);
// 							} else {
// 								throw new Error(this.status + " - " + this.statusText);
// 							}
// 						}
// 					};
// 					xhttp.send(data);
// 					xhttp = null;
// 				},
// 				createDragZone: function () {
// 					var p1, p2, input;

// 					p1 = this.createEls('p', {}, '請點此區選擇1張圖片，');
// 					p2 = this.createEls('p', {}, '或將1張圖片拉至此區。');
// 					input = this.createEls('input', { type: 'file', className: 'input', accept: 'image/*', required: 'required' });

// 					Array.prototype.forEach.call(this.info, function (zone) {
// 						zone.appendChild(p1);
// 						zone.appendChild(p2);
// 					}.bind(this));
// 					Array.prototype.forEach.call(this.dropzone, function (zone) {
// 						zone.appendChild(input);
// 						this.status(zone);
// 						this.upload(zone);
// 					}.bind(this));
// 				},
// 				loading: function () {
// 					var div, table, img;

// 					div = this.createEls('div', { className: 'loading-modal' });
// 					table = this.createEls('table', { className: 'loading-table' });
// 					img = this.createEls('img', { className: 'loading-image', src: '/Bartenders/images/loading-spin.svg' });

// 					div.appendChild(table);
// 					table.appendChild(img);
// 					document.body.appendChild(div);
// 				},
// 				status: function (el) {
// 					var div = this.createEls('div', { className: 'status' });

// 					this.insertAfter(el, div);
// 				},
// 				matchFiles: function (file, zone) {
// 					var status = zone.nextSibling;

// 					if (file.type.match(/image/) && file.type !== 'image/svg+xml') {
// 						document.body.classList.add('loading');
// 						status.classList.remove('bg-success', 'bg-danger');
// 						status.innerHTML = '';

// 						var fd = new FormData();
// 						fd.append('image', file);

// 						this.post(this.endpoint, fd, function (data) {
// 							document.body.classList.remove('loading');
// 							typeof this.callback === 'function' && this.callback.call(this, data);
// 						}.bind(this));
// 					} else {
// 						status.classList.remove('bg-success');
// 						status.classList.add('bg-danger');
// 						status.innerHTML = 'Invalid archive';
// 					}
// 				},
// 				upload: function (zone) {
// 					var events = ['dragenter', 'dragleave', 'dragover', 'drop'],
// 						file, target, i, len;

// 					zone.addEventListener('change', function (e) {
// 						if (e.target && e.target.nodeName === 'INPUT' && e.target.type === 'file') {
// 							target = e.target.files;

// 							for (i = 0, len = target.length; i < len; i += 1) {
// 								file = target[i];
// 								this.matchFiles(file, zone);
// 							}
// 						}
// 					}.bind(this), false);

// 					events.map(function (event) {
// 						zone.addEventListener(event, function (e) {
// 							if (e.target && e.target.nodeName === 'INPUT' && e.target.type === 'file') {
// 								if (event === 'dragleave' || event === 'drop') {
// 									e.target.parentNode.classList.remove('dropzone-dragging');
// 								} else {
// 									e.target.parentNode.classList.add('dropzone-dragging');
// 								}
// 							}
// 						}, false);
// 					});
// 				},
// 				run: function () {
// 					var loadingModal = document.querySelector('.loading-modal');

// 					if (!loadingModal) {
// 						this.loading();
// 					}
// 					this.createDragZone();
// 				}
// 			};

// 			return Imgur;
// 		}));

// 		$('#imgPlace').hide();

		// 	Upload js
// 		var feedback = function (res) {
// 			if (res.success === true) {
// 				$('#imgPlace').name = "na";
// 				var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
// 				document.querySelector('.status').innerHTML =
// 					'<input id="realImg" name="pdImg" style="display:none;" class="image-url" value=\"' + get_link + '\" readonly/><br>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
// 			}
// 		};

// 		new Imgur({
// 			clientid: 'ceb59faf76db10f',
// 			callback: feedback
// 		});


		$('.sho').show();
		$('.nosho').hide();

		function showT1() {
			var T1 = document.getElementById("setA");
			var T2 = document.getElementById("setB");
			T1.className = "sho";
			T1.name = "setTimeAct";
			T2.className = "nosho";
			T2.name = "setTimeNon";
			$('.sho').show();
			$('.nosho').hide();
		}

		function showT2() {
			var T1 = document.getElementById("setA");
			var T2 = document.getElementById("setB");
			T2.className = "sho";
			T2.name = "setTimeAct";
			T1.className = "nosho";
			T1.name = "setTimeNon";
			$('.sho').show();
			$('.nosho').hide();
		}

		var d = new Date();

		var month = d.getMonth() + 1;
		var day = d.getDate();

		var output = d.getFullYear() + '/' + (month < 10 ? '0' : '') + month
			+ '/' + (day < 10 ? '0' : '') + day + " " + d.getHours() + ":"
			+ d.getMinutes() + ":" + d.getSeconds();

		$("input.dateRange").daterangepicker(
			{
				"alwaysShowCalendars": true,
				opens: "left",
				timePicker: true,
				timePickerIncrement: 1,
				singleDatePicker: true,
				showDropdowns: true,
				minDate: output,
				startDate: output,
				locale: {
					format: "YYYY/MM/DD HH:mm:ss",
					separator: " ~ ",
					applyLabel: "確定",
					cancelLabel: "清除",
					fromLabel: "開始日期",
					toLabel: "結束日期",
					customRangeLabel: "自訂日期區間",
					daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
					monthNames: ["1月", "2月", "3月", "4月", "5月", "6月",
						"7月", "8月", "9月", "10月", "11月", "12月"],
					firstDay: 1
				}
			});

		$("input.dateRange").on("cancel.daterangepicker", function (ev, picker) {
			$(this).val("");
		});

		$("input.dateRange2").daterangepicker(
			{
				"alwaysShowCalendars": true,
				opens: "left",
				timePicker: true,
				timePickerIncrement: 1,
				showDropdowns: true,
				minDate: output,
				startDate: output,
				locale: {
					format: "YYYY/MM/DD HH:mm:ss",
					separator: " ~ ",
					applyLabel: "確定",
					cancelLabel: "清除",
					fromLabel: "開始日期",
					toLabel: "結束日期",
					customRangeLabel: "自訂日期區間",
					daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
					monthNames: ["1月", "2月", "3月", "4月", "5月", "6月",
						"7月", "8月", "9月", "10月", "11月", "12月"],
					firstDay: 1
				}
			});

		$("input.dateRange2").on("cancel.daterangepicker",
			function (ev, picker) {
				$(this).val("");
			});
			
		$(function () {
			if (window.history && window.history.pushState) {
				$(window).on('popstate', function () {
					window.history.pushState('forward', null, '#');
					window.history.forward(1);
				});
			}
			window.history.pushState('forward', null, '#');
			window.history.forward(1);
		})
	</script>

</body>

</html>