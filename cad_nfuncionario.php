<?
require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/form2.class");
require("libs/funcoes.php");
require("libs/class_interface.php");
$db   = new db();

if (isset($_POST['btncadastrar'])){

	
	$erro = 0;
	if ($_POST["fun_senha"] != ''){
		
		if ($_POST["fun_senha2"] != $_POST["fun_senha"]){
			
			$erro  = 1;
			messagebox("As senhas devem ser iguais!");
			
			
		}else{
			
			$campos = array(
        					"fun_nome" => $POST["fun_nome"],
        					"fun_senha" => md5($_POST["fun_senha"]),
        					"fun_ativo" => 1
        					);
			
		}
		
	}else{
		
		$campos = array(
        				"fun_nome" => $_POST["fun_nome"],      	  				
        				"fun_ativo" => 1,
    					);	
		
	}
	
    if ($erro == 0){
    	$db->valida_trans($db->insert($campos,"funcionarios"),0);
    }

}

if (isset($_POST['btnalterar'])){

	$erro = 0;
	if ($_POST["fun_senha"] != ''){
   		if ($_POST["fun_senha2"] != $_POST["fun_senha"]){
			
			$erro  = 1;
			messagebox("As senhas devem ser iguais!");
			
			
		}else{
			
			$campos = array(
        					"fun_nome" => $_POST["fun_nome"],
        					"fun_senha" => md5($_POST["fun_senha"]),
        					"fun_ativo" => 1
        					);
			
		}
		
	}else{
		
		$campos = array(
        				"fun_nome" => $_POST["fun_nome"],      	  				
        				"fun_ativo" => 1,
    					);	
		
	}
	if ($erro == 0){
    	$db->valida_trans($db->update($campos,"funcionarios","fun_id",$_POST["fun_id"]),0);
	}
}



if (isset ($_GET["fun_id"])){

    $btnlabel = "Alterar";
    $btnname  = "btnalterar";
    $db->dselect("funcionarios","fun_id",$_GET["fun_id"],true);

} else {

    $btnlabel = "Cadastrar";
    $btnname  = "btncadastrar";
}

$form = new form();

$form->Makeform("form1","post","","","",true,"Cadastro de Funcionários");
$form->linha(true);
$form->frminput("Código:","fun_id",0,5,"Código:",'RN',$db->dados['fun_id']);
$form->linha(false,true);
$form->frminput("Nome:","fun_nome",0,30,"Nome:",'E',$db->dados['fun_nome']);
$form->linha(false,true);
$form->FrmSenha("Senha:","fun_senha",15,15,"Senha:");
$form->linha(false,true);
$form->frmsenha("Confirma Senha:","fun_senha2",15,15,"Senha:");
$form->linha(false,true);
//$form->frminput("Ativo:","fun_ativo",0,2,"Ativo:",'',$db->dados['fun_ativo']);
//$form->linha(false,true);
$form->abrecelula('&nbsp;');
$form->FrmBtnOpen("Consultar","btnconsultar","cad_cnfuncionario.php","consulta");
$form->frmbutton($btnlabel,$btnname,"onclick='return chknulo(document.form1)'","submit",'t');
$form->FrmButton("Limpar","btnlimpar","onclick='limpa_form(document.form1);'","button");
if (isset ($_GET["fun_id"])){

    $form->frmBDel('Excluir','cad_nfuncionario.php','funcionarios',fun_id,$_GET["fun_id"]);

}

$form->fechacelula();
$form->linha(false);
$form->fecha();
local('Cadastros >> [b][</b>Cadastro de Funcionários<b>]</b>');
Makemenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
$window = new window(10,30,'950px','450px','consulta','consulta','','');
$window->show();

?>
<hr>
<a href='cfg_itens.php' target='corpo' class='modulo'><b>Início</b></a>