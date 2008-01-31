<?
  session_start("usuarios");
   if (!session_is_registered("usu_login") and !session_is_registered("usu_id")){
     echo "sua Sessão é inválida.....";
     exit;
  }
  require("libs/classes.class");
  require("libs/funcoes.php");
  $db = new db();
 
  ?>

<html>
<head>
  <title>Consulta Associados</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="GENERATOR" content="Quanta Plus">
   <link rel="stylesheet" href="libs/estilos.css" type="text/css" media="all">
   <script language="JavaScript" src="libs/funcoes.js"></script>
   <script language="javascript">
      function EnviaDados(id,nome){
         window.parent.document.getElementById("rua_id").value = id;
         window.parent.document.getElementById("rua_nome").value = nome;
         window.parent.document.getElementById("janela").parentWindow.close();
      }


   </script>
</head>
<body bgcolor="#cccccc" >
   <div align="center">
   <table border=0>
     <form method="POST" name="frmconsulta" action="">
       <tr>
          <td><B>Nome:</B></td>
          <td><input type="text" name="txtconsulta" size=45 class="input"
                     onKeyup="c_maiuscula(this);"></td>
          <td><input type="submit" value="consultar" class="botao" name="btnconsultar"></td>
       <tr></tr>
     </form>
   </table>
   <p></p>
   <p></p>
   <div id="principal">
   <?
     if (isset($btnconsultar) or isset($sql)){
            if (!isset($sql)){
           $sql = "select rua_id as Código,
                          rua_nome as Rua
                          
                   from   Ruas
                   where  to_ascii(rua_nome) like to_ascii('$txtconsulta%')
                   order by rua_nome";
                }
            repag($sql,10,$pagina,"botao",true,"0#1","EnviaDados");

    }
   ?>
</div>
</body>
</html>
