<?
define('FPDF_FONTPATH','font/');
require('fpdf.php');
class PDF extends FPDF {
   
   function cell2($w,$h=0,$txt='',$border=0,$ln=0,$align='',$fill=0,$b=0,$fsize=10,$font='arial'){
      if ($b == 0){
        $this->setFont($font,'',$fsize);
      }
      if ($b == 1){
        $this->setFont($font,'B',$fsize);
      }
     $this->cell($w,$h,$txt,$border,$ln,$align,$fill);
   }

}   

$pdf = new PDF();
$pdf->open();
$pdf->addPage();
$pdf->cell2(0,7,'Teste',1,1,'C',0,1,20);
$pdf->cell2(0,7,'Teste',1,1,'L',0,0,20);
$pdf->cell2(0,5,'O texto abaixo está usando <tags html>');
$pdf->setFont('arial','',12);
$pdf->setx(10);
$pdf->output();
?>