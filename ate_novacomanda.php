<?php
require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
require_once("libs/class_dbgrid.php");
require_once("libs/classes.class");
require_once("libs/class_interface.php");
require("classes/class_atendimento.php");
$db   = new db();
$db->_DEBUG = 1;
$hab1 = 0;
$hab  = 0;
$form = new form('',true,"libs",false,5);
if ($_POST["gravado"] != 1){
	
	$db->begin();
	$campos = array(
	                "com_delivery"  => 0,
	                "com_dtcomanda" => date("Y-m-d"),
	                "com_aberta"    => '1',
	                "com_mesid"     => $_GET["mes_id"]);
	                
   $db->executa($db->insert($campos,"comandas"));
   $comanda = $db->last_id("comandas","com_id");
   $gravado = 1;
   $db->commit();	                
	
}
//echo $comanda;
if (isset($_POST["btncadastrar"])){
	
	echo $_POST["comanda"];
	$db->begin();	                
	$campos = array("cti_comid" => $_POST["com_id"],
	                "cti_proid" => $_POST["cti_proid"],
	                "cti_qtde"  => $_POST["cti_qtde"]);
	                
	                
	$db->executa($db->insert($campos,"comanda_itens"));
	$item = $db->last_id("comanda_itens","cti_id"); 

	if (is_array($_POST["itens"])){
		$vi = '';
		$obs = "Sem: ";
		while (list($k,$v) = each($_POST["itens"])){
			
			$obs .= $vi.$v;
			$vi = ", ";									    
		}	                
	}
	
	if (is_array($_POST["itens2"])){
		$vi = '';
		$obs .= " AD:";
		while (list($k,$v) = each($_POST["itens2"])){
			
			$db->executa($db->getAll("catprodutos_itens","cpi_id=$v",'',0),true,"ext");
			$campos2 = array("ext_iteid" => $item,
	                         "ext_cipid" => $v,
	                         "ext_valor" => str_replace(".",",",$db->ext["cpi_valor"])                        
						    );
						    
			$db->executa($db->insert($campos2,"comanda_itensextra"));
			
			$obs .= $vi.$db->ext["cpi_item"];
			$vi = ", ";									    
		}	                
	}
	$db->executa($db->update(array("cti_obs"=> $obs),"comanda_itens","cti_id",$item));
	$db->commit();
	//echo "<script>parent.consulta.location.reload();</script>";
}
if (isset($_POST["btnfecha"])){	
	              
	$db->executa("select sum(cti_qtde*pro_preco)+coalesce(sum(ext_valor),0) as vltotal
	             from    comanda_itens inner join produtos on pro_id = cti_proid
                         left outer join comanda_itensextra on cti_id = ext_iteid
	             where cti_comid= ".$_POST["com_id"],true,"vlt");
	
	
	$db->executa("update comandas set com_vltotal =".$db->vlt["vltotal"]." where com_id = ".$_POST["com_id"]);
	$nota = new atendimento($_POST["com_id"],$db);
	$nota->emite();
	echo "<script>parent.location.href='ate_mapamesas.php';</script>";	
}
if (isset($_POST["btnexcluir"])){	
	              
	$db->executa("delete from comandas where com_id= ".$_POST["com_id"]);	
	echo "<script>parent.location.href='ate_mapamesas.php';</script>";	
}
$form->Makeform("form1","post","","","",true,"Pedido");
if ($_GET["cli_id"] != ''){
	
	$db->executa($db->getJoinRecord("clientes(+)ruas|cli_ruaid=rua_id
		                                     (+)bairros|bai_id=cli_baiid"
		                             ,"cli_id=".$_GET["cli_id"],'',0),true,"cli");
	
}
$form->linha(true);
$comanda = $comanda==''?$_POST["com_id"]:$comanda;
$form->Append("<input type='hidden' value='".$comanda."' name='com_id'>");
$form->Append("<input type='hidden' value='".$gravado."' name='gravado'>");
$form->AbreCelula("Item");
$form->FrmInput("","cti_proid",8,7,"Código do item",'',$_POST["cti_proid"],'onBlur="document.form1.submit()"',0);
if ($_POST["cti_proid"]!= ''){
	
	$db->executa($db->getAll("produtos","pro_id=".$_POST["cti_proid"],'',0),true,'pro');
	
	if ($db->num_rows > 0){

	  $hab1 = 1;
	  $form->Append("&nbsp;&nbsp;<span style='color:blue;font-size:12pt;font-weight:bold'>".$db->pro["pro_nome"]."</span></td>");
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
$form->FrmButton("Incluir","btncadastrar","onclick='return chknnulo(document.form1)'","submit","",false,$hab1,'');
$form->FrmButton("Concluir","btnfecha","","submit","",false,$hab1);
$form->FrmButton("Cancelar","btnexcluir","onclick='btnfecha'","submit","");
$form->FechaCelula();
$form->linha(false,true);
$form->Append("<td colspan='7'><table><td>");
$grid = new dbgrid();
if ($_POST["com_id"] == ''){
	
	$_POST["com_id"] = 0;
}else{
	$_POST["com_id"] = $_POST["com_id"];
}
$grid->sql =  $db->getJoinRecord("comandas(=)comanda_itens|com_id=cti_comid
                                     (=)produtos|cti_proid=pro_id","com_id=".$_POST["com_id"],'',0);
$grid->header    = array("Produto","Tipo","Qtde","Valor");
$grid->fields    = array("pro_nome","cti_obs","cti_qtde","pro_preco");
$grid->pfields   = array("Produto","Tipo","Qtde","Valor");
$grid->height    = 150;
$grid->exec      = 0;
$grid->show();
$form->Append("</td></table></td>");
$form->FechaCelula();
$form->linha(false,true);
$db->executa("select sum(cti_qtde*pro_preco) as vltotal
	             from comanda_itens inner join produtos on pro_id = cti_proid where cti_comid= ".$_POST["com_id"],true,"vlt2");
$form->Append("<td colspan='3' style='text-align:right'><b>Total:<span style='color:blue;font-size:12pt'>
             ".number_format($db->vlt2["vltotal"],2,",",".")."</span></b></td>");
$form->fecha();
?>