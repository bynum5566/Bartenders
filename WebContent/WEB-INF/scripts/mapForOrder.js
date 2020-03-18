
		var googleMaps;
		var cancelLocating=false;
		var infowindow;
		var markers = [];
		var barMap = new Map();
		var orders = [];
		var tempMarkList = [];
		var orderLat;
		var orderLng;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'),mapStyle);
			infowindow = new google.maps.InfoWindow;
		}
		
		//地址轉成座標
		async function getInput(address){	
			//等fetch做完再繼續
			
			await fetch('https://maps.googleapis.com/maps/api/geocode/json?address='+address+'&key=AIzaSyAj6gmkT2i_jYKFJttSRpsdp7gAeFrzU5E').then(
				function(response) {
					return response.json();
				}).then(function(JSONdata) {
				//console.log("this is location's latlng: ", JSONdata.address_components);
					var all = JSONdata.results.forEach(function(item){
						orderLat = item.geometry.location.lat;
						orderLng = item.geometry.location.lng;
					});
				});//fetch結束
		};
		
		function relocate(lat,lng){
			for(var i=0;i<tempMarkList.length;i++){
				tempMarkList[i].setMap(null);
			}
			
			var place = new google.maps.LatLng(lat, lng);
			map.panTo(place); 
			tempMark = new google.maps.Marker({
                position: place,
//                draggable: true,
                icon:'images/defaultMarker.png',
                map: map
            });
			tempMarkList.push(tempMark);
		};
		
		
		
		async function autoLocating(){
			
			if (navigator.geolocation) {
				for(var i=0;i<tempMarkList.length;i++){
					tempMarkList[i].setMap(null);
				};
				await navigator.geolocation.getCurrentPosition(function(position) {
	                var pos = {
	                    lat: position.coords.latitude,
	                    lng: position.coords.longitude
	                };
	                console.log('目前位置',pos.lat,'; ',pos.lng);
	                relocate(pos.lat,pos.lng);
	                tempMark = new google.maps.Marker({
	                    position: pos,
//	                    draggable: true,
	                    icon:'images/defaultMarker.png',
	                    map: map
	                });
	                tempMarkList.push(tempMark);
	            })
	        } else {
	            alert("未允許或遭遇錯誤！");
	        }
		}
		/*
		function reloadMarkers() {
		    for (var i=0; i<markers.length; i++) {
		    	console.log(markers[i]);
		        markers[i].setMap(null);
		    }
		    console.log('marker clear!');
		    markers = [];
		}
		*/
		function reloadMarkers() {
			barMap.forEach(function(item){
				item.setMap(null);
			})
			//console.log('this is barMap in reloadMarkers(): ',barMap);
			console.log('reloadMarkers done!');
		}
		/*
		function changeIcon(index) {
		    for (var i=0; i<markers.length; i++) {
		    	markers[i].setIcon('../images/O3.png');
		    	markers[index].setIcon('../images/O2.png');
		    } 	    
		}
		*/
		function changeIcon(cID) {
			/*
		    for (var i=0; i<barMap.size; i++) {
		    	barMap.get(i).setIcon('../images/O3.png');
		    }
		    */
			
			console.log('this is barMap in changeIcon('+cID+'): ',barMap,'targetbarMap is: ',barMap.get(cID));
			barMap.forEach(function(item){
				item.setIcon('../images/O3.png');
			})
			console.log('icon changed: ',barMap.get(cID));
			//alert('cID is: '+cID);
			//alert('barMap is:'+barMap);
			//alert('barMap.get(cID) is: '+barMap.get(cID));
		    barMap.get(cID).setIcon('../images/O2.png');
		    
			
		}
		
		function reloadOrders() {
		    for (var i=0; i<orders.length; i++) {
		    	console.log(orders[i]);
		    	orders[i].setMap(null);
		    }
		    console.log('order clear!');
		    orders = [];
		}
		function reserveOrder(prefix,input,senderId,situation){
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'/'+senderId+'').then(
					function(response) {
						console.log('reserveOrder done');
						return response.json();
					}).then(function(){
						/*
						console.log('current bar order : ', JSONdata);
						if(situation=='byBar'){
							console.log('situation is: ',situation);
							reloadOrders();
							var prefix = 'logistic/OrderSearchByBar';
							input = JSONdata[0].cID;
							getOrders(prefix,input,senderId,situation);
						}else if(situation=='all'){
							console.log('situation is: ',situation);
							reloadOrders();
							var prefix = 'logistic/OrderSearchByBar';
							input = 0;
							getOrders(prefix,input,senderId,situation);
						}
						*/
						getMarkers('logistic/OrderSearch',1,'${getSenderId}','all')
						getOrders('logistic/OrderSearchByBar',0,'${getSenderId}','all')
						
						
					})
				}
		function getMarkers(prefix,input,senderId,situation){
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
					function(response) {
						console.log('getMarker data get!');
						return response.json();
					}).then(function(JSONdata) {
						console.log('this is MarkerJSON: ', JSONdata);
						var defaultIndex = 0;
						var all = JSONdata.forEach(function(item){
							if(prefix=='Bar'||prefix=='logistic/OrderSearch'){
							var index = defaultIndex;
							var barId = item.userId;
							var name = item.name;
							var beginTime = item.beginTime;
							var endTime = item.endTime;
							var address = item.address;
							var lat = item.lat;
							var lng = item.lng;
							var type = item.type;
							var orderNum = item.orderNum.toString();
							var img = item.img;
							var brief = item.brief;
							var point = new google.maps.LatLng(lat, lng);
							//建立個別marker
							var marker = new google.maps.Marker({
								map : map,
								position : point,
								//logistic頁面 所以要往上一層
								icon : '../images/O3.png',
//								icon : '../images/'+type+'.png',
								label : {
								    text: orderNum,
								    color: 'red',
								    fontSize:'24px'
								  }
							});
							barMap.set(barId,marker);
							//markers.push(marker);
							//建立個別window
							var contentString = 	'<div class="barDiv">'+
							'<div class="infoName">'+name+'</div>'+
							'<div class="infoDetail" >營業時間:'+beginTime.substring(11)+' ~ '+endTime.substring(11)+'</div>'+
							'<div class="infoAddr" >'+address+'</div>'+
							//'<img class="infoImg" alt="未設定照片" src="/Bartenders/logistic/images/'+img+'">'+
							//'<div class="detailDiv">'+
								
								
							//'</div>'+
							
							'</div>';
						
							marker.addListener('click', function() {
								infowindow.setContent(contentString);
								infowindow.open(map, marker);
								var prefix = 'logistic/OrderSearchByBar'
									input = barId;
								changeIcon(barId);
								reloadOrders();
								getOrders(prefix,input,senderId,'byBar');
								
							});
							defaultIndex++;
							}//if結尾
						})	
						
					});
					console.log('getMarkers done')
				}
		//刷新訂單
		function reset(prefix,input){
			fetch('http://localhost:8080/Bartenders/logistic/OrderSearchByBar/0').then(
					function(response) {
						console.log('data get!');
						return response.json();
					}).then(function(JSONdata) {
						getOrderJSON(JSONdata,'all');
					});
				}			
		//讀取特定訂單
		 function getOrders(prefix,input,senderId,situation){
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
					function(response) {
						console.log('getOrders data get!');
						return response.json();
					}).then(function(OrderJSON) {
						console.log('this is OrderJSON: ', OrderJSON);
						var all = OrderJSON.forEach(async function(item){
							
							var address = item.oAddr;
							var oID = item.oID;
							var lID = item.lID;
							var cID = item.cID;
							var sID = item.sID;
							//進行座標轉換
							await getInput(address);
							var lat = orderLat;
							var lng = orderLng;
							
							var point = new google.maps.LatLng(lat, lng);
							var iconImg;
							//建立個別marker
							/**/
							if(sID!=null){
								iconImg = '../images/reserveMarker.png';
								var contentString = 	'<div id="odiv">'+
								'<p class="oinfoDetail">物流單號: '+lID+'</p>'+
								'<p class="oinfoDetail">運送地址: '+address+'</p>'+
								'</div>';
							}else{
								
								iconImg = '../images/defaultMarker.png';
								var contentString = 	'<div id="odiv">'+
								'<p class="oinfoDetail">物流單號: '+lID+'</p>'+
								'<p class="oinfoDetail">運送地址: '+address+'</p>'+
								//'<a style="color:blue;" href="javascript: reserveOrder(\'logistic/OrderReserveByBar/bar/60\',\''+oID+'\','+senderId+',\'byBar\')">我要接單</a>'+
								'<a style="color:blue;" href="javascript: $(\'button[id*='+cID+'-'+oID+'][class*=normal]\').click()">我要接單</a>'+
								'<br>'+
								//'<a style="color:blue;" href="javascript: reserveOrder(\'logistic/OrderReserveByBar/bar/5\',\''+oID+'\','+senderId+')">5秒接單</a>'+
								'<a style="color:blue;" href="javascript: $(\'button[id*='+cID+'-'+oID+'][class*=demo]\').click()">5秒接單</a>'+
								'</div>';
				
							};
							if(sID==null){
								var marker = new google.maps.Marker({
									map : map,
									position : point,
									//logistic頁面 所以要往上一層
									icon : iconImg
								});
								orders.push(marker);
								//建立個別window
								marker.addListener('click', function() {
									infowindow.setContent(contentString);
									infowindow.open(map, marker);
									changeIcon(cID);
								});
							}	
				})
				getOrderJSON(OrderJSON,situation);
			});
			console.log('getOrders done')
		}
		 
		 

		