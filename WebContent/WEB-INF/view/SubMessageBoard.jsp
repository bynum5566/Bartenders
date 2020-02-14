<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<link rel="stylesheet" type="text/css"
	href="/Bartenders/images/add_editView.css">

<noscript>
	<link rel="stylesheet" href="/Bartenders/images/noscript.css" />
</noscript>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet"></link>


<title>酒吧</title>

<style>
h1.panel, form.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	border: solid 1px #c3c3c3;
}

form.panel {
	height: 600px;
	width: 900px;
	background-color: transparent;
}
</style>
</head>
<body>

	<h1>
		<a href="<c:url value="/messageBoardShow.controller"/>">返回留言板</a>
	</h1>

	<h1 style="color: WhiteSmoke;" class="flip" align="right">縮放主題留言按此</h1>

	<!--縮放用JS，開始-->
	<script type="text/javascript">
		$(".flip").click(function() {
			$(".panel").slideToggle("slow");
		});
	</script>
	<!--縮放用JS，結束-->

	<form action='subMessageBoard.controller' method='post' class="panel">
		<table border='1'>

			<tr>
				<td><b>文章</b></td>
				<td width='700'><textarea rows='30' cols='70' name='blabla'
						placeholder="請輸入文章" required="required"></textarea></td>
			</tr>

			<tr>
				<td><b>刪除碼</b></td>
				<td><input type="password" name="deletePassword" size="16"
					maxlength="8" placeholder="請輸入刪除碼" required="required"> <small>(留言刪除用，英文數字最多8個)</small>
				</td>
			</tr>
			<tr>
				<td align="center"><b>圖片</b></td>
				<td>
					<div class="dropzone" id="wordPicture" required="required">
						<div class="info"></div>
					</div> <input id="imgPlace" name="pdImg" class="image-url" />
				</td>
			</tr>

			<tr>
				<td><input type='submit' value='提交'></td>
			</tr>
		</table>
	</form>

	<div style="color: white">
		<c:forEach var="messageBoard" items="${newest}">
			<div>
				<div align="center">
					<img id="pdPicture" src="<c:out value="${messageBoard.picture}" />">
				</div>

				<div style="margin: 10px;">
					<h3 style="margin: 10px; text-decoration: 10px;">帳號:${messageBoard.account}</h3>
					<div id="fb-root"></div>
					<script async defer crossorigin="anonymous"
						src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0"></script>
					

				<h3 align="center">&lt; ${messageBoard.title} &gt;</h3>

				<div style="margin: 40px;" id=""><${messageBoard.blabla}</div>

				<hr>

			</div>
		</c:forEach>
	</div>

	<div style="color: white">
		<c:forEach var="subMessageBoard" items="${subnewest}">
			<tr>
				<td><div class="pdData">
						<img height="100" width="200" id="pdPicture"
							src="<c:out value="${subMessageBoard.picture}"/>">
					</div></td>
				<td style='vertical-align: top bottom:;'>帳號:${subMessageBoard.account}
					&nbsp &nbsp SubID:${subMessageBoard.subId}<br>
					<div style="margin: 10px;">${subMessageBoard.blabla}<br>
					</div> ${subMessageBoard.time}<br>

					<hr>
				</td>
			</tr>

		</c:forEach>
	</div>




	<form action='subMessageBoardDelete.controller' method='post'>

		<div id="del">
			<table style="float: right;">
				<tbody>
					<tr>
						<td align="center" style="white-space: nowrap;">刪除留言: <input
							type="text" name="subId" placeholder="留言subId"><input
							type="password" name="deletePassword" size="8" maxlength="8"
							placeholder="刪除碼"> <input type="submit" value=" 送出 "></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>


	<script>
		/* Imgur Upload Script */
		(function(root, factory) {
			"use strict";
			if (typeof define === 'function' && define.amd) {
				define([], factory);
			} else if (typeof exports === 'object') {
				module.exports = factory();
			} else {
				root.Imgur = factory();
			}
		}
				(
						this,
						function() {
							"use strict";
							var Imgur = function(options) {
								if (!this || !(this instanceof Imgur)) {
									return new Imgur(options);
								}

								if (!options) {
									options = {};
								}

								if (!options.clientid) {
									throw 'Provide a valid Client Id here: https://api.imgur.com/';
								}

								this.clientid = options.clientid;
								this.endpoint = 'https://api.imgur.com/3/image';
								this.callback = options.callback || undefined;
								this.dropzone = document
										.querySelectorAll('.dropzone');
								this.info = document.querySelectorAll('.info');

								this.run();
							};

							Imgur.prototype = {
								createEls : function(name, props, text) {
									var el = document.createElement(name), p;
									for (p in props) {
										if (props.hasOwnProperty(p)) {
											el[p] = props[p];
										}
									}
									if (text) {
										el.appendChild(document
												.createTextNode(text));
									}
									return el;
								},
								insertAfter : function(referenceNode, newNode) {
									referenceNode.parentNode.insertBefore(
											newNode, referenceNode.nextSibling);
								},
								post : function(path, data, callback) {
									var xhttp = new XMLHttpRequest();

									xhttp.open('POST', path, true);
									xhttp.setRequestHeader('Authorization',
											'Client-ID ' + this.clientid);
									xhttp.onreadystatechange = function() {
										if (this.readyState === 4) {
											if (this.status >= 200
													&& this.status < 300) {
												var response = '';
												try {
													response = JSON
															.parse(this.responseText);
												} catch (err) {
													response = this.responseText;
												}
												callback.call(window, response);
											} else {
												throw new Error(this.status
														+ " - "
														+ this.statusText);
											}
										}
									};
									xhttp.send(data);
									xhttp = null;
								},
								createDragZone : function() {
									var p1, p2, input;
									p1 = this.createEls('p', {}, '請點此區選擇1張圖片，');
									p2 = this.createEls('p', {}, '或將1張圖片拖曳至此。');
									input = this.createEls('input', {
										type : 'file',
										className : 'input',
										accept : 'image/*',
										required : 'required'
									});

									Array.prototype.forEach.call(this.info,
											function(zone) {
												zone.appendChild(p1);
												zone.appendChild(p2);
											}.bind(this));
									Array.prototype.forEach.call(this.dropzone,
											function(zone) {
												zone.appendChild(input);
												this.status(zone);
												this.upload(zone);
											}.bind(this));
								},
								loading : function() {
									var div, table, img;

									div = this.createEls('div', {
										className : 'loading-modal'
									});
									table = this.createEls('table', {
										className : 'loading-table'
									});
									img = this
											.createEls(
													'img',
													{
														className : 'loading-image',
														src : '/Bartenders/images/loading-spin.svg'
													});

									div.appendChild(table);
									table.appendChild(img);
									document.body.appendChild(div);
								},
								status : function(el) {
									var div = this.createEls('div', {
										className : 'status'
									});

									this.insertAfter(el, div);
								},
								matchFiles : function(file, zone) {
									var status = zone.nextSibling;

									if (file.type.match(/image/)
											&& file.type !== 'image/svg+xml') {
										document.body.classList.add('loading');
										status.classList.remove('bg-success',
												'bg-danger');
										status.innerHTML = '';

										var fd = new FormData();
										fd.append('image', file);

										this.post(this.endpoint, fd, function(
												data) {
											document.body.classList
													.remove('loading');
											typeof this.callback === 'function'
													&& this.callback.call(this,
															data);
										}.bind(this));
									} else {
										status.classList.remove('bg-success');
										status.classList.add('bg-danger');
										status.innerHTML = 'Invalid archive';
									}
								},
								upload : function(zone) {
									var events = [ 'dragenter', 'dragleave',
											'dragover', 'drop' ], file, target, i, len;

									zone
											.addEventListener(
													'change',
													function(e) {
														if (e.target
																&& e.target.nodeName === 'INPUT'
																&& e.target.type === 'file') {
															target = e.target.files;

															for (
																	i = 0,
																	len = target.length; i < len; i += 1) {
																file = target[i];
																this
																		.matchFiles(
																				file,
																				zone);
															}
														}
													}.bind(this), false);

									events
											.map(function(event) {
												zone
														.addEventListener(
																event,
																function(e) {
																	if (e.target
																			&& e.target.nodeName === 'INPUT'
																			&& e.target.type === 'file') {
																		if (event === 'dragleave'
																				|| event === 'drop') {
																			e.target.parentNode.classList
																					.remove('dropzone-dragging');
																		} else {
																			e.target.parentNode.classList
																					.add('dropzone-dragging');
																		}
																	}
																}, false);
											});
								},
								run : function() {
									var loadingModal = document
											.querySelector('.loading-modal');

									if (!loadingModal) {
										this.loading();
									}
									this.createDragZone();
								}
							};

							return Imgur;
						}));

		$('#imgPlace').hide();

		// 	Upload js
		var feedback = function(res) {
			if (res.success === true) {
				$('#imgPlace').name = "na";
				var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
				document.querySelector('.status').innerHTML = '<input id="realImg" name="pdImg" style="display:none;" class="image-url" value=\"' + get_link + '\" readonly/><br>'
						+ '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
			}
		};

		new Imgur({
			clientid : 'ceb59faf76db10f',
			callback : feedback
		});

		// Origin
		$('.sho').show();
		$('.nosho').hide();

		function showT1() {
			var T1 = document.getElementById("setA");
			var T2 = document.getElementById("setB");
			T1.className = "sho";
			T1.name = "setTimeAct";
			T2.className = "nosho";
			T2.name = "setTimeNon";
			console.log(T1.className + "/" + T1.name);
			console.log(T2.className + "/" + T2.name);
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
			console.log(T1.className + "/" + T1.name);
			console.log(T2.className + "/" + T2.name);
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
					"alwaysShowCalendars" : true,
					opens : "left",
					timePicker : true,
					timePickerIncrement : 1,
					singleDatePicker : true,
					showDropdowns : true,
					minDate : output,
					startDate : output,
					locale : {
						format : "YYYY/MM/DD HH:mm:ss",
						separator : " ~ ",
						applyLabel : "確定",
						cancelLabel : "清除",
						fromLabel : "開始日期",
						toLabel : "結束日期",
						customRangeLabel : "自訂日期區間",
						daysOfWeek : [ "日", "一", "二", "三", "四", "五", "六" ],
						monthNames : [ "1月", "2月", "3月", "4月", "5月", "6月",
								"7月", "8月", "9月", "10月", "11月", "12月" ],
						firstDay : 1
					}
				});

		$("input.dateRange").on("cancel.daterangepicker", function(ev, picker) {
			$(this).val("");
		});

		$("input.dateRange2").daterangepicker(
				{
					"alwaysShowCalendars" : true,
					opens : "left",
					timePicker : true,
					timePickerIncrement : 1,
					showDropdowns : true,
					minDate : output,
					startDate : output,
					locale : {
						format : "YYYY/MM/DD HH:mm:ss",
						separator : " ~ ",
						applyLabel : "確定",
						cancelLabel : "清除",
						fromLabel : "開始日期",
						toLabel : "結束日期",
						customRangeLabel : "自訂日期區間",
						daysOfWeek : [ "日", "一", "二", "三", "四", "五", "六" ],
						monthNames : [ "1月", "2月", "3月", "4月", "5月", "6月",
								"7月", "8月", "9月", "10月", "11月", "12月" ],
						firstDay : 1
					}
				});

		$("input.dateRange2").on("cancel.daterangepicker",
				function(ev, picker) {
					$(this).val("");
				});
	</script>



</body>
</html>