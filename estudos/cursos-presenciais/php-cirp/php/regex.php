<?php

$campo1 = "10/11/2014";
$campo2 = "10/11/2014123";

$regra = "/^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/";

if(preg_match($regra,$campo1)) {
  echo "data correta";
}
else echo "data errada";

echo "<br>";

if(preg_match($regra,$campo2)) {
  echo "data correta";
}
else echo "data errada";

?>
