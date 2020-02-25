<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Bartenders/assets/css/main.css" />
<noscript><link rel="stylesheet" href="/Bartenders/assets/css/noscript.css" /></noscript>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	width: 900px;
}
</style>
<style>
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
</style>
</head>
<body class="is-preload">
	<div id="page-wrapper">
		<article id="main">
			<section class="wrapper style5">
				<div class="inner">
					<section>

<script>
/*
var url = location.href;

//再來用去尋找網址列中是否有資料傳遞(QueryString)
if(url.indexOf('?')!=-1)
{
  var orderID = "";
  var orderStatus = "";
  //在此直接將各自的參數資料切割放進ary中
  var ary = url.split('?')[1].split('&');
  console.log(ary);
  //此時ary的內容為：
  //ary[0] = 'id=U001'，ary[1] = 'name=GQSM'
      //如果資料名稱為id的話那就把他取出來
      if(ary[0].split('=')[0] == 'orderID')
    	  orderID = ary[0].split('=')[1];
     	  console.log(orderID);
      if(ary[1].split('=')[0] == 'orderStatus')
    	  orderStatus = ary[1].split('=')[1];
          console.log(orderStatus);
          if(orderID!=""&&orderStatus!=""){
        	  if(confirm("確實執行嗎?")){
          		window.location.href = '<c:url value="/QRCodeUpdate.do"/>?orderID='+ orderID + '&orderStatus=' + orderStatus;
          		alert("已經更新資料庫");
          	  }
          		else{
          			alert("已經取消了操作");
          		}
          }
         
}
*/
</script>
	<h3>
		Login status:${logisticLogin} <br>
		Welcome,${username}
	</h3>
<h3>物流大廳</h3>

<form action="<c:url value="/logistic/LogisticGate" />" method="get">
	<table>
		<tr>
			<td><input type="submit" value="查看訂單"></td>
		</tr>
	</table>
</form>

<form action="<c:url value="/logistic/LogisticLogout.do" />" method="post">
	<table>
		<tr>
			<td><input type="submit" value="登出"></td>
		</tr>
	</table>
</form>
</section>
				</div>
			</section>
		</article>
	</div>
	
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