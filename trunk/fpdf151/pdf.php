<?
 define('FPDF_FONTPATH','fpdf151/font/');
 require('fpdf151/fpdf.php');
 class pdf extends fpdf{

     function cabecalho ($tipo,$inst){
         include("config.php");
         pg_connect("dbname=$DB user=$USUARIO password=$SENHA host=$HOST");
         $db = new db();
         $sql = "select *
                 from   config_relat
                 where  rel_reltipid = $tipo
                 and    rel_insid    = $inst";
         $rs    = pg_query($sql);
         $dados = pg_fetch_array($rs);
         if ($this->DefOrientation == "P"){
             if ($dados["rel_cabimg1"] != null or $dados["rel_cabimg1"] != '0' ){
                 $this->Image('libs/imagens/'.$dados["rel_cabimg1"],10,10,30,30);
             }
             if ($dados["rel_cabimg2"] != null or $dados["rel_cabimg2"] != '0'){
                 $this->Image('libs/imagens/'.$dados["rel_cabimg2"],180,10,20,28);
            }
         }elseif ($this->DefOrientation == "L"){
             if ($dados["rel_cabimg1"] != null or $dados["rel_cabimg1"] != '0'){
                 $this->Image('libs/imagens/'.$dados["rel_cabimg1"],10,10,30,30);
             }
             if ($dados["rel_cabimg2"] != null or $dados["rel_cabimg2"] != '0'){
                 $this->Image('libs/imagens/'.$dados["rel_cabimg2"],250,10,20,28);
             }


         }
         $this->sety(15);
         if ($dados["rel_cab1"] != null){
             $this->SetFont("Times","b",12);
             $this->cell(0,5,$dados["rel_cab1"],0,1,"C");
         }
         if ($dados["rel_cab2"] != null){
             $this->setfont("Times",'b',11);
             $this->cell(0,5,$dados["rel_cab2"],0,1,"C");
         }
         if ($dados["rel_cab3"] != null){
             $this->setfont("Times",'b',10);
             $this->cell(0,5,$dados["rel_cab3"],0,1,"C");
         }
     }

 }
