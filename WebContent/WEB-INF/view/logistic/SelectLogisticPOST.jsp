<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//================================ 接收購物網站所需的各項參數 ==================================
	String order_id = request.getParameter("processID") == null ? "" : request.getParameter("processID"); // 訂單編號
	String st_cate = request.getParameter("stCate") == null ? "" : request.getParameter("stCate"); // 超商別
	String st_code = request.getParameter("stCode") == null ? "" : request.getParameter("stCode"); // 門市代碼
	String st_name = request.getParameter("stName") == null ? "" : request.getParameter("stName"); // 門市名稱
	String st_addr = request.getParameter("stAddr") == null ? "" : request.getParameter("stAddr"); // 門市地址
	String st_tel = request.getParameter("stTel") == null ? "" : request.getParameter("stTel"); // 門市電話
	String webtemp = request.getParameter("webPara") == null ? "" : request.getParameter("webPara"); // 網站所需額外判別資料。ezShip 將原值回傳，供網站判別使用。
	//========================================== 轉碼 ==============================================
	st_name = new String(st_name.getBytes("ISO8859_1"), "UTF-8");
	st_addr = new String(st_addr.getBytes("ISO8859_1"), "UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://map.ezship.com.tw/ezship_map_web.jsp" 
		method="post">
		<fieldset>
			<legend> 取貨資料 </legend>

			<table>
				<tr>
					<td>取件人姓名</td>
					<td><input type="text" name="rv_name" value="謝無忌"></td>
				</tr>
				<tr>
					<td>取件人信箱</td>
					<td><input type="text" name="rv_email"
						value="simulate_receiver@ezship.com.tw"></td>
				</tr>
				<tr>
					<td>取件人手機</td>
					<td><input type="text" name="rv_mobil" value="0967123456"></td>
				</tr>
				<tr>
					<td>訂單編號</td>
					<td><input type="text" name="processID" value="155922"></td>
				</tr>
				<tr>
					<td>訂單金額</td>
					<td><input type="text" name="rv_amount" value="0"></td>
				</tr>
				<tr>
					<td>Ezship帳號</td>
					<td><input type="hidden" name="suID"
						value="eeit11131@outlook.com"></td>
				</tr>
				<tr>
					<td>其他資訊</td>
					<td><input type="hidden" name="webtemp" value="simulationpage"></td>
				</tr>
				<tr>
					<td>回傳頁面</td>
					<td><input type="hidden" name="rtURL"
						value="http://localhost:8080/LogisticSystem/SelectLogisticPOST.jsp"></td>
				</tr>
				<tr>
					<td><input type="submit" value="選擇超商"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td bgcolor=#e3ffd7 width='20%'><div align=right>
							<b>取貨門市</b>
						</div></td>
					<td bgcolor=#FFFFFF style="padding: 10;"><label
						style="line-height: 30px;"> <font color=#444444><b>訂單編號</b></font>  =  <%=order_id%><br>
							<font color=#444444><b>取件門市類別</b></font>  =  <%=st_cate%><br>
							<font color=#444444><b>取件門市代號</b></font>  =  <%=st_code%><br>
							<font color=#444444><b>取件門市名稱</b></font>  =  <%=st_name%><br>
							<font color=#444444><b>取件門市地址</b></font>  =  <%=st_addr%><br>
							<font color=#444444><b>取件門市電話</b></font>  =  <%=st_tel%><br>
							<font color=#444444><b>網站所需額外判別資料</b></font>  =  <%=webtemp%><br>
					</label></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<form
		action="https://www.ezship.com.tw/emap/ezship_request_order_api_ex.jsp"
		method="post">
		<table>
			<tr>
				<td><input type="hidden" name="su_id"
					value="EEIT11131@outlook.com"></td>
				<td><input type="hidden" name="order_id" value="01234"></td>
				<td><input type="hidden" name="order_status" value="A01"></td>
				<td><input type="hidden" name="order_type" value="3"></td>
				<td><input type="hidden" name="order_amount" value="0"></td>
				<td><input type="hidden" name="rv_name" value="謝無忌"></td>
				<td><input type="hidden" name="rv_email"
					value="EEIT11131@outlook.com"></td>
				<td><input type="hidden" name="rv_mobile" value="0921228145"></td>
				<td><input type="hidden" name="st_code" value="TFM13643"></td>
				<td><input type="hidden" name="rv_addr" value=""></td>
				<td><input type="hidden" name="rv_zip" value=""></td>
				<td><input type="hidden" name="st_code" value="TFM18108"></td>
				<td><input type="hidden" name="rt_url"
					value="http://localhost:8080/LogisticSystem/ReturnPage.jsp"></td>
				<td><input type="hidden" name="web_para" value=""></td>
					<!-- 
				<ORDER> 
				<suID>eeit11131@outlook.com</suID>
				<orderID>20140318154002</orderID>
				<orderStatus>A02</orderStatus>
				<orderType>3</orderType>
				<orderAmount>0</orderAmount>
				<rvName>謝無忌</rvName>
				<rvEmail>123@ezship.com.tw</rvEmail>
				<rvMobile>0987654321</rvMobile>
				<stCode>TFM0038</stCode>
				<rtURL>http://localhost:8080/LogisticSystem/ReturnPage.jsp</rtURL>
				<webPara>20140318154002-xxx</webPara>
				</ORDER>
 -->
			</tr>
			<tr>
				<td><input type="submit" value="下一步"></td>
			</tr>

		</table>
	</form>

</body>
</html>