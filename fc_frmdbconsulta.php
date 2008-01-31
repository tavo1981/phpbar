<?
require("libs/classes.class");
require("libs/funcoes.php");
require("libs/JSON.php");

$db = new db();

$xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
$xml .="<root>\n";
  
 // <item id="703" label="HUMBERTO%20DE%20CAMPOS"/>


//$xmlDoc = new DOMDocument('1.0', 'utf-8');
//$xmlDoc->formatOutput = true;

//$root = $xmlDoc->createElement('root');
//$root = $xmlDoc->appendChild($root);

if ($_POST["string"] != ''){
	
	$sql = "SELECT ".$_POST["tkey"].",".$_POST["tvalue"]."
	        FROM   ".$_POST["ttable"]."
	        where  to_ascii(".$_POST["tvalue"].",'LATIN1')
	        ilike  to_ascii('%".$_POST["string"]."%','LATIN1') $wh order by to_ascii(".$_POST["tvalue"].")";
     $rs  = pg_query($sql);
	 while ($ln = pg_fetch_array($rs)){
		//Cadastrar na lista
		$xml .= "<item id=\"".$ln[0]."\" label=\"".rawurlencode($ln[1])."\"/>\n";
		//Add to list
		//$item = $xmlDoc->createElement('item');
		//$item = $root->appendChild($item);
		//$item->setAttribute('id',$ln[0]);
		//$item->setAttribute('label',rawurlencode($ln[1])); 
		//rawurlencode evita problemas de charset
		//rawurlencode avoids charset problems
	}


}
//Retornar XML de resultado para AJAX
//Return XML code for AJAX Request
$xml .= "</root>\n";
header("Content-type:application/xml; charset=utf-8");
echo $xml;
$rs = fopen("/tmp/teste.xml",'w');
fputs($rs,$xml);
fclose($rs);
//$xmlDoc->save("/tmp/teste.xml");

?>
