<?php
require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");
$db   = new db();
$db->_DEBUG = 1;
$hab = 0;
if (isset($_POST["btncadastrar"])){
	
	$db->begin();	                
	$campos = array("cti_comid" => $_GET["com_id"],
	                "cti_proid" => $_POST["cti_proid"],
	                "cti_qtde"  => $_POST["cti_qtde"]);
	                
	                
	$db->executa($db->insert($campos,"comanda_itens"));
	$item = $db->last_id("comanda_itens","cti_id");                
	
	if (is_array($_POST["itens"])){
		$vi = '';
		$obs = "S: ";
		while (list($k,$v) = each($_POST["itens"])){
			
			$obs .= $vi.$v;
			$vi = ", ";									    
		}	                
	}
	
	if (is_array($_POST["itens2"])){
		$vi = '';
		$obs .= " A:";
		while (list($k,$v) = each($_POST["itens2"])){
			
			$campos2 = array("ext_iteid" => $item,
	                         "ext_cipid"  => $v                         
						    );
						    
			$db->executa($db->insert($campos2,"comanda_itensextra"));
			$db->executa($db->getAll("catprodutos_itens","cpi_id=$v",'',0),true,"ext");
			$obs .= $vi.$db->ext["cpi_item"];
			$vi = ", ";									    
		}	                
	}
	$db->executa($db->update(array("cti_obs"=> $obs),"comanda_itens","cti_id",$item));
	$db->commit();
	echo "<script>parent.consulta.location.reload();</script>";
}

$form = new form('',false);
?>
<html>
<head>
  <title>Módulos</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="GENERATOR" content="Quanta Plus">
  <link rel='stylesheet' href='libs/mnucemes.css' title='XP Extended' />
  <SCRIPT LANGUAGE='JavaScript' SRC='libs/menuw.js'></SCRIPT>
  <script type='text/javascript' src='libs/prototype.js'></script>
  <script type='text/javascript' src='libs/funcoes.js'></script>
  <script>
  function trazItem(pro_id){
  	
  	xmlhttp.open("GET","ajaxlibs/fc_atendimento.php?pro_id="+pro_id+"&fc=trazItem",true);
  	xmlhttp.onreadystatechange=function() {

        if (xmlhttp.readyState==4){
        	
        	
        	
        }
        
  	}
  	xmlhttp.send(null);
        
  	
  }
 </script> 
</head>
<body bgcolor="#EAE5DA" oncontextmenu='return false'>
<center>
<?
$form->Makeform("form1","post","","","",true,"Adicionar");
$form->linha(true);
$form->AbreCelula("Item");
$form->FrmInput("","cti_proid",8,7,"Código do item",'',$_POST["cti_proid"],'onBlur="document.form1.submit()"',0);
if ($_POST["cti_proid"]!= ''){
	
	$db->executa($db->getAll("produtos","pro_id=".$_POST["cti_proid"],'',0),true,'pro');
	
	if ($db->num_rows > 0){

	  $hab = 1;
	  $form->Append("</td><td style='color:blue;font-size:12pt;font-weight:bold'>".$db->pro["pro_nome"]."</td>");
	  $rs = $db->executa($db->getAll("produtos_itens","ite_proid=".$db->pro["pro_id"],'',0));
	  $form->FechaCelula();
	 $form->linha(false,true);
	  $form->Append("<td>&nbsp;</td><td colspan='10'>");
	  $form->Append("<table><tr><td valign='top'>");
	  
	  $j = 1;
	  while ($ln = $db->fetch_array($rs)){
	  	
	  	if ($j  == 5){
	  		
	  		$form->Append("</td><td valign='top'>");
	  		$j = 1;
	  	}
	  	$form->Append("<input type='checkbox' name='itens[]' id='item".$ln["ite_id"]."' value='".$ln["ite_produto"]."'>
	  	              <label for='item".$ln["ite_id"]."'><b>".$ln["ite_produto"]."</b></label><br>");
	  	
	  	$j++;
	  }
	  $rs = $db->executa($db->getall("catprodutos_itens","cpi_catid=".$db->pro["pro_catid"],'',0));
	  //$form->AbreCelula("");
	   $j = 0;
	  $form->Append("</td></tr><tr><td valign='top'><hr></td></tr><tr><td valign='top'>");
	  while ($ln = $db->fetch_array($rs)){
	  	
	  	if ($j  == 5){
	  		
	  		$form->Append("</td><td valign='top'>");
	  		$j = 1;
	  	}
	  	
	  	$form->Append("<input type='checkbox' name='itens2[]' id='item2".$ln["cpi_id"]."' value='".$ln["cpi_id"]."'>
	  	              <label for='item2".$ln["cpi_id"]."'><b>".$ln["cpi_item"]."</b>&nbsp;&nbsp;");
	  	$form->Append($ln["cpi_valor"]==''?'':"+ R$(".number_format($ln["cpi_valor"],2,",",".").")");
	  	$form->Append("</label><br>");	  	
	  	$j++;
	  }
	  
		
	}
	$form->Append("</tr></table></td>");
	
}

$form->FechaCelula();
$form->linha(false,true);
$form->FrmInput("Quantidade:","cti_qtde",8,7,"Quantidade","[0-9]E",'1');
$form->linha(false,true);
$form->AbreCelula('');
$form->FrmButton("Incluir","btncadastrar","onclick='return chknnulo(document.form1)'","submit","",false,$hab);
$form->FechaCelula();
$form->fecha();
?>