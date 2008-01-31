<?
session_start("usuarios");
require("../libs/classes.class");
require("../libs/funcoes.php");
require("../libs/JSON.php");
  
function doLogin($usu_login,$usu_senha){
	
	$db   = new db("../config.php");
  	$json = new Services_JSON();
  	$db->executa($db->getJoinRecord("funcionarios","fun_nome='$usu_login' and fun_senha='$usu_senha'",'',0),true,"user");
  	
  	if ($db->num_rows == 1){
  		
         $id     = $db->user["usu_id"];
         $login  = $db->user["usu_login"];
         $itens  =  array("usu_id" => $id,"usu_login" => $login,"status" =>1);
         $str = $json->encode($itens); 
         
         session_register("usu_nome");
  		 session_register("usu_id");
         $_SESSION["usu_modulo"] = 0;
         $_SESSION["usu_nome"]   = $db->user["fun_nome"];
         $_SESSION["usu_id"]     = $db->user["fun_id"];
         $_SESSION["sis_exerc"]  = $exercicio;
         $_SESSION["usu_grpid"]  = $grp_id;
         $_SESSION["bgcolor"]    = "#EAE5DA";
         $_SESSION["dtatend"]    = date("d/m/Y");
         
         if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
      		$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
  		}else{
      		$ip =  $HTTP_SERVER_VARS['REMOTE_ADDR'];
  		}
  		
  		      
		   
	}else{
		
		  $itens   =  array("usu_id" => '',"usu_login" => $_GET["usu_login"],"status" => 2);
		  $str = $json->encode($itens); 
    }
    
    return $str;
}
switch ($_GET["fc"]){
	
	case 'doLogin':
		
		echo doLogin($_GET["usu_login"],$_GET["usu_senha"]);
		break;
		
}
?>