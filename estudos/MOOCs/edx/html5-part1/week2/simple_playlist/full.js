//vid = document.querySelector('#myVideo');
var vid;
var currentVideo = 0;
var sources = [
         "http://html5doctor.com/demos/video-canvas-magic/video.mp4",
         "http://www.archive.org/download/AnimatedMechanicalArtPiecesAtMit/P1120973_512kb.mp4",
         "/home/thiago/teste.mp4"
         ];

function loadNextVideo() {
  vid.src = sources[currentVideo % sources.length];
  vid.load();
  currentVideo++;
}

function loadAndPlayNextVideo() {
  console.log("tocando " + sources[currentVideo % sources.length]);
  loadNextVideo();
  vid.play();
}
function init() {
  vid = document.querySelector('#myVideo');
  vid.addEventListener('ended',loadAndPlayNextVideo,false);
  loadNextVideo();  
} 
