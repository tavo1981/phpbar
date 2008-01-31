<?
 session_start();
 require("libs/classes.class");
 $db = new db();
 if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
     $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
 }else{
     $ip =  $HTTP_SERVER_VARS['REMOTE_ADDR'];
 }
 $sql = "delete from sis_usuonline where onl_usuid = ".$_SESSION["usu_id"]." and onl_usuip = '$ip'";
// echo $sql; 
 $db->executa($sql);
 session_destroy();
 sleep(1);
 echo "<script>window.close();</script>";
 ?>

