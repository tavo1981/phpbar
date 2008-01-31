<?
 define('FPDF_FONTPATH','fpdf151/font/');
 require('fpdf151/fpdf.php');
 include("libs/classes.class");
 include("libs/funcoes.php");
 $db = new db();
 $sql = str_replace("#$","'",$str_sql);
 $rs = $db->executa($sql);
 echo $sql;
 $pdf = new FPDF('L','mm','A4');
 $pdf->Open();
 $pdf->AddPage();
 $Letra = 'Times';
 $pdf->setfont($Letra,'b',12);
 //cabeçalho
 $pdf->Image('libs/imagens/logocab.jpg',10,10,30,30);
 $pdf->Image('libs/imagens/Brasao.png',180,10,20,28);
 $pdf->sety(15);
 $pdf->cell(0,5,"SECRETARIA MUNICIPAL DE EDUCAÇÃO E DESPORTO",0,1,"C");
 $pdf->setxy(50,30);
 $pdf->setfont($Letra,'b',10);
 //Nome da Escola
 $pdf->cell(15,5,"Relatório das instituições",0,1,"L");
 $pdf->setxy(10,50);
 $pdf->SetFillColor(204);
 for ($i = 0;$i < pg_num_fields($rs);$i++){
    $pdf->cell(50,5,ucfirst(pg_field_name($rs, $i)),1,0,'C');
}
//$pdf->output();
?>
