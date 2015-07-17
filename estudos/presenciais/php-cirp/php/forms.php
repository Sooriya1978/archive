<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<html>
  <body>
   <form action="./forms.php" method="POST">
     <input type="text" name="nome" maxlength="10"> <br>
     <input type="submit" value="ok">
   </form>
  </body>
</html>

<?php
header("content type: text/html;charset=utf-8");
if(!empty($_POST['nome'])) {
  $nome = $_POST['nome'];
  echo "olá {$nome}	";
}
?>
