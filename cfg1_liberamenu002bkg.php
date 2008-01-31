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
	 $db->executa("delete from per_menus where per_usuid = $cbousu_id and mnu_mod = $cbomod_id");
     while (list($k,$v) = each($per_menu)){
	    $sql  = "insert into per_menus (mnu_id,per_usuid,mnu_mod) values ($v,$cbousu_id,$cbomod_id)";
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
     $sqlmod = "SELECT  p.mnu_nome as pai, f.mnu_nome,mnu_arq, mnu_filid,mnu_id,mnu_sub,mnu_paisub
	        from    mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
		        left outer join per_menus on mnu_id = mnu_filid and  per_usuid = $cbousu_id
		where   mnu_modid=$cbomod_id and mnu_sub = 0 order by p.mnu_nome,mnu_filid,mnu_paisub";

 }else{
    $sqlmod = "select p.mnu_nome as pai,
                      mnu_filid,
                      f.mnu_nome,
                      mnu_sub,mnu_paisub
               from   mnu_filho f inner join mnu_pai p on
	              mnu_pai = mnu_paiid
	       where mnu_modid=$cbomod_id mnu_sub = 0 order by p.mnu_nome,mnu_filid,mnu_paisub";
  }
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
</head>
<body bgcolor="#cccccc" oncontextmenu="menu_dir(event.clientY,event.clientX,event);return false">
 <?
 makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
  ?>
    <table >
     <tr height="40"><td>&nbsp;</td></tr>
  </table>
<center>
  <form action="" method="post" name="form1" onsubmit="return chknulo(this)">
  <input type="hidden"  name="cbomod_id" value="<?=$cbomod_id;?>">
  <table cellspacin=0 border=1 width="75%">
   <tr>
    <td colspan=2><b>Usuário:</b></td>
    <td colspan=2>
	 <?
	 $sqlusu = "select usu_id,usu_nome from sis_usuarios order by usu_nome;";
	 if (isset($cbousu_id)){
	     frm_select($sqlusu,"nnulo","-1","Usuarios","cbousu_id",true,$cbousu_id,"onchange='form1.submit()'");
	 }else{
	    frm_select($sqlusu,"nnulo","-1","Usuarios","cbousu_id",false,"","onchange='form1.submit()'");
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
	     if ($pai == $ln["pai"]){
            if ($ln["mnu_sub"] == 1){
               echo "&nbsp;&nbsp;&nbsp;&nbsp;";
            }
		      echo "<input type='checkbox'
		         name='per_menu[]' value='".
				 $ln["mnu_filid"]."'";
				 echo $ln["mnu_filid"]==$ln["mnu_id"] ?"checked":"";
		       echo   ">".$ln["mnu_nome"]."<br>\n";
		  }else{
	         echo "</td><td align='center' valign=top >
			         <b>".$ln["pai"]."</b><br>\n";
            if ($ln["mnu_sub"] ==1){
               echo "&nbsp;&nbsp;&nbsp;&nbsp;";
            }
		      echo "<input type='checkbox'
		            name='per_menu[]' value='".
				      $ln["mnu_filid"]."'";
				echo $ln["mnu_filid"]==$ln["mnu_id"] ?"checked":"";
		      echo   ">".$ln["mnu_nome"]."<br>\n";
		  }
		  
		  $pai = $ln["pai"];
		    $i++; 
	   }
	   echo "</td>\n";
	 ?>
	  <tr>
		 <td colspan=4 style="text-align:center">
		  <input type="submit" class="botao" Value="Cadastrar" name="btncadastrar"></td>	   
		 </tr>     
  </table>
  <script>parent.topo.document.getElementById("usu").innerHTML = "<br>Configurações->Liberar Permissões";</script>
</body>
<html>  
  
