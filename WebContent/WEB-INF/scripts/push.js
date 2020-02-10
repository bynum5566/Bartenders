

let reg = null;
var sub;
var isSubscribed = false;
const applicationServerPublicKey = 'BJy4oN1An6NJG5rxWrIyfQMZdqqvIkHbQxh7yrr8Iasa0q-onHTR-K9UCcBy16NnVWgfxOOG6eCyGXWe-7DYsGo';
//轉碼函數
function urlB64ToUint8Array(base64String) {
const padding = '='.repeat((4 - base64String.length % 4) % 4);
const base64 = (base64String + padding)
  .replace(/\-/g, '+')
  .replace(/_/g, '/');

const rawData = window.atob(base64);
const outputArray = new Uint8Array(rawData.length);

for (let i = 0; i < rawData.length; ++i) {
  outputArray[i] = rawData.charCodeAt(i);
}
return outputArray;
}

//取得button DOM
var subscribeButton = document.querySelector('button');
if ('serviceWorker' in navigator && 'PushManager' in window) {
	  //如果有serviceWorker可以使用
	console.log('Service Worker and Push is supported');

  //註冊sw.js，其中有實作與推播相關的行為
  navigator.serviceWorker.register('scripts/pushsw.js')
.then(function(serviceWorkerRegistration) {
 //可以開始註冊推播，將讓冊按鈕變成able狀態
	console.log('Service Worker is registered: ', serviceWorkerRegistration);
    reg = serviceWorkerRegistration;
    subscribeButton.disabled = false;
  }).catch(function(error) {
    console.log('Service Worker Error :^)', error);
  });
}
//設定註夕按鈕的click行為
subscribeButton.addEventListener('click', function() {
  if (isSubscribed) {
    unsubscribe();
  } else {
    subscribe();
  }
});
function subscribe() {

	
	const appServerKey = urlB64ToUint8Array(applicationServerPublicKey);//先轉碼
	const subscribeSetting = {
			  userVisibleOnly: true,//在發送推送時顯示通知
			  applicationServerKey: appServerKey}//提供公鑰}
  reg.pushManager.subscribe(subscribeSetting)
  .then(function(Subscription){
 //註冊推播成功，印出推播相關訊息，改變註冊按鈕狀態
	const subscriptionString = JSON.stringify(Subscription); //subscriptionString是字串
    sub = Subscription; //sub 以及 pushSubscription都是Json格式
    console.log('Subscribed! Endpoint:', sub.endpoint);
    console.log('Subscribed! expirationTime:', sub.expirationTime);
    var key = sub.getKey('p256dh');
    var auth = sub.getKey('auth');
    console.log('Subscribed! p256dh:', sub.getKey('p256dh'));
    console.log('Subscribed! auth:', sub.getKey('auth'));

    var encodedKey = btoa(String.fromCharCode.apply(null, new Uint8Array(key)));
    var encodedAuth = btoa(String.fromCharCode.apply(null, new Uint8Array(auth)));
    console.log('encodedKey:', encodedKey);
    console.log('encodedAuth:', encodedAuth);

    isSubscribed = true;
    document.getElementById("pushsubscription").innerHTML = subscriptionString;
    
    fetch('/GetData.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            endpoint: subscription.endpoint,
            // Take byte[] and turn it into a base64 encoded string suitable for
            // POSTing to a server over HTTP
            key: key ? btoa(String.fromCharCode.apply(null, new Uint8Array(key))) : '',
            auth: auth ? btoa(String.fromCharCode.apply(null, new Uint8Array(auth))) : ''
        })
    })
    /*
    .then(function(response) {
	    if (!response.ok) {
	      throw new Error('Bad status code from server.');
	    }

	    return response.json();
	  });
	 */
  });
}
function unsubscribe() {
  sub.unsubscribe().then(function(event) {
 //取消註冊推播成功，印出推播相關訊息，改變註冊按鈕狀態
    subscribeButton.textContent = 'Subscribe';
    console.log('Unsubscribed!', event);
    isSubscribed = false;
  }).catch(function(error) {
    console.log('Error unsubscribing', error);
    subscribeButton.textContent = 'Subscribe';
  });
}

function sendSubscriptionToBackEnd(sub) {
    console.log('Subscribed! auth:', sub.getKey('auth'));
    console.log('Subscribed! p256dh:', sub.getKey('p256dh'));
    console.log("endpoint:",sub.endpoint);

	/*
	  return fetch('/NotificationProject/subscribe', {
	    method: 'POST',
	    headers: {
	      'Content-Type': 'application/json'
	    },
	    body: JSON.stringify(pushSubscription)
	  })
	  
	  .then(function(response) {
	    if (!response.ok) {
	      throw new Error('Bad status code from server.');
	    }

	    return response.json();
	  })
	  .then(function(responseData) {
	    if (!(responseData.data && responseData.data.success)) {
	      throw new Error('Bad response from server.');
	    }
	  });
	  */
	}