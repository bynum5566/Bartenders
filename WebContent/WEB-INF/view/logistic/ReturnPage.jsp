<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//================================ 接收購物網站所需的各項參數 ==================================
	String sn_id = request.getParameter("sn_id") == null ? "" : request.getParameter("sn_id"); // 訂單編號
	String order_id = request.getParameter("order_id") == null ? "" : request.getParameter("order_id"); // 訂單編號
	String order_status = request.getParameter("order_status") == null ? "" : request.getParameter("order_status"); // 超商別
	  //========================================== 轉碼 ==============================================
	  order_status = new String(order_status.getBytes("ISO8859_1"),"UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table>
			<tr>
				<td bgcolor=#e3ffd7 width='20%'><div align=right>
						<b>結果</b>
					</div></td>
				<td bgcolor=#FFFFFF style="padding: 10;"><label
					style="line-height: 30px;"> <font color=#444444><b>訂單編號</b></font>  =  <%=order_id%><br>
						<font color=#444444><b>店到店編號</b></font>  =  <%=sn_id%><br> <font
						color=#444444><b>訂單狀態</b></font>  =  <%=order_status%><br> 
				</label></td>
			</tr>
		</table>
</body>
</html>