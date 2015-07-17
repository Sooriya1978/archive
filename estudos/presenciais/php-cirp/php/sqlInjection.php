<?php
echo "Exeplo de ataque SQL injection!";
echo "<br>";
$nome = "Thiago Gomes); delete from clientes;";
echo "<br>";
echo "sql insert: insert into clientes (nome) values ({$nome})";

?>
