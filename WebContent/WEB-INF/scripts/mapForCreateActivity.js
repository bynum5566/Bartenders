		var map;
		var googleMaps;
		var cancelLocating=false;
		var infowindow;
		var markers = [];
		var tempMarkList = [];
		var locationLat;
		var locationLng;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'),mapStyle); 
			infowindow = new google.maps.InfoWindow;
			Location();
		}
		
		function reloadMarkers() {
		    for (var i=0; i<markers.length; i++) {
		    	console.log(markers[i]);
		        markers[i].setMap(null);
		    }
		    markers = [];
		}
		
		function getMarkers(lat,lng,type){
			if(type=='no'){
				icon = 'defaultMarker';
			}else{
				icon = type;
			}
			var point = new google.maps.LatLng(lat, lng);
			//建立暫時marker
			var marker = new google.maps.Marker({
				map : map,
				position : point,
				icon: 'images/'+icon+'.png'
			});
			markers.push(marker);	
		}
		function relocate(lat,lng){
			reloadMarkers()
			
			var place = new google.maps.LatLng(lat, lng);
			map.panTo(place); 
			marker = new google.maps.Marker({
                position: place,
                icon:'images/defaultMarker.png',
                map: map
            });
			markers.push(marker);
		};
		//透過點擊地圖取得座標
		function CancelLocating(){
			cancelLocating = true;
			console.log('cancel locating');
		}
		function Location(){
			console.log('enable locating');
			google.maps.event.addListener(map, 'click', function(event) {
				if(cancelLocating==true){
					console.log('locating function is stop');
					return;
				}
				reloadMarkers();
				alert(event.latLng.lat() + ", " + event.latLng.lng());
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();

				document.getElementById('lat').value = lat;
				document.getElementById('lng').value = lng;

			});
		}
		