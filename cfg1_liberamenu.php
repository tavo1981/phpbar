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
	 $db->executa("delete from per_menus where per_usuid = $cbousu_id");
     while (list($k,$v) = each($per_menu)){
	    $sql  = "insert into per_menus (mnu_id,per_usuid) values ($v,$cbousu_id)";
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
     $sqlmod2 = "SELECT p.mnu_nome as pai, f.mnu_nome,mnu_arq, mnu_filid
	           from mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid 
			   left outer join per_menus on mnu_id = mnu_filid 
			   where per_usuid = $cbousu_id order by pai,f.mnu_nome"; 
			    $rsmod2 = $db->executa($sqlmod2);
 }
 $sqlmod = "select p.mnu_nome as pai,
                   mnu_filid, 
                   f.mnu_nome
            from   mnu_filho f inner join mnu_pai p on 
			       mnu_pai = mnu_paiid order by pai,f.mnu_nome ";
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
<body bgcolor="#cccccc" onload="initPage();" >
 <?
 makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
  ?>
    <table >
     <tr height="40"><td>&nbsp;</td></tr>
  </table>
<center>
  <form action="" method="post" name="form1" onsubmit="return chknulo(this)">
  <table cellspacin=0 border=1 width=400>
  <tr>
    <td colspan=2><b>Usuário:</b></td>
    <td colspan=2>
	 <?
	 $sqlusu = "select usu_id,usu_nome from sis_usuarios order by usu_nome;";
	 if (isset($cbousu_id)){
	     frm_select($sqlusu,"nnulo","Usuarios","cbousu_id",true,$cbousu_id,"onchange='form1.submit()'");  
	 }else{
	    frm_select($sqlusu,"nnulo","Usuarios","cbousu_id",false,"","onchange='form1.submit()'"); 
	 }	 
     ?>
     </td>
  </tr>
  <tr>
    <td  colspan=4 style="text-align:center"><b>Menus</b></td>
</tr>	
      <?
	  $i = 0;
	   while ($ln = pg_fetch_array($rsmod)){
	     if (isset($cbousu_id)){
		    if ($i < pg_num_rows($rsmod2)){
			   $mod = pg_result($rsmod2,$i,"mnu_filid");
		    }
		  }  
		  if ($pai == $ln["pai"]){
		      echo "<input type='checkbox' 
		         name='per_menu[]' value='".
				 $ln["mnu_filid"]."'";
				 echo $ln["mnu_filid"]==$mod ?"checked":"";
		       echo   ">".$ln["mnu_nome"]."<br>\n";
		  }else{
	         echo "</td><td align='center' valign=top >
			         <b>".$ln["pai"]."</b><br>\n"; 
		     echo "<input type='checkbox' 
		         name='per_menu[]' value='".
				 $ln["mnu_filid"]."'";
				 echo $ln["mnu_filid"]==$mod ?"checked":"";
		      echo   ">".$ln["mnu_nome"]."<br>\n";
		  }  
		  
		  $pai = $ln["pai"];
		    $i++; 
	   }
	   echo "</td>\n";
	 ?>
	  <tr>
		 <td colspan=2 style="text-align:center">
		  <input type="submit" class="botao" Value="Cadastrar" name="btncadastrar"></td>	   
		 </tr>     
  </table>
  <script>parent.topo.document.getElementById("usu").innerHTML = "<br>Configurações->Liberar Módulos";</script>
</body>
<html>  
  
