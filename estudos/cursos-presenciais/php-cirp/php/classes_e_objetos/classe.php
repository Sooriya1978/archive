<?php
//public: objetos podem usar
//private: só dentro da classe
//protected: dentro da classe e das herdadas
//Classe PAI
class Carro {
  //Atributos
  public $portas;
  public $bancos;

  //Esse método sempre é executado no instanciamento da classe
  public function __construct(){
    $this->portas = 2;
    $this->bancos = 3;
  }

  //Métodos
  public function acelerar(){
    echo "acelerando. portas: {$this->portas} <br>";
  }
  public function frear(){
    echo "frear. <br>";
  }
}

//Classe filha
class Palio extends Carro {
  public $arCondicionado;
  
  public function __construct($temAr=false){
    //Chama o construtor da classe pai
    parent::__construct();
    //Acessa o atributo
    $this->arCondicionado = $temAr;
  }

  public function temAr(){
    if($this->arCondicionado) echo "Esse carro tem Ar condicionado";
    else  echo "Esse carro nao tem Ar condicionado";
  }
  
}
