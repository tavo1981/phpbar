<?
//atualiza menus

require("../libs/classes.class");
$db = new db("../config.php");
//$db->_DEBUG = 1;
//$fp = fopen("update.sql","r");	
//while (!feof($fp)){
	
//	$db->executa(fgets($fp));
	
	
//}

$sql = "create table comandaentrega (cet_comid bigint,cet_funid integer);";
$db->executa($sql);
$sql  = "create unique index comandaentrega_unique on comandaentrega(cet_comid,cet_funid)";
$db->executa($sql);
$sql = "create index comandaentrega_cet_comid on comandaentrega(cet_comid)";
$db->executa($sql);
$sql = "create index comandaentrega_cet_funid on comandaentrega(cet_funid)";
$db->executa($sql);