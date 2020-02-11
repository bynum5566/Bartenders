<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />	
<link rel="stylesheet" type="text/css" href="/Bartenders/images/add_editView.css">
<noscript><link rel="stylesheet" href="/Bartenders/images/noscript.css" /></noscript>
<title>Edit Product</title>


<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet"></link>

</head>
<body>
	<div class="outwrap">
		<div class="inwrap">
			<h1>修改票券商品</h1>
			<form action="<c:url value="/editTkPD"></c:url>" method="POST" enctype="multipart/form-data">
				<table>
					<tr id="hdId">
						<td colspan="2">
							<input class="bt0" name="pdId" type="text" required="required" value="<c:out value="${pdId}"/>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td><label>商品名稱</label></td>
						<td><input class="bt0" name="pdNm" type="text" required="required" value="<c:out value="${pdNm}"/>"></td>
					</tr>
					<tr>
						<td><label>商品數量</label></td>
						<td><input class="bt0" name="pdStk" id="pdamount" type="number" min="1" required="required" value="<c:out value="${pdStk}"/>"></td>
					</tr>
					<tr>
						<td><label>商品價格</label></td>
						<td><input class="bt0" name="pdPri" id="pdprice" type="number" min="1" required="required" value="<c:out value="${pdPri}"/>"></td>
					</tr>
					<tr>
						<td><label>Tag1</label></td>
						<td><input class="bt0" name="pdTg1" type="text" max="10" value="<c:out value="${pdT1}"/>"></td>
					</tr>
					<tr>
						<td><label>Tag2</label></td>
						<td><input class="bt0" name="pdTg2" type="text" max="10" value="<c:out value="${pdT2}"/>"></td>
					</tr>
					<tr>
						<td><label>Tag3</label></td>
						<td><input class="bt0" name="pdTg3" type="text" max="10" value="<c:out value="${pdT3}"/>"></td>
					</tr>
					<tr>
						<td><label>商品詳細</label></td>
						<td><textarea class="bt0" name="pdDta"><c:out value="${pdDT}"/></textarea></td>
					</tr>
					<tr>
						<td><label>商品圖片</label></td>
						<td>
							<div class="dropzone">
								<div class="info"></div>
							</div>
							<div id="imgPlace1" >
								<img id="oriImg" src="<c:out value="${pdpicUrl}"/>"/>
							</div>
								<input id="imgPlace2" type="text" name="pdImg" class="image-url" value="<c:out value="${pdpicUrl}"/>" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td class="setT2"><label>票券生效日</label><div><c:out value="${valideT}"/></div></td>
						<td>
							<div>請點選擇器編輯</div>
							<div><input name="setTKTime1" id="setB1" class="dateRange form-control" type="text"/></div>
						</td>
					</tr>
					<tr>
						<td class="setT2"><label>票券失效日</label><div><c:out value="${expiryT}"/></div></td>
						<td>
							<div>請點選擇器編輯</div>
							<div><input name="setTKTime2" id="setB2" class="dateRange form-control" type="text"/></div>
						</td>
					</tr>
					<tr id="setA" class="sho">
						<td><label>上架時間</label><div><c:out value="${autoLT}"/></div></td>
						<td>
							<div>請點選擇器編輯</div>
							<div><input name="setTimeAct1" id="setA1" class="dateRange form-control" type="text"></div>
						</td>
					</tr>
					<tr id="setB" class="sho">
						<td><label>下架時間</label><div><c:out value="${autoPT}"/></div></td>
						<td>
							<div>請點選擇器編輯</div>
							<div><input name="setTimeAct2" id="setA2" class="dateRange form-control" type="text"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="bT">
							<a href="/Bartenders/Dashboard.TkProducts">
								<input class="bT" type="button" value="回票券商品管理"/>
							</a> 
<!-- 							<button onclick="location.href = '/Bartenders/Dashboard.TkProducts';" class="bT" >回票券商品管理</button> -->
							<input class="bT" type="submit" value="修改商品"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script>
	/* Imgur Upload Script */
	(function (root, factory) {
	    "use strict";
	    if (typeof define === 'function' && define.amd) {
	        define([], factory);
	    } else if (typeof exports === 'object') {
	        module.exports = factory();
	    } else {
	        root.Imgur = factory();
	    }
	}(this, function () {
	    "use strict";
	    var Imgur = function (options) {
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
	        this.dropzone = document.querySelectorAll('.dropzone');
	        this.info = document.querySelectorAll('.info');

	        this.run();
	    };

	    Imgur.prototype = {
	        createEls: function (name, props, text) {
	            var el = document.createElement(name), p;
	            for (p in props) {
	                if (props.hasOwnProperty(p)) {
	                    el[p] = props[p];
	                }
	            }
	            if (text) {
	                el.appendChild(document.createTextNode(text));
	            }
	            return el;
	        },
	        insertAfter: function (referenceNode, newNode) {
	            referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
	        },
	        post: function (path, data, callback) {
	            var xhttp = new XMLHttpRequest();

	            xhttp.open('POST', path, true);
	            xhttp.setRequestHeader('Authorization', 'Client-ID ' + this.clientid);
	            xhttp.onreadystatechange = function () {
	                if (this.readyState === 4) {
	                    if (this.status >= 200 && this.status < 300) {
	                        var response = '';
	                        try {
	                            response = JSON.parse(this.responseText);
	                        } catch (err) {
	                            response = this.responseText;
	                        }
	                        callback.call(window, response);
	                    } else {
	                        throw new Error(this.status + " - " + this.statusText);
	                    }
	                }
	            };
	            xhttp.send(data);
	            xhttp = null;
	        },
	        createDragZone: function () {
	            var p1, p2, input;

	                p1 = this.createEls('p', {}, '請點此區選擇1張圖片，');
	                p2 = this.createEls('p', {}, '或將1張圖片拉至此區。');
	            input = this.createEls('input', {type: 'file', className: 'input', accept: 'image/*'});

	            Array.prototype.forEach.call(this.info, function (zone) {
	                zone.appendChild(p1);
	                zone.appendChild(p2);
	            }.bind(this));
	            Array.prototype.forEach.call(this.dropzone, function (zone) {
	                zone.appendChild(input);
	                this.status(zone);
	                this.upload(zone);
	            }.bind(this));
	        },
	        loading: function () {
	            var div, table, img;

	            div = this.createEls('div', {className: 'loading-modal'});
	            table = this.createEls('table', {className: 'loading-table'});
	            img = this.createEls('img', {className: 'loading-image', src: '/Bartenders/images/loading-spin.svg'});

	            div.appendChild(table);
	            table.appendChild(img);
	            document.body.appendChild(div);
	        },
	        status: function (el) {
	            var div = this.createEls('div', {className: 'status'});

	            this.insertAfter(el, div);
	        },
	        matchFiles: function (file, zone) {
	            var status = zone.nextSibling;

	            if (file.type.match(/image/) && file.type !== 'image/svg+xml') {
	                document.body.classList.add('loading');
	                status.classList.remove('bg-success', 'bg-danger');
	                status.innerHTML = '';

	                var fd = new FormData();
	                fd.append('image', file);

	                this.post(this.endpoint, fd, function (data) {
	                    document.body.classList.remove('loading');
	                    typeof this.callback === 'function' && this.callback.call(this, data);
	                }.bind(this));
	            } else {
	                status.classList.remove('bg-success');
	                status.classList.add('bg-danger');
	                status.innerHTML = 'Invalid archive';
	            }
	        },
	        upload: function (zone) {
	            var events = ['dragenter', 'dragleave', 'dragover', 'drop'],
	                file, target, i, len;

	            zone.addEventListener('change', function (e) {
	                if (e.target && e.target.nodeName === 'INPUT' && e.target.type === 'file') {
	                    target = e.target.files;

	                    for (i = 0, len = target.length; i < len; i += 1) {
	                        file = target[i];
	                        this.matchFiles(file, zone);
	                    }
	                }
	            }.bind(this), false);

	            events.map(function (event) {
	                zone.addEventListener(event, function (e) {
	                    if (e.target && e.target.nodeName === 'INPUT' && e.target.type === 'file') {
	                        if (event === 'dragleave' || event === 'drop') {
	                            e.target.parentNode.classList.remove('dropzone-dragging');
	                        } else {
	                            e.target.parentNode.classList.add('dropzone-dragging');
	                        }
	                    }
	                }, false);
	            });
	        },
	        run: function () {
	            var loadingModal = document.querySelector('.loading-modal');

	            if (!loadingModal) {
	                this.loading();
	            }
	            this.createDragZone();
	        }
	    };

	    return Imgur;
	}));

	$('#imgPlace2').hide();
	
// 	Upload js
var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace1').hide();
    	$('#imgPlace2').name="na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status').innerHTML =
        '<input id="realImg" name="pdImg" style="display:none;" class="image-url" value=\"' + get_link + '\" readonly="readonly"/><br>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f',
    callback: feedback
});


// Origin
	$("#hdId").hide();
	
		$('.sho').show();
		$('.nosho').hide();

				
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
					minDate: output,
					timePickerIncrement : 1,
					singleDatePicker : true,
					showDropdowns : true,
					autoUpdateInput: false,
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

		$("input.dateRange").on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('L'));
        });
		
		$("input.dateRange").on("apply.daterangepicker", function(ev, picker) {
			$(this).val(picker.startDate.format("YYYY/MM/DD HH:mm:ss"));
			});

// 		$(function() {
// 			if (window.history && window.history.pushState) {
// 			$(window).on('popstate', function () {
// 			window.history.pushState('forward', null, '#');
// 			window.history.forward(1);
// 			});
// 			}
// 			window.history.pushState('forward', null, '#'); 
// 			window.history.forward(1);
// 			})
	</script>

	<%@ include file="menu.jsp"%>
	
</body>
</html>