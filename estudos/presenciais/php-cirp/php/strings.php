<?php

//trim: remove espaços do começo e do final da string
$bomdia = "                 BoM dia meu caro amigo!               ";

$texto = trim($bomdia);
echo $texto;
echo "<br>";

//maiúscula
echo strtoupper($texto);
echo "<br>";

//minúscula
echo strtolower($texto);
echo "<br>";

//Pega posição 
echo strpos($texto,"caro");
echo "<br>";

//recorta string: começa na posição 4 e tem comprimento de 7 caracteres
echo substr($texto,4,7);
echo "<br>";

//replace
echo str_replace("amigo","amiga",$texto);
echo "<br>";

//tamanho
echo strlen($texto);
echo "<br>";

?>
