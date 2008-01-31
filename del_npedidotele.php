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
$js = "
function enter(obj,e){

 tecla   = document.all ? event.keyCode : e.which;
       		 if (tecla == 13){       		     
       		     pegaProduto(obj.value);
       		    return false;
       		 
       		 }else{
       		     return true;
       		 }


}
function pegaProduto(cpi_id){

		try{
  	        xmlhttp = new XMLHttpRequest();
	    }catch(ee){
    	    try{
        	   xmlhttp = new ActiveXObject('Msxml2.XMLHTTP');
    	  }catch(e){
        	  try{
	               xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
     	       }catch(E){
        	       xmlhttp = false;
        	   }
      	   }
	    }
	    xmlhttp.open('GET','ajaxlibs/fc_atendimento.php?fc=trazItens&cpi_id='+cpi_id,true);
       		 xmlhttp.onreadystatechange=function() {
       		 	
       		   if (xmlhttp.readyState==4){   		     
       		      
                   json = eval(\"(\"+xmlhttp.responseText+\")\");        
                  
                    if (json.tem == 'S'){           
                         
                    	$('sabores').innerHTML = $('sabores').innerHTML+' <a id=\"'+json.cpi_id+'\" ondblclick=\'removeitem(this.id)\'>,'+prepare(json.cpi_item)+'</a>' 
                    	$('itens2').add(new Option(prepare(json.cpi_item),json.cpi_id),null);
                    	
                    	
                    }else{
                    	alert('Sabor n�o Encontrado');
                    }                 
                    
       		     } 
       		     \$('cpi_id').value='';
                    	\$('cpi_id').focus();      		        		  
       		
       		 }
       		 xmlhttp.send(null); 		
	    	      		
}			    		
function removeitem(valor){
  
    var tem = 0; 
  		var itens = $('itens2').getElementsByTagName('option');
		 	    
  		for (i = 0;i < $('itens2').options.length;i++){
  			
  				if ($('itens2').options[i].value == valor){
  				    
  				    $('itens2').options[i] = null;
  				    
  				    pai = $(valor).parentNode;
  				    pai.removeChild($(valor));
				 		
				}			
  			
  		}  

}
function incluir(){

for (i = 0;i < $('itens2').options.length;i++){
	
	$('itens2').options[i].selected = true;

}
document.form1.submit();
return true;
}

			    		
";
$form = new form($js,true,"libs",false,0);
if ($_POST["gravado"] != 1){
	
	$db->begin();
	$campos = array(
	                "com_delivery" => 1,
	                "com_dtcomanda" => $_SESSION["dtatend"],
	                "com_hora"      => date("H:i:s"),
	                "com_aberta"    => '0');
	                
   $db->executa($db->insert($campos,"comandas"));
   $comanda = $db->last_id("comandas","com_id");
   $gravado = 1;
   $db->commit();	                
	
}
//echo $comanda;
if (isset($_POST["btncadastrar"])){
		
	$db->begin();	                
	$campos = array("cti_comid" => $_POST["com_id"],
	                "cti_proid" => $_POST["cti_proid"],
	                "cti_qtde"  => $_POST["cti_qtde"],
	                "cti_valor"  => $_POST["cti_valor"]);
	                
	                
	$db->executa($db->insert($campos,"comanda_itens"));
	$item = $db->last_id("comanda_itens","cti_id");  	             
	if (is_array($_POST["itens"])){
		$vi = '';
		$obs .= "S: ";
		while (list($k,$v) = each($_POST["itens"])){
			
			$obs .= $vi.$v;
			$vi = ", ";									    
		}	                
	}
		
	if (is_array($_POST["itens2"])){		
		
		$vi = '';
		$obs .= " A: ";
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
		$obs .= $_POST["ite_obs"]; 	                
	}
	$db->executa($db->update(array("cti_obs"=> $obs),"comanda_itens","cti_id",$item));
	$db->commit();
	//echo "<script>parent.consulta.location.reload();</script>";
}
if (isset($_POST["btnfecha"])){
	
	$campos = array(
	                "del_comid" => $_POST["com_id"],
	                "del_cliid" => $_GET["cli_id"],
	                "del_fone"  => $_POST["del_fone"],
	                "del_ruaid" => $_POST["rua_id"],
	                "del_baiid" => $_POST["bai_id"],
	                "del_complemento" => $_POST["cli_complemento"],
	                "del_endnum"  => $_POST["del_endnum"],
	                "del_nome"    => $_POST["del_nome"],
	                "del_obs"     => $_POST["del_obs"]);
    $db->executa($db->insert($campos,"comanda_delivery"));  
    $db->executa("select coalesce(sum(ext_valor),0) as vltotal
	             from    comanda_itensextra inner join comanda_itens on cti_id = ext_iteid 
	             where cti_comid= ".$_POST["com_id"],true,"vext");
               
	$db->executa("select coalesce(sum(cti_qtde*cti_valor),0) as vltotal
	             from    comanda_itens inner join produtos on pro_id = cti_proid                         
	             where cti_comid= ".$_POST["com_id"],true,"vlt");
	
	$db->executa("update comandas set com_vltotal = '".($db->vlt["vltotal"]+$db->vext["vltotal"])."' where com_id = ".$_POST["com_id"]);
	$nota = new atendimento($_POST["com_id"],$db);
	$nota->emite();
	echo "<script>parent.location.href='del_nentrega.php';</script>";	
}

if (isset($_POST["btnexcluiritens"])){
	
	if (is_array($_POST["grid1chk"])){
		while (list($k,$v) = each($_POST["grid1chk"])) {
			
			$db->executa("delete from comanda_itens where cti_id = ".$v);
			
		}
		
	}
	
}

if (isset($_POST["btnexcluir"])){	
	              
	$db->executa("delete from comandas where com_id= ".$_POST["com_id"]);	
	echo "<script>parent.location.href='del_nentrega.php';</script>";	
}
$form->append("</center>");
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
$form->Append("<td style='text-align:right'><b>Nome:</b></td><td>");
$form->FrmInput("Nome:","del_nome",75,30,"",'E',$db->cli["cli_nome"],'',0);
$form->Append("&nbsp;&nbsp;&nbsp;<b onclick=\"setxy(this,'endereco');if (\$('endereco').style.display == 'none'){\$('endereco').style.display = ''}else{\$('endereco').style.display = 'none'}\">Mudar Endere�o</b></td>");
$form->linha(false,true);
$form->FrmInput("Fone:","del_fone",15,10,"",'E',$_GET["cli_fone"],"");
$form->linha(false,true);
$form->AbreCelula("Item:");
$form->FrmInput("","cti_proid",8,7,"C�digo do item",'',$_POST["cti_proid"],'onBlur="document.form1.submit()"',0);
if ($_POST["cti_proid"]!= ''){
	
	$db->executa($db->getAll("produtos","pro_id=".$_POST["cti_proid"],'',0),true,'pro');
	
	if ($db->num_rows > 0){

	  $hab = 1;
	  $form->Append("&nbsp;&nbsp;<span style='color:blue;font-size:12pt;font-weight:bold'>".$db->pro["pro_nome"]."</span></td>");
	  $form->linha(false,true);
	  $form->FrmInput("","cti_valor",8,7,"valor do Produto",'',$db->pro["pro_preco"]);
	  
/*	  if ($db->pro["pro_catid"] ==3 or  $db->pro["pro_catid"] ==4){
	  	
	 	  	$form->FechaCelula();
	 	  	$form->linha(false,true);
	 	  	$form->AbreCelula("Sabor:");
	        $form->FrmInput("","cpi_id",8,7,"C�digo do Sabor",'','','onkeyPress="return enter(this,event);"' ,0);
	        $form->Append("<select multiple name='itens2[]' size='2' style='display:none' id='itens2'></select>");
	        $form->Append("<span id='sabores'></span>");
	        
	        echo "<script>\$('cpi_id').focus();</script>";
	        $form->FechaCelula();
	  	
	  	
	  }
	      
	}		
	
	
	
}
*/	  
	  $rs = $db->executa($db->getAll("produtos_itens","ite_proid=".$db->pro["pro_id"],'',0));
	  $form->FechaCelula();
	  $form->linha(false,true);
	  $form->Append("<td colspan='15'>");
	  $form->Append("<table><td valign='top'>");
	  
	  $j = 1;
	  while ($ln = $db->fetch_array($rs)){
	  	
	  	if ($j  == 5){
	  		
	  		$form->Append("</td><td valign='top'>");
	  		$j = 1;
	  	}
	  	$form->Append("<input type='checkbox' name='itens[]' id='item".$ln["ite_id"]."' value='".$ln["ite_produto"]."'>
	  	              <label for='item".$ln["ite_id"]."'>".$ln["ite_produto"]."</b></label>");
	  	
	  	$j++;
	  }
	 // $rs = $db->executa($db->getall("catprodutos_itens","cpi_catid=".$db->pro["pro_catid"],'',0));
	  //$form->AbreCelula("");
	  //$form->Append("<hr>");
	 $rs = $db->executa($db->getall("catprodutos_itens","cpi_catid=".$db->pro["pro_catid"],'cpi_id,cpi_item',0));
	  //$form->AbreCelula("");
	   $j = 0;
	  $form->Append("</td></tr><tr><td valign='top'><hr></td></tr><tr><td valign='top' nowrap>");
	  while ($ln = $db->fetch_array($rs)){
	  	
	  	if ($j  == 10){
	  		
	  		$form->Append("</td><td valign='top' nowrap>");
	  		$j = 1;
	  	}
	  	
	  	$form->Append("<input type='checkbox' name='itens2[]' id='item2".$ln["cpi_id"]."' value='".$ln["cpi_id"]."'>
	  	              <label for='item2".$ln["cpi_id"]."'>  ".$ln["cpi_item"]."");
	  	$form->Append($ln["cpi_valor"]==''?'':"+ R$(".number_format($ln["cpi_valor"],2,",",".").")");
	  	$form->Append("</label><br>");	  	
	  	$j++;
	  }
	}
	$form->Append("</table></td>");
}


$form->FechaCelula();

$form->linha(false,true);

$form->FrmInput("Quantidade:","cti_qtde",8,7,"Quantidade","[0-9]E",'1');
$form->linha(false,true);
$form->Append("<div id='teste' style='display:none;position:absolute;top:350px;left:120px;border:2px outset black;background-color:blue'>
<b>Observa��es do Item:</b><br>
<textarea rows=5 cols=20 name='ite_obs'></textarea><br></div>");
$form->AbreCelula('');
$form->FrmButton("Incluir","btncadastrar","onclick='return incluir()'","submit","i",false,$hab);
$form->FrmButton("Fechar & imprimir","btnfecha","onclick='btnfecha'","submit","",false,$hab);
$form->FrmButton("Cancelar","btnexcluir","onclick='btnfecha'","submit","");
$form->FrmButton("Excluir Itens","btnexcluiritens","","submit","");
$form->FrmButton("Observacoes","btnobs","onclick=\"if (\$('teste').style.display == 'none'){\$('teste').style.display = ''}else{\$('teste').style.display = 'none'}\"","button","");
$db->executa("select coalesce(sum(ext_valor),0) as vltotal
	             from    comanda_itensextra inner join comanda_itens on cti_id = ext_iteid 
	             where cti_comid= ".$comanda,true,"vext");               
$db->executa("select coalesce(sum(cti_qtde*cti_valor),0) as vltotal
	             from    comanda_itens inner join produtos on pro_id = cti_proid                         
	             where cti_comid= ".$comanda,true,"vlt");
$form->Append("&nbsp;&nbsp;&nbsp;<b>Total:<span style='color:blue;font-size:12pt'>
             ".number_format($db->vlt["vltotal"]+$db->vext["vltotal"],2,",",".")."</span></b>");
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
$grid->fields    = array("pro_nome","cti_obs","cti_qtde","cti_valor");
$grid->pfields   = array("Produto","Tipo","Qtde","Valor");
$grid->height    = 150;
$grid->checkbox  = "cti_id";
$grid->exec      = 0;
$grid->show();
$form->Append("</td></table>");
$form->Append("<div id='endereco' style='display:none;
position:absolute;border:2px outset black;background-color:".$_SESSION["bgcolor"]."'>
<div class='titleBar'><span class='titleBarText'>Mudar Endere�o</span>
<img class='titleBarButtons' onclick=\"\$('endereco').style.display='none'\"alt='' src='libs/imagens/btn_fechar.jpg'>
</div><br><table><tr>");
$ruaid = $_POST["rua_id"]== ''?$db->cli["rua_id"]:$_POST["rua_id"];
$rua   = $_POST["rua_nome"]== ''?$db->cli["rua_nome"]:$_POST["rua_nome"];
$form->FrmDbConsulta("Endere�o:","ruas","rua_id","rua_nome","fc_ruas.php","Endere�o",
true,$ruaid,$rua);
$form->Append("<td><input type='text' value='".$db->cli["cli_endnum"]."' class='nnulo' size='5' name='del_endnum'
			   onkeyup='c_maiuscula(this)' maxlenght='10'></td>");
$form->linha(false,true);
$baiid = $_POST["bai_id"]== ''?$db->cli["bai_id"]:$_POST["bai_id"];
$bai   = $_POST["bai_descr"]== ''?$db->cli["bai_descr"]:$_POST["bai_descr"];
$form->FrmDbConsulta("Bairro:","bairros","bai_id","bai_descr","fc_bairros.php","Bairro da resid�ncia do Apenado",
true,$baiid,$bai);
$form->linha(false,true);
$comp = $_POST["cli_complemento"]== ''?$db->cli["cli_complemento"]:$_POST["cli_complemento"];
$form->FrmInput("Complemento:","cli_complemento",75,30,"",'E',$comp);
$form->Append("</table></div>");  
$form->Append("</table>");         

$form->fecha();
?>