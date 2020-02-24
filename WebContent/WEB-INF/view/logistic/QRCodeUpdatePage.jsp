<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CodeUpdate</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<style>
table {
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

div {
	class: center;
}

fieldset {
	text-align: center;
	width: 1200px;
}
</style>
</head>
<body>
<script>
var url = location.href;
console.log(url);
//再來用去尋找網址列中是否有資料傳遞(QueryString)
if(url.indexOf('?')!=-1)
{
  var orderID = "";
  var orderStatus = "";
  var sID = '${sender.senderId}';
	console.log('senderId is: ',sID);
  //在此直接將各自的參數資料切割放進ary中
  var ary = url.split('?')[1].split('&');
  console.log(ary);
  //此時ary的內容為：
  //ary[0] = 'id=U001'，ary[1] = 'name=GQSM'
      //如果資料名稱為id的話那就把他取出來
      if(ary[0].split('=')[0] == 'orderID')
    	  orderID = ary[0].split('=')[1];
     	  console.log(orderID);
     	  /*
      if(ary[1].split('=')[0] == 'orderStatus')
    	  orderStatus = ary[1].split('=')[1];
          console.log(orderStatus);
          */
          if(orderID!=""){
        	  if(confirm("確實執行嗎?")){
          		window.location.href = '<c:url value="/logistic/QRCodeUpdate.do"/>?orderID='+ orderID +'&sID=' + sID;
          		
          	  }
          		else{
          			alert("已經取消了操作");
          			window.location.href = '<c:url value="/logistic/loginSuccess"/>';
          		}
          }
         
}


	
</script>
<h1>QRcode Update Page</h1>
<h3>
		Login status:${logisticLogin} <br>
		Welcome,${username}
</h3>
<h3>Order detail</h3>
<div>
		<fieldset>
			<legend>訂單明細</legend>
			<table align=center>
				<thead>
					<tr>
						<td>序號</td>
						<td>訂單號碼</td>
						<td>物流號碼</td>
						<td>送貨類型</td>
						<td>送貨地址</td>
						<td>取件人姓名</td>
						<td>取件人手機</td>
						<td>訂單金額</td>
						<td>狀態</td>
						<td>物流單成立時間</td>
						<td>物流收貨時間</td>
						<td>顧客取貨時間</td>
						<td>完成</td>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${status.index+1}</td>
							<td>${update.oID}</td>
							<td>${update.lID}</td>
							<td>${update.oType}</td>
							<td>${update.oAddr}</td>
							<td>${update.oName}</td>
							<td>${update.oPhone}</td>
							<td>${update.oAmount}</td>
							<td class="status">${update.oStatus}</td>
							<td>${update.oTimeA}</td>
							<td>${update.oTimeB}</td>
							<td>${update.oTimeC}</td>
							<td>${update.oComplete}</td>
						</tr>

				</tbody>
			</table>
		</fieldset>
	</div>
<form action="<c:url value="/logistic/loginSuccess" />" method="get">
	<table>
		<tr>
			<td><input type="submit" value="確定"></td>
		</tr>
	</table>
</form>
${test}

</body>
</html>