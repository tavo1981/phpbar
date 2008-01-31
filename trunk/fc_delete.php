<?
  session_start();
  if (!session_is_registered("usu_login") and !session_is_registered("usu_id")){
     echo "sua Sessão é inválida.....";
	 exit;
  }
  require("libs/classes.class");
  require("libs/funcoes.php");
  $db = new db();
  $db->begin();
  if ($_GET["log"] == 1 ){
  	addLog(1,$_SESSION["usu_id"],$_GET["ttable"]," where ".$_GET["fkey"]." = ".$_GET["fvalue"],'',$db);
  	
  }
  $sql = "delete from ".$_GET["ttable"]." where ".$_GET["fkey"] ." = '".$_GET["fvalue"]."'";

 $rs =  $db->executa($sql);
 if (!$rs){
  	
	 echo "<script>alert('Erro ao excluir Registro!\\n Erro:".$db->erro;
	 echo "');</script>";
	 $db->rollback();
	 echo "<script>history.back();
    </script>";
 }else{
 	$db->commit();
 //	echo $_GET["retarq"];
  	echo "<script>location.href='".$_GET["retarq"]."';
   </script>";

}
?>
