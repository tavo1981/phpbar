<?
  require("libs/fc_sessoes.php");
  $_SESSION["usu_modulo"] = $_GET["sis_modid"];
  require("libs/classes.class");  
  require("libs/funcoes.php");
  $db = new db();
  $db->_DEBUG = 1;
  $sql = "select * from sis_modulos where mod_id = ".$_SESSION["usu_modulo"];
  $db->executa($sql,true,"mod");
  
      $sqlmnu = "SELECT mnu_filid,
                        p.mnu_nome AS pai, 
                        f.mnu_nome,
                        mnu_arq,
                        mnu_img,
                        mnu_sub,
                        mnu_paisub
                  FROM  mnu_filho f INNER JOIN mnu_pai p ON mnu_pai = mnu_paiid
                        INNER JOIN sis_modulos m ON mnu_modid = mod_id
                  WHERE mod_id = ".$_SESSION["usu_modulo"]."
                  AND   (mnu_sub = 0 OR mnu_sub ISNULL)
                  ORDER BY pai,f.mnu_nome";
  
    $rsm  = $db->executa($sqlmnu);
  ?>
  
<html>
<head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="GENERATOR" content="Quanta Plus">
  <link rel="stylesheet" href="libs/estilos.css" type="text/css" media="all">
  <link rel="stylesheet" href="libs/menuw.css" type="text/css" media="all">
  <link rel='stylesheet' href='libs/mnucemes.css' title='XP Extended' />
  <SCRIPT LANGUAGE="JavaScript" SRC="libs/menuw.js"></SCRIPT>
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
</head>
<body bgcolor="#EAE5DA" onload="initPage();" oncontextmenu="menu_dir(event.clientY,event.clientX,event);return false">
 <?
 makeMenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
 ?> 
  <img src="libs/imagens/<?=$db->mod["mod_icone"];?>" border='0' style='display:inline'>    
  <hr>  
 <center>
 <table style='height:70%' >
<tr>
<?
 while ($ln = $db->fetch_array($rsm)){
         if ($i == 6){
            echo "</tr><tr>";
            $i = 0;
         }
	    echo "<td style='text-align:center;' valign='top'><a href='".$ln["mnu_arq"]."
	          'style='font-face:verdana;text-decoration:none;color:black;color:#96928B;font-size:12pt'>	    
	            <img id='cad$i'src='libs/imagens/".$ln["mnu_img"].".png' border='0'><br><b>".$ln["mnu_nome"]."</b>
	           </a></td>";
     
       $i++;    
 }
 
?>
</table>
<hr>
</center>
<a href='modulos.php' target='corpo' class='modulo'><b>Início</b></a>
</body>
</html>
