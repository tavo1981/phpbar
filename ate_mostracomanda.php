<?php
//require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");
$db   = new db();
$db->_DEBUG = 1;
$form = new form('',false);
?>
<html>
<head>
  <title>Módulos</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="GENERATOR" content="Quanta Plus">
  <link rel='stylesheet' href='libs/mnucemes.css' title='XP Extended' />
  <SCRIPT LANGUAGE='JavaScript' SRC='libs/menuw.js'></SCRIPT>
  <script type='text/javascript' src='libs/hmenu.js'></script>
  <script type='text/javascript' src='libs/prototype.js'></script>
  <script type='text/javascript' src='libs/funcoes.js'></script>
  <script>
  function addNovo(valor){ 	
  	
  		
  		parent.comanda.location.href='ate_nitemcomanda.php?com_id='+valor
  		parent.winList["comanda"].open();
  	
  	
  }
 </script> 
</head>
<body bgcolor="#EAE5DA" oncontextmenu='return false'>
<?
//echo $db->getJoinRecord("comandas(=)mesas|mes_id=com_mesid","com_id=".$_GET["com_id"],'',0);
$db->executa($db->getJoinRecord("comandas(=)mesas|mes_id=com_mesid","com_id=".$_GET["com_id"],'',0),true,"pro");
$form->Append("<center><h1 style='color:#96928B'>".$db->pro["mes_nome"]."</h1>(comanda nº".$_GET["com_id"].")</center><hr>");
$rsite = $db->executa($db->getJoinRecord("comandas(=)comanda_itens|com_id=cti_comid
                                     (=)produtos|cti_proid=pro_id","com_id=".$_GET["com_id"],'',0));

$form->Append("<table width='100%' cellspacing='0'>");
$vltotal = 0;
while ($lnite = $db->fetch_array($rsite)) {
	
	
	$obs = '';
	if ($lnite["cti_obs"] != ''){
		
		$obs = "<br><small>(".$lnite["cti_obs"].")</small>";
	}
	$form->Append("<tr><td><b style='color:#96928B'>".$lnite["cti_qtde"]."</b> &nbsp;"
	                .$lnite["pro_nome"]."$obs</td>
	                <td style='text-align:right' valign='bottom'>".number_format($lnite["pro_preco"],2,",",".")."</td>
	                <td style='text-align:right' valign='bottom'>
	                <b style='color:blue'>".number_format($lnite["pro_preco"]*$lnite["cti_qtde"],2,",",".")."</b></td>	                
	                <td><img src='libs/imagens/delitem.png'></td></tr>");
    $sql2 = "select  cpi_valor, cpi_item from comanda_itensextra inner join catprodutos_itens on cpi_id = ext_cipid
             where   cpi_valor is not null and ext_iteid = ".$lnite["cti_id"];
    $rs2  = $db->executa($sql2);
    $valorext = 0;
    while ($ln2 = $db->fetch_array($rs2)){
    	
    	$form->Append("<tr><td style='text-align:left' colspan='2'><b style='color:#96928B'>&nbsp;&nbsp;+"
	                .$ln2["cpi_item"]."</td>
	                <td style='text-align:right;color:blue;font-weight:bold' valign='bottom'>".number_format($ln2["cpi_valor"],2,",",".")."</td></tr>");
	    $valorext += $ln2["cpi_valor"];            
    	
    }
	$vltotal += ($lnite["pro_preco"]*$lnite["cti_qtde"])+$valorext;	
	
}
$form->Append("<tr style=''><td colspan='2' style='text-align:right;border-top:1px outset black'><b>Total R$</b></td>
               <td style='text-align:right;border-top:1px outset black'>".number_format($vltotal,2,",","."));
$form->Append("</table>");
$form->linha(false,true);
$form->Append("<div style='border-top:2px inset #96928B'>");
$form->Append("<img src='libs/imagens/add.png' style='padding: 7px;' title='Adicionar' border='0' onclick='addNovo(".$_GET["com_id"].")' >");
$form->Append("<img src='libs/imagens/imprimir.png' style='padding: 7px' title='Imprimir Comanda' border='0' onclick='Imprimir(".$_GET["com_id"].")' >");
//$form->FrmButton("Novo Produto","btnnovo","onclick=''",'button');
#$form->Append("<img src='libs/imagens/fechacomanda.png' style='padding: 7px' title='Fechar Comanda' border='0' onclick='Fechar Comanda(".$_GET["com_id"].")' >");
$form->Append("</div>");
?>