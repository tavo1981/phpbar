<?
require('libs/fc_sessoes.php');
require_once('libs/classes.class');
require_once('libs/form2.class');
require_once('libs/funcoes.php');
require('libs/class_dbgrid.php');
$db   = new db();
$js   = "function manda(id){
	
          url = 'cad_ncatprodutos.php?cat_id='+id;
          parent.location.href=url;
          }";
$form            = new form($js,true,'libs',false);
$grid            = new dbGrid();
$grid->sql       = $db->getAll('catprodutos','','',0);
$grid->header    = array('Código', 'Categoria');
$grid->fields    = array('cat_id', 'cat_descr');
$grid->pfields   = array('Código', 'Categoria');
$grid->func      = true;
$grid->js        = "manda";
$grid->js_campos = '0#2';
$grid->exec      = 1;
$grid->limite    = 10;
$grid->show();
$form->fecha();
?>