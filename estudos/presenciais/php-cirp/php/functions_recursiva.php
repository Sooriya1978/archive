<?php
$pi = 3.14;
$numero  = 3;
function recursiva(){
 global $pi;
 echo "olha quanto vale pi: {$pi} <br>";
 $pi = 550;
 static $numero; //Preserva o valor alterado
 if($numero > 1) {
  echo "numero {$numero} <br>";
  $numero--;
  recursiva();
 }
}

echo "numero {$numero} <br>";
recursiva();
echo "numero {$numero} <br>";
 

echo "olha quanto vale pi agora: {$pi} <br>";

?>
