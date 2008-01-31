<?
require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/funcoes.php");
require("libs/JSON.php");

$db = new db();
function leconteudo($n,$ttable,$tkey,$tvalue,$wh,$sufix='',$fc_js=''){
	
  if ($n != ""){  
     $sql = "select $tkey, $tvalue from $ttable where  to_ascii($tvalue) ilike  to_ascii('%$n%') $wh
                   order by $tvalue";
     $rs  = pg_query($sql);
     $i   = 0;
     if ($fc_js){
     	$js = $fc_js;
     }else {
     	$js= "js_completa";
     }
     while ($ln = pg_fetch_array($rs)){

        $texto .= "<a style='cursor:hand;cursor:pointer' 
                   href=\"javascript:$js('$sufix$tkey','$sufix$tvalue','".$ln[0]."','".$ln[1]."','$tvalue$tkey')\"
                   class='cblinha'  onKeyDown='proximo2(this,event);return false'>".$ln[1]."</a>";
        $i++;
     }
     return $texto;    
  }
  
}

function direto($id,$ttable,$tkey,$tvalue,$wh){
  if ($id != ""){
      $sql = "select $tkey, $tvalue from $ttable where $tkey = $id $wh"; 
      $rs  = pg_query($sql);
      //echo $sql;
      if (pg_num_rows($rs) > 0){
        $texto = pg_result($rs,0,"$tvalue");
      }else{
         $texto = "Registro ($id) não encontrado";
      }
  
      return $texto;    
  }
     
}

function adddisciplinas($turma,$ano){

    $sql    = "select tur_serie,tur_modalidade,tur_nivel from turmas where tur_id = $turma";    
    $rs     = pg_query($sql);
    $serie  = pg_result($rs,0,"tur_serie");
    $modal  = pg_result($rs,0,"tur_modalidade"); 
    $nivel  = pg_result($rs,0,"tur_nivel"); 
    $sqldis = " select dis_id,dis_nome 
                from   curriculoano inner join curriculo_itens
                       on cur_id = cut_curid
                       inner join disciplinas on cur_disid = dis_id
                where  cur_serie = ".$serie."
                and    cur_ano   = ".$ano."
                and    cur_nivel = ".$nivel."
                and    cur_modid = ".$modal;
    //echo $sql;
    $rsdis  = pg_query($sqldis);
    while ($ln = pg_fetch_array($rsdis)){
            
    	$itens[]=array("dis_id" => $ln["dis_id"],"dis_nome" => urlencode($ln["dis_nome"]));
       
    }
    $json  = new Services_JSON();
    $str = $json->encode($itens);        
    return $str;
  
   // echo $sqldis;
    
}
function addpart($part){

    $sql    = "select distinct dia_nome from dia_desafio where to_ascii(dia_nome) ilike to_ascii('%$part%')";    
    $rs     = pg_query($sql);
     while ($ln = pg_fetch_array($rs)){
        $texto .= "<a style='cursor:hand;cursor:pointer' 
                   href=\"javascript:js_completa('dia_nome','".$ln[0]."')\"
                   class='cblinha' onKeyDown='proximo2(this,event);return false'>".$ln[0]."</a>";
    }
    $ret .= "";
         
    return $texto;
  //
   // echo $sqldis;
    
}

function consAluno($nome){

    $sql    = "select alu_id,alu_nome,alu_mae,to_char(alu_dtnasc,'dd/mm/YYYY')
               from alunos where to_ascii(alu_nome) ilike to_ascii('$nome%') order by to_ascii(alu_nome)";    
    $rs     = pg_query($sql);
    $i = 0;
     while ($ln = pg_fetch_array($rs)){
     	if ($i % 2 == 0){
     		$color = 'cblinha1';
     	}else{
     		$color = 'cblinha2';
     	}     	
        $texto .= "<a style='cursor:hand;cursor:pointer;' 
                   href=\"javascript:js_compaluno('".$ln[0]."','".$ln[1]."')\"
                   class='$color'  onKeyDown='proximo2(this,event);
                   return false'> ".str_pad($ln[0],5,"0",STR_PAD_LEFT)." || ".$ln[3]." || ".$ln[1].
                   " || <span style='color:green'>Mãe </span>".$ln[2] ."</a>";
        $i++;
    }
    $ret .= "";
         
    return $texto;
  //
   // echo $sqldis;
    
}

function descturma($tur_id){
	
	$sql = "select 	tur_serie,
	                tur_id,
	                mod_sigla,
	                tip_sigla,
	                niv_sigla,
	                tur_maxi,
	                niv_ord,
	                tur_modalidade,
	               (select Count(*) from movalunos
	                 where  mov_turid = tur_id 
	                 and    mov_dtsaida is null
	                 ) as talunos ,
	                 ( case when mod_id = 2 and tip_id = 2 then 
	                    (select eja_fase||' '||eja_modal from ejadesc
	                     where eja_ano = tur_ano and eja_serie = tur_serie) end ) as eja_desc 
	        from turmas left outer join modalidades on mod_id  = tur_modalidade
	                    left outer join niveis on niv_id       = tur_nivel
	                    left outer join tipos_turmas on tip_id  = tur_tipo
	                    
	        where tur_id = $tur_id";
	$rs  = pg_query($sql);
	//echo $sql;
	$str = " &nbsp;&nbsp;";
	if (@pg_result($rs,0,"tur_modalidade") != 2){
		$str .= @pg_result($rs,0,"tur_serie")." ";
		$str .= @pg_result($rs,0,"niv_ord")." ";
	}
	
	$str .= @pg_result($rs,0,"mod_sigla")." "; 
	$str .= @pg_result($rs,0,"tip_sigla")." ";
	$str .= @pg_result($rs,0,"eja_desc").' ';
	$str .= @pg_result($rs,0,"niv_sigla").'    ';
	$str .= "<span style='color:green'>";
	$str .= @pg_result($rs,0,"talunos");
	$str .= " alunos</span>&nbsp;&nbsp;&nbsp;&nbsp;|";
	$str .= trim(@pg_result($rs,0,"tur_maxi"))."|";
	$str .= trim(@pg_result($rs,0,"talunos"))."|".@pg_result($rs,0,"tur_modalidade")."|".@pg_result($rs,0,"tur_serie");
	return $str;             
	
}

function ajx_nummat($alu_id){
	
	$sql = "select 	count(*) as total from movalunos
	        where   mov_aluid = $alu_id
	        and     mov_ano   = ".$_SESSION["sis_exerc"]."
	        and     mov_dtsaida is null";
	$rs  = pg_query($sql);
	$str = @pg_result($rs,0,"total");
	return $str;        
	
}

function ajx_aluidade($data,$tur_id){
	
	$sql = "select date_part('YEAR', age('".strformat($data,"dten")."'::date)) as ano,
	               date_part('MONTH',age('".strformat($data,"dten")."'::date)) as mes";
	   
	$rs   = pg_query($sql);
	//echo $sql;
	$ano  = pg_result($rs,0,"ano");    
	
	$sql  = "select tur_serie, tur_nivel from turmas where tur_id = ".$tur_id;
	//echo $sql;
	$rs2  = pg_query($sql);
	$sql3 = "select def_idade from defasagem where def_nivel = ".@pg_result($rs2,0,"tur_nivel").
	         " and def_serie = ".@pg_result($rs2,0,"tur_serie");
	$rs3  = pg_query($sql3);
	if ($ano > pg_result($rs3,0,"def_idade")){
		$def = 1;
	}else{
		$def = 0;
	}
	
	$str  = pg_result($rs,0,"ano")." anos ".
            pg_result($rs,0,"mes")." m";
	return $str."|$def";
        
	
}

function getMicros($ins_id){
	
	$sql   = "select equ_id,equ_nome,equ_tipid
	          from   equipeinf
	          where  equ_insid  = $ins_id
	          order by equ_nome";	
	$json  = new Services_JSON();
	$rs    = @pg_query($sql);
	while ($ln = pg_fetch_array($rs)){
		$itens[]=array("id" => $ln["equ_id"],"nome" => $ln["equ_nome"],"tipo" => $ln["equ_tipid"]);
	} 
	$itens = $json->encode($itens);
	
	return $itens;
       	
}


function getAjuda($aju_id){
	
	$sql   = "select aju_descricao from sis_ajuda where aju_id = $aju_id";	
	$rs    = @pg_query($sql);
	return pg_result($rs,0,'aju_descricao');   
	
}

function getAluDtentrada($aluid){
	
	$sql   = "select mov_dtentrada
	         from    movalunos inner join alunos
	                 on mov_aluid = mov_id
	         where  alu_id = $aluid";	
	$rs    = @pg_query($sql);
	return pg_result($rs,0,'mov_dtentrada');   
	
}
function ajx_idade($data,$alu_id){
	
	
	$sql = "select date_part('YEAR', age('".strformat($data,"dten")."'::date)) as ano,
	               date_part('MONTH',age('".strformat($data,"dten")."'::date)) as mes";
	   
	$rs   = @pg_query($sql);
	$json  = new Services_JSON();
	$ano = pg_result($rs,0,"ano");
	$mes = pg_result($rs,0,"mes");
	$str = array("ano" => $ano,"mes" => $mes);
    $str = $json->encode($str);      
	return $str;
        
	
}
function estnutri($sexo,$ano,$mes,$peso){
	
	$sql = "select 	fc_pesagem('$sexo',$ano,$mes,$peso) as estnutri";
	$rs  = @pg_query($sql);
	$str = @pg_result($rs,0,"estnutri");
	return $str;
}     

function ajx_getTurma($ano){
	
	$json  = new Services_JSON();
	$sql   = "select tur_id,tur_nome from turmas where tur_ano = $ano order by tur_nome";
	$rs = pg_query($sql);
	
	while ($ln = pg_fetch_array($rs)){
		
		$itens[]=array("tur_id" => $ln["tur_id"],"tur_nome" => $ln["tur_nome"]);
		
	} 
	
	$str = $json->encode($itens);      
	return $str;
	
}

function ajx_addDisConselho($aluid,$disid,$nota,$profid){
	
	$insert = "insert into escaprconselho 
	                  (con_aluid,con_disid,con_profid,con_notareal,con_insid,con_ano)
	           values ($aluid,$disid,$profid,'$nota',".$_SESSION["usu_instid"].",'".$_SESSION["sis_exerc"]."')";
	$rs  = pg_query($insert);
	if ($rs){
		$strret = '';
	}else{
		$strret = "Houve um erro ao Incluir nota!\\n Erro = $insert";
	}
	return $strret;                 
}


function ajx_deleteDisConselho($con_id){
	
	$insert = "delete from escaprconselho where con_id = $con_id";
	$rs  = pg_query($insert);
	if ($rs){
		$strret = '';
	}else{
		$strret = "Houve um erro ao Excluir a Disciplina!\\n Erro = $insert";
	}
	return $strret;                 
}

//Função para pegar ordem dos Menus
function ordem_menus($menu){

    $sql        = "select mnu_ordem,mnu_nome from mnu_filho
                   where mnu_pai = $menu";    
    $rs         = pg_query($sql);
    $mnu_ordem  = @pg_result($rs,0,"mnu_ordem");
    $mnu_nome   = @pg_result($rs,0,"mnu_nome"); 
   
    while ($ln = pg_fetch_array($rs)){
            
    	$itens[]=array("mnu_ordem" => $ln["mnu_ordem"],"mnu_nome" => urlencode($ln["mnu_nome"]));
       
    }
    $json  = new Services_JSON();
    $str = $json->encode($itens);        
    return $str;
  //
   // echo $sqldis;
    
}

function ajx_numproc($num_proc){
	
	$sql = "select pro_id,pro_numproc
	        from   processosjur
            where pro_numproc = $num_proc";
	$rs         = pg_query($sql);
	
	if (pg_num_rows($rs) > 0){
		
		$proid      = @pg_result($rs,0,"pro_id");
    	$pronumproc = @pg_result($rs,0,"pro_numproc"); 
    	$itens      = array("valido" => 1,"proc_id" => $proid,"numproc" => $pronumproc);
	}else{
		$itens      = array("valido" => 0,"proc_id" => '',"numproc" => '');
	}
	
	$json  = new Services_JSON();
    $str = $json->encode($itens);        
    return $str;
           	
	
}

if(isset($_GET["n"])){
       
    $t=leconteudo($_GET["n"],$_GET["ttable"],$_GET["tkey"],$_GET["tvalue"],$_GET["wh"],$_GET["sufix"],$_GET["fc_js"]);
    echo(urlencode($t));
}


if($_GET["id"] != ""){
       
    $t=direto($_GET["id"],$_GET["ttable"],$_GET["tkey"],$_GET["tvalue"],$_GET["wh"]);
    echo(urlencode($t));
}

if ($_GET["fc"] == "adddisciplinas"){
       
    $s=adddisciplinas($_GET["serie"],$_GET["ano"]);
    echo  $s;
}
if ($_GET["part"] != ""){
       
    $s=addpart($_GET["part"]);
    echo(urlencode($s));
}

if ($_GET["fc"] == "consAluno"){
       
    $s=consAluno($_GET["alunome"]);
    echo(urlencode($s));
}
if ($_GET["fc"] == "descturma"){
       
    $s=descturma($_GET["tur_id"]);
    echo(urlencode($s));
}
if ($_GET["fc"] == "ajx_nummat"){
       
    $s=ajx_nummat($_GET["alu_id"]);
    echo(urlencode($s));
}
if ($_GET["fc"] == "ajx_aluidade"){
       
    $s=ajx_aluidade($_GET["data"],$_GET["tur_id"]);
    echo(urlencode($s));
}
if ($_GET["fc"] == "getMicros"){
       
    $s=getMicros($_GET["ins_id"]);
    echo $s;
}
if ($_GET["fc"] == "idade"){
       
    $s=ajx_idade($_GET["valor"],$_GET["aluid"]);
    echo $s;
}
if ($_GET["fc"] == "estnutri"){
       
    $s=estnutri($_GET["sexo"],$_GET["ano"],$_GET["mes"],$_GET["peso"]);
    echo $s;
}
if ($_GET["fc"] == "getAjuda"){
       
    $s=getAjuda($_GET["aju_id"]);
    echo(urlencode($s));
}

if ($_GET["fc"] == "ajx_getTurma"){
       
    $s=ajx_getTurma($_GET["ano"]);
    echo ($s);
}
if ($_GET["fc"] == "ajx_addDisConselho"){
       
    $s=ajx_addDisConselho($_GET["alu_id"],$_GET["dis_id"],$_GET["nota"],$_GET["prof_id"]);
    echo $s;
}

if ($_GET["fc"] == "ajx_deleteDisConselho"){
       
    $s=ajx_deleteDisConselho($_GET["con_id"]);
    echo $s;
}

if ($_GET["fc"] == "ordem_menus"){
       
    $s=ordem_menus($_GET["mnu"]);
    echo $s;
}

if ($_GET["fc"] == "ajx_numproc"){
       
    $s=ajx_numproc($_GET["pro_numproc"]);
    echo $s;
}
?>