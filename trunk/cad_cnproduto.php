<?
require('libs/fc_sessoes.php');
require_once('libs/classes.class');
require_once('libs/form2.class');
require_once('libs/funcoes.php');
require('libs/class_dbgrid.php');
$db   = new db();
$js   = "function manda(id){
	
          url = 'cad_nproduto.php?pro_id='+id;
          parent.location.href=url;
          }";
$form            = new form($js,true,'libs',false);
$grid            = new dbGrid();
$grid->sql       = $db->getAll('produtos','','',0);
$grid->header    = array('Cуdigo do Produto', 'Nome', 'Descriзгo', 'estoque', 'Foto');
$grid->fields    = array('pro_id', 'pro_nome', 'pro_descr', 'pro_estoque', 'pro_foto');
$grid->pfields   = array('Cуdigo do Produto', 'Nome', 'Descriзгo', 'estoque', 'Foto');
$grid->func      = true;
$grid->js        = "manda";
$grid->js_campos = '0#2';
$grid->exec      = 1;
$grid->limite    = 10;
$grid->show();
$form->fecha();
?>