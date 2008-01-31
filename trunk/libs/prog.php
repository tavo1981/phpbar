<?
 require_once("../sismus/config.php");
 $con = pg_connect("dbname=$DB user=$USUARIO password=$SENHA host=$HOST");
 $handle = fopen ("../sismus/ARQSINB", "r");
 $linhas  = count(file("../sismus/ARQSINB"));
 echo ($linhas*1)/100;
 ?>
  <html>
  <head><TITLE>teste de progress bar</TITLE>
  <script>
    
    function atualiza(){
      var total = document.getElementById('total').style.width.substr(0,3);
      var barra = document.getElementById('barra');
      var inicial = 0;
      while (inicial <= total){
        barra.style.width = inicial+"px"; 
        inicial = inicial + 1;
      }    
      
   }
  </script> 
  </head>
  <body>
  <div align="right" id ="total" style="width:500px;height:30px;border:1px solid black;top:10px;left:10px;position:absolute">
  <b>Total: </b><?echo $linhas;?></div>
  <div align="right" id="barra" style="height:30px;border:1px solid black;top:10px;left:10px;position:absolute;
                             background-color: #d0d0d0;"></div>
  
 <?
 fclose($handle);
 pg_close($con);
 
 ?>
 <div style="top:50px;position:absolute">
<input type="button" value="carregar" onclick="atualiza();">
<input type="button" value="limpar" onclick="document.getElementById('barra').style.width='0px';">
</div>
</body>
</html> 
 
 