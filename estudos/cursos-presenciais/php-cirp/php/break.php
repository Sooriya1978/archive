<?php
$num  = 1;

while($num < 4) {
  echo "num: {$num} <br>";
  if($num==2){
    echo "vou sair do loop <br>";
    break;
  }
  echo "sou menor mesmo <br>";
  $num++;
}

?>
