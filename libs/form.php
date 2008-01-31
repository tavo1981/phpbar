<?
include("form.class");
$frm1 = new form("form1","post");
$frm1->linha(true);
$frm1->frm_input("nome","txt_nome",50,50,"Nome do Vivente","AEN");
$frm1->linha(false);
?>