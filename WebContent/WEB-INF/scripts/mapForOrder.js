
		var googleMaps;
		var cancelLocating=false;
		var infowindow;
		var markers = [];
		var tempMarkList = [];
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'),mapStyle);
			infowindow = new google.maps.InfoWindow;
		}
		
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
		
		function getMarkers(prefix,input){
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
					function(response) {
						console.log('data get!');
						return response.json();
					}).then(function(JSONdata) {
						console.log('this is data: ', JSONdata);
						var all = JSONdata.forEach(function(item){
							if(prefix=='Bar'||prefix=='logistic/OrderSearch'){
							var lat = item.lat;
							var lng = item.lng;
							var orderNum = item.orderNum.toString();
							var point = new google.maps.LatLng(lat, lng);
							//建立個別marker
							var marker = new google.maps.Marker({
								map : map,
								position : point,
								//logistic頁面 所以要往上一層
								icon : '../images/O1.png',
								label : {
								    text: orderNum,
								    color: 'red',
								    fontSize:'24px'
								  }
							});
							
							markers.push(marker);
							//建立個別window
							var contentString = 	'<div id="idiv">'+
							'</div>';
							/*
							marker.addListener('click', function() {
								infowindow.setContent(contentString);
								infowindow.open(map, marker);
							});
							 */
					}
				})
			});
		}
		//讀取特定訂單
		function getOrders(prefix,input){
			fetch('http://localhost:8080/Bartenders/'+prefix+'/'+input+'').then(
					function(response) {
						console.log('data get!');
						return response.json();
					}).then(function(JSONdata) {
						console.log('this is data: ', JSONdata);
						var all = JSONdata.forEach(function(item){
							if(prefix=='Bar'||prefix=='logistic/OrderSearch'){
							var lat = item.lat;
							var lng = item.lng;
							var orderNum = item.orderNum.toString();
							var point = new google.maps.LatLng(lat, lng);
							//建立個別marker
							var marker = new google.maps.Marker({
								map : map,
								position : point,
								//logistic頁面 所以要往上一層
								icon : '../images/O1.png',
								label : {
								    text: orderNum,
								    color: 'red',
								    fontSize:'24px'
								  }
							});
							
							markers.push(marker);
							//建立個別window
							var contentString = 	'<div id="idiv">'+
							'</div>';
							/*
							marker.addListener('click', function() {
								infowindow.setContent(contentString);
								infowindow.open(map, marker);
							});
							 */
					}
				})
			});
		}

		