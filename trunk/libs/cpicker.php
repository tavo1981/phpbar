<html>

<head>
  <title></title>
  <style type="text/css">
  .clsCursor
     {cursor:pointer;}
  .cpicker{border:1px solid black;          }   
  .cpicker td {border-right:1px;
               border-bottom:1px}
     </style>
</head>

<body>
<script>
function ColorPalette_MouseMove(colorString){
        document.getElementById('cpick').style.background="#"+colorString;
        document.getElementById('arq').value='#'+colorString.toUpperCase();
        
}
function manda(){
 color =  document.getElementById('arq').value;
 parent.document.getElementById(<?="'".$_GET["field"]."'";?>).value=color;
 parent.document.getElementById(<?="'".$_GET["field"]."'";?>).style.background=color;
 window.parent.document.getElementById('cpicker').style.visibility='hidden';

}
</script>
         <table><tr><td> 
         <table  bgcolor="#000000" width="74"height="15" id="cpick" class="cpicker" cellspacing="0" cellpadding="0" align="left">
             <tr>
              <td>&nbsp;</td>
               </tr>
                 </table>
                 </td><td>
                    <input type="text" name="colourp" id='arq' 
                     onKeyUp = "document.getElementById('cpick').style.background=this.value;this.value=this.value.toUpperCase()"
                     size="8" value="#000000" style="width:74px; font: 8pt verdana" maxlength="7">
                    </td></tr></table>   
                    <table class="cpicker" cellspacing="0px" cellpadding="0px" >
                      <tr>
                        <td bgcolor="#ffffff" width="12" ><img class="clsCursor" src="blank.gif" onClick="manda()" height=12 width=12  onMouseOver="ColorPalette_MouseMove('ffffff')" ></td>
                        <td bgcolor="#ffffcc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffffcc')"></td>
                        <td bgcolor="#ffff99" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffff99')"></td>
                        <td bgcolor="#ffff66" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffff66')"></td>
                        <td bgcolor="#ffff33" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffff33')"></td>
                        <td bgcolor="#ffff00" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffff00')"></td>
                        <td bgcolor="#ccffff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ccffff')"></td>
                        <td bgcolor="#ccffcc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ccffcc')"></td>
                        <td bgcolor="#ccff99" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ccff99')"></td>
                        <td bgcolor="#ccff66" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ccff66')"></td>
                        <td bgcolor="#ccff33" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ccff33')"></td>
                        <td bgcolor="#ccff00" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ccff00')"></td>
                        <td bgcolor="#99ffff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('99ffff')"></td>
                        <td bgcolor="#99ffcc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('99ffcc')"></td>
                        <td bgcolor="#99ff99" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('99ff99')"></td>
                        <td bgcolor="#99ff66" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('99ff66')"></td>
                        <td bgcolor="#99ff33" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('99ff33')"></td>
                        <td bgcolor="#99ff00" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('99ff00')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#00ffff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00ffff')"></td>
                        <td bgcolor="#00ffcc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00ffcc')"></td>
                        <td bgcolor="#00ff99" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00ff99')"></td>
                        <td bgcolor="#00ff66" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00ff66')"></td>
                        <td bgcolor="#00ff33" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00ff33')"></td>
                        <td bgcolor="#00ff00" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00ff00')"></td>
                    
                        <td bgcolor="#ffccff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffccff')"></td>
                        <td bgcolor="#ffcccc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffcccc')"></td>
                        <td bgcolor="#ffcc99" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffcc99')"></td>
                        <td bgcolor="#ffcc66" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffcc66')"></td>
                        <td bgcolor="#ffcc33" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffcc33')"></td>
                        <td bgcolor="#ffcc00" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ffcc00')"></td>
                 
                        <td bgcolor="#ccccff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ccccff')"></td>
                        <td bgcolor="#cccccc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cccccc')"></td>
                        <td bgcolor="#cccc99" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cccc99')"></td>
                        <td bgcolor="#cccc66" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cccc66')"></td>
                        <td bgcolor="#cccc33" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cccc33')"></td>
                        <td bgcolor="#cccc00" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cccc00')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#00ccff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00ccff')"></td>
                        <td bgcolor="#00cccc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00cccc')"></td>
                        <td bgcolor="#00cc99" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00cc99')"></td>
                        <td bgcolor="#00cc66" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00cc66')"></td>
                        <td bgcolor="#00cc33" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00cc33')"></td>
                        <td bgcolor="#00cc00" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('00cc00')"></td>
                     
                        <td bgcolor="#ff99ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff99ff')"></td>
                        <td bgcolor="#ff99cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff99cc')"></td>
                        <td bgcolor="#ff9999" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff9999')"></td>
                        <td bgcolor="#ff9966" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff9966')"></td>
                        <td bgcolor="#ff9933" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff9933')"></td>
                        <td bgcolor="#ff9900" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff9900')"></td>
                 
                        <td bgcolor="#cc99ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc99ff')"></td>
                        <td bgcolor="#cc99cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc99cc')"></td>
                        <td bgcolor="#cc9999" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc9999')"></td>
                        <td bgcolor="#cc9966" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc9966')"></td>
                        <td bgcolor="#cc9933" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc9933')"></td>
                        <td bgcolor="#cc9900" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc9900')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#9999ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('9999ff')"></td>
                        <td bgcolor="#9999cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('9999cc')"></td>
                        <td bgcolor="#999999" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('999999')"></td>
                        <td bgcolor="#999966" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('999966')"></td>
                        <td bgcolor="#999933" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('999933')"></td>
                        <td bgcolor="#999900" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('999900')"></td>
                     
                        <td bgcolor="#6699ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('6699ff')"></td>
                        <td bgcolor="#6699cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('6699cc')"></td>
                        <td bgcolor="#669999" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('669999')"></td>
                        <td bgcolor="#669966" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('669966')"></td>
                        <td bgcolor="#669933" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('669933')"></td>
                        <td bgcolor="#669900" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('669900')"></td>
                      
                        <td bgcolor="#3399ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('3399ff')"></td>
                        <td bgcolor="#3399cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('3399cc')"></td>
                        <td bgcolor="#339999" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('339999')"></td>
                        <td bgcolor="#339966" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('339966')"></td>
                        <td bgcolor="#339933" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('339933')"></td>
                        <td bgcolor="#339900" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('339900')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#0099ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('0099ff')"></td>
                        <td bgcolor="#0099cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('0099cc')"></td>
                        <td bgcolor="#009999" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('009999')"></td>
                        <td bgcolor="#009966" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('009966')"></td>
                        <td bgcolor="#009933" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('009933')"></td>
                        <td bgcolor="#009900" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('009900')"></td>
                      
                        <td bgcolor="#ff66ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff66ff')"></td>
                        <td bgcolor="#ff66cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff66cc')"></td>
                        <td bgcolor="#ff6699" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff6699')"></td>
                        <td bgcolor="#ff6666" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff6666')"></td>
                        <td bgcolor="#ff6633" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff6633')"></td>
                        <td bgcolor="#ff6600" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff6600')"></td>
                      
                        <td bgcolor="#cc66ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc66ff')"></td>
                        <td bgcolor="#cc66cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc66cc')"></td>
                        <td bgcolor="#cc6699" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc6699')"></td>
                        <td bgcolor="#cc6666" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc6666')"></td>
                        <td bgcolor="#cc6633" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc6633')"></td>
                        <td bgcolor="#cc6600" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc6600')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#9966ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('9966ff')"></td>
                        <td bgcolor="#9966cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('9966cc')"></td>
                        <td bgcolor="#996699" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('996699')"></td>
                        <td bgcolor="#996666" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('996666')"></td>
                        <td bgcolor="#996633" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('996633')"></td>
                        <td bgcolor="#996600" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('996600')"></td>
                      
                        <td bgcolor="#6666ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('6666ff')"></td>
                        <td bgcolor="#6666cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('6666cc')"></td>
                        <td bgcolor="#666699" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('666699')"></td>
                        <td bgcolor="#666666" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('666666')"></td>
                        <td bgcolor="#666633" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('666633')"></td>
                        <td bgcolor="#666600" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('666600')"></td>
                
                        <td bgcolor="#3366ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('3366ff')"></td>
                        <td bgcolor="#3366cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('3366cc')"></td>
                        <td bgcolor="#336699" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('336699')"></td>
                        <td bgcolor="#336666" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('336666')"></td>
                        <td bgcolor="#336633" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('336633')"></td>
                        <td bgcolor="#336600" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('336600')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#0066ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('0066ff')"></td>
                        <td bgcolor="#0066cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('0066cc')"></td>
                        <td bgcolor="#006699" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('006699')"></td>
                        <td bgcolor="#006666" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('006666')"></td>
                        <td bgcolor="#006633" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('006633')"></td>
                        <td bgcolor="#006600" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('006600')"></td>
                      
                        <td bgcolor="#ff33ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff33ff')"></td>
                        <td bgcolor="#ff33cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff33cc')"></td>
                        <td bgcolor="#ff3399" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff3399')"></td>
                        <td bgcolor="#ff3366" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff3366')"></td>
                        <td bgcolor="#ff3333" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff3333')"></td>
                        <td bgcolor="#ff3300" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff3300')"></td>
                  
                        <td bgcolor="#cc33ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc33ff')"></td>
                        <td bgcolor="#cc33cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc33cc')"></td>
                        <td bgcolor="#cc3399" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc3399')"></td>
                        <td bgcolor="#cc3366" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc3366')"></td>
                        <td bgcolor="#cc3333" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc3333')"></td>
                        <td bgcolor="#cc3300" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc3300')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#9933ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('9933ff')"></td>
                        <td bgcolor="#9933cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('9933cc')"></td>
                        <td bgcolor="#993399" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('993399')"></td>
                        <td bgcolor="#993366" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('993366')"></td>
                        <td bgcolor="#993333" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('993333')"></td>
                        <td bgcolor="#993300" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('993300')"></td>
                    
                        <td bgcolor="#6633ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('6633ff')"></td>
                        <td bgcolor="#6633cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('6633cc')"></td>
                        <td bgcolor="#663399" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('663399')"></td>
                        <td bgcolor="#663366" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('663366')"></td>
                        <td bgcolor="#663333" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('663333')"></td>
                        <td bgcolor="#663300" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('663300')"></td>
                   
                        <td bgcolor="#3333ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('3333ff')"></td>
                        <td bgcolor="#3333cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('3333cc')"></td>
                        <td bgcolor="#333399" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('333399')"></td>
                        <td bgcolor="#333366" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('333366')"></td>
                        <td bgcolor="#333333" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('333333')"></td>
                        <td bgcolor="#333300" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('333300')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#0033ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('0033ff')"></td>
                        <td bgcolor="#0033cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('0033cc')"></td>
                        <td bgcolor="#003399" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('003399')"></td>
                        <td bgcolor="#003366" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('003366')"></td>
                        <td bgcolor="#003333" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('003333')"></td>
                        <td bgcolor="#003300" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('003300')"></td>
                      
                        <td bgcolor="#ff00ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff00ff')"></td>
                        <td bgcolor="#ff00cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff00cc')"></td>
                        <td bgcolor="#ff0099" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff0099')"></td>
                        <td bgcolor="#ff0066" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff0066')"></td>
                        <td bgcolor="#ff0033" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff0033')"></td>
                        <td bgcolor="#ff0000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('ff0000')"></td>
                
                        <td bgcolor="#cc00ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc00ff')"></td>
                        <td bgcolor="#cc00cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc00cc')"></td>
                        <td bgcolor="#cc0099" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc0099')"></td>
                        <td bgcolor="#cc0066" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc0066')"></td>
                        <td bgcolor="#cc0033" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc0033')"></td>
                        <td bgcolor="#cc0000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('cc0000')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#9900ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('9900ff')"></td>
                        <td bgcolor="#9900cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('9900cc')"></td>
                        <td bgcolor="#990099" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('990099')"></td>
                        <td bgcolor="#990066" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('990066')"></td>
                        <td bgcolor="#990033" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('990033')"></td>
                        <td bgcolor="#990000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('990000')"></td>
                      
                        <td bgcolor="#6600ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('6600ff')"></td>
                        <td bgcolor="#6600cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('6600cc')"></td>
                        <td bgcolor="#660099" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('660099')"></td>
                        <td bgcolor="#660066" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('660066')"></td>
                        <td bgcolor="#660033" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('660033')"></td>
                        <td bgcolor="#660000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('660000')"></td>
       
                        <td bgcolor="#3300ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('3300ff')"></td>
                        <td bgcolor="#3300cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('3300cc')"></td>
                        <td bgcolor="#330099" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('330099')"></td>
                        <td bgcolor="#330066" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('330066')"></td>
                        <td bgcolor="#330033" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('330033')"></td>
                        <td bgcolor="#330000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('330000')"></td>
                      </tr>
                      <tr>
                        <td bgcolor="#0000ff" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('0000ff')"></td>
                        <td bgcolor="#0000cc" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('0000cc')"></td>
                        <td bgcolor="#000099" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000099')"></td>
                        <td bgcolor="#000066" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000066')"></td>
                        <td bgcolor="#000033" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000033')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                        <td bgcolor="#000000" width="12"><img class="clsCursor" src="blank.gif" onClick="manda()" height='12' width='12'  onMouseOver="ColorPalette_MouseMove('000000')"></td>
                      </tr>
                    </table>
                 
  </table>
</form>
</body>
</html>