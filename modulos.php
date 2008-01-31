<?
  session_start("usuarios");
  if (!session_is_registered("usu_nome") and !session_is_registered("usu_id")){
     echo "sua Sessï¿½o ï¿½ invï¿½lida.....";
	 exit;
  }
  require_once("libs/classes.class");
  require_once("libs/funcoes.php");
  $db = new db();
  if (is_admin($_SESSION["usu_id"])){
     $sqlmod = "select mod_id,mod_nome,mod_descricao,mod_icone
                from   sis_modulos order by mod_id";
  }else{
     $sqlmod = "select mod_id,mod_nome,mod_descricao,mod_icone
                from   sis_modulos left outer join per_mod
			           on mod_id = per_mod
			       where per_usuid = ".$_SESSION["usu_id"]."
			       order by mod_id";

  }
  $rsmod = $db->executa($sqlmod);
  ?>
<html>
<head>
  <title>Módulos</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="GENERATOR" content="Quanta Plus">
  <link rel='stylesheet' href='libs/estilos.css' title='XP Extended' />
  <SCRIPT LANGUAGE='JavaScript' SRC='libs/menuw.js'></SCRIPT>
  <script type='text/javascript' src='libs/hmenu.js'></script>
  <script type='text/javascript' src='libs/funcoes.js'></script>
    <script type='text/javascript' src='libs/prototype.js'></script>

  <script>
  function muda(val,obj){
  	
  	if (val == 1){
  		
  		this.className='box2';
  		//alert('aqui');
  	}else{
  		
  		this.className='box1';
  		
  	}
  	
  }
 </script>
 <style>
 
 .box1 {height:128px;width:128px}
 .box2 {height:128px;width:128px;background-color:white;border:2px solid white}
 </style>
 
</head>
<body bgcolor="#EAE5DA" 
  oncontextmenu='return false'>

   <br><br><br><br><br><br>
   <center>
      <table cellspacing="3" style='height:70%'>
      <tr>
	  <?
	    while ($ln = pg_fetch_array($rsmod)){
         if ($i == 6){
            echo "</tr><tr>";
            $i = 0;
         }
	    echo "<td><center><a href='mod_inicial.php?sis_modid=".$ln["mod_id"]."' class='modulo'>
	            <img id='cad$i'src='libs/imagens/".$ln["mod_icone"]."' border='0'><br><B>".$ln["mod_nome"]."</b>
	           </a></center></td>";
     
       $i++;    
	  }
	  ?>
     </tr>
	  </table>
   </center>  
   </body>
</html>