		var mapReal = [];
		var googleMaps;
		var infowindow;
		var mapId = pre;
		var mapNumber = number;
		var mapIndex = pre;
		var markers = new Array(mapNumber);
		for(var i=0; i<mapNumber;i++){
			markers[i] = new Array();
		}

		function initMap() {
//			var bounds  = new google.maps.LatLngBounds();
//			console.log('this is bounds:',bounds)
			for(var i=0; i<mapNumber;i++){
				console.log('creating mapId: ',mapId[i]);
				mapIndex[i] = new google.maps.Map(document.getElementById(mapId[i]),mapStyle);
				mapReal.push(mapIndex[i]);
				console.log('creating success: ',mapReal[i]);
			}
			infowindow = new google.maps.InfoWindow;
			console.log('mapReal: ',mapReal);
			console.log('mapId: ',mapId);
			console.log('mapNumber: ',mapNumber);
			console.log('mapIndex: ',mapIndex);
			console.log('markers: ',markers);
		}


		