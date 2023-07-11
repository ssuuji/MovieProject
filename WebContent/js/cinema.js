/**
 * 
 */
document.addEventListener('DOMContentLoaded', function() {
    var loginBtn = document.querySelector('#login-btn .btn');
    if (loginBtn) {
        loginBtn.addEventListener('click', function() {
            document.querySelector('.login-form').classList.toggle('active');
        });
    }
    
    var closeLogin = document.querySelector('#close-login-form');
    if (closeLogin) {
        closeLogin.addEventListener('click', function() {
            document.querySelector('.login-form').classList.remove('active');
        });
    }

   /* var joinBtn = document.querySelector('#join-form');
    if (joinBtn) {
        joinBtn.addEventListener('click', function() {
            document.querySelector("#join\\.jsp .join-form");
            joinBtn.style.display = 'block';
        });}*/
    
    
  /*  var backJoin = document.querySelector('#back-btn');
    if (backJoin) {
        backJoin.addEventListener('click', function() {
            document.querySelector('index\\.jsp .join-form').classList.remove('active');
        });
    }*/
});
