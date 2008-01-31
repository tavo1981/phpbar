<?
require("../libs/classes.class");
require("../libs/funcoes.php");
require("../libs/JSON.php");
  
function trazItens($cpi_id){
	
	$db   = new db("../config.php");
	$db->_DEBUG = 1;
  	$json = new Services_JSON();
  	$rs   = $db->executa($db->getAll("catprodutos_itens","cpi_id=$cpi_id",'',0));
  	if ($db->num_rows > 0){
  		while ($ln = $db->fetch_array($rs)){
  	
			  $itens   =  array("cpi_id" => $ln["cpi_id"],"cpi_item" => urlencode($ln["cpi_item"]),"tem"=>"S");
		  
    	}
  	}else{
  		
  		$itens = array("tem"=>"N");
  		
  	}
    $str     = $json->encode($itens);     
    return $str;
    
}

switch ($_GET["fc"]){
	
	case 'trazItens':
		
		echo trazItens($_GET["cpi_id"]);
		break;
}
?>