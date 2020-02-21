<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChartJs</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style type="text/css">

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

.outwrap {
	min-width: auto;
	top: 90px;
	position: sticky;
	text-align: center;
	margin: auto;
	width: 800px;
	border-radius: 5px;
	background: linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.3) 99%);
	background: -moz-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.3) 99%);
	background: -webkit-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.3) 99%);
	background: -o-linear-gradient(270deg, rgba(12, 10, 10, 0.5) 34%,
		rgba(163, 163, 163, 0.3) 99%);
	box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-webkit-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	-moz-box-shadow: 0px 11px 7px rgba(10, 9, 9, 0.6);
	color:#FFFFFF;
	
}
</style>

</head>
<body>
	<div class="outwrap" >
		<canvas id="myChart"></canvas>
	</div>

	<script>
  var ctx = document.getElementById("myChart");
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels:${productNames},
      datasets: [{
        label: '產品銷售數量',
        data:${productsSoldQuantity},
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
      scales: {
    	  scaleFontColor: "#000093",
        yAxes: [{
          ticks: {
            beginAtZero:true,
          }
        }]
      }
    }
  });
  bar.defaults = {
		  scaleFontColor: "#000093",
  }
</script>

</body>


</html>
<%@include file="menu.jsp"%>