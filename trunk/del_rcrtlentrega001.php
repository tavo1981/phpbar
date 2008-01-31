<?
require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/form2.class");
require("libs/funcoes.php");
$db   = new db();
$js   = "function visualiza(){
           url = 'del_rctrlentregas002.php?dtvenda='+\$F('dtvenda');
            window.open(url,'','location=0');           
}";
$form = new form($js);
$form->MakeForm("form1","post","","","",true,"Entregas Tele-Entrega");
$form->linha(true);
$form->FrmData("Data:","dtvenda",'','E',date("d/m/Y"));
$form ->AbreCelula("");
$form->FrmButton("Visualizar","btnvisu","Onclick='visualiza()'","button","z");
$form->FechaCelula();
$form->fecha();

?>
<hr>
<a href='modulos.php' target='corpo' class='modulo'><b>Início</b></a>