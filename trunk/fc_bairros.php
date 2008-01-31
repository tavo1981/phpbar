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
         window.parent.document.getElementById("<?=$_GET["sufix"]?>bai_id").value = id;
         window.parent.document.getElementById("<?=$_GET["sufix"]?>bai_descr").value = nome;
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
          </tr>
          <tr>
          <td>&nbsp;</td>
          <td ><input type="submit" value="consultar" class="botao" name="btnconsultar">
          <?libera_inc(212,2,"cad_nbairro.php");?></td>
       <tr></tr>
     </form>
   </table>
   <p></p>
   <p></p>
   <div id="principal">
   <?
     if (isset($btnconsultar) or isset($sql)){
            if (!isset($sql)){
           $sql = "select bai_id as Código,
                          bai_descr as Bairro
                          
                   from   Bairros
                   where  to_ascii(bai_descr) like to_ascii('$txtconsulta%')
                   order by bai_descr";
                }
            repag($sql,10,$pagina,"botao",true,"0#1","EnviaDados");

    }
   ?>
</div>
</body>
</html>
