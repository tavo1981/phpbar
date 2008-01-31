<?
//require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/form2.class");
require("libs/funcoes.php");
require("libs/class_interface.php");
$db   = new db();

if (isset($_POST['btncadastrar'])){

    $campos = array(
        "cpi_id" => $_POST["cpi_id"],
        "cpi_item" => $_POST["cpi_item"],
        "cpi_descr" => $_POST["cpi_descr"],
        "cpi_valor" => $_POST["cpi_valor"],
        "cpi_catid" => $_POST["cpi_catid"],
    );
    $db->valida_trans($db->insert($campos,"catprodutos_itens"),0);

}

if (isset($_POST['btnalterar'])){

    $campos = array(
        "cat_descr" => $_POST["cat_descr"],
    );
    $db->valida_trans($db->update($campos,"catprodutos","
	               cat_id",$_POST["cat_id"]),0);

}

if (isset ($_GET["cat_id"])){

    $btnlabel = "Alterar";
    $btnname  = "btnalterar";
    $db->dselect("catprodutos","cat_id",$_GET["cat_id"],true);

} else {

    $btnlabel = "Cadastrar";
    $btnname  = "btncadastrar";
}

$form = new form();

$form->Makeform("form1","post","","","",true,"");
$form->linha(true);
$form->frminput("Código:","cpi_id",0,5,"Código:",'N',($_POST["cpi_id"]+1));
$form->linha(false,true);
$form->frminput("Item:","cpi_item",0,30,"Item:",'',$db->dados['cpi_item']);
$form->linha(false,true);
$form->frmselect("Categoria:","cpi_catid",true,"catprodutos",'cat_id','cat_descr','Categoria',"-1","A",3);
$form->linha(false,true);
$form->frminput("Descrição:","cpi_descr",0,30,"Descrição:",'',$db->dados['cpi_descr']);
$form->linha(false,true);
$form->frminput("Valor:","cpi_valor",0,15,"Valor:",'',$db->dados['cpi_valor']);
$form->linha(false,true);
$form->abrecelula('&nbsp;');
$form->FrmBtnOpen("Consultar","btnconsultar","cad_cncatprodutos.php","consulta");
$form->frmbutton($btnlabel,$btnname,"onclick='return chknulo(document.form1)'","submit",'t');
$form->FrmButton("Limpar","btnlimpar","onclick='limpa_form(document.form1);'","button");
if (isset ($_GET["cat_id"])){

    $form->frmBDel('Excluir','cad_ncatprodutos.php','catprodutos',cat_id,$_GET["cat_id"]);

}

$form->fechacelula();
$form->linha(false);
$form->fecha();
local('Cadastros >> [b][</b><b>]</b>');
Makemenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
$window = new window(10,30,'950px','450px','consulta','consulta','','');
$window->show();
?>