
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyARuVyX8O40wx8QEl-KB-doaOJ1ehxzLk4",
    authDomain: "firstpush-da104.firebaseapp.com",
    databaseURL: "https://firstpush-da104.firebaseio.com",
    projectId: "firstpush-da104",
    storageBucket: "firstpush-da104.appspot.com",
    messagingSenderId: "73910678088",
    appId: "1:73910678088:web:8159bbaac57dd2d1655e7d",
    measurementId: "G-8703KYS025"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();
  messaging.usePublicVapidKey('BKHqNcUg2Rvkdk-aYahA3pp3popFXlFA9Wabu-XFdOLTAYz9v8mULKbeGwBjdt7flZD15m3iPavcKqyJFm8lpUY');
  
  messaging
    .requestPermission()
    .then(function() {
      console.log('Notification permission granted.');
    })
    .catch(function(err) {
      console.log('Unable to get permission to notify.', err);
    });
  messaging.getToken()
    .then((currentToken) => {
    	console.log('try to get token');
      console.log(currentToken);
    }).catch((err) => {
        console.log('Unable to retrieve refreshed token ', err);
      });
  messaging.onMessage(function(payload) {
	  console.log('onMessage', payload);
  });
