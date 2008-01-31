<?
session_start("usuarios");
  if (!session_is_registered("usu_login") and !session_is_registered("usu_id")){
     echo "sua sessão é invalida";
	 exit;
  }
  ?>
<html>
<head>
<title>phpBar </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
 <script language="JavaScript" src="libs/funcoes.js"></script>
</head>
<frameset rows="*,23" frameborder="YES" border="1" framespacing="0" cols="*" bordercolor="#000000" onunload="sair(false)"> 
  <frame name="corpo" noresize src="modulos.php">
  <frame name="rodape" noresize src="rodape.php">
</frameset>
<noframes> 
<body>
</body>
</noframes> 
</html>
