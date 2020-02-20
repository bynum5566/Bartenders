<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.LinkedList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
// CSV file name
String fileName ="SaleReport.csv";

//output content container
LinkedList<String> outputContent = new LinkedList<String>();

// add CSV title
outputContent.add("產品名字,銷售數量,總銷售額");

// add CSV content
outputContent.add("紅酒,M,12");
outputContent.add("白酒,M,18");

// no caching for download files
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0);

response.setCharacterEncoding("UTF-8");
response.setContentType("application/octet-stream");
String uriencodedFilename = fileName;
try {
    uriencodedFilename = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
} catch (Exception e) { }
response.setHeader("Content-Disposition", "attachment;filename*=UTF-8''" + uriencodedFilename + ";filename=\"" + uriencodedFilename + "\"");

PrintWriter printWriter = response.getWriter();
printWriter.print('\ufeff');
try {
    for(String s : outputContent){
        printWriter.print(s+"\r\n");  // MS format
    }
} finally {
    printWriter.flush();
    printWriter.close();
}
%>

<script type="text/javascript">
var dlLink = "CSVGen.jsp?fn="+encodeURIComponent(fileName);
window.open(dlLink);

</script>
</body>
</html>