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
     $campos = array("mnu_nome"   => $txtmnu_nome,
	                 "mnu_pai"    => $cbopai_id,
                     "mnu_img"    => $txtmnu_imagem,
                     "mnu_dir"    => $radmnu_dir,
                     "mnu_sub"    => $radsub_menu,
                     "mnu_paisub" => $txtmnu_subpai,
					 "mnu_arq"    => $txtmnu_arq);
     $db->executa($db->insert($campos,"mnu_filho"),0);
     $codmenu = $db->last_id("mnu_filho","mnu_filid");
     $sql  = "insert into per_menus (mnu_id,per_usuid) values ($codmenu,".$_SESSION["usu_id"].")";
  	 $rs = $db->executa($sql);
     echo "<script>window.location.href='cfg1_nmenufilho001.php';</script>";
  }
?> 
<html>
<head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="GENERATOR" content="Quanta Plus">
  <link rel="stylesheet" href="libs/estilos.css" type="text/css" media="all">
  <script language="JavaScript" src="libs/funcoes.js"></script>
   <link rel="stylesheet" href="libs/menuw.css" type="text/css" media="all">
  <SCRIPT LANGUAGE="JavaScript" SRC="libs/menuw.js"></SCRIPT>
         <link rel="stylesheet" href="libs/mnucemes.css" title="XP Extended" />
     <script type="text/javascript" src="libs/hmenu.js"></script>
  <script>
   function syncr(){

      if (document.form1.cbopai_id.selectedIndex == 1){
          document.getElementById("ima").src="libs/imagens/novo.png";
          document.form1.txtmnu_imagem.value = "novo.png";
      }else if (document.form1.cbopai_id.selectedIndex == 2){
          document.getElementById("ima").src="libs/imagens/find2.png";
          document.form1.txtmnu_imagem.value = "find2.png";
      }else if(document.form1.cbopai_id.selectedIndex == 3){
          document.getElementById("ima").src="libs/imagens/procedimentos.png";
          document.form1.txtmnu_imagem.value = "procedimentos.png";
      }else if(document.form1.cbopai_id.selectedIndex == 4){
          document.getElementById("ima").src="libs/imagens/relat.png";
          document.form1.txtmnu_imagem.value = "relat.png";
      }else{
         document.getElementById("ima").src="libs/imagens/mnuico.jpg";
         document.form1.txtmnu_imagem.value = "";
      }
   }
  </script>
  </head>
<body bgcolor="#cccccc"onload="winInit();initPage();"  oncontextmenu="menu_dir(event.clientY,event.clientX,event);return false" onload='winInit()'>

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
            $sql = "select mod_nome from sis_modulos where mod_id = $cbomod_id";
            echo pg_result(pg_exec($sql),0,'mod_nome');
          ?></td>
		 </tr>
	     <tr>
		    <td>
			   <b>Menu pai:</b>
		    </td>
		    <td><?
			 $sqlusu = "select mnu_paiid,mnu_Nome
			            from   mnu_pai
                     where  mnu_modid = $cbomod_id
                     order by mnu_nome";
	         frm_select($sqlusu,"nnulo","-1","Modulo","cbopai_id",false,"","onChange='syncr()'");?></td>
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
		    <td><input type="text"size="30" class="input" name="txtmnu_arq"></td>
		 </tr>
       </tr>
		  <tr>
		    <td colspan="2">
            <fieldset>
            <legend>Habilitar Menu Direito</legend>
		      <input type="radio" class="input" value="1" name="radmnu_dir">Sim
            <input type="radio" class="input" value="0" name="radmnu_dir" checked>Não
            </fieldset>
          </td>
		 </tr>
       <tr>
		    <td colspan="2">
            <fieldset>
            <legend>É sub-menu</legend>
		      <input type="radio" class="input" value="1" name="radsub_menu">Sim
            <input type="radio" class="input" value="0" name="radsub_menu" checked>Não
            </fieldset>
          </td>
		 </tr>
       <tr>
  <td><b><label><u>Menu Pai</u></b></label></td>
    <td><input class="input" type="text" id='mnu_id'
             name="txtmnu_subpai" size=6
             onblur="window.if_janela.location='fc_mnufilho001.php?valor=mnu_id'"
             onKeyPress="return teclas(event);"
             title="Coddigo do menu" onkeyPress="return teclas(event)">
      <input type="text" name="txtmnu_subnome" id="mnu_nome"
             title="Contratado" class="input" size=35
             onkeyUp="c_maiuscula(this)">
     <a <a href="" onclick="window.if_janela.location.href='fc_mnufilho002.php';if (winList['janela']) winList['janela'].open(); return false;">
    <img src="libs/imagens/find2.png" border="0"></a>
  </td>
 </tr>
       <tr>
		    <td>
			   <b>Imagem:</b>
		    </td><td>
          <input type="hidden" name="txtmnu_imagem">
          <img src="libs/imagens/modico.jpg" id="ima" boder=0>
		    <td>
          </td>
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
<div id='janela' class='window' style='left:320px;top:40px;width:550px;zindex:150'>
<div class='titleBar'>
<span class='titleBarText' id='titulo'>Consultando</span>
<img class='titleBarButtons' alt='' src='libs/imagens/buttons.gif' usemap='#sampleMap1' />
<map id='sampleMap1' name='sampleMap1'>

<area shape='rect' coords='0,0,15,13'  href='' alt='' title='Minimize' onclick="this.parentWindow.minimize();return false;" />
<area shape='rect' coords='16,0,31,13' href='' alt='' title='Restore'  onclick="this.parentWindow.restore();return false;" />
<area shape='rect' coords='34,0,49,13' href='' alt='' title='Close'    onclick="this.parentWindow.close();return false;" />
</map>
</div>
<div class='clientArea' style='height:350px;background-color:#cccccc'>
<iframe name='if_janela' width='100%' height='100%'frameborder=0></iframe>
</div>
</div>
 <?
makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
  ?>
</html>
