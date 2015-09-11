<?php

function fatorial($num) {
 if($num>1){
  return $num*fatorial($num-1);
 }
 else return $num;
}

echo fatorial(4);

?>
