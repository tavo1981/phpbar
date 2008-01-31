<?php
require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/form2.class");
require("libs/funcoes.php");
require("libs/class_dbgrid.php");
$db = new db();
$form = new form("",true,"libs");
$form->linha(true);
$itens[0]["Tab"]    = "Produto";
$itens[0]["arq"]    = "cad_nproduto";
$itens[0]["Active"] = 1;
$itens[1]["Tab"]    = "Ingredientes";
$itens[1]["arq"]    = "cad_nprodutoitem.php";
$itens[1]["Active"] = 0;
$form->Append("</center>");
$form->TabNav($itens,"80%");
$form->fecha();
makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
?>