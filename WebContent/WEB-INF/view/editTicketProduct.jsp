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
<title>Edit Product</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css" rel="stylesheet"></link>

</head>
<body>
	<div class="outwrap">
		<div class="inwrap">
			<h1>修改票券商品</h1>
			<form action="<c:url value="/editTkPD"></c:url>" method="POST" enctype="multipart/form-data">
				<table>
					<tr id="hdId">
						<td colspan="2"><input class="bt0" name="pdId" type="text" required="required" value="<c:out value="${pdId}"/>" readonly="readonly"></td>
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
						<td><textarea class="bt0" name="pdDta"><c:out value="${pdDT}" /></textarea></td>
					</tr>
					<tr>
						<td><label>商品圖片</label></td>
						<td>
							<div id="imgs">
								<div id="img1">
									<div class="dropzone1">
										<div class="info1"></div>
									</div>
									<div id="imgPlace01">
										<img id="oriImg" src="<c:out value="${pic1}"/>" />
									</div>
									<input id="imgPlace02" type="text" name="pdImg" class="image-url" value="<c:out value="${pic1}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur1.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/uploadPd1-1.js"></script>
								</div>
								<div id="img2">
									<div class="dropzone2">
										<div class="info2"></div>
									</div>
									<div id="imgPlace03">
										<img id="oriImg" src="<c:out value="${pic2}"/>" />
									</div>
									<input id="imgPlace04" type="text" name="pdImg2" class="image-url" value="<c:out value="${pic2}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur2.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/uploadPd2-1.js"></script>
								</div>
								<div id="img3">
									<div class="dropzone3">
										<div class="info3"></div>
									</div>
									<div id="imgPlace05">
										<img id="oriImg" src="<c:out value="${pic3}"/>" />
									</div>
									<input id="imgPlace06" type="text" name="pdImg3" class="image-url" value="<c:out value="${pic3}"/>" readonly="readonly" />
									<script type="text/javascript" src="/Bartenders/JS/imgur3.js"></script>
									<script type="text/javascript" src="/Bartenders/JS/uploadPd3-1.js"></script>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="setT2"><label>票券生效日</label>
						<div>
								<c:out value="${valideT}" />
							</div></td>
						<td>
							<div>請點選擇器編輯</div>
							<div>
								<input name="setTKTime1" id="setB1" class="dateRange form-control" type="text" />
							</div>
						</td>
					</tr>
					<tr>
						<td class="setT2">
							<label>票券失效日</label>
							<div><c:out value="${expiryT}" /></div>
						</td>
						<td>
							<div>請點選擇器編輯</div>
							<div>
								<input name="setTKTime2" id="setB2" class="dateRange form-control" type="text" />
							</div>
						</td>
					</tr>
					<tr id="setA" class="sho">
						<td>
							<label>上架時間</label>
						</td>
						<td>
							<div><c:out value="${autoLT}" /></div>
<!-- 							<div>請點選擇器編輯</div> -->
							<div>
								<input name="setTimeAct1" id="setA1" class="dateRange form-control" type="text">
							</div>
						</td>
					</tr>
					<tr id="setB" class="sho">
						<td>
							<label>下架時間</label>
						</td>
						<td>
							<div><c:out value="${autoPT}" /></div>
<!-- 							<div>請點選擇器編輯</div> -->
							<div>
								<input name="setTimeAct2" id="setA2" class="dateRange form-control" type="text">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="bT">
							<a href="/Bartenders/Dashboard.TkProducts">
								<div class="bT">回票券商品管理</div>
							</a> 
							<input class="bT" type="submit" value="修改商品" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script>
		$("#hdId").hide();
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
					minDate : output,
					timePickerIncrement : 1,
					singleDatePicker : true,
					showDropdowns : true,
					autoUpdateInput : false,
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

		$("input.dateRange").on('apply.daterangepicker', function(ev, picker) {
			$(this).val(picker.startDate.format('L'));
		});

		$("input.dateRange").on("apply.daterangepicker", function(ev, picker) {
			$(this).val(picker.startDate.format("YYYY/MM/DD HH:mm:ss"));
		});
	</script>

	<%@ include file="menu.jsp"%>

</body>
</html>