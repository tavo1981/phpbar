<?
session_start();
if (!session_is_registered("usu_login") and !session_is_registered("usu_id")){
    echo "sua Sess�o � inv�lida.....";
	 exit;
}
?>