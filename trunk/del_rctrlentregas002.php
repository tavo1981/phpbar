<?
//require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/funcoes.php");
require("libs/form.class");
require('fpdf151/fpdf.php');
$db   = new  db();
$db->_DEBUG = 1;
$pdf  = new FPDF("L",'mm',"A4");
$pdf->open();
$pdf->AddPage();
$fonte='times';
$pdf->SetLeftMargin(5);
$pdf->SetAutoPageBreak("on",2);
$pdf->SetFont($fonte,"",12);
$pdf->sety(15);
$pdf->SetFont($fonte,"b",12);
$pdf->setx(5);
$pdf->ln();
$pdf->SetFont($fonte,"",14);
$pdf->setx(5);
$pdf->cell(50,5,"Controle de Entregas",0,1);
$pdf->line(5,$pdf->GetY(),290,$pdf->GetY());
$pdf->ln(10);
$pdf->setfont($fonte,"B","14");
$pdf->cell(0,5,$_GET["dtvenda"],0,1,"C");
$pdf->setfillcolor(235);
$pdf->SetFont($fonte,"b",10);
$total = $db->entregas["total"];
$sql = " SELECT fun_nome,count(*) as total
         FROM   comandas inner join comandaentrega 
                on cet_comid = com_id
                inner join funcionarios on fun_id = cet_funid
         WHERE com_dtcomanda = '".strformat($_GET["dtvenda"],"dten")."' group by fun_nome order by fun_nome";
$rs = $db->executa($sql);
$pdf->cell(140,5,"Funcionário","B",0,"C",1);
$pdf->cell(45,5,"Qtde","B",1,"C",1);
$pdf->SetFont($fonte,"",10);
while ($ln = $db->fetch_array($rs)){
	
	if ($pdf->getY() >= $pdf->h -15){
		
		$pdf->addpage();
		$pdf->SetFont($fonte,"b",10);
		$pdf->cell(140,5,"Funcionário","B",0,"C",1);
		$pdf->cell(45,5,"Qtde","B",1,"C",1);
		$pdf->SetFont($fonte,"",10);
		
	}
	
	$pdf->cell(140,5,$ln["fun_nome"],1,0);
	$pdf->cell(45,5,$ln["total"],1,1);	
	
}
$pdf->ln();
$pdf->output();
?>