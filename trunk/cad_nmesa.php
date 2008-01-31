<?php
require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");

$db   = new db();
if (isset($_POST["btncadastrar"])){
	
	$db->executa($db->doInsert("mesas"));
	
	
}elseif (isset($_POST["btnalterar"])){
	
	
	$db->executa($db->doUpdate("mesas",'',"where mes_id=".$_GET["mes_id"]));
	
}
$js = "  	function manda(id){
  		teste              = 'cad_nmesa.php';
  		location.href =teste+'?mes_id='+id;  		 
  	}";

$form = new form($js);
if(isset($_GET["mes_id"])){
	$btnacao  = "btnalterar";
    $btnlabel = "Alterar";	
    
}else {
	$btnacao  = "btncadastrar";
    $btnlabel = "Cadastrar";	
    
}
	
if(isset($_GET["mes_id"])){
	$btnacao  = "btnalterar";
    $btnlabel = "Alterar";	
    $join     = "mesas"; 
   	$wh = array("mes_id"     => $_GET["mes_id"]);
   				
   	$campos = "*";
    $db->executa($db->select($campos,$join,$wh),true);
	
}

$form->MakeForm("form1","post","","","",false,"Cadastro de Mesas");
$form->Append("<tr><td valign='top'><fieldset><table align='left' valign='top'>");
$form->linha(true);
$form->FrmInput("Código:","mes_id",0,5,"Código da mesa","R",$db->dados["mes_id"]);
$form->linha(false,true);
$form->FrmInput("Mesa:","mes_nome",70,30,"Nome Completo do Idoso","E",$db->dados["mes_nome"]);
$form->linha(false,true);
$itens  = array(1 => "Interna",2=>"Externa");
$form->FrmSelect("Local:","mes_local",false,$itens,'','','Locl da mesa',"-1",'true',$db->dados["mes_local"]);
$form->Append("</table></fieldset></td><td border='1' valign='top'><fieldset><table align='left'>");
$form->linha(true);
$sql              = "SELECT * from mesas order by mes_id";;
$grid             = new dbGrid();
$grid->sql        = $sql;
$grid->header     = array("Código","Mesa","local");
$grid->fields     = array("mes_id","mes_nome","mes_local");
$grid->pfields    = array("Código","Mesa","local");
$grid->js         = "manda";
$grid->js_campos  = "0#1";
$grid->limite     = 8;
$grid->form       = "form1";
$grid->size       = 600;
$grid->event      = "OnDblclick";
$grid->exec       = 0;
$grid->altercolor = true;
$grid->show();
$form->linha(false);
$form->Append("</table></fieldset></td></tr>");
$form->Separador();
$form->linha(true);
$form->Append("<td><center>");
$form->FrmButton("$btnlabel","$btnacao","OnClick='return chknulo(document.form1);'","submit","t");
$form->FrmButton("Limpar","btnlimpar","onclick=\"location.href='cad_nmesa.php'\"","button");
if(isset($_GET["mes_id"])){
	$form->frmBDel("Excluir","cad_nmesa.php","mesas","mes_id",$_GET["mes_id"]);
}
$form->Append("</td></center>");
$form->linha(false);
$form->fecha();
makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
?>