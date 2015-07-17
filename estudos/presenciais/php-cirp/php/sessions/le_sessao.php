<?php

session_start();

echo "<html><body>{$_SESSION['nome']}</body></html>";

$_SESSION = array();
session_destroy();

?>
