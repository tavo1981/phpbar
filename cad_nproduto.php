<?
require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/form2.class");
require("libs/funcoes.php");
require("libs/class_interface.php");
$db   = new db();

if (isset($_POST['btncadastrar'])){

    $campos = array(
        "pro_id"      => $_POST["pro_id"],
        "pro_nome"    => $_POST["pro_nome"],
        "pro_descr"   => $_POST["pro_descr"],
        "pro_estoque" => $_POST["pro_estoque"],
        "pro_catid"   => $_POST["pro_catid"],
        "pro_foto"    => $_POST["pro_foto"],
        "pro_preco"   => $_POST["pro_preco"]
    );
    $rs = $db->executa($db->insert($campos,"produtos"));
    if ($rs){
        
        $pro_id = $db->last_id("produtos_itens",'ite_id');
        echo "<script>
              parent.Ingredientes1.location.href='cad_nprodutoitem.php?pro_id=$pro_id';
              parent.mo_camada('Ingredientes','Ingredientes1');    
              </script>";
        
    }
} 

if (isset($_POST['btnalterar'])){

    $campos = array(
        "pro_nome"    => $_POST["pro_nome"],
        "pro_descr"   => $_POST["pro_descr"],
        "pro_estoque" => $_POST["pro_estoque"],
        "pro_catid"   => $_POST["pro_catid"],
        "pro_foto"    => $_POST["pro_foto"],
        "pro_preco"   => $_POST["pro_preco"]
    );
    $db->valida_trans($db->update($campos,"produtos","
	               pro_id",$_POST["pro_id"]),0);

}

if (isset ($_GET["pro_id"])){

    $btnlabel = "Alterar";
    $btnname  = "btnalterar";
    $db->dselect("produtos","pro_id",$_GET["pro_id"],true);
    echo "<script>
              parent.Ingredientes1.location.href='cad_nprodutoitem.php?pro_id=$pro_id';
              
              </script>";
 
} else {

    $btnlabel = "Cadastrar";
    $btnname  = "btncadastrar";
}

$form = new form('',false,"libs",false);
?>

<html>
<head>
 <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="GENERATOR" content="Quanta Plus">
  <link rel="stylesheet" href="libs/estilos.css" type="text/css" media="all">
  <link rel="stylesheet" href="libs/menuw.css" type="text/css" media="all">
  <SCRIPT LANGUAGE="JavaScript" SRC="libs/menuw.js"></SCRIPT>
  <script language="JavaScript" src="libs/funcoes.js"></script>
  <script language="JavaScript" src="libs/prototype.js"></script>
  <link rel="stylesheet" href="libs/mnucemes.css" title="XP Extended" />
  </head>
  <body bgcolor="<?=$_SESSION["bgcolor"];?>"
   onload="initPage();winInit();" oncontextmenu="menu_dir(event.clientY,event.clientX,event);return false">
  <center>
  
<?
$form->Makeform("form1","post","","","",true,"Novo Produto");
$form->linha(true);
$form->frminput("Código do Produto:","pro_id",0,5,"Código do Produto:",'N',$db->dados['pro_id']);
$form->linha(false,true);
$form->frminput("Nome:","pro_nome",0,35,"Nome:",'E',$db->dados['pro_nome']);
$form->linha(false,true);
$form->frmTextArea("Descrição:","pro_descr",50,4,'input','','',$db->dados['pro_descr']);
$form->linha(false,true);
$arrestoque  = Array(1 => "Sim",0 =>"Não");
$form->frmselect("Estoque","pro_estoque",false,$arrestoque,'','','Desconta em Estoque',"-1","E",$db->dados["pro_estoque"]);
$form->linha(false,true);
$form->frmselect("Categoria:","pro_catid",true,"catprodutos",'cat_id','cat_descr','Categoria',"-1","A",$db->dados["pro_catid"]);
$form->linha(false,true);
$form->FrmInputFile("Foto:","pro_foto");
$form->linha(false,true);
$form->frminput("Preço:","pro_preco",0,10,"Preço do Produto","N",$db->dados['pro_preco']);
$form->linha(false,true);
$form->abrecelula('&nbsp;');
$form->FrmBtnOpen("Consultar","btnconsultar","cad_cnproduto.php","consulta");
$form->frmbutton($btnlabel,$btnname,"onclick='return chknulo(document.form1)'","submit",'t');
$form->FrmButton("Limpar","btnlimpar","onclick='limpa_form(document.form1);'","button");
if (isset ($_GET["pro_id"])){

    $form->frmBDel('Excluir','cad_nproduto.php','produtos',pro_id,$_GET["pro_id"]);

}

$form->fechacelula();
$form->linha(false);
$form->fecha();

$window = new window(10,30,'950px','450px','consulta','consulta','','');
$window->show();
?>