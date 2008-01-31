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
$pdf->cell(50,5,"Tele Entregas do Dia",0,1);
$pdf->line(5,$pdf->GetY(),290,$pdf->GetY());
$pdf->ln(10);
$pdf->setfont($fonte,"B","14");
$pdf->cell(0,5,$_GET["dtvenda"],0,1,"C");
$pdf->setfillcolor(235);
$pdf->SetFont($fonte,"b",10);
$sql1 = "select count(*) as total from comandas
         where com_delivery = 1
         and com_dtcomanda = '".strformat($_GET["dtvenda"],"dten")."'";
$db->executa($sql1,true,"entregas");
$total = $db->entregas["total"];
$sql = "SELECT sum(cti_qtde) as total ,pro_nome 
        from   comandas inner join comanda_itens on com_id = cti_comid 
               inner join produtos on pro_id =  cti_proid
        where  com_dtcomanda = '".strformat($_GET["dtvenda"],"dten")."'
        group by pro_nome order by pro_nome";
$rs = $db->executa($sql);
$pdf->cell(140,5,"Produto","B",0,"C",1);
$pdf->cell(45,5,"Qtde","B",1,"C",1);
$pdf->SetFont($fonte,"",10);
while ($ln = $db->fetch_array($rs)){
	
	if ($pdf->getY() >= $pdf->h -15){
		
		$pdf->addpage();
		$pdf->SetFont($fonte,"b",10);
		$pdf->cell(140,5,"Produto","B",0,"C",1);
		$pdf->cell(45,5,"Qtde","B",1,"C",1);
		$pdf->SetFont($fonte,"",10);
		
	}
	
	$pdf->cell(140,5,$ln["pro_nome"],1,0);
	$pdf->cell(45,5,$ln["total"],1,1);	
	
}
$pdf->ln();
$pdf->SetFont($fonte,"b",14);
$pdf->cell(40,6,"Tele-entregas:",0,0);
$pdf->SetFont($fonte,"",15);
$pdf->cell(20,6,$db->entregas["total"],0,1);
$sqltotal = "select sum(com_vltotal) as total from comandas where com_dtcomanda ='".strformat($_GET["dtvenda"],"dten")."'";
$db->executa($sqltotal,true,"tot");
$pdf->SetFont($fonte,"b",14);
$pdf->cell(40,6,"Valor Total:",0,0);
$pdf->SetFont($fonte,"",15);
$pdf->cell(20,6,"R$ ".number_format($db->tot["total"],2,",","."),0,0);
$pdf->output();
?>