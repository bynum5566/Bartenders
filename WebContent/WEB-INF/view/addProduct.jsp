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
<title>Add new product</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css" rel="stylesheet"></link>

</head>

<body>
	<div class="outwrap">
		<button style="width:40px; height:40px; background-color: transparent; border-color: transparent; border: none; background-image: url(/Bartenders/images/contract.png);" align="right" id="Input"></button>
		<div class="inwrap">
			<h1>新增商品</h1>
			<form action="<c:url value="/addPD"></c:url>" method="POST" enctype="multipart/form-data">
				<table>
					<tr>
						<td><label>商品名稱</label></td>
						<td><input id="pdName" class="bt0" name="pdNm" type="text" required="required"></td>
					</tr>
					<tr>
						<td><label>商品數量</label></td>
						<td><input id="pdStock" class="bt0" name="pdStk" id="pdamount" type="number" min="1" required="required"></td>
					</tr>
					<tr>
						<td><label>商品價格</label></td>
						<td><input id="pdPrice" class="bt0" name="pdPri" id="pdprice" type="number" min="1" required="required"></td>
					</tr>
					<tr>
						<td><label>Tag1</label></td>
						<td><input id="pdTag1" class="bt0" name="pdTg1" type="text" max="10"></td>
					</tr>
					<tr>
						<td><label>Tag2</label></td>
						<td><input id="pdTag2" class="bt0" name="pdTg2" type="text" max="10"></td>
					</tr>
					<tr>
						<td><label>Tag3</label></td>
						<td><input id="pdTag3" class="bt0" name="pdTg3" type="text" max="10"></td>
					</tr>
					<tr>
						<td><label>商品詳細</label></td>
						<td><textarea id="pdDetail" class="bt0" name="pdDta"></textarea></td>
					</tr>
					<tr>
						<td><label>商品圖片</label></td>
						<td>
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
						<td colspan="2">
							<input class="bt0" id="setTt1" name="tm" type="radio" value="1" checked required onfocus="showT1()">
							<label for="setTt1">設定自動上架時間</label><br>
							<input class="bt0" id="setTt2" name="tm" type="radio" value="2" onfocus="showT2()">
							<label	for="setTt2">設定自動上/下架時間</label>
						</td>
					</tr>
					<tr id="setA" class="sho">
						<td class="setT1"><label>上架時間</label></td>
						<td><input name="setTimeAct" id="setA1" class="dateRange form-control" type="text" /></td>
					</tr>
					<tr id="setB" class="nosho">
						<td class="setT2"><label>上/下架時間</label></td>
						<td><input name="setTimeNon" id="setB1" class="dateRange2 form-control" type="text" /></td>
					</tr>
					<tr>
						<td colspan="2" id="bT">
							<a href="/Bartenders/Dashboard.Products">
								<div class="bT">回上頁</div>
							</a>
							<a href="/Bartenders/Product.Add">
								<div class="bT">重填</div>
							</a>
							<input class="bT" type="submit" value="新增商品" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>


<script>
	$('#Input').click(function(){
			$('#pdName').val('完美馬丁尼');
			$('#pdStock').val('1000');
			$('#pdPrice').val('300');
			$('#pdTag1').val('perfect');
			$('#pdTag2').val('Martini');
			$('#pdTag3').val('馬丁尼');
			$('#pdDetail').val('在馬丁尼中加入1:1的不甜香艾酒與甜香艾酒製作而成。<br>完美馬丁尼適合完美的你<br>試飲瓶新裝上市，憑3個任意品項試飲瓶至本店可兌換會員卡乙張。');
	})
</script>

	<%@ include file="menu.jsp"%>

	<script>
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

		$(function() {
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