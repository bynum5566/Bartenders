
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
	        };
		};
		
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
					if(prefix=='Bar'||prefix=='OrderSearch'){
					var id = item.barId;
					var name = item.name;
					var address = item.address;
					var lat = item.lat;
					var lng = item.lng;
					var type = item.type;
					var orderNum = item.orderNum.toString();
					console.log('this is pending order: ', orderNum);
					var img = item.img;
					console.log('this is img: ', img);
					var brief = item.brief;
					var point = new google.maps.LatLng(lat, lng);
					//建立個別marker
					var marker = new google.maps.Marker({
						map : map,
						position : point,
						//logistic頁面 所以要往上一層
						icon : '../images/O1.png',
//						icon : '../images/'+type+'.png',
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
					'<img class="infoType" alt="未設定類型" src="'+type+'.png">'+
					'<div class="infoAddr" >'+address+'</div>'+
					'<img class="infoImg" alt="未設定照片" src="images/'+img+'">'+
					'<div class="infoBrief" >'+brief+'</div>'
					'</div>';
					
					marker.addListener('click', function() {
						infowindow.setContent(contentString);
						infowindow.open(map, marker);
					});
					}else if(prefix=='ActivityUserId'||prefix=='ActivityType'||prefix=='ActivityActivityId'||prefix=='ActivityDate'||prefix=='ActivityJoker'){
						var id = item.activityId;
						var name = item.name;
						var address = item.address;
						var lat = item.lat;
						var lng = item.lng;
						var type = item.type;
						
						var img = item.img;
						console.log('this is img: ', img);
						var brief = item.brief;
						var point = new google.maps.LatLng(lat, lng);
						//建立個別marker
						var marker = new google.maps.Marker({
							map : map,
							position : point,
							icon: 'images/'+type+'.jpg'
						});
						
						markers.push(marker);
						//建立個別window
						var contentString = 
						'<div class="infoDiv">'+
						'<div class="infoTitle">'+
							'<h1 class="infoH1">'+name+'</h1>'+
							'<img class="infoType" alt="未設定類型" src="images/'+type+'.png">'+
						'</div>'+
						'<img class="infoImg" alt="未設定照片" src="images/'+img+'">'+
						'<div class="detailDiv">'+
							'<p class="infoDetail">2020/02/21</p>'+
							'<p class="infoDetail">16:00 ~ 20:00</p>'+
							'<p class="infoDetail">'+address+'</p>'+
							'<p class="infoDetail">主辦人:林靖</p>'+
							'<p class="infoDetail">0921228145</p>'+
							'<p class="infoDetail">人數: 2 / 5</p>'+
							'<p class="infoDetail"><a>活動詳情</a></p>'+
						'</div>'+
						
							'<div class="outer">'+
								'<div class="ground">'+
									'<p class="limitP" class="num"><img src="images/arrowLimit.png"></p>'+
									'<div class="targetD">'+
										'<p class="targetP" class="num"><img src="images/arrowTarget.png"></p>'+
									'</div>'+
									'<div class="currentD">'+
										'<img class="currentP" src="images/arrowCurrent.png">'+
									'</div>'+
								'</div>'+
							'</div>'+
						
						'<div class="infoBrief" >'+brief+'</div>'+
					'</div>';
						
						
						marker.addListener('click', function() {
							infowindow.setContent(contentString);
							infowindow.open(map, marker);
						});
					}//if結尾
				})	
			});
		}

		