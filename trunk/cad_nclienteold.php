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
		                "cli_nome"       => $_POST["cli_nome"],
		                "cli_ruaid"      => $_POST["rua_id"],
		                "cli_baiid"      => $_POST["bai_id"],
		                "cli_complemento"=> $_POST["cli_complemento"],
		                "cli_endnum"     => $_POST["cli_endnum"],
		                "cli_dtnasc"     => $_POST["cli_dtnasc"],
		                "cli_foneprinc"  => $_POST["cli_foneprinc"]		
		               );
		$db->executa($db->insert($campos,"clientes"));
}elseif (isset($_POST["btnalterar"])){
	
	$campos = array(
		                "cli_nome"       => $_POST["cli_nome"],
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
  <script language="JavaScript" src="libs/prototype.js"></script>
    <link rel="stylesheet" href="libs/mnucemes.css" title="XP Extended" />
  <script>
 cliente = new Object();
 cliente.tem = null;
 cliente.cadastrar = function (){
 	
 	if (chknulo(document.form1)){  	   	
  		 
			 this.showOutros(); 
			 //alert(this.tem);
			 //return false; 		
			if (cliente.tem == true){
				
				return false;
			}else if (cliente.tem == false){
				
				return true;
			}else{
				return false;
				
			}
  	   }else{
  	   	
  	   	return false;
  	   }	
 }
  		 
  function manda(id){
  	url = 'cad_ncliente.php';
  	location.href =url+"?cli_id="+id;
  }
  function limpa(){

  	location.href ='cad_ncliente.php';

  }
  
  cliente.showOutros = function(){
  	
  	 pars  = 'fc=clientesFone&rua_id=' + $F('rua_id') + '&cli_nome=' + $F("cli_nome")+'&cli_fone='+$F('cli_foneprinc')
  	 url   = 'ajaxlibs/fc_clientes.php';  	 
  	 //cliente.tem = false;
  	 req   = new Ajax.Request(
				    url, 
		   		      {
					   method: 'get', 
				   	   parameters: pars, 				   	   
				   	   onSuccess: this.openClientes
			    	});	  	 
  	//cliente.tem = true;
  }
  
  cliente.openClientes = function(req){
  	
  	 	json = eval("("+req.responseText+")");    			
  		if (json[0].tem == "S"){  			 
  			//cliente.tem = true; 
  			v  = '';
  			cl = '';
  			for (i = 0;i < json.length;i++){
  				
  				cl = cl+v+json[i].cli_id;
  				v = ","; 				  				
  			}
  			
  			if (confirm('O sistema encontrou clientes com os dados fornecidos.\ndeseja Visualiza-lo?')){
  				url = "cad_listaclientes.php?wh=cli_id in("+cl+")";
  				consulta.location.href=url;  			
  				winList["consulta"].open();
  				cliente.tem = true;
  			}
  			
  		}else{
  			
  			cliente.tem = false;
  			alert(this.tem);
  		}
  		
  	
  }
  function cadastrar(){ 	
  	 
  	 return cliente.cadastrar();
  	   
   }
  	</script>
</head>
<body bgcolor="<?=$_SESSION["bgcolor"];?>" onload="winInit();">
<?
$form->MakeForm("form1","post","","","",true,"Clientes");
$form->Append("<input type='hidden' value='".$db->dados["cli_id"]."' name='cli_id'>");
$form->FrmInput("Nome:","cli_nome",75,30,"",'AE',$db->dados["cli_nome"]);
$form->linha(false,true);
$form->FrmInput("Fone:","cli_foneprinc",15,10,"",'E',$db->dados["cli_foneprinc"],"");
$form->linha(false,true);
$form->Frmdata("Nascimento:","cli_dtnasc",'',"",strformat($db->dados["cli_dtnasc"],"dtbr"));
$form->linha(false,true);
$form->FrmDbConsulta("Endereço:","ruas","rua_id","rua_nome","fc_ruas.php","Endereço",
true,$db->dados["rua_id"],$db->dados["rua_nome"]);
$form->Append("<td><input type='text' value='".$db->dados["cli_endnum"]."' class='nnulo' size='5' name='cli_endnum'
			   onkeyup='c_maiuscula(this)' maxlenght='10'></td>");
$form->linha(false,true);
$form->FrmDbConsulta("Bairro:","bairros","bai_id","bai_descr","fc_bairros.php","",
true,$db->dados["cli_baiid"],$db->dados["bai_descr"]);
$form->linha(false,true);
$form->FrmInput("Complemento:","cli_complemento",75,30,"",'',$db->dados["cli_complemento"]);
$form->linha(false,true);
$form->AbreCelula('');
//$form->FrmButton($btnlabel,$btnacao,"onclick='return chknulo(document.form1);'","submit");
$form->FrmButton($btnlabel,$btnacao,"onclick='return cadastrar()'","submit");
$form->FechaCelula();
$form->linha(false);
if(isset($_GET["aud_id"])){

	$form->frmBDel("Excluir","jur_nprocaudiencia.php?pro_id=".$_GET["pro_id"],
	"procaudiencias","aud_id",$_GET["aud_id"],1);

}

$form->Append("</td>");

$form->Append("</table></fieldset></td><td border='1' valign='top'><fieldset><legend><b>Clientes</b></legend></b><table align='left'><td>");
$form->linha(true);
$sql = $db->getJoinRecord("clientes(+)ruas|cli_ruaid=rua_id
		                                         (+)bairros|bai_id=cli_baiid"
		                                ,'','cli_nome',0);
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
$form->linha(false);
$form->Append("</table></td></tr>");
$form->Separador();
$form->linha(true);
$form->Append("<td><center>");
$form->fecha();
$form->linha(false);
$window = new window(10,30,'400px','550px','consulta','consulta','','');
$window->show();
?>  
<script>
$('bai_id').className = 'input';
</script>