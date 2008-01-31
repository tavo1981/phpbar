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
     $campos = array("mnu_nome"  => $txtmnu_nome,
	                 "mnu_modid"   => $cbomod_id);
     $db->valida_trans($db->insert($campos,"mnu_pai"),1);				 
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
</head>
<body bgcolor="#cccccc" oncontextmenu="menu_dir(event.clientY,event.clientX,event);return false">
 <?
makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
  ?>
  <table>
     <tr height="40"><td>&nbsp;</td></tr>
  </table>
<center>
  <form action="" method="post" name="form1" onsubmit="return chknulo(this)">
   <table>
	     <tr>
		    <td>
			   <b>Módulo:</b>
		    </td>
		    <td>
			<?
			 $sqlusu = "select mod_id,mod_nome from sis_modulos order by mod_nome;";
	         frm_select($sqlusu,"nnulo","Modulo","cbomod_id",false);
		  ?> </td>	   
		 </tr>
		 <tr>
		    <td>
			   <b>Nome:</b>
		    </td>
		    <td><input type="text"size="30" class="nnulo" name="txtmnu_nome"></td>	   
		 </tr>
	    <td colspan=2 style="text-align:center">
			  <input type="submit" class="botao" Value="Cadastrar" name="btncadastrar"></td>	   
	 </tr>
	  </table>
	  </form>
	  </center>
	  <script>parent.topo.document.getElementById("usu").innerHTML = "<br>Configurações->Novo Menu Pai";</script>
</body>
</html>
