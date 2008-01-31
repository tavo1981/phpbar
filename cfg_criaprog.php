<?
//require("libs/fc_sessoes.php");
require("libs/classes.class");
require("libs/form2.class");
require("libs/funcoes.php");
$db->_DEBUG = 1;
$db   = new db();
$form = new form("",true);
if (isset($_POST["criar"])){
	
	$campos = $db->getAttTable($_POST["pro_tabela"]);
	$nome_progconsulta = str_replace("_","_c",$_POST["pro_nomeprog"]);
	$nome_progadd      = $_POST["pro_nomeprog"];
	$rs = fopen("/tmp/".$_POST["pro_nomeprog"],"w");
	fputs($rs,"<?\nrequire(\"libs/fc_sessoes.php\");
require(\"libs/classes.class\");
require(\"libs/form2.class\");
require(\"libs/funcoes.php\");
require(\"libs/class_interface.php\");\n");
	
	fputs($rs,"\$db   = new db();\n\n");
	fputs($rs,"if (isset(\$_POST['btncadastrar'])){\n\n");
	fputs($rs,"    \$campos = array(\n");
	
	while ($ln  = $db->fetch_array($campos)){
		
		if ($_POST["pkey"] != $ln["attname"]){
			
			fputs($rs,"        \"".$ln["attname"]."\" => \$_POST[\"".$ln["attname"]."\"],\n");
			
		}
		
	}
	
	fputs($rs,"    );\n");
	fputs($rs,"    \$db->valida_trans(\$db->insert(\$campos,\"".$_POST["pro_tabela"]."\"),0);\n\n");
	fputs($rs,"}\n\n");
	fputs($rs,"if (isset(\$_POST['btnalterar'])){\n\n");
	fputs($rs,"    \$campos = array(\n");
	$db->result_seek($campos,0);
	
	while ($ln  = $db->fetch_array($campos)){
		
		if ($_POST["pkey"] != $ln["attname"]){
			
			fputs($rs,"        \"".$ln["attname"]."\" => \$_POST[\"".$ln["attname"]."\"],\n");
			
		}
		
	}
	
	fputs($rs,"    );\n");
	fputs($rs,"    \$db->valida_trans(\$db->update(\$campos,\"".$_POST["pro_tabela"]."\",\"
	               ".$_POST["pkey"]."\",\$_POST[\"".$_POST["pkey"]."\"]),0);\n\n");
	fputs($rs,"}\n\n");
	
	fputs($rs,"if (isset (\$_GET[\"".$_POST["pkey"]."\"])){\n\n");
	fputs($rs,"    \$btnlabel = \"Alterar\";\n");
	fputs($rs,"    \$btnname  = \"btnalterar\";\n");
	fputs($rs,"    \$db->dselect(\"".$_POST["pro_tabela"]."\",\"".$_POST["pkey"]."\",\$_GET[\"".$_POST["pkey"]."\"],true);\n\n");
	
	fputs($rs,"} else {\n\n");
	fputs($rs,"    \$btnlabel = \"Cadastrar\";\n");
	fputs($rs,"    \$btnname  = \"btncadastrar\";\n");
	fputs($rs,"}\n\n");
	
	//descrvendo o Formulário
	
	fputs($rs,"\$form = new form();\n\n");
	fputs($rs,"\$form->Makeform(\"form1\",\"post\",\"\",\"\",\"\",true,\"".$_POST["pro_textoidf"]."\");\n");
	fputs($rs,"\$form->linha(true);\n");
	
	$db->result_seek($campos,0);
	
	while ($ln  = $db->fetch_array($campos)){
		
		$strval  = '';
		
		if ($ln["attnotnull"] == "t" and ($ln["attname"] != $_POST["pkey"])){
				
			$strval .= "E";
				
		}else if ($ln["attname"] == $_POST["pkey"]) {
			$strval = "R";
			
		}
		
		
		if (strpos($ln["Type"],"character") > 0){
				
				$strval .= "A";
		}
		
	    if (in_array($ln["Type"],$db->_tnumbers)){
		
				$strval .= "N";		
		
		}		
		
		if ($ln["Type"] == "date"){
						
			fputs($rs,"\$form->frmData(\"".$_POST["lbl".$ln["attname"]]."\",\"".$ln["attname"]."\",\""
		      .$_POST["lbl".$ln["attname"]]."\",'$strval',strformat(\$db->dados['".$ln["attname"]."'],'dtbr'));\n");
			
		}elseif ($ln["Type"] == "text"){
			
			fputs($rs,"\$form->frmTextArea(\"".$_POST["lbl".$ln["attname"]]."\",\"".$ln["attname"]
			     ."\",50,4,'input','','$strval',\$db->dados['".$ln["attname"]."']);\n");
	
		} else {
						
			$tamanho = $_POST["tam".$ln["attname"]]==0?25:$_POST["tam".$ln["attname"]];
			fputs($rs,"\$form->frminput(\"".$_POST["lbl".$ln["attname"]]."\",\"".$ln["attname"]."\",0,$tamanho,\""
		      .$_POST["lbl".$ln["attname"]]."\",'$strval',\$db->dados['".$ln["attname"]."']);\n");
			
		}
		
		fputs($rs,"\$form->linha(false,true);\n");
		
	}
	
	//Criando os Botoes
	
	fputs($rs,"\$form->abrecelula('&nbsp;');\n");
	fputs($rs,"\$form->FrmBtnOpen(\"Consultar\",\"btnconsultar\",\"$nome_progconsulta\",\"consulta\");\n");
	fputs($rs,"\$form->frmbutton(\$btnlabel,\$btnname,\"onclick='return chknulo(document.form1)'\",\"submit\",'t');\n");
	fputs($rs,"\$form->FrmButton(\"Limpar\",\"btnlimpar\",\"onclick='limpa_form(document.form1);'\",\"button\");\n");
	fputs($rs,"if (isset (\$_GET[\"".$_POST["pkey"]."\"])){\n\n");
	fputs($rs,"    \$form->frmBDel('Excluir','".$_POST["pro_nomeprog"]."','".$_POST["pro_tabela"]
	               ."',".$_POST["pkey"].",\$_GET[\"".$_POST["pkey"]."\"]);\n\n");
	fputs($rs,"}\n\n");
	fputs($rs,"\$form->fechacelula();\n");
	fputs($rs,"\$form->linha(false);\n");
	fputs($rs,"\$form->fecha();
local('".$_POST["pro_modulo"]." >> [b][</b>".$_POST["pro_textoidf"]."<b>]</b>');
Makemenu(\$_SESSION[\"usu_id\"],\$_SESSION[\"usu_modulo\"]);\n");
	fputs($rs,"\$window = new window(10,30,'950px','450px','consulta','consulta','','');\n");
    fputs($rs,"\$window->show();\n?>");
	fclose($rs);
	
	////Criando Programa de Consulta
	
	$rsc = fopen("/tmp/$nome_progconsulta","w");
	fputs($rsc,"<?
require('libs/fc_sessoes.php');
require_once('libs/classes.class');
require_once('libs/form2.class');
require_once('libs/funcoes.php');
require('libs/class_dbgrid.php');\n");
	fputs($rsc,"\$db   = new db();\n");
	fputs($rsc,"\$js   = \"function manda(id){
	
          url = '$nome_progadd?".$_POST["pkey"]."='+id;
          parent.location.href=url;
          }\";\n");
	fputs($rsc,"\$form            = new form(\$js,true,'libs',false);\n");
	fputs($rsc,"\$grid            = new dbGrid();\n");
	fputs($rsc,"\$grid->sql       = \$db->getAll('".$_POST["pro_tabela"]."','','',0);\n");
	fputs($rsc,"\$grid->header    = array(");
	$db->result_seek($campos,0);
	$vl  = '';
	$str = '';
	while ($ln  = $db->fetch_array($campos)){
		
	    $str  .=  "$vl'".$ln["attname"]."'";
		$str1 .=  "$vl'".str_replace(":",'',$_POST["lbl".$ln["attname"]]."'");
	    $vl  = ", ";
		
	}
	fputs($rsc,$str1.");\n");
	fputs($rsc,"\$grid->fields    = array($str);\n");
	fputs($rsc,"\$grid->pfields   = array($str1);\n");
	fputs($rsc,"\$grid->func      = true;\n");
	fputs($rsc,"\$grid->js        = \"manda\";\n");
	fputs($rsc,"\$grid->js_campos = '0#2';\n");
	fputs($rsc,"\$grid->exec      = 1;\n");
	fputs($rsc,"\$grid->limite    = 10;\n");
	fputs($rsc,"\$grid->show();\n");
	fputs($rsc,"\$form->fecha();\n");
	fputs($rsc,"?>");
	fclose($rsc);
	
	$_POST["criar"] = '';
}
$form->Makeform("form1","post","","","",true,"Criar Programa");
$form->linha(true);
$form->FrmInput("Nome Programa:","pro_nomeprog",0,'50','',"E",$_POST["pro_nomeprog"]);
$form->linha(false,true);
$form->FrmInput("Texto de Identificação:","pro_textoidf",0,'50','',"",$_POST["pro_textoidf"]);
$form->linha(false,true);
$form->FrmSelect("Modulo:","pro_modulo",true,"sis_modulos","mod_nome","mod_nome",'',"-1",true
                 ,$_POST["pro_modulo"]);
$form->linha(false,true);
$form->FrmSelect("Tabela:","pro_tabela",true,"pg_tables","tablename","tablename",'',"-1",true
                 ,$_POST["pro_tabela"],"onchange='document.form1.submit()'");
$form->linha(false,true);

if ($_POST["pro_tabela"] != '' and $_POST["criar"] == ''){
	
	$campos = $db->getAttTable($_POST["pro_tabela"]);
	$form->Append("<td colspan='10'><table cellspacing=0><tr>");
	$form->Append("<td class='cabecalho'>Campo</td><td class='cabecalho'><b>PK</b></td>
	               <td class='cabecalho'>Label</td><td class='cabecalho'>Tamanho</td></tr>");
	
	while ($ln  = $db->fetch_array($campos)){
 
		$form->Append("<tr><td><b>".$ln["attname"]."</b></td><td>
		                <input type='radio' name='pkey' value='".$ln["attname"]."'></td><td>
		               <input type='text' name='lbl".$ln["attname"]."' value='' size='10' text='label do campo'></td><td>
		               <input type='text' name='tam".$ln["attname"]."' value='' size='10' text='Tamanho do campo'></td></tr>"); 
		
	}
	
	$form->Append("</table></tr>");
	$form->linha(false,true);
	$form->abrecelula("&nbsp;");
	$form->frmbutton("Cadastrar","criar","onclick=\"return chknulo(document.form1)\"","submit","t");
	$form->fechacelula();
	$form->linha(false);
	
	
}
$form->fecha();
local("Secretaria >> <b>[</b>Tipo de Exceções de Avaliação<b>]</b>");
Makemenu($_SESSION["usu_id"],$_SESSION["usu_modulo"]);
?>