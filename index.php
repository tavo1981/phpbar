<html><head>
 <meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
  <title>PHPBar - Login</title>
  <script type="text/javascript" src="libs/prototype.js"></script>
  <script type="text/javascript" src="libs/md5.js"></script>
  <script>
  
  function doLogin(){
  	
  	 $('erro').style.display = 'none';
  	 $('btnlogar').disabled  = true;
  	 login = $F('usu_login');	
  	 senha = hex_md5($F('usu_senha'));
   	 pars  = 'fc=doLogin&usu_login=' + login + '&usu_senha=' + senha;
  	 url   = 'ajaxlibs/fc_login.php';
  	 if (login != "" && senha != ""){ 
  	 	$('msg').style.visibility='visible';
   	 	req   = new Ajax.Request(
				    url, 
		   		      {
					   method: 'get', 
				   	   parameters: pars, 
				   	   onComplete: openForm
			    	});
  	 }else{
  	 	
  	 	$('usu_login').focus();
  	 	
  	 }
  	return false;
  }
  
  function openForm(req){
  	  
  	  json = eval("("+req.responseText+")");
  	  
  	  if (json.status == 1){
  	  	  
  	  	   $('msg').style.visibility ='hidden';
  	  	   $('btnlogar').disabled    = false;
  	  	   $('usu_login').value      = '';
  	  	   $('usu_senha').value      = '';
  		   window.open('phpbar.php','phpBar','location=0,top=0,left=0,height='+(screen.height)+',width='+(screen.width-20)+',resizable=1');
  		   
  	  }else{
  	  	$('btnlogar').disabled    = false;
  	  	$('msg').style.visibility ='hidden';
  	  	$('usu_senha').value      = '';
  	  	$('erro').style.display   = '';
  	  	$('usu_login').focus();
  	  	
  	  }
  		   
  	
  	
  }
 
  </script>
</head>
<body background="#EEEEEE"  onload="document.frm1.usu_login.focus()" style="background-color:#EEEEEE;
                            background-image:url('libs/imagens/Globe.gif');background-repeat:no-repeat;
                            font-family:verdana">
<br>
</div>
<div id='box' style="border: 2px outset rgb(153, 153, 153); position: absolute;top: 144px; left: 300px; width: 480px;
background-color:#eeeee2;padding:2px" align="center">
<!--<img src="libs/imagens/topo3.jpg">--><br>
 <form onsubmit="" method="post" name="frm1">
<table style="text-align: left; left: 346px; top: 240px;
              height: 79px;font-size:11pt;font-family:verdana"
   border="0" cellpadding="2" cellspacing="2">
  <tbody>
  <tr>
     <td colspan="2">Por Favor, Informe Login e Senha<br>
      </td>
    </tr>
    <tr>
      <td style="vertical-align: top;">Login:<br>
      </td>
      <td style="vertical-align: top;"><input size="25" name="usu_login" id='usu_login'><br>
      </td>
    </tr>
    <tr>
      <td style="vertical-align: top;">Senha:<br>
      </td>
      <td style="vertical-align: top;"><input  size="25" name="usu_senha" id='usu_senha' type="password"><br>
      </td>
    </tr><tr align="right">
      <td colspan="2" rowspan="1" style="vertical-align: top;">
          <input value="Ok" name="btnlogar"  id='btnlogar' onclick="return doLogin();" type="submit" style='width:80px'><br>
      </td>
    </tr>
    <tr id='erro' style='display:none'><td colspan=2 style='text-align:center'><font color='red'>
    <b>Senha ou Login Incorretos</b></font></td></tr>
   
     </form>
  </tbody>
</table>
<span style="font-weight: bold;">&nbsp;&nbsp;&nbsp; </span><br>
<hr>
<?="todos Direitos reservados 2007 - ".date("Y") ?>

</div>
<div id='msg' style='top:0px;left:400px;position:absolute;padding:4px;
              visibility:hidden;border:2px solid #000000;background-color:#FFFFFF'>
<img src="libs/imagens/logando.gif">Logando no Sistema....
</div>
</body>
</html>
