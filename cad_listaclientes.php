<?
require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");
$db   = new db();

$form = new form();
$sql = $db->getJoinRecord("clientes(+)ruas|cli_ruaid=rua_id
		                                         (+)bairros|bai_id=cli_baiid"
		                                ,$_GET["wh"],'cli_nome',0);
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
?>