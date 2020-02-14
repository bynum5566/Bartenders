<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/add_editView.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/style.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/mobile-style.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<title>My bar</title>

<style type="text/css">
a.bT:link, a.bT:hover, a.bT:visited {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="outwrap">
		<div class="inwrap">
			<h2>編輯Bar</h2>
			<form action="/Bartenders/editBar" method="post"
				enctype="multipart/form-data">
				<table>
					<tr id="hdId">
						<td colspan="2"><input class="bt0" name="pdId" type="text"
							value="<c:out value="${barId}"/>" readonly="readonly"></td>
					</tr>

					<tr>
						<td><label>Bar名稱</label></td>
						<td><input type="text" name="barName" required="required"
							value="<c:out value="${barName}"/>"></td>
					</tr>

					<tr>
						<td><label>Bar Logo</label></td>
						<td><input type="text" name="barName" required="required"
							value="<c:out value="${barName}"/>"></td>
					</tr>

					<tr>
						<td><label>Bar Logo</label></td>
						<td>
							<div class="dropzone">
								<div class="info"></div>
							</div>
							<div id="imgPlace1">
								<img id="oriImg" src="<c:out value="${pdpicUrl}"/>" />
							</div>
							<input id="imgPlace2" type="text" name="pdImg" class="image-url"
							value="<c:out value="${barImgUrl}"/>" readonly="readonly" />
							<script type="text/javascript" src="/Bartenders/JS/imgur.js"></script>
							<script type="text/javascript" src="/Bartenders/JS/upload.js"></script>
						</td>
					</tr>

					<tr>
						<td><label>封面圖片</label></td>
						<td>
							<div id="imgs">
								<div id="img1">
									<div class="dropzone1">
										<div class="info1"></div>
									</div>
									<div id="imgPlace01">
										<img id="oriImg" src="<c:out value="${pdpicUrl1}"/>" />
									</div>
									<input id="imgPlace02" type="text" name="cover1" class="image-url"
									value="<c:out value="${barImgUrl1}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur1.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload1.js"></script>
								</div>

								<div id="img2">
									<div class="dropzone2">
										<div class="info2"></div>
									</div>
									<div id="imgPlace03">
										<img id="oriImg" src="<c:out value="${pdpicUrl2}"/>" />
									</div>
									<input id="imgPlace04" type="text" name="cover2" class="image-url"
									value="<c:out value="${barImgUrl2}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur2.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload2.js"></script>
								</div>

								<div id="img3">
									<div class="dropzone3">
										<div class="info3"></div>
									</div>
									<div id="imgPlace05">
										<img id="oriImg" src="<c:out value="${pdpicUrl3}"/>" />
									</div>
									<input id="imgPlace06" type="text" name="cover3" class="image-url"
									value="<c:out value="${barImgUrl3}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur3.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload3.js"></script>
								</div>

								<div id="img4">
									<div class="dropzone4">
										<div class="info4"></div>
									</div>
									<div id="imgPlace07">
										<img id="oriImg" src="<c:out value="${pdpicUrl4}"/>" />
									</div>
									<input id="imgPlace08" type="text" name="cover4" class="image-url"
									value="<c:out value="${barImgUrl4}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur4.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload4.js"></script>
								</div>
								<div id="img5">
									<div class="dropzone5">
										<div class="info5"></div>
									</div>
									<div id="imgPlace09">
										<img id="oriImg" src="<c:out value="${pdpicUr5l}"/>" />
									</div>
									<input id="imgPlace10" type="text" name="cover5" class="image-url"
									value="<c:out value="${barImgUrl5}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur5.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/upload5.js"></script>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td><label>關於</label></td>
						<td><textarea name="aboutBar">${aboutBar}</textarea></td>
					</tr>

					<tr>
						<td><label>Menu</label></td>
						<td><textarea name="barMenu">${barMenu}</textarea></td>
					</tr>

					<tr>
						<td><label>最新消息與活動</label></td>
						<td><a href="/Bartenders/NewsAndEvents.Add"><div
									class="bT">新增+</div></a></td>
					</tr>

					<tr>
						<td><label>地址</label></td>
						<td><input type="text" name="barAddress" required="required"
							value="<c:out value="${barAdd}"/>"></td>
					</tr>

					<tr>
						<td><label>電話</label></td>
						<td><input type="tel" name="barPhone" required="required"
							value="<c:out value="${barPhone}"/>"></td>
					</tr>

					<tr>
						<td><label>Facebook連結</label></td>
						<td><input type="url" name="barFb"
							value="<c:out value="${barFb}"/>"></td>
					</tr>

					<tr>
						<td><label>Line帳號</label></td>
						<td><input type="text" name="barLine"
							value="<c:out value="${barLine}"/>"></td>
					</tr>

					<tr>
						<td><label>Instgram連結</label></td>
						<td><input type="url" name="barIG"
							value="<c:out value="${barIg}"/>"></td>
					</tr>

					<tr>
						<td id="bT" colspan="2"><a href="/Bartenders/My.Bar"> <input
								class="bT" type="button" value="回上頁" />
						</a> <input class="bT" type="submit" value="確認修改" /></td>
					</tr>

				</table>
			</form>
		</div>
	</div>

	<script>
// 		/* Imgur Upload Script */
// 		(function(root, factory) {
// 			"use strict";
// 			if (typeof define === 'function' && define.amd) {
// 				define([], factory);
// 			} else if (typeof exports === 'object') {
// 				module.exports = factory();
// 			} else {
// 				root.Imgur = factory();
// 			}
// 		}
// 				(
// 						this,
// 						function() {
// 							"use strict";
// 							var Imgur = function(options) {
// 								if (!this || !(this instanceof Imgur)) {
// 									return new Imgur(options);
// 								}
// 								if (!options) {
// 									options = {};
// 								}
// 								if (!options.clientid) {
// 									throw 'Provide a valid Client Id here: https://api.imgur.com/';
// 								}
// 								this.clientid = options.clientid;
// 								this.endpoint = 'https://api.imgur.com/3/image';
// 								this.callback = options.callback || undefined;
// 								this.dropzone = document
// 										.querySelectorAll('.dropzone');
// 								this.info = document.querySelectorAll('.info');
// 								this.run();
// 							};

// 							Imgur.prototype = {
// 								createEls : function(name, props, text) {
// 									var el = document.createElement(name), p;
// 									for (p in props) {
// 										if (props.hasOwnProperty(p)) {
// 											el[p] = props[p];
// 										}
// 									}
// 									if (text) {
// 										el.appendChild(document
// 												.createTextNode(text));
// 									}
// 									return el;
// 								},
// 								insertAfter : function(referenceNode, newNode) {
// 									referenceNode.parentNode.insertBefore(
// 											newNode, referenceNode.nextSibling);
// 								},
// 								post : function(path, data, callback) {
// 									var xhttp = new XMLHttpRequest();
// 									xhttp.open('POST', path, true);
// 									xhttp.setRequestHeader('Authorization',
// 											'Client-ID ' + this.clientid);
// 									xhttp.onreadystatechange = function() {
// 										if (this.readyState === 4) {
// 											if (this.status >= 200
// 													&& this.status < 300) {
// 												var response = '';
// 												try {
// 													response = JSON
// 															.parse(this.responseText);
// 												} catch (err) {
// 													response = this.responseText;
// 												}
// 												callback.call(window, response);
// 											} else {
// 												throw new Error(this.status
// 														+ " - "
// 														+ this.statusText);
// 											}
// 										}
// 									};
// 									xhttp.send(data);
// 									xhttp = null;
// 								},
// 								createDragZone : function() {
// 									var p1, p2, input;
// 									p1 = this.createEls('p', {}, '請點此區選擇1張圖片，');
// 									p2 = this.createEls('p', {}, '或將1張圖片拉至此區。');
// 									input = this.createEls('input', {
// 										type : 'file',
// 										className : 'input',
// 										accept : 'image/*'
// 									});
// 									Array.prototype.forEach.call(this.info,
// 											function(zone) {
// 												zone.appendChild(p1);
// 												zone.appendChild(p2);
// 											}.bind(this));
// 									Array.prototype.forEach.call(this.dropzone,
// 											function(zone) {
// 												zone.appendChild(input);
// 												this.status(zone);
// 												this.upload(zone);
// 											}.bind(this));
// 								},
// 								loading : function() {
// 									var div, table, img;
// 									div = this.createEls('div', {
// 										className : 'loading-modal'
// 									});
// 									table = this.createEls('table', {
// 										className : 'loading-table'
// 									});
// 									img = this
// 											.createEls(
// 													'img',
// 													{
// 														className : 'loading-image',
// 														src : '/Bartenders/images/loading-spin.svg'
// 													});
// 									div.appendChild(table);
// 									table.appendChild(img);
// 									document.body.appendChild(div);
// 								},
// 								status : function(el) {
// 									var div = this.createEls('div', {
// 										className : 'status'
// 									});
// 									this.insertAfter(el, div);
// 								},
// 								matchFiles : function(file, zone) {
// 									var status = zone.nextSibling;

// 									if (file.type.match(/image/)
// 											&& file.type !== 'image/svg+xml') {
// 										document.body.classList.add('loading');
// 										status.classList.remove('bg-success',
// 												'bg-danger');
// 										status.innerHTML = '';

// 										var fd = new FormData();
// 										fd.append('image', file);

// 										this.post(this.endpoint, fd, function(
// 												data) {
// 											document.body.classList
// 													.remove('loading');
// 											typeof this.callback === 'function'
// 													&& this.callback.call(this,
// 															data);
// 										}.bind(this));
// 									} else {
// 										status.classList.remove('bg-success');
// 										status.classList.add('bg-danger');
// 										status.innerHTML = 'Invalid archive';
// 									}
// 								},
// 								upload : function(zone) {
// 									var events = [ 'dragenter', 'dragleave',
// 											'dragover', 'drop' ], file, target, i, len;

// 									zone
// 											.addEventListener(
// 													'change',
// 													function(e) {
// 														if (e.target
// 																&& e.target.nodeName === 'INPUT'
// 																&& e.target.type === 'file') {
// 															target = e.target.files;

// 															for (
// 																	i = 0,
// 																	len = target.length; i < len; i += 1) {
// 																file = target[i];
// 																this
// 																		.matchFiles(
// 																				file,
// 																				zone);
// 															}
// 														}
// 													}.bind(this), false);

// 									events
// 											.map(function(event) {
// 												zone
// 														.addEventListener(
// 																event,
// 																function(e) {
// 																	if (e.target
// 																			&& e.target.nodeName === 'INPUT'
// 																			&& e.target.type === 'file') {
// 																		if (event === 'dragleave'
// 																				|| event === 'drop') {
// 																			e.target.parentNode.classList
// 																					.remove('dropzone-dragging');
// 																		} else {
// 																			e.target.parentNode.classList
// 																					.add('dropzone-dragging');
// 																		}
// 																	}
// 																}, false);
// 											});
// 								},
// 								run : function() {
// 									var loadingModal = document
// 											.querySelector('.loading-modal');
// 									if (!loadingModal) {
// 										this.loading();
// 									}
// 									this.createDragZone();
// 								}
// 							};
// 							return Imgur;
// 						}));

// 		$('#imgPlace2').hide();

// 		// 	Upload js
// 		var feedback = function(res) {
// 			if (res.success === true) {
// 				$('#imgPlace1').hide();
// 				$('#imgPlace2').name = "na";
// 				var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
// 				document.querySelector('.status').innerHTML = '<input id="realImg" name="pdImg" style="display:none;" class="image-url" value=\"' + get_link + '\" readonly="readonly"/><br>'
// 						+ '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
// 			}
// 		};

// 		new Imgur({
// 			clientid : 'ceb59faf76db10f',
// 			callback : feedback
// 		});

		// Origin
		$("#hdId").hide();
	</script>

	<%@ include file="menu.jsp"%>

</body>
</html>