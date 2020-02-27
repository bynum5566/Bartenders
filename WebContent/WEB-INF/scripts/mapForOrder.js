
		var googleMaps;
		var cancelLocating=false;
		var infowindow;
		var markers = [];
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
		
		function reloadMarkers(prefix,input) {
		    for (var i=0; i<markers.length; i++) {
		    	console.log(markers[i]);
		        markers[i].setMap(null);
		    }
		    console.log('marker clear!');
		    markers = [];
		}
		
		function changeIcon(index) {
		    for (var i=0; i<markers.length; i++) {
		    	markers[i].setIcon('../images/O3.png');
		    	markers[index].setIcon('../images/O2.png');
		    } 	    
		}
		
		function reloadOrders() {
		    for (var i=0; i<orders.length; i++) {
		    	console.log(orders[i]);
		    	orders[i].setMap(null);
		    }
		    console.log('order clear!');
		    orders = [];
		}
		
		function getMarkers(prefix,input){
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
					function(response) {
						console.log('data get!');
						return response.json();
					}).then(function(JSONdata) {
						console.log('this is data: ', JSONdata);
						var defaultIndex = 0;
						var all = JSONdata.forEach(function(item){
							if(prefix=='Bar'||prefix=='logistic/OrderSearch'){
							var index = defaultIndex;
							console.log('this index: ', index);
							var barId = item.userId;
							var name = item.name;
							var address = item.address;
							var lat = item.lat;
							var lng = item.lng;
							var type = item.type;
							var orderNum = item.orderNum.toString();
							console.log('this is pending order: ', orderNum);
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
							
							markers.push(marker);
							//建立個別window
							var contentString = 	'<div>'+
							'<h3 class="infoH3">'+name+'</h3>'+
							'<img class="infoType" alt="未設定類型" src="../images/'+type+'.png">'+
							'<div class="infoAddr" >'+address+'</div>'+
							'<img class="infoImg" alt="未設定照片" src="../images/'+img+'">'+
							'<div class="infoBrief" >'+brief+'</div>'
							'</div>';
						
							marker.addListener('click', function() {
								infowindow.setContent(contentString);
								infowindow.open(map, marker);
								var prefix = 'logistic/OrderSearchByBar'
									input = barId;
								changeIcon(index);
								reloadOrders();
								getOrders(prefix,input);
								
							});
							defaultIndex++;
							}//if結尾
						})	
					});
				}

						
		//讀取特定訂單
		 function getOrders(prefix,input){
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
					function(response) {
						console.log('data get!');
						return response.json();
					}).then(function(OrderJSON) {
						console.log('this is OrderJSON: ', OrderJSON);
						//<c:set var="orderData" scope="page" value="OrderJSON" />;
						var all = OrderJSON.forEach(async function(item){
							
							var address = item.oAddr;
							var lID = item.lID;
							//進行座標轉換
							await getInput(address);
							var lat = orderLat;
							var lng = orderLng;
							var point = new google.maps.LatLng(lat, lng);
							//建立個別marker
							var marker = new google.maps.Marker({
								map : map,
								position : point,
								//logistic頁面 所以要往上一層
								icon : '../images/defaultMarker.png',
							});
							
							orders.push(marker);
							//建立個別window
							var contentString = 	'<div id="odiv">'+
							'<p class="oinfoDetail">物流單號: '+lID+'</p>'+
							'<p class="oinfoDetail">運送地址: '+address+'</p>'+
							'</div>';
							marker.addListener('click', function() {
								infowindow.setContent(contentString);
								infowindow.open(map, marker);
								
							});
							
				})
				getOrderJSON(OrderJSON);
			});
		}
		 
		 

		