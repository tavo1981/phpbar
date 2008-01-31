<?
  session_start("usuarios");
  if (!isset($_SESSION["usu_login"]) and !isset($_SESSION["usu_id"])){
     echo "sua Sessão é inválida.....";
	 exit;
  }
  require_once("libs/classes.class");
  require_once("libs/funcoes.php");
  $db = new db();
  if (isset($btncadastrar)){
     $db->begin();
	 $erro = 0;
	 $db->executa("delete from per_mod where per_usuid = $cbousu_id");
     while (list($k,$v) = each($per_mod)){
	    $sql  = "insert into per_mod (per_usuid,per_mod) values ($cbousu_id,$v)";
		$rs = $db->executa($sql);
		if (!$rs){
		   $erro++;
		}    				 
     }
	 if ($erro == 0){
	    $db->commit();
		messagebox("Permissões liberadas com Sucesso!");
	 }else{
	    $db->rollback();	
  	    messagebox("Erro ao liberar permissões!\\n Erro: ".$db->erro());
	 }
  }	 	
  
 if (isset($cbousu_id)){ 
     $sqlmod = "select mod_id, 
                       mod_nome,
                       per_usuid,
                       per_mod
		         from  sis_modulos left outer join per_mod 
			     on  mod_id = per_mod and per_usuid = $cbousu_id"; 
  }else{
     $sqlmod = "select mod_id, 
                      mod_nome
                from  sis_modulos";
  }				
 $rsmod = $db->executa($sqlmod)
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
     <link rel="stylesheet" href="libs/mnucemes.css" title="XP Extended" />
    <script type="text/javascript" src="libs/hmenu.js"></script> 
</head>
<body bgcolor="#cccccc" onload="initPage();"  oncontextmenu="menu_dir(event.clientY,event.clientX,event);return false">
 <?
 makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
  ?>
    <table>
     <tr height="40"><td>&nbsp;</td></tr>
  </table>
<center>
  <form action="" method="post" name="form1" onsubmit="return chknulo(this)">
  <table cellspacin=0>
  <tr>
    <td><b>Usuário:</b></td>
    <td>
	 <?
	 $sqlusu = "select usu_id,usu_nome from sis_usuarios order by usu_nome;";
	 if (isset($cbousu_id)){
	     frm_select($sqlusu,"nnulo","-1","Usuarios","cbousu_id",true,$cbousu_id,"onchange='form1.submit()'");  
	 }else{
	    frm_select($sqlusu,"nnulo","-1","Usuarios","cbousu_id",false,"","onchange='form1.submit()'"); 
	 }	 
     ?>
     </td>
  </tr>
  <tr>
    <td colslan=2 style="text-align:center"><b>Módulos</b></td>
  </tr>
     <?
	  $i = 0;
	   while ($ln = pg_fetch_array($rsmod)){
	      echo "<tr><td></td>\n";
		  echo "<td><input type='checkbox' 
		         name='per_mod[]' value='".
				 $ln["mod_id"]."'";
		  echo $ln["mod_id"]==$ln["per_mod"] ?"checked":"";
		  echo   ">".$ln["mod_nome"]."</td>\n";
		  echo "</tr>\n";
		  $i++; 
	   }
	 ?>
	  <tr>
		 <td colspan=2 style="text-align:center">
		  <input type="submit" class="botao" Value="Cadastrar" name="btncadastrar"></td>	   
		 </tr>     
  </table>
  <script>parent.topo.document.getElementById("usu").innerHTML = "<br>Configurações->Liberar Módulos";</script>
</body>
<html>  
  
