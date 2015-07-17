// Check if the user is ready to play!
confirm('I am ready to play!');
var age = prompt("What's your age?");

if(typeof(age) !== 'number') document.write("Cabeca de ovo coloque um numero");

if (age < 18){
    document.write("Nao pode");
}
else {
    document.write("Vamos Start!");
}
document.write("Snow White and Batman were hanging out at the bus stop, waiting to go to the shops. There was a sale on and both needed some new threads. You've never really liked Batman. You walk up to him.");
document.write("Batman glares at you.");
var userAnswer = prompt("Are you feeling lucky, punk?");
if (userAnswer == "yes"){
    document.write("Batman hits you very hard. It's Batman and you're you! Of course Batman wins!");
}
else {
    document.write("You did not say yes to feeling lucky. Good choice! You are a winner in the game of not getting beaten up by Batman.");
}
feedback = prompt("Avalie");
if(feedback>8){
    document.write("This is just the beginning of my game empire. Stay tuned for more!");
}
else {
    document.write("I slaved away at this game and you gave me that score?! The nerve! Just you wait!");
}
