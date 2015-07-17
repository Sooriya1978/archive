<?php
header ( "Content-type: text/html;charset=utf-8" );
$texto = "); 45";

//número
echo is_numeric($texto);
echo "<br> falso: nao mostrada nada ; verdadeiro: 1  <br>";

//string
echo is_string($texto);
echo "<br>";

//coloca caracteres de escape (NAO FUNCIONA NO POSTGRESQL)
$seguro = addslashes($texto);
echo $seguro;
//Para remover escape
echo stripslashes($seguro);
echo "<br>";

//tags html
$texto = "<a href=\"http://cirp.usp.br\">LINK </a>";
echo "texto sem tratamento: {$texto} </br>";
echo "usando htmlspecialchars: (olhe o código fonte da paǵina) " . htmlspecialchars($texto);
echo "<br>";

//Problemas com acentuação
$texto = "veríssimo";
echo "texto sem tratamento: {$texto} </br>";
echo "usando htmlentities: (olhe o código fonte da paǵina) " . htmlentities($texto);
echo "<br>";

?>
