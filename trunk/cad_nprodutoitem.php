<?php
require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");

$db   = new db();
$form = new form("",false);
if (isset($_POST["btncadastrar"])){
	
	$exeptions = array("ite_proid" => $_GET["pro_id"]);
	
	$db->executa($db->doInsert("produtos_itens",$exeptions));
	
}elseif (isset($_POST["btnalterar"])){
	
	$exeptions = array("ite_proid" => $_GET["pro_id"]);
	$db->executa($db->doUpdate("produtos_itens",$exeptions,"where ite_id=".$_POST["ite_id"]));
	
}
if(isset($_GET["ite_id"])){
	
	$btnacao  = "btnalterar";
    $btnlabel = "Alterar";	
    $db->dselect("produtos_itens","ite_id",$_GET["ite_id"],true);
    
}else {
	
	$btnacao  = "btncadastrar";
    $btnlabel = "Cadastrar";	    
}
?>
<html>
<head>
 <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="GENERATOR" content="Quanta Plus">
  <link rel="stylesheet" href="libs/estilos.css" type="text/css" media="all">
  <link rel="stylesheet" href="libs/menuw.css" type="text/css" media="all">
  <SCRIPT LANGUAGE="JavaScript" SRC="libs/menuw.js"></SCRIPT>
  <script language="JavaScript" src="libs/funcoes.js"></script>
  <link rel="stylesheet" href="libs/mnucemes.css" title="XP Extended" />
  <script>
  	function manda(id){
  		teste         = location.href;
  		location.href = teste+"&ite_id="+id;  		 
  	}
  	function limpa(){
  		
  		location.href ='cad_nprodutoitem.php?pro_id=<?=$_GET["pro_id"];?>';  
  		
  	}
  	</script>
</head>
<body bgcolor="<?=$_SESSION["bgcolor"];?>" onload="winInit();">
<?
$form->MakeForm("form1","post","","","",true,"");

if (isset($_GET["pro_id"])){
	
	$form->Append("<tr><td valign='top' width='300'><fieldset><legend><b>Novo Item</b></legend><table valign='top'>");
	$form->linha(true);
	$form->FrmInput("Codigo:","ite_id",0,5,"Codigo do item","R",$db->dados["ite_id"]);
	$form->linha(false,true);
	$form->FrmInput("Item:","ite_produto",85,20,"Descricao do item","A",$db->dados["ite_proid"]);
    $form->linha(false,true);
	$form->Append("<td colspan=2>");
	$form->FrmButton("$btnlabel","$btnacao","OnClick='return chknulo(document.form1);'","submit","t");
	$form->FrmButton("Limpar","btnlimpar","onclick=\"return limpa()\"","button");
	if(isset($_GET["aud_id"])){
		
		$form->frmBDel("Excluir","cad_produtoitem.php?pro_id=".$_GET["pro_id"],
					   "produtos_itens","ite_id",$_GET["ite_id"],1);
					   
	}
	
	$form->Append("</td>");
	
	$form->Append("</table></fieldset></td><td border='1' valign='top'><fieldset><legend><b>Itens</b></legend></b><table align='left'><td>");
	$form->linha(true);
	$sql = "SELECT ite_id,
	               ite_produto
		      from produtos_itens  
			 WHERE ite_proid =".$_GET["pro_id"];
	
	$grid             = new dbGrid();
	$grid->sql        = $sql;
	$grid->header     = array("Codigo","Produto");
	$grid->fields     = array("ite_id","ite_produto");
	$grid->pfields    = array("Codigo","Produto");
	$grid->js         = "manda";
	$grid->js_campos  = "0#1";
	//$grid->limite     = 15;
	$grid->size       = 400;
	$grid->event      = "OnDblclick";
	$grid->exec       = 0;
	$grid->altercolor = true;
	$grid->show();
	$form->linha(false);
	$form->Append("</table></td></tr>");
	$form->Separador();
	$form->linha(true);
	$form->Append("<td><center>");
	
	
	
	
}else{
	
	$form->Append("<br><b> Selecione o Produto primeiro. </b>");
}
$form->fecha();
$form->linha(false);

?>  
nau