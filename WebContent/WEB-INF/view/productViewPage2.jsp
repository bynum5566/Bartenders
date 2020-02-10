<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bartender- Preview ${productName}</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<style type="text/css">
	.outwrap{
		margin: auto;
		text-align: center;
		width: 800px;
		line-height: 18px;
	}
	.inwrap{
		margin: auto;
		text-align: left;
	}
	.pdData{
		display: inline;
		width: 350px;
	}
	.pdDataMain{
		width: 350px;
	}
	.bt0 {
		margin: 10px;
	}
	.bt01 {
		text-align: right;
	}
	#pdPicture{
		max-width: 350px;
	}
</style>
</head>
<body>
<table class="outwrap">
	<tr><td colspan="2"><h2>商品預覽</h2></td></tr>
	<tr class="inwrap"><td colspan="2"><h3>${productName}</h3></td></tr>
	<tr class="inwrap">
		<td class="pdData">
			<div class="pdData"><img id="pdPicture" src="<c:out value="${pic}"/>"></div>
		</td>
		<td class="pdDataMain">
		<form action="/addMyFav" method="post">
			<div id="hideId" class="pdDataMain"><label>商品編號: </label><input type="text" value="<c:out value="${productId}"/>" readonly="readonly"></div>
			<div class="pdDataMain"><label>價格: </label><h4>${pdPri}</h4></div>
			<div class="pdDataMain"><label>庫存量: </label><h4 id="stk">${pdStk}</h4></div>
			<div class="pdDataMain"><label>有效期間: ${pdValD}</label></div>
			<div id="quant" class="pdDataMain"><label>購買數量:</label><input type="number" max="<c:out value="${pdStk}"/>"></div>
			<div id="sold" class="sold pdDataMain"><h4 class="sold">缺貨中</h4></div>
			<div>
				<div>
					<input class="bt0" type="submit" value="加入購物車+">
					<input class="bt0" type="submit" value="加入我的最愛+">
				</div>
			</div>
		</form>
		</td>
	</tr>
	<tr><td colspan="2"><div class="inwrap"><p>${pdDetail}</p></div></td></tr>
	<tr class="bt01 bt0">
		<td colspan="2"><a href="/Bartenders/Dashboard.TkProducts">
			<input class="bt01 bt0" type="button" value="回商品管理" />
		</a></td>
	</tr>
</table>

<script type="text/javascript">
	$('#sold').hide();
	$('#hideId').hide();
	var stock = document.getElementById("stk").value;
	if(stock <= 0){
		$('#sold').show();
		$('#quant').hide();
	}else{
		$('#quant').show();
		$('#sold').hide();
	}
</script>
<!-- <button onclick="location.href='/Bartenders/Dashboard.TkProducts'">回主控台</button> -->
</body>
</html>