//Array
var languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"];
document.write(languages[2]);
document.write(languages.length);
for(var i = 0 ; i < languages.length; i++){
    document.write(languages[i]);
}

//jagged array
var jagged = [[1,2,3,4,5],[1,2]];
var newArray = [[1,2,3],[4,5,6],[7,8,9]];

//O tipo de variável mais usado: object
//Objeto são como arrays, mas podemos ter strings nos índices e funções nos valores.

//Objeto: jeito 1
var me = {name: 'thiago', age: 26};

//Objeto: jeito 2
var myObj = new Object(); //Ou: var myObj = {}
myObj.name = 'thiago'; //Ou: myObj["name"] = 'thiago'
myObj.age = 26;

var me = new Object();
me.name = "Thiago";
me["age"] = 26;

//Object no array
var myArray = [1,true,'a',{nome:'thiago'}];
var newArray = [[1,{a:2}],[3]];

//Array no Object
var myObject = {
  name: 'Eduardo',
  type: 'Most excellent',
  interests: [1,2]
};

