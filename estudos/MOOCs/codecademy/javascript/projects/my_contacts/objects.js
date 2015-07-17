/*
friends is an object. We can push elements in is object in this way: 
object.key
*/

var friends = {}; // It is the same of: new Object();

//friends.thais is equal to friends['thais']
friends.thais = {
  firstName: "Thais",
  lastName: "Silva",
  number: "123456",
  address: ["Rua Sena","12","sp"]
}; 

friends.bruno = {
  firstName: "Bruno",
  lastName: "Verissimo",
  number: "123456",
  address: ["Rua Santina","13","sp"]
}; 


//A function to list my contacts
var list = function(){
    for (var name in friends){
        console.log(name);
    }
};
//list();

//A function to search friends by firstName
var search = function(name){
  for(var names in friends){
    if(friends[names].firstName === name){
      console.log(friends[names]);
      return friends[name];  
    }
    else {
      console.log('sorry, we do not have this name in our list!');
    }
  }
};
search('Thais')
