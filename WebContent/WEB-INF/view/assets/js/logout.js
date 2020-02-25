function signOut() {
    gapi.auth2.init().then( () => {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
           });
    })
    document.location.href="http://localhost:8080/Bartenders/logout";
  }
  
  function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }