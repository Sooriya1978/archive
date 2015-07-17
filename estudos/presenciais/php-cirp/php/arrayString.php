<?php

//String para array
$texto = "A B C";
$vetor = explode(" ",$texto);
print_r($vetor);
echo "<br>";

//array para string
$texto = implode("/",$vetor);
echo $texto;

?>
