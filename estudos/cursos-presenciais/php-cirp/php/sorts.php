<?php

$lista = array();
$lista = array('0'=>'c','d','a');
$lista[] = 'b';
$lista['banana'] = 'amarela';
echo "<pre>";
echo "Array original: <br>";
print_r($lista);

//sort,ksort, asort,rsort
$lista_sort = $lista;
$lista_rsort = $lista;
$lista_krsort = $lista;
$lista_ksort = $lista;
$lista_asort = $lista;
$lista_arsort = $lista;

sort($lista_sort);
echo "sort ordena em ordem crescente pelos valores, mas JOGA OS INDICES FORA! ";
print_r($lista_sort);

rsort($lista_rsort);
echo "rsort ordena em ordem decrescente pelos valores, e PERDE OS INDICES. ";
print_r($lista_rsort);

asort($lista_asort);
echo "asort ordena em ordem crescente pelos valores, MANTEDO OS INDICES ";
print_r($lista_asort);

arsort($lista_arsort);
echo "arsort ordena em ordem decrescente pelos valores, MANTEDO OS INDICES ";
print_r($lista_arsort);

ksort($lista_ksort);
echo "ksort ordena em ordem crescente pelos indices, MANTENDO OS INDICES ";
print_r($lista_ksort);

krsort($lista_krsort);
echo "krsort ordena em ordem decrescente pelos indices, MANTENDO OS INDICES ";
print_r($lista_krsort);

?>
