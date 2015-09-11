<?php
//@ pega o erro e joga em $php_errormsg
// no php.ini configurar: track_errors
@ $x = 1/0;

if(!empty($php_errormsg)) {
  echo $php_errormsg;
}

?>
