var loop = function(){
	var i = 1;
	while(i<4) {
		document.write("I'm looping! <br>");
		i++;
	}
};

loop();

var soloLoop = function(){
	var logica = true;
	while(logica){
		document.write("Looped once!<br>");
		logica = false;
	}
};

soloLoop();

var doWhile = function(){
	var x = false;
	do {
		document.write("Vou rodar uma vez " + String(x))
	} while(x);
};
doWhile();
