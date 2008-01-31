<?
/**
* Arquivo de Funcoes
* @author Iuri Guntchnigg at iuri at sapiranga.rs.gov.br
* @access public
*/ 
function cria_menu($usuario,$modulo,$sub=null){
   	
   $sqlpai = " select * FROM mnu_pai WHERE mnu_modid=$modulo ORDER BY mnu_nome";
   $rs = pg_query($sqlpai);
   echo "<div class='menuBar' style='width:99.4%;position:absolute;left:0px;top:0px'>";
   while ($ln = pg_fetch_array($rs)){
       $m2 = $ln["mnu_nome"];
       $nome = str_replace($ln["mnu_akey"],"<u>".$ln["mnu_akey"]."</u>",$ln["mnu_nome"]);
       echo "<a class='menuButton' accesskey='".$ln["mnu_akey"]."'
       onclick=\"return buttonClick(event,'".$ln["mnu_nome"]."');\"
       onmouseover=\"buttonMouseover(event, '".$m2."');\"
       onKeyDown=\"moveFirst('".$ln["mnu_nome"]."',event)\">".$nome."</a>";
    }
     
       echo "<a class='menuButton'
       onclick=\"\"
       onmouseover=\"\"><a class='menuButton' onclick=\"window.open('ajuda.php','Ajuda','height=600,width=800,location=no')\">Ajuda</a></a>";
   if (is_admin($usuario)){
      $sqlmnu = "SELECT mnu_filid,
                        p.mnu_nome AS pai, 
                        f.mnu_nome,
                        mnu_arq,
                        mnu_img,
                        mnu_sub,
                        mnu_paisub
                  FROM  mnu_filho f INNER JOIN mnu_pai p ON mnu_pai = mnu_paiid
                        INNER JOIN sis_modulos m ON mnu_modid = mod_id
                  WHERE mod_id = $modulo
                  AND   (mnu_sub = 0 OR mnu_sub ISNULL)
                  ORDER BY pai,f.mnu_nome";

   }else{
       $sqlmnu = "SELECT mnu_filid,
                         p.mnu_nome AS pai,
                         f.mnu_nome,
                         mnu_arq,
                         mnu_img,
                         mnu_sub,
                         mnu_paisub
                  FROM   mnu_filho f INNER JOIN  mnu_pai p ON mnu_pai = mnu_paiid
                         inner join per_menus on mnu_id = mnu_filid
                  WHERE (per_usuid = $usuario AND mnu_mod = $modulo)
                  AND   (mnu_sub = 0 OR mnu_sub isnull)
                  ORDER BY pai,f.mnu_nome";
    }
   //echo $sqlmnu;
   $rsmnu = pg_query($sqlmnu);
   echo "\n</div>\n\n";
   while ($lnmnu = pg_fetch_array($rsmnu)){
      if ($pai == $lnmnu["pai"]){
          if ($lnmnu["mnu_arq"] == ""){
             echo "<a class='menuItem' href='a'\n 
                    onKeyDown=\"menuItemKeyDown(event, '".$lnmnu["mnu_filid"]."');proximo(this,event)\"\n"
                  ."onclick=\"menuItemMouseover(event, '".$lnmnu["mnu_filid"]."');return false;\"\n"
                  ."onmouseover=\"menuItemMouseover(event, '".$lnmnu["mnu_filid"]."');\"";
             echo  "<span class='menuItemText'>".$lnmnu["mnu_nome"]."</span>"
                 ."<span  class='menuItemArrow'>&#9654;</span></a>";
          }else{
             echo  "<a class='menuItem' href='".$lnmnu["mnu_arq"]."'onKeyDown='proximo(this,event)'>".$lnmnu["mnu_nome"]."</a>\n";
          }
      }else{
         echo "</div><div id='".$lnmnu["pai"]."' class='menu' onKeyPress=\"hide_menu(event)\" onmouseover=\"menuMouseover(event)\">\n";
         if ($lnmnu["mnu_arq"] == ""){
            echo "<a class='menuItem' href='a'
                 onKeyDown=\"menuItemKeyDown(event, '".$lnmnu["mnu_filid"]."');proximo(this,event)\"\n"
                 ."onclick=\"menuItemMouseover(event, '".$lnmnu["mnu_filid"]."');return false;\"\n"
                 ."onmouseover=\"menuItemMouseover(event, '".$lnmnu["mnu_filid"]."');\"";
            echo "<span  class='menuItemText'>".$lnmnu["mnu_nome"]."</span>"
                 ."<span class='menuItemArrow'>&#9654;</span></a>";
         }else{
            echo  "<a class='menuItem' href='".$lnmnu["mnu_arq"]."'onKeyDown='proximo(this,event)'>".$lnmnu["mnu_nome"]."</a>\n";
         }
      }
      $pai = $lnmnu["pai"];
   }
   echo "</tbody></table></div>\n";
   if (is_admin($usuario)){
       $sqlmod = "select mod_id,mod_nome,mod_arquivo,mod_descricao
                  from   sis_modulos
                  order by mod_id";
   }else{
       $sqlmod = "select mod_id,mod_nome,mod_arquivo,mod_descricao
                  from   sis_modulos left outer join per_mod
                                   on mod_id = per_mod
                                 where  per_usuid = ".$usuario."
                  order by mod_id";

   }
   $rsmod = pg_query($sqlmod);
    echo "<div id='mnu_dir' class='menu' onmouseover=\"menuMouseover(event)\">\n"
        ."<table>\n"
        ."<tbody>\n";
   while ($lnmod = pg_fetch_array($rsmod)){
         echo "<tr class='item'><td class='icon'>\n"
               ."&nbsp;"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='mod_inicial.php?sis_modid=".$lnmod["mod_id"]."'>".$lnmod["mod_nome"]."</a>\n"
               ."</td>\n"
               ."</tr>\n";
   }
   if (is_admin($usuario)){
      echo     "<tr class='separator'><td class='icon'>\n"
               ."<div></div>"
               ."</td><td class='label'>\n"
               ."<div></div>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp;\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick='window.location.reload'>Recarregar página</a>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp;\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick=\"mostra_fonte(window.location)\">Mostrar Fonte</a>\n"
               ."</td>\n"
               ."</tr>\n";

   }
   if (is_admin($usuario)){
      $sqlmnudir = "SELECT  p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                  inner  join sis_modulos m on mnu_modid = mod_id
                       where  mod_id = $modulo
                  and    f.mnu_dir = '1'
                                 order by pai,f.mnu_nome";

   }else{
       $sqlmnudir = "SELECT p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                              left outer join per_menus on mnu_id = mnu_filid
                                 where  (per_usuid = $usuario
                  and    mnu_mod = $modulo)
                  and    f.mnu_dir = '1'
                  order by pai,f.mnu_nome";
    }
    $rsmnudir = pg_query($sqlmnudir);
    if (pg_num_rows($rsmnudir) > 0){
       echo "<tr class='separator'><td class='icon'>\n"
              ."<div></div>"
              ."</td><td class='label'>\n"
              ."<div></div>\n"
              ."</td>\n"
              ."</tr>\n";
       while ($lnmnudir = pg_fetch_array($rsmnudir)){
            echo "<tr class='item'><td class='icon'>\n"
                  ."&nbsp\n"
                  ."</td><td class='label'>\n"
                  ."<a class='menuItem2' href='".$lnmnudir["mnu_arq"]."'>".$lnmnudir["mnu_nome"]."</a>\n"
                  ."</td>\n"
                  ."</tr>\n";
       }
    }
    $sqlmes = "select coalesce(sum(*),0) as total from mensagens where mes_usupara = ".$usuario." and mes_lida='0'";
    $total = pg_result(pg_query($sqlmes),0,"total");
    echo "<tr class='separator'><td class='icon'>\n"
               ."<div></div>"
               ."</td><td class='label'>\n"
               ."<div></div>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='cfg_messageboard.php'>Mensagens ($total)</a>\n"
               ."</td>\n"
               ."</tr>\n"
               ."</td>"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick='sair(true)'>Sair Do Sistema</a>\n"
               ."</td>\n"
               ."</tr>\n";
   echo "</tbody></table></div>\n";
//submenus
   if (is_admin($usuario)){
      $sqlsub = "SELECT mnu_filid ,p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img,mnu_sub,mnu_paisub
                       from mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                  inner join sis_modulos m on mnu_modid = mod_id
                       where mod_id = $modulo
                  and   mnu_sub = 1
                                 order by mnu_paisub,pai,f.mnu_nome";

   }else{
       $sqlsub = "SELECT mnu_filid, p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img,mnu_sub,mnu_paisub
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                              left outer join per_menus on mnu_id = mnu_filid
                                 where (per_usuid = $usuario and mnu_mod = $modulo)
                   and   mnu_sub = 1
                  order by mnu_paisub,pai,f.mnu_nome";
  }
 //echo $sqlsub;
 $rssub = pg_query($sqlsub);
   echo "\n</div>\n\n";
   //$fc = "nao";
   while($lnsub = pg_fetch_array($rssub)){
     if ($pai == $lnsub["mnu_paisub"]){
        if ($lnsub["mnu_arq"] == ""){
            echo "<a class='menuItem'
                   onKeyDown=\"menuItemKeyDown(event, '".$lnsub["mnu_filid"]."');proximo(this,event)\"\n"
                 ."onclick=\"return false;\"\n"
                 ."onmouseover=\"menuItemMouseover(event, '".$lnsub["mnu_filid"]."');\"";
           echo  "<span class='menuItemText'>".$lnsub["mnu_nome"]."</span>"
                 ."<span  class='menuItemArrow'>&#9654;</span></a>";
        }else{
            echo  "<a class='menuItem' href='".$lnsub["mnu_arq"]."'onKeyDown='proximo(this,event)'>".$lnsub["mnu_nome"]."</a>\n";
        }
        
          }else{
           if ($pai != "" and $pai != $lnsub["pai"]){
            echo "</div>\n\n";
         }
         echo "<div id='".$lnsub["mnu_paisub"]."' class='menu' onmouseover=\"menuMouseover(event)\">\n";
        if ($lnsub["mnu_arq"] == ""){
            echo "<a class='menuItem'
                   onKeyDown=\"menuItemKeyDown(event, '".$lnsub["mnu_filid"]."');proximo(this,event)\"\n"
                 ."onclick=\"return false;\"\n"
                 ."onmouseover=\"menuItemMouseover(event, '".$lnsub["mnu_filid"]."');\"";
            echo "<span class='menuItemText'>".$lnsub["mnu_nome"]."</span>"
                 ."<span class='menuItemArrow'>&#9654;</span></a>";
         }else{
             echo  "<a class='menuItem' href='".$lnsub["mnu_arq"]."'onKeyDown='proximo(this,event)'>".$lnsub["mnu_nome"]."</a>\n";
         }
     }
         $pai = $lnsub["mnu_paisub"];
  }
   echo "</div>\n";
}

/*function makeMenu($usuario,$modulo,$sub=null){
   $sqlpai = " select * FROM mnu_pai WHERE mnu_modid=$modulo ORDER BY mnu_nome";
   $rs = pg_query($sqlpai);
   echo "<div class='menuBar' style='width:99.4%;position:absolute;left:0px;top:0px'>";
   while ($ln = pg_fetch_array($rs)){
       $m2 = $ln["mnu_nome"];
       $nome = str_replace($ln["mnu_akey"],"<u>".$ln["mnu_akey"]."</u>",$ln["mnu_nome"]);
       echo "<a class='menuButton' accesskey='".$ln["mnu_akey"]."'
       onclick=\"return buttonClick(event,'".$ln["mnu_nome"]."');\"
       onmouseover=\"buttonMouseover(event, '".$m2."');\"
       onKeyDown=\"moveFirst('".$ln["mnu_nome"]."',event)\">".$nome."</a>";
    }
     
       echo "<a class='menuButton'
       onclick=\"\"
       onmouseover=\"\"><a class='menuButton' onclick=\"window.open('ajuda.php','Ajuda','height=600,width=800,location=no')\">Ajuda</a></a>";
   if (is_admin($usuario)){
      $sqlmnu = "SELECT mnu_filid,
                        p.mnu_nome AS pai, 
                        f.mnu_nome,
                        mnu_arq,
                        mnu_img,
                        mnu_sub,
                        mnu_paisub
                  FROM  mnu_filho f INNER JOIN mnu_pai p ON mnu_pai = mnu_paiid
                        INNER JOIN sis_modulos m ON mnu_modid = mod_id
                  WHERE mod_id = $modulo
                  AND   (mnu_sub = 0 OR mnu_sub ISNULL)
                  ORDER BY pai,f.mnu_nome";

   }else{
       $sqlmnu = "SELECT mnu_filid,
                         p.mnu_nome AS pai,
                         f.mnu_nome,
                         mnu_arq,
                         mnu_img,
                         mnu_sub,
                         mnu_paisub
                  FROM   mnu_filho f INNER JOIN  mnu_pai p ON mnu_pai = mnu_paiid
                         inner join per_menus on mnu_id = mnu_filid
                  WHERE (per_usuid = $usuario AND mnu_mod = $modulo)
                  AND   (mnu_sub = 0 OR mnu_sub isnull)
                  ORDER BY pai,f.mnu_nome";
    }
   //echo $sqlmnu;
   $rsmnu = pg_query($sqlmnu);
   echo "\n</div>\n\n";
   while ($lnmnu = pg_fetch_array($rsmnu)){
      if ($pai == $lnmnu["pai"]){
          if ($lnmnu["mnu_arq"] == ""){
             echo "<a class='menuItem' href='a'\n 
                    onKeyDown=\"menuItemKeyDown(event, '".$lnmnu["mnu_filid"]."');proximo(this,event)\"\n"
                  ."onclick=\"menuItemMouseover(event, '".$lnmnu["mnu_filid"]."');return false;\"\n"
                  ."onmouseover=\"menuItemMouseover(event, '".$lnmnu["mnu_filid"]."');\"";
             echo  "<span class='menuItemText'>".$lnmnu["mnu_nome"]."</span>"
                 ."<span  class='menuItemArrow'>&#9654;</span></a>";
          }else{
             echo  "<a class='menuItem' href='".$lnmnu["mnu_arq"]."'onKeyDown='proximo(this,event)'>".$lnmnu["mnu_nome"]."</a>\n";
          }
      }else{
         echo "</div><div id='".$lnmnu["pai"]."' class='menu' onKeyPress=\"hide_menu(event)\" onmouseover=\"menuMouseover(event)\">\n";
         if ($lnmnu["mnu_arq"] == ""){
            echo "<a class='menuItem' href='a'
                 onKeyDown=\"menuItemKeyDown(event, '".$lnmnu["mnu_filid"]."');proximo(this,event)\"\n"
                 ."onclick=\"menuItemMouseover(event, '".$lnmnu["mnu_filid"]."');return false;\"\n"
                 ."onmouseover=\"menuItemMouseover(event, '".$lnmnu["mnu_filid"]."');\"";
            echo "<span  class='menuItemText'>".$lnmnu["mnu_nome"]."</span>"
                 ."<span class='menuItemArrow'>&#9654;</span></a>";
         }else{
            echo  "<a class='menuItem' href='".$lnmnu["mnu_arq"]."'onKeyDown='proximo(this,event)'>".$lnmnu["mnu_nome"]."</a>\n";
         }
      }
      $pai = $lnmnu["pai"];
   }
   echo "</tbody></table></div>\n";
   if (is_admin($usuario)){
       $sqlmod = "select mod_id,mod_nome,mod_arquivo,mod_descricao
                  from   sis_modulos
                  order by mod_id";
   }else{
       $sqlmod = "select mod_id,mod_nome,mod_arquivo,mod_descricao
                  from   sis_modulos left outer join per_mod
                                   on mod_id = per_mod
                                 where  per_usuid = ".$usuario."
                  order by mod_id";

   }
   $rsmod = pg_query($sqlmod);
    echo "<div id='mnu_dir' class='menu' onmouseover=\"menuMouseover(event)\">\n"
        ."<table>\n"
        ."<tbody>\n";
   while ($lnmod = pg_fetch_array($rsmod)){
         echo "<tr class='item'><td class='icon'>\n"
               ."&nbsp;"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='mod_inicial.php?sis_modid=".$lnmod["mod_id"]."'>".$lnmod["mod_nome"]."</a>\n"
               ."</td>\n"
               ."</tr>\n";
   }
   if (is_admin($usuario)){
      echo     "<tr class='separator'><td class='icon'>\n"
               ."<div></div>"
               ."</td><td class='label'>\n"
               ."<div></div>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp;\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick='window.location.reload'>Recarregar página</a>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp;\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick=\"mostra_fonte(window.location)\">Mostrar Fonte</a>\n"
               ."</td>\n"
               ."</tr>\n";

   }
   if (is_admin($usuario)){
      $sqlmnudir = "SELECT  p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                  inner  join sis_modulos m on mnu_modid = mod_id
                       where  mod_id = $modulo
                  and    f.mnu_dir = '1'
                                 order by pai,f.mnu_nome";

   }else{
       $sqlmnudir = "SELECT p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                              left outer join per_menus on mnu_id = mnu_filid
                                 where  (per_usuid = $usuario
                  and    mnu_mod = $modulo)
                  and    f.mnu_dir = '1'
                  order by pai,f.mnu_nome";
    }
    $rsmnudir = pg_query($sqlmnudir);
    if (pg_num_rows($rsmnudir) > 0){
       echo "<tr class='separator'><td class='icon'>\n"
              ."<div></div>"
              ."</td><td class='label'>\n"
              ."<div></div>\n"
              ."</td>\n"
              ."</tr>\n";
       while ($lnmnudir = pg_fetch_array($rsmnudir)){
            echo "<tr class='item'><td class='icon'>\n"
                  ."&nbsp\n"
                  ."</td><td class='label'>\n"
                  ."<a class='menuItem2' href='".$lnmnudir["mnu_arq"]."'>".$lnmnudir["mnu_nome"]."</a>\n"
                  ."</td>\n"
                  ."</tr>\n";
       }
    }
    $sqlmes = "select coalesce(sum(*),0) as total from mensagens where mes_usupara = ".$usuario." and mes_lida='0'";
    $total = pg_result(pg_query($sqlmes),0,"total");
    echo "<tr class='separator'><td class='icon'>\n"
               ."<div></div>"
               ."</td><td class='label'>\n"
               ."<div></div>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='cfg_messageboard.php'>Mensagens ($total)</a>\n"
               ."</td>\n"
               ."</tr>\n"
               ."</td>"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick='sair(true)'>Sair Do Sistema</a>\n"
               ."</td>\n"
               ."</tr>\n";
   echo "</tbody></table></div>\n";
//submenus
   if (is_admin($usuario)){
      $sqlsub = "SELECT mnu_filid ,p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img,mnu_sub,mnu_paisub
                       from mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                  inner join sis_modulos m on mnu_modid = mod_id
                       where mod_id = $modulo
                  and   mnu_sub = 1
                                 order by mnu_paisub,pai,f.mnu_nome";

   }else{
       $sqlsub = "SELECT mnu_filid, p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img,mnu_sub,mnu_paisub
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                              left outer join per_menus on mnu_id = mnu_filid
                                 where (per_usuid = $usuario and mnu_mod = $modulo)
                   and   mnu_sub = 1
                  order by mnu_paisub,pai,f.mnu_nome";
  }
 //echo $sqlsub;
 $rssub = pg_query($sqlsub);
   echo "\n</div>\n\n";
   //$fc = "nao";
   while($lnsub = pg_fetch_array($rssub)){
     if ($pai == $lnsub["mnu_paisub"]){
        if ($lnsub["mnu_arq"] == ""){
            echo "<a class='menuItem'
                   onKeyDown=\"menuItemKeyDown(event, '".$lnsub["mnu_filid"]."');proximo(this,event)\"\n"
                 ."onclick=\"return false;\"\n"
                 ."onmouseover=\"menuItemMouseover(event, '".$lnsub["mnu_filid"]."');\"";
           echo  "<span class='menuItemText'>".$lnsub["mnu_nome"]."</span>"
                 ."<span  class='menuItemArrow'>&#9654;</span></a>";
        }else{
            echo  "<a class='menuItem' href='".$lnsub["mnu_arq"]."'onKeyDown='proximo(this,event)'>".$lnsub["mnu_nome"]."</a>\n";
        }
        
          }else{
           if ($pai != "" and $pai != $lnsub["pai"]){
            echo "</div>\n\n";
         }
         echo "<div id='".$lnsub["mnu_paisub"]."' class='menu' onmouseover=\"menuMouseover(event)\">\n";
        if ($lnsub["mnu_arq"] == ""){
            echo "<a class='menuItem'
                   onKeyDown=\"menuItemKeyDown(event, '".$lnsub["mnu_filid"]."');proximo(this,event)\"\n"
                 ."onclick=\"return false;\"\n"
                 ."onmouseover=\"menuItemMouseover(event, '".$lnsub["mnu_filid"]."');\"";
            echo "<span class='menuItemText'>".$lnsub["mnu_nome"]."</span>"
                 ."<span class='menuItemArrow'>&#9654;</span></a>";
         }else{
             echo  "<a class='menuItem' href='".$lnsub["mnu_arq"]."'onKeyDown='proximo(this,event)'>".$lnsub["mnu_nome"]."</a>\n";
         }
     }
         $pai = $lnsub["mnu_paisub"];
  }
   echo "</div>\n";
}
*/
function formatadata($data,$br=false){
   if ($br == false){
       $aux = explode("/",$data);
       $data = $aux[2].$aux[1].$aux[0];
   }else{
      $aux = explode("-",$data);
      $data = $aux[2]."/".$aux[1]."/".$aux[0];
   }
   return $data;
}

//funcao para formatacao de data
//$tipo : define se a função ira pegar a data atual,sendo 0 para data atual ou sem parametro
// ou 1 para data passada normal para a funçao
  function dateformat($data,$tipo=0,$st="c",$cid=true){
    switch($tipo){
    case 0:
           $X = getdate();
           $m = $X["mon"];
           $d = $X["mday"];
           $y = $X["year"];
           break;

     case 1 :
          $X = explode("/",$data);
          $m = $X["1"];
          $d = $X["0"];
          $y = $X["2"];
          break;
     }            
    switch ($m){
      case 0:
      case 1:
        $m = "janeiro";
        break;
      case 2:
        $m = "fevereiro";
        break;
      case 3:
        $m = "março";
        break;
      case 4:
        $m = "abril";
        break;
      case 5:
        $m = "maio";
        break;
      case 6:
        $m = "junho";
        break;
      case 7:
        $m = "julho";
        break;
      case 8:
        $m = "agosto";
        break;
      case 9:
        $m = "setembro";
        break;
      case 10:
        $m = "outubro";
        break;
      case 11:
        $m = "novembro";
        break;
      case 12:
        $m = "dezembro";
        break;
}
 if ($st == "c" and $cid == true){
   $data = "Sapiranga, ".$d." de ".$m." de ".$y;
   return $data;
 }else if ($st == "c" and $cid == false){
   $data =  $d." de ".$m." de ".$y;
   return $data; 
 }elseif ($st == "m") {
   $data = $m;
   return $data;
 }   
}//fecha funcao

function messagebox($menssagem){
   echo "<script>alert('$menssagem');</script>";
}
/**
        * Funcao para criar Um DBgrid com Páginaão e ORdenaçao de resultados
        * @return Object DataGrid
        * @param string  $sql    = String de consulta sql 
        * @param string  $limite = quantidades de registros a serem mostrados por página
        * @param string  $pagina = Constante permanente
        * @param string  $classe = Classe css = obsoleta;
        * @param boolean $fc     = se ira executar ou não uma função no evebnto Onclic;  
        * @param string  $campos = campos que sao paremetros para a funcao passada Ex.:"?#?" onde ? é o numero do campo 
        * @param strint  $qual   = Nome da funcao js script a ser executada.
                
        */
function repag($sql,$limite,$pagina,$classe,$fc=false,$campos="",$qual="",$exec=1){
   echo "<font color='#cccccc'>";
   echo "<form method='post' action=''>";
   echo "<input type='hidden' name='sql' value='$sql'>";
   echo "</form>";
   echo "</font>";
   if ($campos != ""){
      $vl = explode("#",$campos);
      $par = count($vl);
   }
   $total_reg = $limite;
   if (!$pagina) {
      $pc = "1";
   }else{
      $pc = $pagina;
   }
   if ($sql != ""){
   $sql = str_replace("\\","",$sql);
   $a = $sql;
   $inicio = $pc - 1;
   $inicio = $inicio * $total_reg; 
   $lmt = pg_query($sql." limit $total_reg offset $inicio");
   $tds = pg_query($sql);
   $tr = pg_num_rows($tds); // verifica o número total de registros
   $mostra = $pc * $total_reg;
   if ($mostra > $tr){
       $mostra = $tr;
   }   
   $tp = $tr / $total_reg; 
   $pag = ceil($tp);
   if (pg_num_rows($lmt) > 0 ){
       echo "<table cellspacing=0 border=0 class='$classe' id='tbgrid'>\n";
       echo "<thead id='tbcab'><tr><th colspan=".(pg_num_fields($lmt))." style='text-align:left'>";
       echo "<b>foram encontrados <font color='blue'>
             $tr</font> registros. Mostrando <font color='blue'>$mostra</font> de
             <font color='blue'>$tr</font></br></th>";  
       echo "</th></tr>";
       echo "<tr>\n<th class='cabecalho'onclick='return sortTable(0)'>&nbsp;</th>";
       
       for ($i = 0;$i < pg_num_fields($lmt);$i++){
          $testar = pg_field_name($lmt, $i);
          if (strpos($testar,"hid",0) ){
              $display="display:none";
              //messagebox('alo');
          }else{
            $display=null;
          }
          echo "<th  bgcolor='#999999'class='cabecalho'style='text-align:center;$display'><b>\n";
          echo "<a onclick='return sortTable(".($i+1).")'>";
          echo  ucfirst(pg_field_name($lmt, $i))."</a></b>";
          echo  "</th>\n";
       }
       
       echo "</tr></thead>\n";
       //$rs2 = pg_query($sql." limit $total_reg offset $inicio");
       $ji = 0;
       echo "<tbody id='tbcorpo'>";
       while ($ln = pg_fetch_array($lmt)){
          if ($ji % 2 == 0){
             $cor = "bgcolor='#EEEEEE'";
          }else{
             $cor = "bgcolor='#FFFFFF'";
          }
          echo  "<tr class='trlinha'>\n<td class='numero' width='15'>".($ji+1)."</td>";
          for ( $j = 0; $j < pg_num_fields($lmt);$j++){
             $testar = pg_field_name($lmt, $j);
          if (strpos($testar,"hid",0) ){
              $display="style='display:none'";
          }else{
            $display=null;
          }
             if ($fc == true){
                if ($par > 1){
                   $virgula="";
                   //echo "passou";
                   $pass = "";
                   for ($f = 0;$f < $par;$f++){
                        $pass = $pass.$virgula."'".trim($ln[$vl[$f]])."'";
                        $virgula=",";
                    }
                }else{
                    $pass = $ln[$campos];
                } 
                echo  "<td $display $cor class='linha' onclick=\"$qual($pass)\"><a style='cursor:default' class='teste'>";
                echo $ln[pg_field_name($lmt,$j)]==""?"&nbsp;":$ln[pg_field_name($lmt,$j)];
                echo "</a></td>\n";
             }else{
                echo  "<td $display $cor class='linha'>";
                echo $ln[pg_field_name($lmt,$j)]==""?"&nbsp;":$ln[pg_field_name($lmt,$j)];
                echo "</td>\n";
             } 
          }
          
          echo "</tr>\n";
          $ji++;
       }
       if (pg_num_rows($lmt) == 1 && $exec == 1 && $fc == true && pc == 1){
           echo "<script>$qual($pass);</script>";
       }
       echo "</tbody>";
       echo "<tfoot id='tbrod'><tr><td colspan='100' style='text-align:center' class='cabecalho'>";
       $anterior = $pc -1;
       $proximo = $pc +1;
       if ($pc>1) {
          echo "<a href=\"?pagina=1&sql=$a\"><img src='libs/imagens/pri.png' border=0 title='Primeiro'></a> ";
          echo " <a href=\"?pagina=$anterior&sql=$a\"><img src='libs/imagens/ant.png' border=0 title='Anterior'></a> ";
       }else{
          echo "<a><img src='libs/imagens/prid.png' border=0></a> ";
          echo " <a></a><img src='libs/imagens/antd.png' border=0></a> ";
       }
       echo " ";
       if ($pc<$tp) {
          echo " <a href=\"?pagina=$proximo&sql=$a\"><img src='libs/imagens/pro.png' border=0 title='Próximo'></a>";
          echo "<a href=\"?pagina=$pag&sql=$a\"><img src='libs/imagens/ult.png' border=0 title='Último''></a> ";
       }else{
          echo " <a><img src='libs/imagens/prod.png' border=0></a>";
          echo "<a><img src='libs/imagens/ultd.png' border=0></a> ";
       }
       echo "</tfoot></table>";
   }else{
      echo "<b>Não foram encotrados registros</b>";
   }
   }
   
}


function cab_html(){
   echo
   "<html>
      <head>
        <title></title>
        <meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>
        <meta name='GENERATOR' content='Quanta Plus'>
        <link rel='stylesheet' href='libs/estilos.css' type='text/css' media='all'>
        <link rel='stylesheet' href='libs/menuw.css' type='text/css' media='all'>
       <SCRIPT LANGUAGE='JavaScript' SRC='libs/menuw.js'></SCRIPT>
       <script language='JavaScript' src='libs/cal.js'></script>
       <script language='JavaScript' src='libs/funcoes.js'></script>
     </head>
    <body bgcolor='#cccccc' oncontextmenu=\"menu_dir(event.clientY,event.clientX,event);return false\">";
}

#-----------------------> FUNÇÕES PARA FORMULÁRIOS <---------------------#

function frm_select($sql, $class, $size="-1",$title, $nome,$valida=false,$valor="",$func=""){
  $rs = pg_query($sql);

  echo "<select name='".$nome."' size='".$size."' title='$title' class='$class' $func>\n";
    if  ($size == "-1"){
          echo  " <option value='0'>Selecione</option>\n";
        }
  while ($lnpar = pg_fetch_Array($rs)){
     if ($valida == true){
        if ($valor == $lnpar[0]){
           $sel = "selected";
        }else{
           $sel = null;
       }
         }else{
           $sel = null;
         }
         echo "<option value='".$lnpar[0]."'$sel>".$lnpar[1]."</option>\n";
  }
  echo "</select>";
}
//cria um botão para consulta
function frm_consulta($alvo,$form){

    echo "<input type='submit' name='btnconsultar' value='Consultar' class='botao'
         onclick=\"document.".$form.".action='".$alvo."';document.".$form.".submit();\">";
}
//cria aum botão para limpar o formulário
function frm_limpa($form){
   echo "<input type='button' name='btnlimpar' value='Limpar' class='botao'
         onclick=\"limpa_form(document.".$form.");\">";
}

function testa_file($file){
   $err = 0;
   $max = 50000;
   messagebox($_FILES[$file]['type']);
   if ($_FILES[$file]['size'] > $max){
       messagebox('O arquivo é maior do que o tamanho permitido!\\n  tamanho maximo:50k');
        $err += 1;
   }
   if ($_FILES[$file]['type'] != "image/png"){
       messagebox('Formato de Arquivo não suportado!');
       $err += 1;

   }else if ($_FILES[$file]['type'] != "image/jpeg"){
         messagebox('Formato de Arquivo não suportado!');
          $err += 1;
   }

   if ($err != 0 ){
       return true;
   }else{
       return false;
   }
}

function is_admin($usuario){
   if ($usuario == 1){
      return true;
   }else{
     return false;
   }
}

function local($onde){
    echo "<script>parent.topo.document.getElementById('usu').innerHTML ='<br> $onde';</script>";
}

/**
 * @return string
 * @param string $string
 * @param string $type
 * @param integer $length
 * @param string $chr
 * @param string $orientation
 * @desc formata a string conforme tipo selecionado 
         po   = portaria;
         cpf  = cpf;
         cnpj = cnpj;
         dtbr = data formato dd/mm/yyyy
         dten = data formato yyyy/mm/dd 
*/
function strformat($string,$type,$length=null,$chr=null,$orientation="L"){
   switch (strtolower($type)){
     case "po":
        if (strlen($tring) < 6){
           $port = str_pad($string,6,"0",STR_PAD_LEFT);
        }else{
           $port = $tring;
        }
        $strformat = substr($port,0,4)."/".substr($port,4,2);
     break;
     case "cpf":
       if (strlen($tring) < 11){
          $port = str_pad($string,11,"0",STR_PAD_LEFT);
        }else{
           $port = $tring;
        }
        $strformat = substr($port,0,3).".".substr($port,3,3).".".substr($port,6,3)."/".substr($port,9,2);   
     break;
      case "cnpj":
       if (strlen($tring) < 14){
          $port = str_pad($string,11,"0",STR_PAD_LEFT);
        }else{
           $port = $tring;
        }
        $strformat = substr($port,0,2).".".substr($port,2,3).".".substr($port,5,3)."/".substr($port,8,4)."-".substr($port,12,2);   
     break;
     case "dtbr":
        $dtaux = explode("-",$string);
        $strformat = $dtaux[2]."/".$dtaux[1]."/".$dtaux[0];
        if ($strformat == "//"){$strformat = null;}
     break  ;
     case "dten":
        $dtaux = explode("/",$string);
        $strformat = $dtaux[2]."-".$dtaux[1]."-".$dtaux[0];
        if ($strformat == "//"){$strformat = null;}
     break  ;   
   }
   if ($strformat == ""){
      $strformat == "";
   }
   return $strformat;
}


/**
 * @return ARRAY
 * @param date $inicial
 * @param date $final
 * @param string $format
 * @desc retorna as datas entre a data inicial e final
*/
function diff_data($inicial,$final,$format="br"){
   $format = strtolower($format);
   switch ($format){
      case "br":
         $fmt = "%d/%m/%Y";
      break;
      case "en":
         $fmt = "%Y-%m-%d";
      break;
   }
   $dtini   = explode("/",$inicial);
   $dtfim   = explode("/",$final);  
   $inicial = $dtini[2]."-".$dtini[1]."-".$dtini[0];
   $final   = $dtfim[2]."-".$dtfim[1]."-".$dtfim[0];
   $diastotal  =  (strtotime($final)-strtotime($inicial))/86400;  
   $jd = 0;
   for ($i = 0;$i <= $diastotal;$i++){
       $date[$jd] = strftime($fmt,mktime(0,0,0,$dtini[1],$dtini[0]+$i,$dtini[2]));
       $jd++;
   }
   return $date;
}
/**
 * @return string
 * @param decimal $valor
 * @param bolean[opcional] $maiusculas
 * @desc Retorna o número em extenso (valor monetario);
*/
function extenso($valor=0, $maiusculas=false) {
    
    $rt = '';
    $singular = array("centavo", "real", "mil", "milhão", "bilhão", "trilhão", "quatrilhão");
    $plural = array("centavos", "reais", "mil", "milhões", "bilhões", "trilhões",
"quatrilhões");

    $c = array("", "cem", "duzentos", "trezentos", "quatrocentos",
"quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos");
    $d = array("", "dez", "vinte", "trinta", "quarenta", "cinquenta",
"sessenta", "setenta", "oitenta", "noventa");
    $d10 = array("dez", "onze", "doze", "treze", "quatorze", "quinze",
"dezesseis", "dezesete", "dezoito", "dezenove");
    $u = array("", "um", "dois", "três", "quatro", "cinco", "seis",
"sete", "oito", "nove");

    $z=0;

    $valor = number_format($valor, 2, ".", ".");
    $inteiro = explode(".", $valor);
    for($i=0;$i<count($inteiro);$i++)
        for($ii=strlen($inteiro[$i]);$ii<3;$ii++)
            $inteiro[$i] = "0".$inteiro[$i];

    $fim = count($inteiro) - ($inteiro[count($inteiro)-1] > 0 ? 1 : 2);
    for ($i=0;$i<count($inteiro);$i++) {
        $valor = $inteiro[$i];
        $rc = (($valor > 100) && ($valor < 200)) ? "cento" : $c[$valor[0]];
        $rd = ($valor[1] < 2) ? "" : $d[$valor[1]];
        $ru = ($valor > 0) ? (($valor[1] == 1) ? $d10[$valor[2]] : $u[$valor[2]]) : "";

        $r = $rc.(($rc && ($rd || $ru)) ? " e " : "").$rd.(($rd &&
$ru) ? " e " : "").$ru;
        $t = count($inteiro)-1-$i;
        $r .= $r ? " ".($valor > 1 ? $plural[$t] : $singular[$t]) : "";
        if ($valor == "000")$z++; elseif ($z > 0) $z--;
        if (($t==1) && ($z>0) && ($inteiro[0] > 0)) $r .= (($z>1) ? " de " : "").$plural[$t];
//        $rt = '';
        if ($r) $rt = $rt . ((($i > 0) && ($i <= $fim) &&
($inteiro[0] > 0) && ($z < 1)) ? ( ($i < $fim) ? ", " : " e ") : " ") . $r;
    }

         if(!$maiusculas){
                          return($rt ? $rt : "zero");
         } else { /*
                         Trocando o " E " por " e ", fica muito + apresentável!
                     Rodrigo Cerqueira, rodrigobc@fte.com.br
                    */
                          if ($rt) $rt=ereg_replace(" E "," e ",ucwords($rt));
                          return (($rt) ? ($rt) : "Zero");
         }


}

 function formata_fone($fone,$tipo){
     if ($tipo == 0 ){
        if ($fone == ""){
           $i = "";
	    }elseif (strlen($fone) == 9){
           $fformatado =  "(".substr($fone,0,2).") ".
           substr($fone,2,3)."-".
           substr($fone,5,4);
	    }elseif (strlen($fone)==10){
           $fformatado =  "(".substr($fone,0,2).") ".
           substr($fone,2,4)."-".
           substr($fone,6,4);
	     }elseif (strlen($fone) == 8){
           $fformatado = "(051) ".substr($fone,0,4)."-".
           substr($fone,4,4);
	    }else{
           $fformatado = $fone;
	    }
	}elseif($tipo == 1){
	    if ($fone == ""){
           $i = "";
		}elseif (strlen($fone) == 10){
            $fformatado =  "(".substr($fone,0,2).") ".
            substr($fone,2,4)."-".
            substr($fone,6,4);
        }else{
            $fformatado =  $fone;

		}
   }
   return $fformatado;
}


function InsPrinc($ins_id,$class){
    $sql = "select conf_insprinc from config";
    $class->executa($sql,true);
    if ($class->dados["conf_insprinc"] == $ins_id){
        return true;
    }else{
        return false;
    }
}        

function libera_inc($mnu='', $modulo,$arqinc){
    
    $sqlperm = "SELECT  * 
                FROM    per_menus
                WHERE   mnu_id  = $mnu
                AND     MNU_MOD = $modulo
                AND     per_usuid = ".$_SESSION["usu_id"];
    
    $rs = pg_query($sqlperm);
    if (pg_num_rows($rs)  == 1){
        echo "<input type='button' value='Incluir Novo' class='botao'
               onclick=\"location.href='$arqinc?menu=n'\">";
    }
        
    
}
function liberaInc($arqinc){
    
    $sqlperm = "SELECT  * 
                FROM    per_menus inner join mnu_filho 
                        on mnu_filid = mnu_id
                WHERE   mnu_arq = '$arqinc'
                AND     per_usuid = ".$_SESSION["usu_id"];
    
    $rs = pg_query($sqlperm);
    if (pg_num_rows($rs)  == 1){
        echo "<input type='button' value='Incluir Novo' class='botao'
               onclick=\"location.href='$arqinc?menu=n'\">";
    }
        
    
}
function chaPermGrupo($grpid,$db){
     
    $db->executa("select cpg_id from chapermgrupo where cpg_grpid in($grpid)");
   
    if ($db->num_rows == 1){
        return true;
    }else{
        return false;
    }
}

function chaPermnucleo($usu_id,$db){
     
    $db->executa("select nch_nucid from sis_nucleoschefes where nch_usid in($usu_id)");
   
    if ($db->num_rows >= 1){
        return true;
    }else{
        return false;
    }
}

function context_menu($usuario){
    
  if (is_admin($usuario)){
       $sqlmod = "select mod_id,mod_nome,mod_arquivo,mod_descricao
                  from   sis_modulos
                  order by mod_id";
   }else{
       $sqlmod = "select mod_id,mod_nome,mod_arquivo,mod_descricao
                  from   sis_modulos left outer join per_mod
                                   on mod_id = per_mod
                                 where  per_usuid = ".$usuario."
                  order by mod_id";

   }
   $rsmod = pg_query($sqlmod);
    echo "<div id='mnu_dir' class='menu' onmouseover=\"menuMouseover(event)\">\n"
        ."<table>\n"
        ."<tbody>\n";
   while ($lnmod = pg_fetch_array($rsmod)){
         echo "<tr class='item'><td class='icon'>\n"
               ."&nbsp;"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='mod_inicial.php?sis_modid=".$lnmod["mod_id"]."'>".$lnmod["mod_nome"]."</a>\n"
               ."</td>\n"
               ."</tr>\n";
   }
   if (is_admin($usuario)){
      echo     "<tr class='separator'><td class='icon'>\n"
               ."<div></div>"
               ."</td><td class='label'>\n"
               ."<div></div>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp;\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick='window.location.reload'>Recarregar página</a>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp;\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick=\"mostra_fonte(window.location)\">Mostrar Fonte</a>\n"
               ."</td>\n"
               ."</tr>\n";

   }
   if (is_admin($usuario)){
      $sqlmnudir = "SELECT  p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                  inner  join sis_modulos m on mnu_modid = mod_id
                       where  mod_id = $modulo
                  and    f.mnu_dir = '1'
                                 order by pai,f.mnu_nome";

   }else{
       $sqlmnudir = "SELECT p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                              left outer join per_menus on mnu_id = mnu_filid
                                 where  (per_usuid = $usuario
                  and    mnu_mod = $modulo)
                  and    f.mnu_dir = '1'
                  order by pai,f.mnu_nome";
       
    }
    $sqlmes = "select coalesce(sum(*),0) as total from mensagens where mes_usupara = ".$usuario." and mes_lida='0'";
    $total = pg_result(pg_query($sqlmes),0,"total");
    echo "<tr class='separator'><td class='icon'>\n"
               ."<div></div>"
               ."</td><td class='label'>\n"
               ."<div></div>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='cfg_messageboard.php'>Mensagens ($total)</a>\n"
               ."</td>\n"
               ."</tr>\n"
               ."</td>"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick='sair(true)'>Sair Do Sistema</a>\n"
               ."</td>\n"
               ."</tr>\n";
   echo "</tbody></table></div>\n";
}
 function makeMenu($usuario,$modulo){ 	
 	 
     	
      /*if (is_admin($usuario)){
         $sqlpai = "select * FROM mnu_pai WHERE mnu_modid=$modulo ORDER BY mnu_nome";
         $rs = pg_query($sqlpai);
         $menu = "<div class='menuBar' style='width:100%;position:absolute;left:0px;top:0px;margin-right:0'>\n";
         $menu.= "<ul id='menu' style='visibility: hidden'>\n";

         while ($ln = pg_fetch_array($rs)){
             $m2 = $ln["mnu_nome"];
             $nome = str_replace($ln["mnu_akey"],"_".$ln["mnu_akey"],$ln["mnu_nome"]);
             $menu .= "<li>$nome\n";
             $sqlmnu = "
             
               SELECT mnu_filid,
                  p.mnu_nome AS pai, 
                  f.mnu_nome,
                   mnu_arq,
                   mnu_img,
                   mnu_sub,
                   mnu_paisub
                  FROM  mnu_filho f INNER JOIN mnu_pai p ON mnu_pai = mnu_paiid
                        INNER JOIN sis_modulos m ON mnu_modid = mod_id
                  WHERE mod_id = $modulo and mnu_pai = ".$ln["mnu_paiid"]." 
                  AND   (mnu_sub = 0 OR mnu_sub ISNULL)
                  ORDER BY pai,f.mnu_ordem";
             $rsmnu = pg_query($sqlmnu);
             if (pg_num_rows($rsmnu) > 0){
                 $menu .=" <ul>\n";
                 while ($lnmnu = pg_fetch_array($rsmnu)){
                     if ($lnmnu["mnu_arq"] != ""){
                         $menu .= "<li><a title='".$lnmnu["mnu_nome"]."' href='".$lnmnu["mnu_arq"]."'>
                          ".$lnmnu["mnu_nome"]."</a></li>\n";
                     }else{
                         $menu .= "<li><a title='".$lnmnu["mnu_nome"]."'>".$lnmnu["mnu_nome"]."</a>\n";
                         $menu .= "<ul>\n";
                         $sqlsub = "SELECT mnu_filid,
                                   p.mnu_nome AS pai, 
                                   f.mnu_nome,
                                   mnu_arq,
                                   mnu_img,
                                   mnu_sub,
                                   mnu_paisub
                            FROM   mnu_filho f INNER JOIN mnu_pai p ON mnu_pai = mnu_paiid
                            INNER  JOIN sis_modulos m ON mnu_modid = mod_id
                            WHERE  mod_id = $modulo 
                            AND    mnu_paisub= ".$lnmnu["mnu_filid"]."  
                            AND   (mnu_sub = 1)
                            ORDER BY pai,f.mnu_ordem";
                         $rssub = pg_query($sqlsub);
                         // echo $sqlsub;exit;
                         while ($lnsub = pg_fetch_array($rssub)){
                             $menu .= "<li><a title='".$lnsub["mnu_nome"]."' href='".$lnsub["mnu_arq"]."'>"
                             .$lnsub["mnu_nome"]."</a></li>\n";

                         }
                         $menu .=" </li></ul>";
                     }

                 }

                 $menu .= "</li></ul>\n";
             }else{
                 $menu .= "</li>\n";
             }
         }
         
         $menu .= "<li><a onclick=\"alert('Ajuda')\">Ajuda</a></li></ul></div>";
     }else{
         $sqlpai = "select * FROM mnu_pai WHERE mnu_modid::integer=$modulo ORDER BY mnu_nome";
         $rs = pg_query($sqlpai);
         $menu = "<div style='width:99.4%;position:absolute;left:0px;top:0px'>\n";
         $menu.= "<ul id='menu' style='visibility: hidden'>\n";

         while ($ln = pg_fetch_array($rs)){
             $m2 = $ln["mnu_nome"];
             $nome = str_replace($ln["mnu_akey"],"_".$ln["mnu_akey"],$ln["mnu_nome"]);
             $menu .= "<li>$nome\n";
             $sqlmnu = "SELECT distinct  mnu_filid,
                               f.mnu_ordem,
                               f.mnu_nome,
                               mnu_arq,
                               mnu_img,
                               mnu_sub,
                               mnu_paisub
                        FROM   sis_usuarios LEFT OUTER JOIN sis_usuperfil
                               ON  upf_usuid = usu_id
                               LEFT OUTER JOIN  sis_perfilitem ON upf_pefid = ite_pefid
                               LEFT OUTER JOIN sis_perfis on upf_pefid = pef_id
                               INNER JOIN      mnu_filho f ON mnu_filid = ite_menuid
                       WHERE (usu_id = $usuario AND pef_modid = $modulo)
                       AND    mnu_pai =".$ln["mnu_paiid"]."
                       AND (mnu_sub = 0 OR mnu_sub isnull)
                       union             
               		   SELECT distinct mnu_filid,
               		           f.mnu_ordem,
               		           f.mnu_nome,
               		           mnu_arq,
               		           mnu_img,
               		           mnu_sub,
               		           mnu_paisub
                        FROM   mnu_filho f INNER JOIN  mnu_pai p ON mnu_pai::integer = mnu_paiid
                               left outer join per_menus on mnu_id = mnu_filid
                        WHERE (per_usuid = $usuario AND mnu_mod = $modulo)
                        AND mnu_pai = ".$ln["mnu_paiid"]."
                        AND   (mnu_sub = 0 OR mnu_sub isnull)
                        ORDER BY mnu_ordem";
             //echo "<br>".$sqlmnu;
             $rsmnu = pg_query($sqlmnu);
             if (pg_num_rows($rsmnu) > 0){
                 $menu .=" <ul>\n";
                 while ($lnmnu = pg_fetch_array($rsmnu)){
                     if ($lnmnu["mnu_arq"] != ""){
                         $menu .= "<li><a title='".$lnmnu["mnu_nome"]."' href='".$lnmnu["mnu_arq"]."'>
                          ".$lnmnu["mnu_nome"]."</a></li>\n";
                     }else{
                         $menu .= "<li><a title='".$lnmnu["mnu_nome"]."'>".$lnmnu["mnu_nome"]."</a>\n";
                         $menu .= "<ul>\n";
                         $sqlsub = "SELECT distinct mnu_filid,
                               		       f.mnu_ordem,
                                           f.mnu_nome,
                                           mnu_arq,
                                           mnu_img,
                                           mnu_sub,
                                        mnu_paisub
                        FROM   sis_usuarios LEFT OUTER JOIN sis_usuperfil
                               ON  upf_usuid = usu_id
                               LEFT OUTER JOIN  sis_perfilitem ON upf_pefid = ite_pefid
                               LEFT OUTER JOIN sis_perfis on upf_pefid = pef_id
                               INNER JOIN      mnu_filho f ON mnu_filid = ite_menuid
                       WHERE (usu_id = $usuario AND pef_modid = $modulo)
                       AND    mnu_paisub = ".$lnmnu["mnu_filid"]." 
                       AND    (mnu_sub = 1)
                       UNION             
               		   SELECT distinct mnu_filid,
               		           f.mnu_ordem,
               		           f.mnu_nome,
               		           mnu_arq,
               		           mnu_img,
               		           mnu_sub,
               		           mnu_paisub
                        FROM   mnu_filho f  INNER JOIN  mnu_pai  ON mnu_pai = mnu_paiid
                               inner join per_menus on mnu_id = mnu_filid
                        WHERE (per_usuid = $usuario AND mnu_mod = $modulo)
                            AND    mnu_paisub= ".$lnmnu["mnu_filid"]." 
                            AND   (mnu_sub = 1)
                            ORDER BY mnu_ordem";
                         $rssub = pg_query($sqlsub);
                          //echo $sqlsub;exit;
                         while ($lnsub = pg_fetch_array($rssub)){
                             $menu .= "<li><a title='".$lnsub["mnu_nome"]."' href='".$lnsub["mnu_arq"]."'>"
                             .$lnsub["mnu_nome"]."</a></li>\n";

                         }
                         $menu .=" </li></ul>";
                     }

                 }

                 $menu .= "</li></ul>\n";
             }else{
                 $menu .= "</li>\n";
             }
         }
         $menu .= "<li><a href=\"javascript:window.open('ajuda.php?prg=".basename($_SERVER['PHP_SELF'])."'
         ,'Ajuda','height=600,width=800,location=no')\">Ajuda</a></li></ul></div>";
     }
     echo $menu;
     if (is_admin($usuario)){
       $sqlmod = "select mod_id,mod_nome,mod_arquivo,mod_descricao
                  from   sis_modulos
                  order by mod_id";
    }else{
       $sqlmod = "select mod_id,mod_nome,mod_arquivo,mod_descricao
                  from   sis_modulos left outer join per_mod
                                   on mod_id = per_mod
                                 where  per_usuid = ".$usuario."
                  order by mod_id";

   }
   $rsmod = pg_query($sqlmod);
   echo "<div id='mnu_dir' class='menu' onmouseover=\"menuMouseover(event)\">\n"
        ."<table>\n"
        ."<tbody>\n";
   while ($lnmod = pg_fetch_array($rsmod)){
         echo "<tr class='item'><td class='icon'>\n"
               ."&nbsp;"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='mod_inicial.php?sis_modid=".$lnmod["mod_id"]."'>".$lnmod["mod_nome"]."</a>\n"
               ."</td>\n"
               ."</tr>\n";
   }
   if (is_admin($usuario)){
      echo     "<tr class='separator'><td class='icon'>\n"
               ."<div></div>"
               ."</td><td class='label'>\n"
               ."<div></div>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp;\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick='window.location.reload'>Recarregar página</a>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp;\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick=\"mostra_fonte(window.location)\">Mostrar Fonte</a>\n"
               ."</td>\n"
               ."</tr>\n";

   }
   if (is_admin($usuario)){
      $sqlmnudir = "SELECT  p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                  inner  join sis_modulos m on mnu_modid = mod_id
                       where  mod_id = $modulo
                  and    f.mnu_dir = '1'
                                 order by pai,f.mnu_nome";

   }else{
       $sqlmnudir = "SELECT p.mnu_nome as pai, f.mnu_nome,mnu_arq,mnu_img
                       from   mnu_filho f inner join mnu_pai p on mnu_pai = mnu_paiid
                              left outer join per_menus on mnu_id = mnu_filid
                                 where  (per_usuid = $usuario
                  and    mnu_mod = $modulo)
                  and    f.mnu_dir = '1'
                  order by pai,f.mnu_nome";
    }
    $rsmnudir = pg_query($sqlmnudir);
    if (pg_num_rows($rsmnudir) > 0){
       echo "<tr class='separator'><td class='icon'>\n"
              ."<div></div>"
              ."</td><td class='label'>\n"
              ."<div></div>\n"
              ."</td>\n"
              ."</tr>\n";
       while ($lnmnudir = pg_fetch_array($rsmnudir)){
            echo "<tr class='item'><td class='icon'>\n"
                  ."&nbsp\n"
                  ."</td><td class='label'>\n"
                  ."<a class='menuItem2' href='".$lnmnudir["mnu_arq"]."'>".$lnmnudir["mnu_nome"]."</a>\n"
                  ."</td>\n"
                  ."</tr>\n";
       }
    }
    $sqlmes = "select coalesce(sum(*),0) as total from mensagens where mes_usupara = ".$usuario." and mes_lida='0'";
    $total = pg_result(pg_query($sqlmes),0,"total");
    echo "<tr class='separator'><td class='icon'>\n"
               ."<div></div>"
               ."</td><td class='label'>\n"
               ."<div></div>\n"
               ."</td>\n"
               ."</tr>\n"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='cfg_messageboard.php'>Mensagens ($total)</a>\n"
               ."</td>\n"
               ."</tr>\n"
               ."</td>"
               ."<tr class='item'><td class='icon'>\n"
               ."&nbsp\n"
               ."</td><td class='label'>\n"
               ."<a class='menuItem2' href='' onclick='sair(true)'>Sair Do Sistema</a>\n"
               ."</td>\n"
               ."</tr>\n";
   echo "</tbody></table></div>\n";
*/
 }
 
 function getperm($grp_id){
     
     if ($grp_id == 6 or $grp_id == 3){
         return true;
     }else{
         return false;
     }
 
 }
 
 function getConfig($ano,$db){
     global $_DTENCERRA,$_DTCENSO,$_DTMATR,$_NOTAMIM,$_NOTAMAX,$_NOTAMEDIA,$_NOTAINT,$_LABELREG,$_CONSMAX;
     $sql = "select * 
             from   conf_anoletivo inner join regimes on reg_id = cfg_regid
             where  cfg_ano = '$ano'";
     
     $db->executa($sql,true,"cfg");
     $_DTENCERRA = $db->cfg["cfg_dtencerra"];
     $_DTCENSO   = $db->cfg["cfg_dtcenso"];
     $_NOTAMIM   = $db->cfg["cfg_notamin"];
     $_NOTAMAX   = $db->cfg["cfg_notamax"];
     $_NOTAMEDIA = $db->cfg["cfg_media"];
     $_NOTAINT   = $db->cfg["cfg_notaint"];
     $_LABELREG  = $db->cfg["reg_label"];
     $_DTMATR    = $db->cfg["cfg_dtinicia"];
     $_CONSMAX   = $db->cfg["cfg_disconselho"];
     $_DIASLET   = $db->cfg["cfg_diasletivos"];
     
     
 }
 
 function normalize($string){
     
    $aux = explode(" ",$string);
    $sep = null;
    $strnormal = "";
    for ($i = 0;$i < count($aux);$i++){
        if (strtolower($aux[$i]) == "de" or strtolower($aux[$i]) == "da" or strtolower($aux[$i]) == "dos" 
        or strtolower($aux[$i]) == "das" or strtolower($aux[$i]) == "do" or strtolower($aux[$i]) == "e"){
           $strnormal .= $sep.strtolower($aux[$i]);   
        }else{
            $strnormal .= $sep.ucfirst(strtolower($aux[$i]));
        }
        $sep = " ";     
    }   
    return $strnormal;
     
 }
 
 //
   /**
    * função para calcular media final dos alunos 
    *
    * @param integer $alu_id
    * @param integer $ano
    * @param integer $dis_id
    * @param integer $serie
    * @param object  $db
    * @return integer
    */
 function fc_calcmedia($alu_id,$ano,$dis_id,$serie,$db,$mp=1){
     $sql = "select for_formula from formulaserie 
             where  for_ano = $ano and for_serie = $serie";
     $db->executa($sql,true);
     $formula = $db->dados["for_formula"];
     $sql = " SELECT per_periodo,
                     per_peso,
                     var_chave,
                     exe_tipid,
                     coalesce(exe_nota,'0') as exe_nota,
                     coalesce(ava_nota,'0') as ava_nota 
              from   periodos inner join avalvariaveis on var_perid = per_id
                     left outer join escavaliacoes on per_id = ava_perid 
                     and ava_disid = $dis_id and ava_aluid = $alu_id
                     left outer join escavalexce on per_id = exe_perid 
                     and exe_disid = $dis_id and exe_aluid = $alu_id
              where  var_ano = $ano";
    $rs = $db->executa($sql);        
    $SP = "";
    //echo $sql."<br>";
    $calc = true;
    $formulao = $formula;
    while ($ln = $db->fetch_array($rs)){
    	
      if (stripos($formula,trim($ln["var_chave"]),0)){
         $nota = $ln["exe_nota"] != 0?$ln["exe_nota"]:$ln["ava_nota"];
         $formula = str_replace($ln["var_chave"],$nota,$formula);
         
         if (stripos($formula,"SP")){
         	 
         	 if ($mp == 0){
         	 	$SP += $ln["per_peso"];
         	 }else  if ($nota != "0"){
                 $SP += $ln["per_peso"];
             }
               
         }
          
         if (stripos($formula,"P",0)){
                $pos     = stripos($formula,"P",0);
                $rep = 1;
                $formula = substr_replace($formula,$ln["per_peso"],$pos,1);
            }
                
        }
        if ($ln["exe_tipid"] == 2){
            $calc = false;
        }
            
    }
    
    if (stripos($formula,"SP")){
        //substr_replace($formula,$SP,stripos($formula,"SP",2));
        if ($SP != ""){
        	$formula = str_replace("SP",$SP,$formula);
        }else{
        	$formula = str_replace("/SP",'',$formula);
        }
    }
    //echo $formula."<br>";
    //echo $dis_id."-".$formula."</br>";
    if ($calc or $SP != "" ){
    	if ($formulao != $formula){
       	    eval("\$teste=".$formula.";");
    	}
    } 
       
    
    //return round($db->dados["media"],1);
    return round($teste,1);
    
    
 }    
 function remZero($val){
	
	return $val=='0'?'':$val;
}

function tipoTurma($tur_id,$db){

	$sql = "SELECT 
                  (case when tur_modalidade = 4 then (select mod_descr 
                                                      from   modalidades 
                                                      where  mod_id = 4)
                        when  tur_nivel     = 1 then (select niv_descr
                                                      from   niveis 
                                                      where  niv_id = 1 )
                        when  tur_nivel     = 2 then (select niv_descr
                                                      from   niveis 
                                                      where  niv_id = 2 )
                   else (select tip_sigla
                         from   tipos_turmas
                         where  tip_id = tur_tipo) end ) as sigla
	        from   turmas where tur_id= $tur_id";
	$db->executa($sql,true);
	return $db->dados["sigla"];
	
}

function valida_docs($alu_id,$db){

	$erro  = 0;
	$sql   = "select doc_tiponac,
	                 doc_tipocert,
	                 doc_termo,
	                 doc_folha,
	                 doc_livro,
	                 doc_dtcert
	           from  alunosdoc 
	           where doc_aluid = $alu_id";
	$rs    = $db->executa($sql);      
	if (@pg_result($rs,0,"doc_tiponac") == 4){
		 $sql1   = "select
	                 doc_rg,
	                 doc_dtcert,
	                 doc_dtrg
	           from  alunosdoc 
	           where doc_aluid = $alu_id";
	     $rs1    = $db->executa($sql1); 
	     for ($i = 0 ;$i <= @pg_num_fields($rs1);$i++){
			@pg_result($rs1,0,@pg_field_name($rs1,$i))==""?$erro++:$erro=$erro;		
		}    
	}else{
		for ($i = 0;$i < @pg_num_fields($rs);$i++){
			
			@pg_result($rs,0,($i))==""?$erro++:$erro=$erro;		
			
			
		}
		
	}
	
	if ($erro > 0 ){
		return false;
	}else {
		return true;
	}  
	
}
function mostraFoto($aluid){
	
	$sql = "select fot_foto from alunosfotos where fot_aluid = $aluid";
	//echo $sql;
	$rs = pg_exec($sql);
	$row = pg_fetch_row($rs,0);
	pg_query ("begin");
	$loid = pg_lo_open($row[0],"r");
	$foto = pg_lo_read_all ($loid);
	pg_lo_close ($loid);
	pg_query ("commit"); 
	
}

function sitAluno($alu_id){
	global $db;
	
	$sql = "select tur_nome,
	               alu_nome,
	               tur_id,
	               tur_modalidade,
	               to_char(mov_dtentrada,'dd/mm/yyyy') as mov_dtentrada,
	               to_char(mov_dtsaida,'dd/mm/yyyy') as mov_dtsaida,
	               to_char(alu_dtnasc,'dd/mm/yyyy') as alu_dtnasc,
	               date_part('YEAR', age(current_date,alu_dtnasc)) as ano,
	               date_part('MONTH',age(current_date,alu_dtnasc)) as mes,
	               stp_descr,
	               mov_serie                                     
	        from   alunos left outer join movalunos on alu_movid = mov_id
	               inner join turmas on tur_id              = mov_turid 
	               left outer join sittipos on stp_id       = 
	                    (case when mov_tiposaida is not null then mov_tiposaida
	                     else mov_tipoentrada end)                              
	        where  alu_id = $alu_id";
	
	$rs     = pg_query($sql);
	$cturma = new turma(@pg_result($rs,0,"tur_id"),$db);
	$serie = '';
	
	if (@pg_result($rs,0,"tur_modalidade") == 2){
		
	   $serie = @pg_result($rs,0,"mov_serie")."ª ";	
		
	}
 echo "
    <tr>
    <td>&nbsp;</td><td><br>
         <Table>
          <tr>
              <td><b>Turma:<b></td><td bgcolor='white'>".@pg_result($rs,0,"tur_nome").
              "&nbsp; $serie &nbsp;&nbsp;&nbsp;".$cturma->descturma()."</td>             
          </tr>
          <tr>
             <td><b>Data Matrícula:</b></td><td id='infmovdtentrada' style='background-color:white'>".@pg_result($rs,0,"mov_dtentrada")."</td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;<b>Data Nasc:</b></td><td style='background-color:white'>".@pg_result($rs,0,"alu_dtnasc")." - ".
	          @pg_result($rs,0,"ano")." anos
          </tr>
          <tr>
             <td> <b>Data Alteração:</b></td><td id='infmovdtsaida' style='background-color:white'>".@pg_result($rs,0,"mov_dtsaida")."</td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;<b>Situação:</b></td><td style='background-color:white'>".@pg_result($rs,0,"stp_descr")."</td>
          </tr>
          <tr>
             <td><br></td>                  
    </table>
    </td>";	
}

function redirect($url,$nivel=''){
	
	$nivel = $nivel != ""?$nivel.".":'';
	echo "<script>".$nivel."location.href='$url'</script>";
}

function mesExtenso($mes='',$maisculo = 1){
    
	$mes=$mes ==''?date("m"):$mes;
	switch ($mes){
		
		case 1:
		   $rMes = "janeiro";
		   break;
		case 2:
		   $rMes = "fevereiro";
		   break;
		case 3:
		   $rMes = "março";
		   break;
		case 4:
		   $rMes = "abril";
		   break;		   
	    case 5:
		   $rMes = "maio";
		   break;
		case 6:
		   $rMes = "junho";
		   break;
		case 7:
		   $rMes = "Julho";
		   break;
		case 8:
		   $rMes = "agosto";
		   break;
		case 9:
		   $rMes = "setembro";
		   break;
	    case 10:
		   $rMes = "outubro";
		   break;
		case 11:
		   $rMes = "novembro";
		   break;
		case 12:
		   $rMes = "dezembro";
		   break;
		default:
		   $rMes = null;   
		   break; 
	}
	if ($maisculo == 1){
		return ucfirst($rMes);
	}else {
		return $rMes;
	}
		
}

function addLog ($tipo, $user='', $table, $wh ='',$arr='',$db){
	
	$campos = array(
	                "log_tipid"  => $tipo,
	                "log_usuid"  => $user,
	                "log_tabela" => $table,
	                "log_dtlog"  => "now()",
	                "log_hora"   => "now()",
	                "log_insid"  => $_SESSION["usu_instid"]
	                );
	//$db->begin();               
	$db->executa($db->insert($campos,"sis_log"));
	$lastid = $db->last_id("sis_log","log_id");
	if ($wh != '' and $arr == ''){
		$sql = " select * from $table $wh";
		$rs  = $db->executa($sql);
		for ($i = 0;$i < pg_num_fields($rs);$i++){
			$campos2 = array(
			                 "cam_logid" => $lastid,
			                 "cam_nome"  => @pg_field_name($rs,$i),
			                 "cam_valor" => @pg_result($rs,0,@pg_field_name($rs,$i))
			                 );
			 $db->executa($db->insert($campos2,"campos_log"));           		
		}
		
	}
	if ($arr != '' and $wh == ''){
		
		while (list($k,$v) = each($arr)){
			
				$campos2 = array(
			                 "cam_logid" => $lastid,
			                 "cam_nome"  => $k,
			                 "cam_valor" => $v
			                 );
			 $db->executa($db->insert($campos2,"campos_log"));       
			
		}
		
		
	}
	//$db->commit();	
}

function numeroextenso($valor=0, $maiusculas=false) {
    
    $rt = '';
    $singular = array('','',"mil", "milhão", "bilhão", "trilhão", "quatrilhão");
    $plural = array('','',"mil", "milhões", "bilhões", "trilhões","quatrilhões");

    $c = array("", "cem", "duzentos", "trezentos", "quatrocentos",
"quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos");
    $d = array("", "dez", "vinte", "trinta", "quarenta", "cinquenta",
"sessenta", "setenta", "oitenta", "noventa");
    $d10 = array("dez", "onze", "doze", "treze", "quatorze", "quinze",
"dezesseis", "dezesete", "dezoito", "dezenove");
    $u = array("", "um", "dois", "três", "quatro", "cinco", "seis",
"sete", "oito", "nove");

    $z=0;

    $valor = number_format($valor, 2, ".", ".");
    $inteiro = explode(".", $valor);
    for($i=0;$i<count($inteiro);$i++)
        for($ii=strlen($inteiro[$i]);$ii<3;$ii++)
            $inteiro[$i] = "0".$inteiro[$i];

    $fim = count($inteiro) - ($inteiro[count($inteiro)-1] > 0 ? 1 : 2);
    for ($i=0;$i<count($inteiro);$i++) {
        $valor = $inteiro[$i];
        $rc = (($valor > 100) && ($valor < 200)) ? "cento" : $c[$valor[0]];
        $rd = ($valor[1] < 2) ? "" : $d[$valor[1]];
        $ru = ($valor > 0) ? (($valor[1] == 1) ? $d10[$valor[2]] : $u[$valor[2]]) : "";

        $r = $rc.(($rc && ($rd || $ru)) ? " e " : "").$rd.(($rd &&
$ru) ? " e " : "").$ru;
        $t = count($inteiro)-1-$i;
        $r .= $r ? " ".($valor > 1 ? $plural[$t] : $singular[$t]) : "";
        if ($valor == "000")$z++; elseif ($z > 0) $z--;
        if (($t==1) && ($z>0) && ($inteiro[0] > 0)) $r .= (($z>1) ? " de " : "").$plural[$t];
//        $rt = '';
        if ($r) $rt = $rt . ((($i > 0) && ($i <= $fim) &&
($inteiro[0] > 0) && ($z < 1)) ? ( ($i < $fim) ? ", " : " e ") : " ") . $r;
    }

         if(!$maiusculas){
                          return($rt ? $rt : "zero");
         } else { /*
                         Trocando o " E " por " e ", fica muito + apresentável!
                     Rodrigo Cerqueira, rodrigobc@fte.com.br
                    */
                          if ($rt) $rt=ereg_replace(" E "," e ",ucwords($rt));
                          return (($rt) ? ($rt) : "Zero");
         }


}

function getmicrotime(){ 
	
 	list($sec, $usec) = explode(" ",microtime()); 
 	return ($sec + $usec); 
 
} 

function mostra_tempo($time_end,$time_start){
	
 	$time = $time_end - $time_start;	
 	$tempo =  sprintf("%5f",$time);
 	$tempo = eregi_replace("000","",$tempo);
 	echo "Gerado em ".round(substr($tempo,0,-1)/60,4)." minutos"; 
} 

function getAcl($acl,$db){
     
	
	$sql = "select acl_tipid
	        from sis_aclsext
	        where  acl_usuid=".$_SESSION["usu_id"]
	       ." and acl_tipid=$acl";
	 $rs = pg_query($sql);
  
     if (pg_num_rows($rs) == 1){
         return true;
     }else{
         return false;
     }
 
 } 
 
 
 function setPref($usu,$tipo,$valor,$db){
 	
 	  $db->executa("select 1 from sis_usupref where usp_usuid =".$usu." and usp_tipid = $tipo",true);
      if ($db->num_rows > 0 ){
       	
      	   $db->executa($db->update(array("usp_valor"=>$valor),"sis_usupref","usp_usuid",$usu." and  usp_tipid=$tipo"));
       	
        }else{
       	
       		  $db->executa($db->insert(array("usp_valor"=>$valor,"usp_usuid" => $usu,"usp_tipid"=> $tipo),"sis_usupref"));
       		
        }	
 	
 }
 
 function getPref($usu,$tipo,$db){
 	
 	  $db->executa("select usp_valor from sis_usupref where usp_usuid =".$usu." and usp_tipid = $tipo",true,"usupref");
 	  return $db->usupref["usp_valor"];
      
 	  
}

 function RemoveAcentos($Msg) {
 	
   	$a = array(
              '/[ÂÀÁÄÃ]/'=>'A',
              '/[âãàáä]/'=>'a',
              '/[ÊÈÉË]/'=>'E',
               '/[êèéë]/'=>'e',
              '/[ÎÍÌÏ]/'=>'I',
              '/[îíìï]/'=>'i',
              '/[ÔÕÒÓÖ]/'=>'O',
              '/[ôõòóö]/'=>'o',
              '/[ÛÙÚÜ]/'=>'U',
              '/[ûúùü]/'=>'u',
              '/ç/'=>'c',
              '/Ç/'=> 'C');
     return preg_replace(array_keys($a), array_values($a), $Msg);
}

?>