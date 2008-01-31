<?php
require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");
$db   = new db();
$db->_DEBUG = 1;
if (isset($_POST["btncadastrar"])){
	
	$sql = "select 1 from comandaentrega where cet_comid = ".$_POST["com_id"];
	$db->executa($sql);
	if ($db->num_rows > 0 ){
		
		messagebox("Comanda já lançada!");
	}else{
		
		$campos = array("cet_comid" => $_POST["com_id"],"cet_funid" => $_POST["cet_funid"]);
		$db->executa($db->insert($campos,"comandaentrega"));
	}
}
$form = new form();
$form->Makeform("form1","post","","","",true,"Controle da Entrega");

$form->linha(false,true); 
$form->FrmInput("Comanda:","com_id",0,10,"Número da comanda","E");
$form->linha(false,true); 
$form->FrmSelect("Funcionário:","cet_funid",true,"funcionarios","fun_id","fun_nome",'',-1,"E",$_POST["cet_funid"]);
$form->linha(false,true);
$form->AbreCelula("");
$form->frmbutton("Cadastrar","btncadastrar","onclick='return chknulo(document.form1)'","submit",'t');
$form->fecha();
$form->Append("<hr>");
$form->append("<li><a href='del_rcrtlentrega001.php';return false;' class='modulo'><b>Entregas por Motoboy</b></a></li>");
$form->Append("<hr>");
$form->append("<li><a href='modulos.php';return false;' class='modulo'><b>Inicío</b></a></li>");
Makemenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
$window = new window(10,30,'950px','720px','entrega','entrega','','Pedido');
$window->show();
?>	