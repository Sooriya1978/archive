<?php

include("./classe.php");

 
$meuCarro = new Carro();
$meuCarro->acelerar();
$meuCarro->frear();

$carroThais = new Palio(true);
$carroThais->portas=4;
$carroThais->acelerar();
$carroThais->temAr();

