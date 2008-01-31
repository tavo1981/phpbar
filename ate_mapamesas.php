<?php
require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");
require("classes/class_atendimento.php");
$db = new db();
$fc = "function mostra_comanda(com_id){

	url = 'ate_mostracomanda.php?com_id='+com_id;
	consulta.location.href=url;
	winList['consulta'].open();

}
function nova_comanda(mesa){

	url = 'ate_novacomanda.php?mes_id='+mesa;
	comanda.location.href=url;
	winList['comanda'].open();

}";
$form = new form($fc);
$form->MakeForm("form","post",'','','',true,"Mapa Mesas");	
$form->linha(true);
$form->Append("<td><Table  style='background-color:white;border:2px inset black'>");
$rs = $db->executa("select * from mesas order by mes_id");
$i = 0;
$form->Append("<tr>");
while ($ln = $db->fetch_array($rs)){
	
	$img = "mesa_liberada.gif";
	$event = "ondblclick='nova_comanda(".$ln["mes_id"].")'";
	if ($i == 6){
		
		$i = 0;
		$form->Append("</tr><tr>");
	}
	$sql = "select com_id from comandas where com_mesid = ".$ln["mes_id"]."
	 and com_dtcomanda = current_date and com_aberta = 1";
	$db->executa($sql,true,"mes");
	if ($db->num_rows > 0){
		
		$img   = "mesa_em_uso.gif";
		$event = "ondblclick='mostra_comanda(".$db->mes["com_id"].")'";
	}
	$form->Append("<td style='text-align:center'><img $event src='libs/imagens/$img'><br>".$ln["mes_nome"]."</td>");
	$i++;	
}
$form->Append("</table></td>");

$window = new window(10,30,'400px','550px','consulta','consulta','','');
$window->show();
$window2 = new window(10,30,'700px','550px','comanda','comanda','','');
$window2->show();
?>