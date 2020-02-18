		var map;
		var markers = [];
		var infoWindow;
		function reloadMarkers(type,userId) {
		    for (var i=0; i<markers.length; i++) {
		    	console.log(markers[i]);
		        markers[i].setMap(null);
		    }
		    markers = [];
		    getMarkers(type,userId);
		}
		
		function getMarkers(mapType,input){
			fetch('http://localhost:8080/LogisticSystem/'+mapType+'/'+input+'').then(
					function(response) {
						console.log('data get!');
						return response.json();
					}).then(function(JSONdata) {
				console.log('this is data: ', JSONdata);
				var all = JSONdata.forEach(function(item){
					
					var id = item.userId;
					var name = item.name;
					var address = item.address;
					var lat = item.lat;
					var lng = item.lng;
					var type = item.type;
					var picture = item.img
					var point = new google.maps.LatLng(lat, lng);
					//建立個別marker
					var marker = new google.maps.Marker({
						map : map,
						position : point,
						icon: 'images/'+picture
					});
					
					markers.push(marker);
					//建立個別window
					if(mapType='Bar'){
						var contentString = 	'<div id="idiv">'+
						'<h3 id="ih3" style="margin:10px 10px 0px 10px;display: inline-block">'+name+'</h3>'+
						'<p id="ip" align="right" style="color:red;margin:10px 20px 10px 70px;display: inline">'+type+'</p>'+
						'<p style="margin:5px">'+address+'</p>'+
						'</div>'
					}else if(mapType='ActivityUserId'){
						var contentString = 	'<div id="idiv">'+
						'<h3 id="ih3" style="margin:10px 10px 0px 10px;display: inline-block">'+name+'</h3>'+
						'<p id="ip" align="right" style="color:red;margin:10px 20px 10px 70px;display: inline">'+type+'</p>'+
						'<p style="margin:5px">'+beginTime+' ~ '+endTime+'</p>'+
						'<p style="margin:5px">'+address+'</p>'+
						'<img alt="" src="images/'+picture+'">'+
						'<p>'+brief+'</p>'+
						'</div>'
					}
					
					/*
					
					 */
					
					marker.addListener('click', function() {
						infoWindow.setContent(contentString);
						infoWindow.open(map, marker);
					});
				})
			});
		}
		
		function initMap() {
			
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 25.033054,
					lng : 121.543527
				},
				zoom : 13,
				styles : 
					[ {
						elementType : 'geometry',
						stylers : [ {
							color : '#242f3e'
						} ]
					}, {
						elementType : 'labels.text.stroke',
						stylers : [ {
							color : '#242f3e'
						} ]
					}, {
						elementType : 'labels.text.fill',
						stylers : [ {
							color : '#746855'
						} ]
					}, {
						featureType : 'administrative.locality',
						elementType : 'labels.text.fill',
						stylers : [ {
							color : '#d59563'
						} ]
					}, {
						featureType : 'poi',
						elementType : 'labels.text.fill',
						stylers : [ {
							color : '#d59563'
						} ]
					}, {
						featureType : 'poi.park',
						elementType : 'geometry',
						stylers : [ {
							color : '#263c3f'
						} ]
					}, {
						featureType : 'poi.park',
						elementType : 'labels.text.fill',
						stylers : [ {
							color : '#6b9a76'
						} ]
					}, {
						featureType : 'road',
						elementType : 'geometry',
						stylers : [ {
							color : '#38414e'
						} ]
					}, {
						featureType : 'road',
						elementType : 'geometry.stroke',
						stylers : [ {
							color : '#212a37'
						} ]
					}, {
						featureType : 'road',
						elementType : 'labels.text.fill',
						stylers : [ {
							color : '#9ca5b3'
						} ]
					}, {
						featureType : 'road.highway',
						elementType : 'geometry',
						stylers : [ {
							color : '#746855'
						} ]
					}, {
						featureType : 'road.highway',
						elementType : 'geometry.stroke',
						stylers : [ {
							color : '#1f2835'
						} ]
					}, {
						featureType : 'road.highway',
						elementType : 'labels.text.fill',
						stylers : [ {
							color : '#f3d19c'
						} ]
					}, {
						featureType : 'transit',
						elementType : 'geometry',
						stylers : [ {
							color : '#2f3948'
						} ]
					}, {
						featureType : 'transit.station',
						elementType : 'labels.text.fill',
						stylers : [ {
							color : '#d59563'
						} ]
					}, {
						featureType : 'water',
						elementType : 'geometry',
						stylers : [ {
							color : '#17263c'
						} ]
					}, {
						featureType : 'water',
						elementType : 'labels.text.fill',
						stylers : [ {
							color : '#515c6d'
						} ]
					}, {
						featureType : 'water',
						elementType : 'labels.text.stroke',
						stylers : [ {
							color : '#17263c'
						} ]
					}, {
						"featureType" : "poi.business",
						"elementType" : "all",
						"stylers" : [ {
							"visibility" : "off"
						} ]
					},{
						"featureType" : "poi.government",
						"elementType" : "all",
						"stylers" : [ {
							"visibility" : "off"
						} ]
					},{
						"featureType" : "poi.medical",
						"elementType" : "all",
						"stylers" : [ {
							"visibility" : "off"
						} ]
					},{
						"featureType" : "poi.school",
						"elementType" : "all",
						"stylers" : [ {
							"visibility" : "off"
						} ]
					},{
						"featureType" : "transit",
						"elementType" : "labels.icon",
						"stylers" : [ {
							"visibility" : "off"
						} ]
					} ]
				
			});
			infoWindow = new google.maps.InfoWindow;
			var customLabel = {
				school : {
					label : 'S'
				},
				park : {
					label : 'P'
				}
			};
			getMarkers('ActivityUserId',1001);
	};