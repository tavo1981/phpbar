<?
  require("libs/fc_sessoes.php");
  require("libs/classes.class");
  require("libs/funcoes.php");
  require("libs/form2.class");
  $db   = new db();

  $sqlconf = "select per_periodo,per_id,avl_abrev from periodos
                   inner join conf_anoletivo on cfg_id = per_cfgid
                   inner join tipo_avaliacoes on avl_id = cfg_tipoid
                   where cfg_ano = ".$_SESSION["sis_exerc"]."
                   and   current_date >= per_dtini and current_date <= per_dtfim";
 $db->executa($sqlconf,true);
 $bimestre = $db->dados["per_periodo"]." ".$db->dados["avl_abrev"]; 
  
?>
<html>
<head>
</head>
<body bgcolor="<?=$_SESSION["bgcolor"];?>" style='margin-top:0;margin-left:0;margin-right:0'>
<table border=1 width="102%" >
<tr>
<td width="70%"id='messageboard'>&nbsp;</td><td><a href='modulos.php' target='corpo'>Modulos</a></td>
<td width="10%" style="text-align:right"><?=date("d/m/Y");?></td>
</tr>
</table>

</body>
</html>
  