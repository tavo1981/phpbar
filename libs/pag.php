<?
function paginar($qtde,$recorset,$valor,$sql){
  if (!isset($pg))
     $pg = 0;
  
 $inicial = $pg * $qtde;
 //sqlqtde vai contar quantos registros ha nessa consulta
 $pag = pg_num_rows($recorset);
 $paginas = intval($pag / $qtde);
 
 echo $paginas;
 if ($pg <> 0) {
    $url = $pg - 1;
    echo "<a id=mulink href='$PHP_SELF?pg=$url&txtass_id=$txtass_id'>Anterior</a> ";
 }else {
    echo "<font color='#336699'>Anterior</font> ";
}
   for ($I = 0; $I<($paginas + 1); $I++) {
      if ($I == $pg) {
         echo "<font face=Arial size=3 color=ff0000><b>&nbsp;[$I]&nbsp;</b></font>";
     }else{
         echo "<font face=Arial size=2>
	           <a href='$PHP_SELF?pg=$I&txtass_id=$txtass_id'>&nbsp;$I&nbsp;</a></font>";
     }
  }
  if ($pg < $paginas) {
     $url = $pg + 1;
     echo "<a  href='$PHP_SELF?pg=$url&txtass_id=$txtass_id'> Próximo</a> ";
  }else {
     echo "<font color='#336699'>Próximo</font>";
  } 

}