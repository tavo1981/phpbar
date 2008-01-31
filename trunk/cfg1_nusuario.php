<?
  session_start("usuarios");
  if (!session_is_registered("usu_login") and !session_is_registered("usu_id")){
     echo "sua Sessão é inválida.....";
         exit;
  }
  require_once("libs/classes.class");
  require_once("libs/funcoes.php");
  $db = new db();
  if (isset($btncadastrar)){
     if ($txtusu_senha != $txtusu_senha2){
            messagebox("A senhas devem ser iguais!\\n por favor Digite Novamente");
         }else{
            $campos = array("usu_nome"  => $txtusu_nome,
                            "usu_login" => strtolower($txtusu_login),
                             "usu_senha" => md5($txtusu_senha),
                             "usu_ativo" => '1',
                             "usu_grpid" => $_POST["grp_id"],        
                       "usu_inst"  => $cboins_id);
       $db->valida_trans($db->insert($campos,"sis_usuarios"),0);
                                  
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
</head>
<body bgcolor="#cccccc" oncontextmenu="menu_dir(event.clientY,event.clientX,event);return false">
 <?
 cria_menu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
  ?>
    <table>
     <tr height="40"><td>&nbsp;</td></tr>
  </table>
<center>
  <form action="" method="post" name="form1" onsubmit="return chknulo(this)">
   <table>
             <tr>
                    <td>
                           <b>Login:</b>
                    </td>
                    <td><input type="text"size="30"  class="nnulo" name="txtusu_login"></td>       
                 </tr>
                 <tr>
                    <td>
                           <b>Nome:</b>
                    </td>
                    <td><input type="text"size="30"  class="input" name="txtusu_nome"></td>        
                 </tr>
                 <tr>
                    <td>
                           <b>Instituição:</b>
                    </td>
                    <td>
                        <?$sqlinst = "select * from instituicoes order by ins_id";
                           frm_select($sqlinst,"nnulo","15","Instituicao","cboins_id",false);
                        ?>  
                    </td>          
                 </tr>
                  <tr>
                    <td>
                           <b>Grupo:</b>
                    </td>
                    <td>
                        <?$sqlinst = "select * from sis_grupos order by grp_id";
                           frm_select($sqlinst,"nnulo","-1","Instituicao","grp_id",false);
                        ?>  
                    </td>          
                 </tr>
                 <tr>
                    <td>
                           <b>Senha:</b>
                    </td>
                    <td><input type="password"size="30"  class="nnulo" name="txtusu_senha"></td>           
                 </tr>
                 <tr>
                    <td>
                           <b>Repita:</b>
                    </td>
                    <td><input type="password"size="30" class="nnulo" name="txtusu_senha2"></td>           
                 </tr>
                 <tr>
                    <td colspan=2 style="text-align:center">
                     <input type="button" class="botao" Value="Consultar" name="btnconsultar"
                             onclick="location.href='cfg_cusuarios.php'">
                     <input type="submit" class="botao" Value="Cadastrar" name="btncadastrar"></td>        
                 </tr>
          </table>
          </form>
          </center>
          <script>parent.topo.document.getElementById("usu").innerHTML = "<br>Configurações->Novo Usuário";</script>
</body>
</html>
