<?
require("../libs/classes.class");
require("../libs/funcoes.php");
require("../libs/JSON.php");
require("../libs/classes/classe_turmas.php");
  
function clientesFone(){
	
	$db   = new db("../config.php");
	$db->_DEBUG = 1;
  	$json = new Services_JSON();
  	$rs   = $db->executa($db->getAll("clientes","(cli_nome = '".$_GET["cli_nome"]."'
  	                                                 AND cli_foneprinc = ".$_GET["cli_fone"].")
  	                                             or (cli_nome = '".$_GET["cli_nome"]."' and  cli_ruaid = ".$_GET["rua_id"].")
  	                                             ",'',0));
  	if ($db->num_rows > 0){
  		while ($ln = $db->fetch_array($rs)){
  	
			  $itens[]   =  array("cli_id" => $ln["cli_id"],"tem"=>"S");
		  
    	}
  	}else{
  		
  		$itens[] = array("tem"=>"N");
  		
  	}
    $str     = $json->encode($itens);     
    return $str;
    
}

switch ($_GET["fc"]){
	
	case 'clientesFone':
		//echo "eu";
		echo clientesFone();
		break;
}
?>