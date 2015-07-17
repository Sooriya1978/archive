// 0 (which JavaScript reads as 'false') 
// 1 (which JavaScript reads as 'true')
document.write(Math.floor(Math.random()*5+1));

var slaying = true;
var youHit = Math.random();
var damageThisRound = Math.floor(Math.random()*5+1);
var totalDamage = 0;

while(slaying){
    if(youHit){
        document.write("you hit the dragon!");
        totalDamage+=damageThisRound;
        if(totalDamage>=4){
            document.write("You slew the dragon");
            slaying = false;
        }
        else{
            youHit = Math.random();
        }
        slaying = false;
    }
    else{
        document.write("the dragon defeated you!");
        slaying = false;
    }
}
