<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>營業額圓餅圖</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style type="text/css">
div {
	min-width: auto;
	top: 90px;
	position: sticky;
	text-align: center;
	margin: auto;
	}
	
.outwrap {
	min-width: auto;
	top: 100px;
	position: sticky;
	text-align: center;
	margin: auto;
	width: 550px;
	border-radius: 5px;
	background-image: url(/Bartenders/images/bg21.png);
	fontColor: "white";
	
}
	
body {
	margin: 0;
	padding: 0;
	background-image: url(/Bartenders/images/bg12.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	background-position: top;
	overflow-y:hidden;
	overflow-y:hidden;
}


</style>

</head>
<body>
<div align="center" class="outwrap" style="color: white">
	<h1 style="color: white">營業額圓餅圖</h1><br>
  <canvas align="center" id="myChart" class="mycanvas"></canvas>
</div>

<script>
  var ctx = document.getElementById("myChart");
  var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels:${productNamesForPie},
      fontColor: ["white"],
      datasets: [{
        label: '產品銷售數量',
        data:${productsPrice},
        backgroundColor: [
        	"#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7ADBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"
        ],
        borderColor: [
        	"#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7ADBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"
        ],
        borderWidth: 1
      }]
    },
    options: {
    	legend: {
    		position: 'top',
    		labels: {
    		boxWidth: 20,// 修改寬度
    		fontSize: 20,
    		fontColor: 'white'
    		}
    		},
        scales: {
      	  scaleFontColor: "white",
      	  
          yAxes: [{
            ticks: {
              beginAtZero:true,
              color: 'rgba(0, 0, 0, 0)',
              fontSize: 18, 
              
            }
          }]
        }
      }
  });
</script>

	
</body>


</html>
<%@include file="menu.jsp"%>