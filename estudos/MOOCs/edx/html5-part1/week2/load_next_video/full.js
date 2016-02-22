vid = document.querySelector('#myVideo');
vid.addEventListener('ended', playNextVideo, false);


function playNextVideo(e) {
     // Whatever you want to do after the event, change the src attribute
     // of the video element, for example, in order to play another video
    vid.src = '/home/thiago/teste2.mp4';
    vid.load();
}
