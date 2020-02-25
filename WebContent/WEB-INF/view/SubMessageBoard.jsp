<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="google-signin-client_id" content="1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/Bartenders/assets/css/main.css"/>
	<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css"/></noscript>
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/mobile-style.css">
	<link rel="stylesheet" type="text/css" href="/Bartenders/CSS/style.css">
	<title>主題留言板</title>
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
		
		img.loading-image{
			align-self: center;
			margin-left: 50%;
			margin-top: 5%;
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
		
		.info {
			margin-top: 11%;
		}
		
		.dropzone p {
			margin: 0%;
			text-align: center;
			width: 100%
		}
		
		.input {
			height: 100%;
			left: 0;
			outline: 0;
			opacity: 0;
			position: absolute;
			top: 0;
			width: 100%
		}
		
		.status {
			border-radius: 5px;
			text-align: center;
			width: 50%;
			margin-left: auto;
			margin-right: auto;
		}
		
		.image-url {
			width: 50%;
		}

		.loading-modal {
			background-color: rgba(255, 255, 255, .8);
			display: none;
			position: fixed;
			z-index: 1000;
			top: 0;
			left: 0;
			height: 100%;
			width: 100%
		}
		
		.loading-table {
			margin-left: auto;
			margin-right: auto;
			margin-top: 15%;
			margin-bottom: 15%;
		}
		
		img.img {
			max-width: 200px;
			max-height: 300px;
		}

	</style>
</head>

<body class="is-preload">
	<div id="page-wrapper">
		<header id="header">
			<h1>
				<a href="index.jsp">Bartenders</a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="special"><a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
								<li><a href=<c:url value="/Users.Info"/>>會員中心</a></li>
								<li><a href=<c:url value="/DisplayBarList.controller"/>>所有酒吧</a></li>
								<li><a href=<c:url value="/DisplayRandomBarList.controller"/>>精選酒吧</a></li>
								<li><a href=<c:url value="/DisplayCartList.controller"/>>我的購物車</a></li>
								<li><a href=<c:url value="/userOrder.controller"/>>我的訂單</a></li>
								<li><a href=<c:url value="/Dashboard.MyFavorite"/>>我的最愛</a></li>
								<li><a href=<c:url value="/messageBoardShow.controller"/>>討論區</a></li>
								<li><a href=<c:url value="/room.chat"/>>聊天室</a></li>
								<li class="small"><a href="UserFirstPage">返回首頁</a><a href="javascript:signOut()">登出</a></li>
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

							<h1 class="flip" align="right">縮放主題留言按此</h1>

							<!--縮放用JS，開始-->
							<script type="text/javascript">
								$(".flip").click(function() {
									$(".panel").slideToggle("slow");
								});
							</script>
							<!--縮放用JS，結束-->
						<ul>
							<li>
							<form action='subMessageBoard.controller' method='post' class="panel">
<!-- 								<table border='1'> -->

									<ul class="alt">
										<li><b>文章</b></li>
										<li width='700'>
											<textarea rows='8' cols='70' name='blabla' placeholder="請輸入文章" required="required"></textarea>
										</li>
<!-- 									</tr> -->

<!-- 									<tr> -->
										<li><b>刪除碼</b></li>
										<li>
											<input type="password" name="deletePassword" size="16" maxlength="8" placeholder="請輸入刪除碼" required="required"> <small>(留言刪除用，英文數字最多8個)</small>
										</li>
<!-- 									</tr> -->
<!-- 									<tr> -->
										<li><b>圖片</b></td>
										<li>
											<div class="dropzone" id="wordPicture" required="required">
												<div class="info"></div>
											</div> <input id="imgPlace" name="pdImg" class="image-url"/>
<!-- 									</tr> -->

<!-- 									<tr> -->
											<br>
											<input type='submit' value='提交'>
										</li>
									</ul>
<!-- 								</table> -->
						<hr>
							</form>
						</li>
						<li>
							<div style="border-style: double; background: hsla(255, 50%, 50%, 0.15); padding: 10px;">
								<div>
									<div id="fb-root"></div>
									<c:forEach var="messageBoard" items="${newest}">

										<div>
											<img height="150" width="300" id="pdPicture" src="<c:out value="${messageBoard.picture}"/>">
										</div>

										<div style="margin: 10px;">
											<h4 style="margin: 10px; text-decoration: 10px;">帳號:${messageBoard.account}&nbsp; &nbsp;名稱:${messageBoard.userName}</h4>

										</div>

										<h3 align="center">&lt; ${messageBoard.title} &gt;</h3>
										<div style="margin: 10px;" id="">${messageBoard.blabla}</div>
									</c:forEach>
								</div>

								<c:forEach var="subMessageBoard" items="${subnewest}">
<!-- 									<table> -->
										<div style="margin: 10px;">
											<ul>
												<li rowspan="3">
													<img style="height: 150px; width: 300px;" id="pdPicture" src="<c:out value="${subMessageBoard.picture}"/>">
												</li>
												<li style="vertical-align: top">
													帳號:${subMessageBoard.account}&nbsp &nbsp
													名稱:${subMessageBoard.userName}&nbsp &nbsp
													SubID:${subMessageBoard.subId}
												</li>

<!-- 											</tr> -->
<!-- 											<tr> -->
												<li>${subMessageBoard.blabla}</td>
<!-- 											</tr> -->
<!-- 											<tr> -->
												<li style="vertical-align: bottom;">${subMessageBoard.time}</li>
											</ul>

										</div>
<!-- 									</table> -->

								</c:forEach>
							</li>



							<li>
								<form action='subMessageBoardDelete.controller' method='post'>

									<div id="del">
										<table style="float: right;">
											<tbody>
												<tr>
													<td style="white-space: nowrap;">
														<ul>
															<li><br><br></li>
															<li>刪除留言:</li>
															<li><input type="text" name="subId" placeholder="留言subId"><br></li>
															<li><input type="password" name="deletePassword" size="8" maxlength="8" placeholder="刪除碼"><br></li>
															<li><input type="submit" value=" 送出 "></li>
														</ul>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</form>
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
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</body>

</html>