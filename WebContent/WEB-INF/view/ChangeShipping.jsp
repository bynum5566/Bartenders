<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>修改配送資訊</title>
    <!-- 
    <link rel="stylesheet" href="styles/rwd.css">
    <link rel="stylesheet" href="styles/rwd780.css" media="screen and (max-width:780px)">
     -->
    <style>
body {
    background-color:	#ECF5FF;
    
}
* {
    margin:0;
    padding:0;
}
#allpage {
    width:100%;
    margin:0 auto;
}
header {
    width:100%;
}
.logo-img {
    width:100%;
    
}
.menu {
    width:100%;
    overflow:auto;            
    background-color:#ACD6FF;
    border-radius:5px;
    list-style-type:none;
   
}
.menu li {
    width:7em;
    line-height:2.5em;
    float:left;
    
}
.menu li a {
    display:block;
    text-align:center;
    color:	#005AB5;
}
.menu li a:link {
    text-decoration:none;
}
.menu li a:hover {
    background-color:	#0080FF	;
    color:	#ffffff;
    border-radius:5px;
}
#content {
    width:100%;
    overflow:auto;
    /* border:1px solid gray; */
}
.article {
    width:100%;
    float:left;
}
.section {
    background-color:#ffffff;
    border-radius:5px;
    margin:10px 0;
    padding:20px 26px;
    line-height:2em;
}

.aside {
    width:28%;
    float:right;
    
}
footer {
    background-color:	#ACD6FF;
    border-radius:5px;
    text-align:center;
    line-height:2.5em;
    color:	#4F4F4F;
}        
    </style>
</head>
<body>
    <div id="allpage">
        <header>
			<jsp:include page="/WEB-INF/view/cartTopMenu.jsp" />    
        </header>
        <div id="content">
            <article class="article">
                <section class="section">

<%-- 本體，開始 --%>
	
	
		<h1>修改配送資訊</h1>
		<form action="<c:url value="/doChangeShipping.controller"/>" method="POST">
			<table>

				<tr>
					<td>訂單編號:</td>
					<td><input type="text" size="40" name="orderId" value="${orderId}" readonly="readonly" /><br></td>
				</tr>
				<tr>
					<td>商品名稱:</td>
					<td><input type="text" size="40" name="name" value="${productData[0].productName}等"
							readonly="readonly" /><br></td>
				</tr>
				<tr>
					<td>訂單總價:</td>
					<td><input type="text" size="40" name="price" value="${order.amount}" readonly="readonly" /><br>
					</td>
				</tr>
				<tr>
					<td>原選擇之配送方式:</td>
					<td><input type="text" size="40" name="price" value="${ShippingNumToStr[order.shipping]}"
							readonly="readonly" /><br></td>
				</tr>
				<tr>
					<td>===============</td>
					<td>================================<br></td>
				</tr>
				<tr>
					<td>收件人:</td>
					<td><input type="text" size="40" name="recipient" value="${order.recipient}" /><br></td>
				</tr>

				<tr>
					<td>配送方式:</td>
					<td><select name="shippingType">
							<c:choose>
								<c:when test="${ShippingNumToStr[order.shipping]=='QR票券'}">
									<option value="QR" width="10">3.QR</option>
								</c:when>
								<c:otherwise>
									<option value="HomeDelivery" width="10">1.宅配</option>
									<option value="ConvenienceStore" width="10">2.超商取貨</option>
								</c:otherwise>
							</c:choose>
						</select><br></td>
				</tr>
				<tr>

					<c:choose>
						<c:when test="${ShippingNumToStr[order.shipping]=='QR票券'}">
							<td></td>
							<td><br></td>
							<Input type='hidden' name='address' value='${attrAddress}'>
						</c:when>
						<c:otherwise>
							<td>地址/門市:</td>
							<td><input type="text" name="address" size="40" value="${attrAddress}" /><br></td>
						</c:otherwise>
					</c:choose>

				</tr>
				<tr>
					<td>收件人電話:</td>
					<td><input type="text" size="40" name="phone" value="${order.phone}" /><br></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="確認送出" /> <input type="reset" value="清除重填" /></td>
				</tr>

			</table>
		</form>
		
<%-- 本體，結束 --%>

                </section>                
            </article>


        
        </div>  <!--end content-->

        <footer>
                <p>2020 All Rights Reserved</p>
        </footer>
    </div>  <!--end allpage-->
</body>
</html>