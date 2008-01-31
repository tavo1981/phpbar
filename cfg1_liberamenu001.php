<?
  session_start("usuarios");
  if (!isset($_SESSION["usu_login"]) and !isset($_SESSION["usu_id"])){
     echo "sua Sessão é inválida.....";
	 exit;
  }
  require_once("libs/classes.class");
  require_once("libs/funcoes.php");
  $db = new db();
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
<body bgcolor="#cccccc" onload="initPage();" oncontextmenu="menu_dir(event.clientY,event.clientX,event);return false">
 <?
 makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
  ?>
    <table>
     <tr height="40"><td>&nbsp;</td></tr>
  </table>
<center>
  <form action="cfg1_liberamenu002.php" method="post" name="form1" onsubmit="return chknulo(this)">
  <table cellspacin=0>
  <tr>
    <td><b>Modulo:</b></td>
    <td>
	    <? $sqlmod = "select mod_id,mod_nome from  sis_modulos order by mod_id";
		frm_select($sqlmod,"input",15,"Módulos","cbomod_id",false,"","ondblclick='form1.submit()'");
		?>
	    </td>
	</tr>
	</form>
</table>
</body>
<script>parent.topo.document.getElementById("usu").innerHTML =
"<br>Confoguraçoes->Liberar Permissões";</script>
</html> 
