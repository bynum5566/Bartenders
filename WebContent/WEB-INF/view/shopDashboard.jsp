<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<style type="text/css">
.allwrapper0 {
	text-align: center;
	margin: auto;
}

.allwrapper {
	width: 1410px;
	margin: 35px auto;
}

.outwrapper {
	margin: auto;
	text-align: center;
	width: 650px;
	border: 1px solid black;
}

.bt {
	margin: 30px auto;
	border: none;
	text-align: right;
	margin-left: 530px;
}

.lb {
	margin: 30px 250px;
}

.inwrapper {
	margin: 20px;
	width: 600px;
	height: 350px;
	overflow: auto;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.pd0 {
	padding: 10px;
	margin: auto;
	width: 550px;
	border-radius: 3px;
}

.pd0.td {
	border-top: 1px solid gray;
}

.pd00 {
	padding: 10px;
	margin: auto;
	width: 550px;
}

.pd01 {
	padding: 10px;
	margin: auto;
	width: 545px;
}

.pd01:hover {
	box-shadow: 0px 0px 5px blue;
}

.pd00.tr {
	width: 410px;
	text-align: left;
}

.pdidckP,pdidckL {
	width: 10px;
	text-align: left;
}

.pdRow {
	margin: 5px;
	line-height: 45px;
	border-radius: 3px;
}

.pdRow1 {
	line-height: 30px;
}

.LSide {
	padding: 10px;
	width: 20px;
	text-align: left;
}

.MidS1 {
	width: 320px;
	text-align: left;
}

.pdId, .pdNm {
	text-align: left;
}

.MidS2, .MidS3 {
	text-align: center;
	width: 75px;
}

.RSide {
	width: 20px;
}

#addBt {
	margin-top: 50px;
	margin-right: 1100px;
}

</style>

</head>
<body>
	<div class="allwrapper0">

		<div id="addBt">
			<form action="/Bartenders/Product.Add" method="get">
				<input type="submit" value="新增商品+">
				<a href="/Bartenders/Dashboard.TkProducts">
				<input class="bt01 bt0" type="button" value="票券商品管理"/></a>
			</form>
		</div>

		<div class="allwrapper">

			<Table class="outwrapper">
				<tr>
<%-- 					<form name="form1" action="/pulPD" method="post"> --%>
						<td>
							<div class="lb">上架中商品</div>

							<div class="inwrapper">

								<!-- <table class="pd0">
							<tr>
								<td>
									<table class="pd01">
										<tr class="pdRow1">
											<td class="LSide"><div class="ckb"></div></td>
											<td class="MidS1"><div class="MidS1">商品編號/名稱</div></td>
											<td class="MidS2"><div>價格</div></td>
											<td class="MidS3"><div>數量</div></td>
											<td class="RSide"><div></div></td>
										</tr>
									</table>
								</td>
							</tr>
							</table> -->

								<table class="pd0">${Launched}</table>

								<!-- 							<tr> -->
								<!-- 								<td> -->
								<!-- 									<table class="pd00"> -->
								<!-- 										<tr class="pdRow1"> -->
								<!-- 											<td class="LSide"><div></div></td> -->
								<!-- 											<td class="MidS1"><div>商品編號/名稱</div></td> -->
								<!-- 											<td class="MidS2"><div>價格</div></td> -->
								<!-- 											<td class="MidS3"><div>數量</div></td> -->
								<!-- 											<td class="RSide"><div></div></td> -->
								<!-- 										</tr> -->
								<!-- 									</table> -->
								<!-- 								</td> -->
								<!-- 							</tr> -->


								<!-- <tr class="pdRow">
									<form action="">
										<td class="LSide"><input class="ckb" type="checkbox"
											value="id1" /></td>
										<td class="MidS1"><div class="pdId" name="pdId">商品編號</div>
											<div class="pdNm" name="pdNm">商品名稱</div></td>
										<td class="MidS2"><div name="pdPri">$$</div></td>
										<td class="MidS3"><div name="pdStk">數量</div></td>
										<td class="RSide"><input type="submit" value="編輯">
										</td>
									</form>
								</tr> -->

							</div>
<!-- 							<div name="pdidck1" id="pdidck1"><input id="Text1" type="text" /><input id="Text2" type="text" /></div> -->
<!-- 							<button class="bt">下架</button> -->
						</td>
<%-- 					</form> --%>

<%-- 					<form name="form2" action="/lauPD" method="post"> --%>
						<td>
							<div class="lb">下架中商品</div>

							<div class="inwrapper">

								<!-- <table class="pd0">
							<tr>
								<td>
									<table class="pd01">
										<tr class="pdRow1">
											<td class="LSide"><div class="ckb"></div></td>
											<td class="MidS1"><div class="MidS1">商品編號/名稱</div></td>
											<td class="MidS2"><div>價格</div></td>
											<td class="MidS3"><div>數量</div></td>
											<td class="RSide"><div></div></td>
										</tr>
									</table>
								</td>
							</tr>
							</table> -->

								<table class="pd0">${Pulled}</table>

								<!-- 							<tr> -->
								<!-- 								<td> -->
								<!-- 									<table class="pd00"> -->
								<!-- 										<tr class="pdRow1"> -->
								<!-- 											<td class="LSide"><div></div></td> -->
								<!-- 											<td class="MidS1"><div>商品編號/名稱</div></td> -->
								<!-- 											<td class="MidS2"><div>價格</div></td> -->
								<!-- 											<td class="MidS3"><div>數量</div></td> -->
								<!-- 											<td class="RSide"><div></div></td> -->
								<!-- 										</tr> -->
								<!-- 									</table> -->
								<!-- 								</td> -->
								<!-- 							</tr> -->


								<!-- <tr class="pdRow">
									<form action="">
										<td class="LSide"><input class="ckb" type="checkbox"
											value="id1" /></td>
										<td class="MidS1"><div name="pdId">商品編號</div>
											<div name="pdNm">商品名稱</div></td>
										<td class="MidS2"><div name="pdPri">$$</div></td>
										<td class="MidS3"><div name="pdStk">數量</div></td>
										<td class="RSide"><input type="submit" value="編輯">
										</td>
									</form>
								</tr> -->

							</div>
<!-- 							<div name="pdidck2" id="pdidck2"><input id="Text3" type="text" /><input id="Text4" type="text" /></div> -->
<!-- 							<button class="bt">上架</button> -->
						</td>
<%-- 					</form> --%>
				</tr>
			</table>

		</div>



		<script>
		$('.pdidckPP').hide();
		$('.pdidckLL').hide();
		
// 		function reloadIt() {
// 		    if (window.location.href.substr(-2) !== "?r") {
// 		        window.location = window.location.href + "?r";
// 		    }
// 		}

// 		setTimeout('reloadIt()', 500)();
		
// 		function choose1() { 
// 				    j=0; 
// 				    var cur_idx=1; 
		     
// 				    for (i=0; i<4; i++) 
// 				        if (form1.checkbox[i].checked) 
// 				            j++; 
				     
// 			    if (j>1) {  
// 			       for (i=0; i<4; i++) 
// 				        { 
// 				            if (!(form1.checkbox[i].checked)) 
// 				                form1.checkbox[i].disabled = true; 
// 			            else 
// 				            { 
// 				                document.getElementById("Text"+cur_idx).value=form1.checkbox[i].value; 
// 				                cur_idx++; 
// 				            } 
// 				        } 
			         
// 				    } 
// 			   else { 
// 				        for (i=0; i<4; i++) 
// 				            form1.checkbox[i].disabled = false; 
				         
// 				        document.getElementById("Text1").value=""; 
// 				        document.getElementById("Text2").value=""; 
				         
// 			    } 
// 				}  
		
// 		function choose2() { 
// 		    j=0; 
// 		    var cur_idx=1; 
     
// 		    for (i=0; i<4; i++) 
// 		        if (form2.checkbox[i].checked) 
// 		            j++; 
		     
// 	    if (j>1) {  
// 	       for (i=0; i<4; i++) 
// 		        { 
// 		            if (!(form2.checkbox[i].checked)) 
// 		                form2.checkbox[i].disabled = true; 
// 	            else 
// 		            { 
// 		                document.getElementById("Text"+cur_idx).value=form2.checkbox[i].value; 
// 		                cur_idx++; 
// 		            } 
// 		        } 
	         
// 		    } 
// 	   else { 
// 		        for (i=0; i<4; i++) 
// 		            form2.checkbox[i].disabled = false; 
		         
// 		        document.getElementById("Text3").value=""; 
// 		        document.getElementById("Text4").value=""; 
		         
// 	    } 
// 		}  
		
		
		
		
		
		
// 		var checkedValue = null; 
// 		var inputElements = document.getElementsByClassName('messageCheckbox');
// 		for(var i=0; inputElements[i]; ++i){
// 		      if(inputElements[i].checked){
// 		           checkedValue = inputElements[i].value;
// 		           break;
// 		      }
// 		}
		
// 		var checkedValue = $('.pdidckP:checked').val();
		
		
// 		jQuery(".pdidckL").each(function(){
// 		  		  if (jQuery(this).is(":checked")) 
// 		        ReturnVal = true;
// 		});
		
// 		var x = $('input[type=chexkbox][name="pdidckL"]').value;
// 		console.log(x);
			// 		勾選上架中的	
// 			var ckVal1 = new Array();
// 			$('input[name="pdidckL"]:checkbox:checked')
// 			$(".pdidckL").each(function(i) {
// 				ckVal1[i] = this.value;
// 			});

			
			
			
			
// 			$('.pdidckL:checkbox:checked').each(function(){
// 			console.log(($this).value+",");
				
// 			});
			
// 			var ckL = document.getElementById("pdidck1");
// 			var x1 = ckVal1.toString();
// 			ckL.innerHTML = x1;
// 			console.log(x1);

// 			var checkedValue = $('input:checkbox[name=pdidckL][checked=true]').map(function() 
// 					{
// 						return $(this).val();
// 					})
// 					.get().join(',');
// 			console.log(checkedValue);

			// 		$('input:checkbox[name=pdidckL][checked=true]').each(function(i, item)
			// 				  {
			// 				     checkedValues.push($(item).val());
			// 				   });
			// 				   console.log(checkedValues.join(','));

// 			var valuelist = ''; 
//  $('input:checkbox[name=pdidckL][checked=true]').each(function() 
//  {
//      valuelist += $(this).val() + ",";
//  });
//  if (valuelist.length > 0) {
//  	valuelist = valuelist.substring(0, valuelist.length - 1);
//   }
//   console.log(valuelist);


// console.log($('input[name="pdidckL"]:checked').serialize());

// $('input[type=chexkbox][name="pdidckL"]:checked').each(function() {
//    console.log(this.value); 
// });

			
			// 		勾選下架中的
// 			var ckVal2 = new Array();
// 			$('input[class="pdidckP"]:checkbox:checked').each(function(i) {
// 				ckVal2[i] = $(this).value;
// 			});

// 			var ckP = document.getElementById("pdidck2");
// 			var x2 = ckVal2.toString();
// 			ckP.innerHTML = x2;
// 			console.log(ckVal2);
		</script>
</body>
</html>