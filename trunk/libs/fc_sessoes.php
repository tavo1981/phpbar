<?
session_start();
if (!session_is_registered("usu_login") and !session_is_registered("usu_id")){
    echo "sua Sessão é inválida.....";
	 exit;
}
?>