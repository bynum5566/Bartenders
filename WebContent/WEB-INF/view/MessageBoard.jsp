<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>討論區</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" />
</noscript>
<link rel="stylesheet" type="text/css"
	href="/Bartenders/CSS/mobile-style.css">
<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/style.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>


<style>
h1.panel, form.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	border: solid 1px #c3c3c3;
}

form.panel {
	/* 			height: 600px; */
	height: auto;
	width: 900px;
	background-color: transparent;
}

#wordPicture {
	height: 200px;
	width: 800px;
}

.dropzone {
	background-color: rgb(0, 0, 0, 0.5);
	border: 4px dashed #ccc;
	position: relative;
	margin-right: auto;
	margin-left: auto;
	height: 100px;
	width: 100px;
	padding: 10px;
	margin: 15px;
	display: inline-block;
}

.dropzone p {
	margin: 0%;
	text-align: center;
	width: 100%
}
</style>
</head>





<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1>
				<a href="UserFirstPage">Bartenders</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
								<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
								<li><a
									href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
								<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
								<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
								<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
								<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
								<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
								<li><a href=<c:url value="/JavaMailPage"/>>聯絡我們</a></li>
								<li class="small"><a href="UserFirstPage">返回首頁</a><a
									href="javascript:signOut()">登出</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<main>
							<div>
								<div style="color: WhiteSmoke;">
									[<a href=<c:url value="/messageBoardShowList.controller"/>>主題列表</a>]
								</div>

							</div>

							<h1 class="flip" align="right">縮放留言按此</h1>
							<!--縮放用JS，開始-->
							<script type="text/javascript">
								$(".flip").click(function() {
									$(".panel").slideToggle("slow");
								});
							</script>
							<!--縮放用JS，結束-->
							<ul>
								<li style="color: white; font-weight: bold;">
									<form action='messageBoard.controller' method='post'
										class="panel">

										<ul class="alt">
											<li>主題</li>
											<li><input type="text" name="title" placeholder="請輸入主題"
												required="required"></li>

											<li style="font-weight: bold;">文章</li>
											<li width='700'><textarea rows='20' cols='70'
													name='blabla' placeholder="請輸入文章" required="required"></textarea></li>

											<li>刪除碼</li>
											<li><input type="password" name="deletePassword"
												size="16" maxlength="8" placeholder="請輸入刪除碼"
												required="required"> <small>(留言刪除用，英文數字最多8個)</small>
											</li>

											<li>圖片</li>
											<li>
												<div class="dropzone" id="wordPicture" required="required">
													<div class="info"></div>
												</div> <input id="imgPlace" name="pdImg" class="image-url" /><br>
												<input type='submit' value='提交'>
											</li>
										</ul>
										<hr>
									</form>
								</li>
								<li>
									<div style="color: white">
										<c:forEach var="messageBoard" items="${newest}">
											<div>
												<div>
													<img height="400" width="800" id="pdPicture"
														src="<c:out value="${messageBoard.picture}" />">
												</div>

												<div style="margin: 10px;">
													<span style="padding: 10px;">
														帳號:${messageBoard.account} &nbsp;
														&nbsp;名稱:${messageBoard.userName} </span> <span
														style="padding: 10px;">ID:${messageBoard.id}</span> <span
														style="padding: 10px;">${messageBoard.time}</span> <span
														style="margin: 25px; padding: 10px; font-size: 20px; color: white">
														<a style="color: red; font-size: 1.3em;"
														href="<c:url value="/submessageBoardShow.controller"/>?resId=${messageBoard.id}&resAccount=${messageBoard.account}">回覆</a>
													</span>
												</div>

												<h3 align="center">&lt; ${messageBoard.title} &gt;</h3>

												<div><${messageBoard.blabla}</div>

												<hr>

											</div>
										</c:forEach>
									</div>


									<div id="del"
										style="position: fixed; right: 0; top: 94%; margin-top: -1em;">
										<form action='messageBoardDelete.controller' method='post'>
											<table style="float: right;">
												<tbody>
													<tr>
														<td><input type="text" name="id" size="8"
															placeholder="留言ID"></td>
														<td><input type="password" name="deletePassword"
															size="8" maxlength="8" placeholder="刪除密碼"></td>
														<td><input type="submit" value="刪除留言"></td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>


								</li>
							</ul>
						</main>
					</section>
				</div>
			</section>
		</article>
	</div>

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
	</script>
	<script src="/Bartenders/assets/js/jquery.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrollex.min.js"></script>
	<script src="/Bartenders/assets/js/jquery.scrolly.min.js"></script>
	<script src="/Bartenders/assets/js/browser.min.js"></script>
	<script src="/Bartenders/assets/js/breakpoints.min.js"></script>
	<script src="/Bartenders/assets/js/util.js"></script>
	<script src="/Bartenders/assets/js/main.js"></script>
	<script src="/Bartenders/assets/js/logout.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>
</body>

</html>