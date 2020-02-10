<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChartJs</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

</head>
<body>
<div align="center" style="width:800px;">
  <canvas align="center" id="myChart"></canvas>
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
        yAxes: [{
          ticks: {
            beginAtZero:true,
          }
        }]
      }
    }
  });
</script>
	
</body>


</html>
