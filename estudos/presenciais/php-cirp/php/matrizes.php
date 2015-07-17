<?php
echo "<pre>";
$multi = array(
  array("A","a"),
  array("B","b"),
  array("C","c"),
);
$linhas = count($multi);
$colunas = count($multi[0]);
echo "Linhas: {$linhas} e colunas: {$colunas}";

$clientes = array(
  array(
    "nome" => "Thiago",
    "telefone" => "123456",
  ), 
  array(
    "nome" => "Jose",
    "telefone" => "654321",
  ), 
);
print_r($clientes);
echo "<hr>"
 . "<table border=\"1\">"  
   . "<thead>"
     ."<tr>" 
       ."<th>Nome</th>"
       ."<th>Telefone</th>"
     ."</tr>"   
   . "</thead>"
   . "<tbody>";
foreach($clientes as $cliente){
  echo "<tr>";
  foreach($cliente as $campos=>$valores){
    echo "<td>{$valores} </td>";
  }
  echo "</tr>";
}

echo 
 " </tbody>"
 . "</table>";

?>
