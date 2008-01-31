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
     $campos = array("mod_nome"    => $txtmod_nome,
	                  "mod_descricao"   => $txtmod_descr,
					      "mod_arquivo" => $txtmod_arquivo);
     $db->begin();
     $rs = $db->executa($db->insert($campos,"sis_modulos"));
     $mod_id = $db->last_id("sis_modulos","mod_id");
     $db->executa("insert into mnu_pai (mnu_nome,mnu_modid,mnu_akey) values('Cadastros',$mod_id,'C')");
     $db->executa("insert into mnu_pai (mnu_nome,mnu_modid,mnu_akey) values('Consultas',$mod_id,'o')");
     $db->executa("insert into mnu_pai (mnu_nome,mnu_modid,mnu_akey) values('Procedimentos',$mod_id,'P')");
     $db->executa("insert into mnu_pai (mnu_nome,mnu_modid,mnu_akey) values('Relatórios',$mod_id,'R')");
     $db->commit();
     if ($rs){
        messagebox("Modulo Cadastrado com Sucesso");
     }
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
  <form action="" method="post" name="form1" onsubmit="return chknulo(this)">
   <table>
	     <tr>
		    <td>
			   <b>Módulo:</b>
		    </td>
		    <td><input type="text"size="30" class="nnulo" name="txtmod_nome"></td>	   
		 </tr>
		 <tr>
		    <td>
			   <b>Descrição:</b>
		    </td>
		    <td><textarea name="txtmod_descr" size=40 class="input" title="Descrição" wrap="soft" rows=3></textarea></td>
		 </tr>
		 <tr>
		    <td colspan=2 style="text-align:center">
			  <input type="submit" class="botao" Value="Consultar" name="btnconsultar"
              onclick="document.form1.action='cfg_cmodulos.php';document.form1.submit();">
			  <input type="submit" class="botao" Value="Cadastrar" name="btncadastrar"></td>	   
		 </tr>
	  </table>
	  </form>
	  </center>
	  <script>parent.topo.document.getElementById("usu").innerHTML = "<br>Configurações->Novo Módulo";</script>
</body>
</html>
