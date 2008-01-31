<?
require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/form2.class");
require("libs/funcoes.php");
require("libs/class_interface.php");
$db   = new db();
$form = new form();
$form->append("<li><a href='cad_nfuncionario.php' return false;' class='modulo'><b>Cadastro de funcionários</b></a></li>");
?>