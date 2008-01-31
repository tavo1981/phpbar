<?
require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/funcoes.php");
require("libs/form.class");
require('fpdf151/fpdf.php');
$db   = new  db();
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
$pdf->Text(230,10,"Emissão: ".date("d/m/Y"));
$pdf->SetFont($fonte,"",14);
$pdf->setx(5);
$pdf->cell(50,5,"Lista de clintes Duplos",0,1);
$pdf->line(5,$pdf->GetY(),290,$pdf->GetY());
$pdf->ln(10);
$pdf->setfillcolor(235);
$pdf->SetFont($fonte,"b",10);
$pdf->cell(170,5,"Cliente",1,0,"C",1);
$pdf->cell(45,5,"Fone",1,1,"C",1);
$sql = "SELECT distinct cli_nome, 
               cli_foneprinc
        from   clientes
        group  by cli_nome,cli_foneprinc having count(*) > 1";
$rs = $db->executa($sql);
$pdf->SetFont($fonte,"",10);
while ($ln = $db->fetch_array($rs)){
	
	if ($pdf->getY() >= $pdf->h -15){
		
		$pdf->addpage();
		$pdf->SetFont($fonte,"b",10);
		$pdf->cell(170,5,"Cliente",1,0,"C",1);
		$pdf->cell(45,5,"Fone",1,1,"C",1);
		$pdf->SetFont($fonte,"",10);
		
	}
	
	$pdf->cell(170,5,$ln["cli_nome"],1,0);
	$pdf->cell(45,5,$ln["cli_foneprinc"],1,1);	
	
}
$pdf->output();
?>

?>
