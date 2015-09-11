<?php

echo "tratamento antes de inserir no Banco: ";
$texto = "Thiago ); delete from clientes";
echo "{$texto} <br>";
$texto = str_replace("\\","",$texto);
echo "{$texto} <br>";
$texto = str_replace("'","''",$texto);
echo "{$texto} <br>";
$texto = str_replace('"',"' || E';' || ' ",$texto);
echo "{$texto} <br>";
$texto = str_replace(";","'|| E';' ||'",$texto);
echo "{$texto} <br>";
$texto = str_replace(NULL,"' || E'NULL' || '",$texto);
echo "{$texto} <br>";

?>
