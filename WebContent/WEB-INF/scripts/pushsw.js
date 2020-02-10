//設定推播相關設定
console.log('Started', self);
//設推播的install事件要做的行為A
self.addEventListener('install', function(event) {
  self.skipWaiting();
  console.log('Installed', event);
});
//設推播的activate事件要做的行為A
self.addEventListener('activate', function(event) {
  console.log('Activated', event);
});
//設推播的push事件要做的行為A
self.addEventListener('push', function(event) {
  console.log('Push message', event);
  var title = 'Push message';
  event.waitUntil(
 //產生Pop up的彈跳訊息事窗，桌機會出現在右下角
 //其中，event.data.json()可以得到傳送的json字串(解密後)
 //myText是要傳的json中我設的一個key
    self.registration.showNotification(title, {
      body: 'hihihihihihi',
      icon: 'images/icon.png',
      tag: 'my-tag'
    }));
});