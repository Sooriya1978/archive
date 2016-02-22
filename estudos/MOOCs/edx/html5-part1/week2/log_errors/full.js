vid = document.querySelector('#myVideo');

vid.addEventListener('error', function(evt) {
    logEvent(evt,'red');
}, false);

function logEvent(evt, color) {
    switch (evt.type) {
       case 'error':
           var error = document.querySelector('video').error;
           switch (error.code) {
             case error.MEDIA_ERR_ABORTED:
                note.innerHTML = "fetching aborted at the user's request";
                break;
             case error.MEDIA_ERR_NETWORK:
                note.innerHTML = "a network error caused the browser to stop fetching the media";
                break;
             case error.MEDIA_ERR_DECODE:
                note.innerHTML = "an error occurred while decoding the media";
                break;
             case error.MEDIA_ERR_SRC_NOT_SUPPORTED:
                note.innerHTML = "the media indicated by the src attribute was not suitable";
                break;
             default:
                note.innerHTML = "an error occurred";
                break;
           }
           break;
       }
}
