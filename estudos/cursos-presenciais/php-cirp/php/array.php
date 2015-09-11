<?php

$lista = array();
$lista = array('0'=>'c','d','a');
$lista[] = 'b';
$qtde = count($lista);

for ($i = 0; $i < $qtde ; $i++) {
  echo "{$lista[$i]} <br>";
}

foreach ($lista as $item) {
  echo "{$item} <br>";
}

$idades = array('thiago'=>27,'thais'=>25);
print_r($idades);

?>
