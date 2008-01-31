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
	
	$campos = array(
		                "cli_nome"       => trim($_POST["cli_nome"]),
		                "cli_ruaid"      => $_POST["rua_id"],
		                "cli_baiid"      => $_POST["bai_id"],
		                "cli_complemento"=> $_POST["cli_complemento"],
		                "cli_endnum"     => $_POST["cli_endnum"],
		                "cli_dtnasc"     => $_POST["cli_dtnasc"],
		                "cli_foneprinc"  => $_POST["cli_foneprinc"]		
		               );
		$db->executa($db->insert($campos,"clientes"));
		unset($_POST);
}elseif (isset($_POST["btnalterar"])){
	
	$campos = array(
		                "cli_nome"       => trim($_POST["cli_nome"]),
		                "cli_ruaid"      => $_POST["rua_id"],
		                "cli_baiid"      => $_POST["bai_id"],
		                "cli_complemento"=> $_POST["cli_complemento"],
		                "cli_endnum"     => $_POST["cli_endnum"],
		                "cli_dtnasc"     => $_POST["cli_dtnasc"],
		                "cli_foneprinc"  => $_POST["cli_foneprinc"]		
		               );
		$db->executa($db->update($campos,"clientes","cli_id",$_GET["cli_id"]));
	
}
if(isset($_GET["cli_id"])){
	
	$btnacao  = "btnalterar";
    $btnlabel = "Alterar";	
    $join = "clientes left join ruas on cli_ruaid = rua_id left outer join bairros on cli_baiid = bai_id ";
    $db->dselect($join,"cli_id",$_GET["cli_id"],true);
    
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
  <script type="text/javascript" src="jquery/jquery-1.1.3.1.pack.js"></script>
 <script type="text/javascript" src="jquery/jquery.dimensions.pack.js"></script>
<script type="text/javascript" src="jquery/jquery.cookies.pack.js"></script>
<script type="text/javascript" src="jquery/jquery.iutil.pack.js"></script>
<script type="text/javascript" src="jquery/jquery.idrag.js"></script>
<script type="text/javascript" src="jquery/jquery.grid.columnSizing.js"></script>
    <link rel="stylesheet" href="libs/mnucemes.css" title="XP Extended" />
    <style>
table.jquery_columnSizing{
	table-layout: fixed;
	width : 100%; 
	}
table.jquery_columnSizing tr td{
	overflow : hidden;
	}
</style>
  <script>
$(document).ready(function(){
		/** disable select html elements on page for IE**/
		//document.onselectstart = function(){event.returnValue = false;};
		var d1 = new Date().getTime();	
		 
		//If browser is IE, disable BackgroundImageCache
		if (jQuery.browser.msie) { try { document.execCommand( "BackgroundImageCache", false, true); } catch(err){}};
		var iteration = 0;
		var fnOnLoad = function(){
		    alert('carregou');
		}
		
		$("table").eq(0)		
				.columnSizing({viewResize : true, viewGhost : true, onLoad : fnOnLoad })
				.end();
		
		/*******************************/
		/** PESTAÑAS == TABS ***********/
		/*******************************/
		


	});

	//-->
	</script>
	<script>
	   function showRelat(modelo){
   	
   	
   		switch(modelo){
   			
   			
   			case 1:
   				url = 'cli_rlistaduplos.php'; 
   				break;
   				
   		}
   		window.open(url,'','location=0');
   	
   }
  	</script>
</head>
<body bgcolor="<?=$_SESSION["bgcolor"];?>" onload="winInit();">
<?
$sql = $db->getJoinRecord("clientes(+)ruas|cli_ruaid=rua_id
		                                         (+)bairros|bai_id=cli_baiid"
		                                ,$wh,'cli_nome',0);
	//echo $sql;


$grid             = new dbGrid();
$grid->sql        = $sql;
$grid->header     = array("Nome","Endereço","Fone");
$grid->fields     = array("cli_nome","rua_nome","cli_foneprinc");
$grid->pfields    = array("Nome","Endereço","Fone");
$grid->js         = "manda";
$grid->js_campos  = "0#1";
//$grid->limite     = 15;
$grid->size       = 400;
$grid->event      = "OnDblclick";
$grid->exec       = 0;
$grid->altercolor = true;
$grid->show();

$form->Append("<hr>");
$form->append("<li><a href='#' onclick='showRelat(1);return false;' class='modulo'><b>Clientes Duplos</b></a></li>");
$window = new window(10,30,'400px','550px','consulta','consulta','','');
$window->show();
?>  
<script>
$('bai_id').className = 'input';
</script>
<?=$fcfoco;?>