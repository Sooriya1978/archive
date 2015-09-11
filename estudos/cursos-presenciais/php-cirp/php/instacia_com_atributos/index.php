<?php
class BestClass {
  //Atributos
  public $x;
  public $y;
  public $z;

  //Esse método sempre é executado no instanciamento da classe
  public function __construct($a='valor nao setado',$b='valor nao setado',$c='valor nao setado'){
    echo "iniciei ...<br>";
    $this->x = $a; 
    $this->y = $b; 
    $this->z = $c; 
  }

  //Métodos
  public function mostrarAtributos(){
    echo "Atributo x: {$this->x} <br>";
    echo "Atributo y: {$this->y} <br>";
    echo "Atributo z: {$this->z} <br>";
  }
}

$objeto = new BestClass('XXXX','YYYYY');
$objeto->mostrarAtributos();

?>

