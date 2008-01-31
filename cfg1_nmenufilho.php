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
     switch($cbomnu_id){
       case 1:
          $mnu_imagem = "novo.png";
       case 2:
          $mnu_imagem = "find2.png";
       case 3:
          $mnu_imagem = "procedimentos.png";
       case 4:
          $mnu_imagem = "relat.png";
     }
     $campos = array("mnu_nome" => $txtmnu_nome,
	                  "mnu_pai"  => $cbopai_id,
                     "mnu_img"  => $mnu_imagem,
					      "mnu_arq"  => $txtmnu_arq);
     $db->valida_trans($db->insert($campos,"mnu_filho"),1);				 
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
<body bgcolor="#cccccc" onload="initPage();">
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
			   <b>Menu pai:</b>
		    </td>
		    <td><?
			 $sqlusu = "select mnu_paiid,mnu_Nome
			            from   mnu_pai
                     where  mnu_modid = $cbomod_id";
	         frm_select($sqlusu,"nnulo","-1","Modulo","cbopai_id",false);?></td>	   
		 </tr>
		 <tr>
		    <td>
			   <b>Nome:</b>
		    </td>
		    <td><input type="text"size="30" class="nnulo" name="txtmnu_nome"></td>	   
		 </tr>
		  <tr>
		    <td>
			   <b>Arquivo:</b>
		    </td>
		    <td><input type="text"size="30" class="nnulo" name="txtmnu_arq"></td>	   
		 </tr>
		 <tr>
		    <td colspan=2 style="text-align:center">
			  <input type="submit" class="botao" Value="Cadastrar" name="btncadastrar"></td>	   
		 </tr>
	  </table>
	  </form>
	  </center>
	  <script>parent.topo.document.getElementById("usu").innerHTML = "<br>Configurações->Novo Menu filho";</script>
</body>
</html>
