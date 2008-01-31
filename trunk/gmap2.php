<?php
require_once("libs/fc_sessoes.php");
require_once("libs/form2.class");
require_once("libs/funcoes.php");
echo $_GET["aonde"];   
echo "merda";
ini_set("error_reporting","E_ALL & E_NOTICE");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xmlns:v="urn:schemas-microsoft-com:vml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Local</title>
<script type="text/javascript" src="libs/prototype.js"></script>
    <script src=" http://maps.google.com/?file=api&amp;v=2.x&amp;key=ABQIAAAAseqz3R6eg0P2L4Q1cm3SSxT2yXp_ZAY8_ufC3CFXhHIE1NvwkxS0H1dIG1PTJP_LKPnmnna2M1JLMQ"
      type="text/javascript"></script>
    <style type="text/css">
      body {
        font-family: Verdana, Arial, sans serif;
        font-size: 11px;
        margin: 2px;
      }
    
    </style>
    <script type="text/javascript">
 
    var map;
    var gdir;
    var geocoder = null;
    var addressMarker;

    function initialize() {
      if (GBrowserIsCompatible()) {  
        //classe do mapa.      
        map = new GMap2(document.getElementById("mapa"));
        //classe que mostra o trajeto entre dois pontos.
        gdir = new GDirections(map, document.getElementById("comochegar"));
        GEvent.addListener(gdir, "error", handleErrors);

       }
    }
    
    function setDirections(fromAddress, toAddress,locale) {
       
      gdir.load("from: " + fromAddress + " to: " + toAddress,
                { "locale": locale});
    }

    function handleErrors(){
	   if (gdir.getStatus().code == G_GEO_UNKNOWN_ADDRESS){
	      alert("Endereco desconhecido.\nError: " + gdir.getStatus().code);
	   }else if (gdir.getStatus().code == G_GEO_SERVER_ERROR){
	      alert("Erro no servidor: " + gdir.getStatus().code);
	   }else if (gdir.getStatus().code == G_GEO_MISSING_QUERY){
	      alert("Endereco nao informado:" + gdir.getStatus().code);
       }else if (gdir.getStatus().code == G_GEO_BAD_KEY){
	      alert("Chave de acesso ao Gmap Invalida. \n Error code: " + gdir.getStatus().code);
       }else if (gdir.getStatus().code == G_GEO_BAD_REQUEST){
	      alert("endereco invalido.\n Erro: " + gdir.getStatus().code);
       }else{
           alert("Erro Desconhecido.");
       }
	   
	}
    </script>

  </head>
  <body onload="initialize();js_manda()" onunload="GUnload()" bgcolor="#EEEEE2">
  
  <h2>Como Chegar...</h2>
  <form id='form1' onsubmit="setDirections(this.from.value, this.to.value, 'pt_BR'); return false">

  <table>

   <tr><th align="right">De:&nbsp;</th>

   <td><input type="text" size="25" id="fromAddress" name="from"
     value="28 de fevereiro,40 sapiranga, brasil"/></td>
   <th align="right">&nbsp;&nbsp;Para:&nbsp;</th>
   <td align="right"><input type="text" size="25" id="toAddress" name="to"
     value="<?=$_GET["aonde"]?>" /></td></tr>
   <tr>
   <td colspan=2>
      <input name="button" onclick="js_manda()" id='enviar' type="button" value="Pesquisar!" />
   </tr> 

   </td></tr>
   </table>

    
  </form>

    <br/>
    <table class="directions">
    <tr>
       <th>Detalhes</th>
       <th>Mapa</th></tr>

    <tr>
    <td valign="top"><div id="comochegar" style="background-color:white;width: 275px;height: 400px;border:2px inset white""></div></td>
    <td valign="top"><div id="mapa" style="width: 500px;height: 400px; border:2px inset white"></div></td>

    </tr>
    </table> 
  </body>
</html>
<script>   
function js_manda(){
  setDirections($F('fromAddress'), $F('toAddress'), 'pt_BR'); 
}
</script>