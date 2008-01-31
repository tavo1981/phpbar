<?php
//require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");
require("classes/class_atendimento.php");
$db   = new db();
$ate = new atendimento(26,$db);
$ate->emite();

?>
