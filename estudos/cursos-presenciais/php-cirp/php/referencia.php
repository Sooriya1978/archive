<?php
header("Content-type: text/html ; charset=utf-8;");
function nomes(&$dummy_interno){
 $dummy_interno = "Thais";
}

$dummy = "Thiago";
echo "Dummy antes de chamar a função: {$dummy} <br>"; 
nomes($dummy);
echo "Dummy depois de chamar a função: {$dummy} <br>"; 
?>
