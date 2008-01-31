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
	
	if ($_POST["cli_id"] == ''){
		
		
		$campos = array(
		                "cli_nome"       => $_POST["cli_nome"],
		                "cli_ruaid"      => $_POST["rua_id"],
		                "cli_baiid"      => $_POST["bai_id"],
		                "cli_complemento"=> $_POST["cli_complemento"],
		                "cli_endnum"     => $_POST["cli_endnum"],
		                "cli_dtnasc"     => $_POST["cli_dtnasc"],
		                "cli_foneprinc"  => $_POST["cli_foneprinc"]		
		               );
		$db->executa($db->insert($campos,"clientes"));               		
	}	
}
$form = new form('');
$form->Makeform("form1","post","","","",true,"Tele - Entrega");
$form->linha(true);
$form->FrmInput("Fone:","cli_foneprinc",15,10,"",'E',$_POST["cli_foneprinc"],"");
$form->linha(false,true);
if ($_POST["cli_foneprinc"]!= ''){
	
	$sql = "select distinct cli_id
	        from clientes  left outer join clifones on cli_id = fon_cliid
	        where fon_numero    = ".$_POST["cli_foneprinc"]."
	        or    cli_foneprinc =".$_POST["cli_foneprinc"];
	//echo $sql;
	$db->executa($sql,true,"clif");
	if ($db->num_rows > 0){
		
		
		$db->executa($db->getJoinRecord("clientes(+)ruas|cli_ruaid=rua_id
		                                         (+)bairros|bai_id=cli_baiid"
		                                ,"cli_id=".$db->clif["cli_id"],'',0),true,"cli");		
	}
	$hab=1;
	$form->Append("<input type='hidden' value='".$db->cli["cli_id"]."' name='cli_id'>");	
	$form->FrmInput("Nome:","cli_nome",75,30,"",'E',$db->cli["cli_nome"]);
	$form->linha(false,true);
	$form->Frmdata("Nascimento:","cli_dtnasc",'',"",strformat($db->cli["cli_dtnasc"],"dtbr"));
	$form->linha(false,true);
	$form->FrmDbConsulta("Endereço:","ruas","rua_id","rua_nome","fc_ruas.php","Endereço",
                     true,$db->cli["rua_id"],$db->cli["rua_nome"]);
	$form->Append("<td><input type='text' value='".$db->cli["cli_endnum"]."' class='nnulo' size='5' name='cli_endnum'
			   onkeyup='c_maiuscula(this)' maxlenght='10', id='cli_endnum'></td>");
	$form->linha(false,true);
	$form->FrmDbConsulta("Bairro:","bairros","bai_id","bai_descr","fc_bairros.php","Bairro da residência do Apenado",
                     true,$db->cli["cli_baiid"],$db->cli["bai_descr"]);
    $form->Append("<td><a onclick='showMap()'>Como Chegar</a></td>");                 
	$form->linha(false,true);
	$form->FrmInput("Complemento:","cli_complemento",75,30,"",'E',$db->cli["cli_complemento"]);
	$form->linha(false,true);
	$form->AbreCelula('');
	$form->FrmBtnOpen("Fazer Pedido","btnpedido","del_npedidotele.php?cli_id=".$db->cli["cli_id"]."&cli_fone=".$_POST["cli_foneprinc"],"entrega");
	$form->FrmButton("Incluir","btncadastrar","onclick='return chknnulo(document.form1)'","submit","",false,$hab);
	$form->FechaCelula();
	$form->linha(false);
	
}
$form->fecha();
$form->Append("<hr>");
$form->append("<li><a href='del_rvendasdia001.php';return false;' class='modulo'><b>Vendas Tele-Entrega</b></a></li>");
$form->append("<li><a href='del_ctrentrega.php';return false;' class='modulo'><b>Controle Tele-Entrega</b></a></li>");
Makemenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
$window = new window(10,30,'950px','720px','entrega','entrega','','Pedido');
$window->show();
?>	
<script>
function showMap(){
    
    rua    = $F('rua_nome');
    numero = $F("cli_endnum");
    cidade = "sapiranga";
    pais   = "Brasil"
    sQuery = rua+", "+numero+", "+cidade+", "+pais;
    alert(sQuery);
    window.open("gmap2.php?aonde="+sQuery+"&ok=1",'',"location=0"); 
}
</script>