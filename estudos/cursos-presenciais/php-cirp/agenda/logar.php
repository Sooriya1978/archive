<?php

include('Controlador.php');

$usuario = $_POST['usuario'];
$senha = $_POST['senha'];

$html = "<h2>Autenticação</h2>" 
. "<form action='logar.php' method='POST'>"
. "Usuário: <br> <input type='text' name='usuario'> <br>"
. "Senha: <br> <input type='password' name='senha'> <br>"
. "<input type='submit' value='OK'> <br>"
;

if( ($usuario != "") and ($senha != "") ) {
  if($con->camposOK('login')) {
    $sql = "select count(*) as qtde from usuarios where usuario='{$usuario}' and senha='{$senha}'";
    if($con->sql($sql,$linhas)){
      if($linhas[0]['qtde'] > 0){
        session_start();
        $_SESSION = array();
        $_SESSION['usuario'] = $usuario;
        header('location: index.php');
      } 
      else { 
        $con->erro('Usuário ou senha inválidos');
      }
    }
  }
  else {
   $con->erro('Erro no formato ou na senha!');
  }
}
$con->html($html);
$con->show();

?>
