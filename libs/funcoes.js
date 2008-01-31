function chknulo(form){
   var a = 0
   for (var i = 0; i < form.elements.length; i++){
      if (form.elements[i].className == "nnulo"){
         if (form.elements[i].value == ""){
            alert("Campo "+form.elements[i].title+" é obrigatório");
            form.elements[i].focus();
            a = a + 1;
            return false;
            break;
        }
     }
  }
  if (a != 0 ){
    return false
  }else{
  	 return true;
     //form.submit();
  }
}
function c_maiuscula(campo){
  campo.value= campo.value.toUpperCase();
}
function numero(campo){
   if (isNaN(campo.value)){
     campo.value = "";
     alert('Caractere Inválido');
     document.campo.focus();
   }
}

function pressKey(e,teclas){
   ini  =''; 	
   fim  = '';
   aval = '';
   or   ='';
   and  = ''
   t    = document.all ? event.keyCode : e.which;
   ta   = teclas.split("|");
   
   for (i = 0;i < ta.length;i++){
   	
   	    if (ta[i].indexOf("-") != "-1"){
   	    	
  	       vchars = ta[i].split("-");
  	        or = i > 0?'|| ':'';
  	        
  	       if (vchars.length > 1){
  	       	
  	          ini = vchars[0].charCodeAt();
   	          fim = vchars[1].charCodeAt();	
   	         
  	       	  aval += or+' (t >='+ini+' && t <='+fim+')';
  	       	  or = " ||";
  	       	  
  	       }else{
  	       	  aval += ' && t ='+vchars[0]
  	       }

  	    }else{
  	    	
  	    	and = i > 0?' ||  ':'';
  	    	aval += and+' t == '+ta[i].charCodeAt();
  	    	and = ' ||';
  	    	
  	    }
  	    
    }
    
   if (eval(aval)){
       return true;
   }else{
       if (t != 8 && t != 0 && t != 13 && t != 32){ // backspace
          return false;
     }else{
          return true;
     }
     
  }
  
}

//valida cpf,cnpj
function chkcic(vcic){
expr  = new
RegExp("0{11}|1{11}|2{11}|3{11}|4{11}|5{11}|6{11}|7{11}|8{11}|9{11}");
      if (vcic.value.match(expr)){
         vcic.value = "";
         vcic.focus();
         alert('cpf invalido');
         return false;
      }
      if (isNaN(vcic.value) || vcic.value.length != 11){
         alert("valores invalidos");
         return false;
      }
      for (var vdigpos = 10; vdigpos < 12; vdigpos++ ){
         var vdig = 0;
         var vpos = 0;
         for (var vfator = vdigpos;vfator >= 2; vfator-- ){
            vdig = eval(vdig + vcic.value.substr(vpos,1) * vfator);
            vpos++;
         }
         vdig  = eval(11 -(vdig % 11)) < 10 ? eval(11 - vdig % 11) : 0;
         if (vdig != eval(vcic.value.substr(vdigpos-1,1))) {
         alert("cpf invalido");
         vcic.value = "";
         vcic.focus();
         return false;
      }
      }
   return true;
}
//validação de cnpj
function chkcnpj(vcnpj){
     if (isNaN(vcnpj.value) || vcnpj.value.length != 14){
         alert("valores invalidos");
         return false;
      }
      for (var vdigpos = 13; vdigpos < 15; vdigpos++ ){
         var vdig = 0;
         var vpos = 0;
         for (var vfator = vdigpos - 8 ;vfator >= 2; vfator-- ){
            vdig = eval(vdig + vcnpj.value.substr(vpos,1) * vfator);
            vpos++;
         }
         for (var vfator = 9 ;vfator >= 2; vfator-- ){
            vdig = eval(vdig + vcnpj.value.substr(vpos,1) * vfator);
            vpos++;
         }
         vdig  = eval(11 -(vdig % 11)) < 10 ? eval(11 - vdig % 11) : 0;
         if (vdig != eval(vcnpj.value.substr(vdigpos-1,1))) {
         alert("CNPJ falso");
         return false;
      }
      }
   return true;
}
//validaçao de numeros
function teclas(event){
   tecla = document.all ? event.keyCode : event.which;

   if (tecla > 47 && tecla < 58){
     return true;
   }else{
     if (tecla != 8 && tecla != 0 && tecla != 46 & tecla != 13){ // backspace
        return false;
     }else{
        return true;
     }
   }
}

function mostra_fonte(url){
   x = window.clientX;
   y = window.clientY
   winsrc = window.open('','teste','location=0,height='+x+',width='+y+',scrollbars=1');
   fonte  = "view-source: "+ url
   winsrc.location.href = fonte;

}
function limpa_form(form){
   for (var i = 0; i < form.elements.length; i++){
      if (form.elements[i].type == "text" || form.elements[i].type == "hidden"){
          form.elements[i].value = "";
      }
      if (form.elements[i].type == 'select-one'){
         form.elements[i].selectedIndex = 0;
      }
     
      if (form.elements[i].type == "textarea"){
          form.elements[i].value = "";
      }
      //alert(form.elements[i].type);
   }
}

//mostra e esconde  layers
function mo_camada(camada,tativa){
   alvo = document.getElementById(camada);
   tabat = document.getElementById(tativa);
   divs  = document.getElementsByTagName("DIV");
   for (var j = 0; j < divs.length; j++){
      if (divs[j].className =="tab" && alvo.id == divs[j].id){
         alvo.style.zIndex=2
         alvo.style.visibility = "visible";
         //alert(alvo.style.width);
        
         
      }else if (divs[j].className =="tab" && alvo.id != divs[j].id){
         divs[j].style.visibility = "hidden";
         divs[j].style.zIndex='';
         //alvo.style.heigth = '0px';
      }
   }
   //alert(alvo.style.zindex);
   mcss = document.getElementsByTagName("A");
   for (var i = 0;i < mcss.length; i++){
       if (mcss[i].className =='tab' && mcss[i].id == tabat.id){
          //alert(mcss[i].id+"className="+mcss[i].className+", "+tabat.id);
          mcss[i].className = 'activeTab';
          //alert(mcss[i].id+"className="+mcss[i].className+", "+tabat.id);
       }
       if (mcss[i].className =='activeTab' && mcss[i].id != tabat.id){
         // alert(mcss[i].id);
          mcss[i].className = 'tab'
       }
   }

}

//função para fechar a janela
function sair(mostra){
  if (mostra == true){
     if (confirm("Deseja Sair do sistema?") == true){
            window.open('sair.php','','top=0,left=0,height=10,width=10');
        parent.close();
     }else{
       return false;
     }
  }else{
    window.open('sair.php','','top=0,left=0,height=10,width=10');
    parent.close();
  }
}

function titulo(title){
     titleBar = document.getElementById("titulo");
     titleBar.innerHTML=title;

}
function esc_menudir(){
  document.getElementById('mnu_dir').style.visibility="hidden";

}
function menu_dir(X,Y,evt){
    
     document.getElementById('mnu_dir').style.top = X +'px';
     document.getElementById('mnu_dir').style.left = Y +'px';
     //menuInit('mnu_dir');
    // alert("X="+X+",Y="+Y);     
     buttonClick(evt, 'mnu_dir');
     //document.getElementById('mnu_dir').style.visibility="visible";
 }

function verifica_data (objeto){
   dia = (objeto.value.substring(0,2));
   mes = (objeto.value.substring(3,5));
   ano = (objeto.value.substring(6,10));
   situacao = "";
   if (dia >31){
      situacao = "falsa";
   }
   if (mes<01||mes>12){
       situacao = "falsa"
   }
   if (objeto.value == ""){
      situacao = "falsa";
   }
   if (situacao == "falsa"){
      alert("Data Invalida!");
      objeto.focus();
   }
}
//valida e formata a campo tipo time
function vl_time(objeto,evt){
      tecla = document.all ? event.keyCode : evt.which;
      vvalor  = objeto.value.length;
      //alert(tecla);
      if (vvalor == ""){
          if(tecla > 47 && tecla < 51 || tecla==0){
            return true;
          }else{
            if (tecla == 8){
                return true;
              }else{
                return false;
              }
          }
      }
      if (vvalor == 1){
          if(tecla > 47 && tecla < 58 || tecla==0){
             return true;
          }else{
               if (tecla == 8){
                return true;
              }else{
                return false;
              }
          }

     }
     if (vvalor == 2){
        if (tecla == 8 || tecla==0){
           return true;
        }else{
           objeto.value += ":";
        }
       }
       if (vvalor == 3){
        if(tecla > 47 && tecla < 54 || tecla==0){
            return true;
          }else{
            if (tecla == 8){
                return true;
              }else{
                return false;
              }
          }
      }
      if (vvalor == 4){
          if(tecla > 47 && tecla < 58 || tecla==0 ){
             return true;
          }else{
              if (tecla == 8){
                return true;
              }else{
                return false;
              }
           }
       }
       if (vvalor == 5){
           if (tecla == 8 || tecla==0){
              return true;
           }else{
             objeto.value += ":";
          }
       }   
       if (vvalor == 6){
          if(tecla > 47 && tecla < 54 || tecla==0 ){
             return true;
          }else{
              if (tecla == 8){
                return true;
              }else{
                return false;
              }
           }
       }
       if (vvalor == 7){
          if(tecla > 47 && tecla < 58 || tecla==0 ){
             return true;
          }else{
              if (tecla == 8){
                return true;
              }else{
                return false;
              }
           }
       }       
         
   }
function FormataData(vcampo,teclapressionada){
   var tecla = teclapressionada.keyCode;
   vr = vcampo.value;
   vr = vr.replace( ".", "" );
   vr = vr.replace( "/", "" );
   vr = vr.replace( "/", "" );
   tam = vr.length + 1;
   if ( tecla != 9 && tecla != 8 ){
      if ( tam > 2 && tam < 5 ){}
          vcampo.value =vr.substr( 0, tam - 2  ) + '/' + vr.substr( tam - 2, tam );
      if ( tam >= 5 && tam <= 10 ){
          vcampo.value =vr.substr( 0, 2 ) + '/' + vr.substr( 2, 2 )+ '/' + vr.substr( 4, 4 );
          verifica_data(vcampo);
      }
   }
}
var weekend = [0,6];
var weekendColor = "#EEEEE2";
var fontface = "Verdana";
var fontsize = 2;

var gNow = new Date();
var ggWinCal;
isNav = (navigator.appName.indexOf("Netscape") != -1) ? true : false;
isIE = (navigator.appName.indexOf("Microsoft") != -1) ? true : false;

Calendar.Months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
"Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

// Non-Leap year Month days..
Calendar.DOMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
// Leap year Month days..
Calendar.lDOMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

function Calendar(p_item, p_WinCal, p_month, p_year, p_format) {
    if ((p_month == null) && (p_year == null))    return;

    if (p_WinCal == null)
        this.gWinCal = ggWinCal;
    else
        this.gWinCal = p_WinCal;

    if (p_month == null) {
        this.gMonthName = null;
        this.gMonth = null;
        this.gYearly = true;
    } else {
        this.gMonthName = Calendar.get_month(p_month);
        this.gMonth = new Number(p_month);
        this.gYearly = false;
    }

    this.gYear = p_year;
    this.gFormat = p_format;
    this.gBGColor = "white";
    this.gFGColor = "black";
    this.gTextColor = "black";
    this.gHeaderColor = "black";
    this.gReturnItem = p_item;
}

Calendar.get_month = Calendar_get_month;
Calendar.get_daysofmonth = Calendar_get_daysofmonth;
Calendar.calc_month_year = Calendar_calc_month_year;
Calendar.print = Calendar_print;

function Calendar_get_month(monthNo) {
    return Calendar.Months[monthNo];
}

function Calendar_get_daysofmonth(monthNo, p_year) {
    /*
    Check for leap year ..
    1.Years evenly divisible by four are normally leap years, except for...
    2.Years also evenly divisible by 100 are not leap years, except for...
    3.Years also evenly divisible by 400 are leap years.
    */
    if ((p_year % 4) == 0) {
        if ((p_year % 100) == 0 && (p_year % 400) != 0)
            return Calendar.DOMonth[monthNo];

        return Calendar.lDOMonth[monthNo];
    } else
        return Calendar.DOMonth[monthNo];
}

function Calendar_calc_month_year(p_Month, p_Year, incr) {
    /*
    Will return an 1-D array with 1st element being the calculated month
    and second being the calculated year
    after applying the month increment/decrement as specified by 'incr' parameter.
    'incr' will normally have 1/-1 to navigate thru the months.
    */
    var ret_arr = new Array();

    if (incr == -1) {
        // B A C K W A R D
        if (p_Month == 0) {
            ret_arr[0] = 11;
            ret_arr[1] = parseInt(p_Year) - 1;
        }
        else {
            ret_arr[0] = parseInt(p_Month) - 1;
            ret_arr[1] = parseInt(p_Year);
        }
    } else if (incr == 1) {
        // F O R W A R D
        if (p_Month == 11) {
            ret_arr[0] = 0;
            ret_arr[1] = parseInt(p_Year) + 1;
        }
        else {
            ret_arr[0] = parseInt(p_Month) + 1;
            ret_arr[1] = parseInt(p_Year);
        }
    }

    return ret_arr;
}

function Calendar_print() {
    ggWinCal.print();
}

function Calendar_calc_month_year(p_Month, p_Year, incr) {
    /*
    Will return an 1-D array with 1st element being the calculated month
    and second being the calculated year
    after applying the month increment/decrement as specified by 'incr' parameter.
    'incr' will normally have 1/-1 to navigate thru the months.
    */
    var ret_arr = new Array();

    if (incr == -1) {
        // B A C K W A R D
        if (p_Month == 0) {
            ret_arr[0] = 11;
            ret_arr[1] = parseInt(p_Year) - 1;
        }
        else {
            ret_arr[0] = parseInt(p_Month) - 1;
            ret_arr[1] = parseInt(p_Year);
        }
    } else if (incr == 1) {
        // F O R W A R D
        if (p_Month == 11) {
            ret_arr[0] = 0;
            ret_arr[1] = parseInt(p_Year) + 1;
        }
        else {
            ret_arr[0] = parseInt(p_Month) + 1;
            ret_arr[1] = parseInt(p_Year);
        }
    }

    return ret_arr;
}

// This is for compatibility with Navigator 3, we have to create and discard one object before the prototype object exists.
new Calendar();

Calendar.prototype.getMonthlyCalendarCode = function() {
    var vCode = "";
    var vHeader_Code = "";
    var vData_Code = "";

    // Begin Table Drawing code here..
    vCode = vCode + "<TABLE style='border: 1px solid black' cellspacing='0' BGCOLOR=\"" + this.gBGColor + "\">";


    vHeader_Code = this.cal_header();
    vData_Code = this.cal_data();
    vCode = vCode + vHeader_Code + vData_Code;

    vCode = vCode + "</TABLE>";

    return vCode;
}

Calendar.prototype.show = function() {
    var vCode = "";

    this.gWinCal.document.open();

    // Setup the page...
    this.wwrite("<html>");
    this.wwrite("<head><title>Calendar</title>");
    this.wwrite("</head>");

    this.wwrite("<body bgcolor='#cccccc'" +
        "link=\"" + this.gLinkColor + "\" " +
        "vlink=\"" + this.gLinkColor + "\" " +
        "alink=\"" + this.gLinkColor + "\" " +
        "text=\"" + this.gTextColor + "\">");
    this.wwriteA("<FONT FACE='" + fontface + "' SIZE=2><B>");
    this.wwriteA("<center>");
    this.wwriteA(this.gMonthName + " " + this.gYear);
    this.wwriteA("</center>");


    // Show navigation buttons
    var prevMMYYYY = Calendar.calc_month_year(this.gMonth, this.gYear, -1);
    var prevMM = prevMMYYYY[0];
    var prevYYYY = prevMMYYYY[1];

    var nextMMYYYY = Calendar.calc_month_year(this.gMonth, this.gYear, 1);
    var nextMM = nextMMYYYY[0];
    var nextYYYY = nextMMYYYY[1];
    this.wwrite("<center>");
    this.wwrite("<TABLE style='border: 1px solid black' CELLSPACING=0 CELLPADDING=0 BGCOLOR='#e0e0e0'><TR><TD ALIGN=center>");
    this.wwrite("<A HREF=\"" +
        "javascript:window.opener.Build(" +
        "'" + this.gReturnItem + "', '" + this.gMonth + "', '" + (parseInt(this.gYear)-1) + "', '" + this.gFormat + "'" +
        ");" +
        "\"><img src='libs/imagens/pri.png' border='0'title='Ano Anterior'><\/A></TD><TD ALIGN=center>");
    this.wwrite("<A HREF=\"" +
        "javascript:window.opener.Build(" +
        "'" + this.gReturnItem + "', '" + prevMM + "', '" + prevYYYY + "', '" + this.gFormat + "'" +
        ");" +
        "\"><img src='libs/imagens/ant.png' border='0'title='Mês Anterior'><\/A></TD><TD ALIGN=center>");
    this.wwrite("</TD><TD ALIGN=center>");
    this.wwrite("<A HREF=\"" +
        "javascript:window.opener.Build(" +
        "'" + this.gReturnItem + "', '" + nextMM + "', '" + nextYYYY + "', '" + this.gFormat + "'" +
        ");" +
        "\"><img src='libs/imagens/pro.png' border='0'title='Próximo mês'><\/A></TD><TD ALIGN=center>");
    this.wwrite("<A HREF=\"" +
        "javascript:window.opener.Build(" +
        "'" + this.gReturnItem + "', '" + this.gMonth + "', '" + (parseInt(this.gYear)+1) + "', '" + this.gFormat + "'" +
        ");" +
        "\"><img src='libs/imagens/ult.png' border='0'title='Próximo ano'><\/A></TD></TR></TABLE><BR>");
  // this.wwrite("<center>");
    // Get the complete calendar code for the month..
    vCode = this.getMonthlyCalendarCode();
    this.wwrite(vCode);

    this.wwrite("</font></body></html>");
    this.gWinCal.document.close();
}

Calendar.prototype.showY = function() {
    var vCode = "";
    var i;
    var vr, vc, vx, vy;        // Row, Column, X-coord, Y-coord
    var vxf = 285;            // X-Factor
    var vyf = 200;            // Y-Factor
    var vxm = 10;            // X-margin
    var vym;                // Y-margin
    if (isIE)    vym = 75;
    else if (isNav)    vym = 25;

    this.gWinCal.document.open();

    this.wwrite("<html>");
    this.wwrite("<head><title>Calendar</title>");
    this.wwrite("<style type='text/css'>\n<!--");
    for (i=0; i<12; i++) {
        vc = i % 3;
        if (i>=0 && i<= 2)    vr = 0;
        if (i>=3 && i<= 5)    vr = 1;
        if (i>=6 && i<= 8)    vr = 2;
        if (i>=9 && i<= 11)    vr = 3;

        vx = parseInt(vxf * vc) + vxm;
        vy = parseInt(vyf * vr) + vym;

        this.wwrite(".lclass" + i + " {position:absolute;top:" + vy + ";left:" + vx + ";}");
    }
    this.wwrite("-->\n</style>");
    this.wwrite("</head>");

    this.wwrite("<body " +
        "link=\"" + this.gLinkColor + "\" " +
        "vlink=\"" + this.gLinkColor + "\" " +
        "alink=\"" + this.gLinkColor + "\" " +
        "text=\"" + this.gTextColor + "\">");
    this.wwrite("<FONT FACE='" + fontface + "' SIZE=2><B>");
    this.wwrite("Year : " + this.gYear);
    this.wwrite("</B><BR>");

    // Show navigation buttons
    var prevYYYY = parseInt(this.gYear) - 1;
    var nextYYYY = parseInt(this.gYear) + 1;

    this.wwrite("<TABLE  style='border: 1px solid black' CELLSPACING=0 CELLPADDING=0 BGCOLOR='/e0e0e0'><TR><TD ALIGN=center>");
    this.wwrite("<A HREF=\"" +
        "javascript:window.opener.Build(" +
        "'" + this.gReturnItem + "', null, '" + prevYYYY + "', '" + this.gFormat + "'" +
        ");" +
        "\" alt='Prev Year'><img src='libs/imagens/pro.png border='0' title='Próximo mês'><\/A></TD><TD ALIGN=center>");
    this.wwrite("</A>]</TD><TD ALIGN=center>");
    this.wwrite("<A HREF=\"" +
        "javascript:window.opener.Build(" +
        "'" + this.gReturnItem + "', null, '" + nextYYYY + "', '" + this.gFormat + "'" +
        ");" +
        "\"><img src='libs/imagens/ult.png border='0' title='Próximo Ano'><\/A></TD></TR></TABLE><BR>");

    // Get the complete calendar code for each month..
    var j;
    for (i=11; i>=0; i--) {
        if (isIE)
            this.wwrite("<DIV ID=\"layer" + i + "\" CLASS=\"lclass" + i + "\">");
        else if (isNav)
            this.wwrite("<LAYER ID=\"layer" + i + "\" CLASS=\"lclass" + i + "\">");

        this.gMonth = i;
        this.gMonthName = Calendar.get_month(this.gMonth);
        vCode = this.getMonthlyCalendarCode();
        this.wwrite(this.gMonthName + "/" + this.gYear + "<BR>");
        this.wwrite(vCode);

        if (isIE)
            this.wwrite("</DIV>");
        else if (isNav)
            this.wwrite("</LAYER>");
    }

    this.wwrite("</font><BR></body></html>");
    this.gWinCal.document.close();
}

Calendar.prototype.wwrite = function(wtext) {
    this.gWinCal.document.writeln(wtext);
}

Calendar.prototype.wwriteA = function(wtext) {
    this.gWinCal.document.write(wtext);
}

Calendar.prototype.cal_header = function() {
    var vCode = "";

    vCode = vCode + "<TR>";
    vCode = vCode + "<TD><FONT SIZE='2' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "' style='border-bottom:1px solid black'><B>Dom</B></FONT></TD>";
    vCode = vCode + "<TD><FONT SIZE='2' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'style='border-bottom:1px solid black'><B>Seg</B></FONT></TD>";
    vCode = vCode + "<TD><FONT SIZE='2' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'style='border-bottom:1px solid black'><B>Ter</B></FONT></TD>";
    vCode = vCode + "<TD><FONT SIZE='2' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'style='border-bottom:1px solid black'><B>Qua</B></FONT></TD>";
    vCode = vCode + "<TD><FONT SIZE='2' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'style='border-bottom:1px solid black'><B>Qui</B></FONT></TD>";
    vCode = vCode + "<TD><FONT SIZE='2' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'style='border-bottom:1px solid black'><B>Sex</B></FONT></TD>";
    vCode = vCode + "<TD><FONT SIZE='2' FACE='" + fontface + "' COLOR='" + this.gHeaderColor + "'style='border-bottom:1px solid black'><B>Sab</B></FONT></TD>";
    vCode = vCode + "</TR>";

    return vCode;
}

Calendar.prototype.cal_data = function() {
    var vDate = new Date();
    vDate.setDate(1);
    vDate.setMonth(this.gMonth);
    vDate.setFullYear(this.gYear);

    var vFirstDay=vDate.getDay();
    var vDay=1;
    var vLastDay=Calendar.get_daysofmonth(this.gMonth, this.gYear);
    var vOnLastDay=0;
    var vCode = "";

    /*
    Get day for the 1st of the requested month/year..
    Place as many blank cells before the 1st day of the month as necessary.
    */

    vCode = vCode + "<TR>";
    for (i=0; i<vFirstDay; i++) {
        vCode = vCode + "<TD" + this.write_weekend_string(i) + "><FONT SIZE='2' FACE='" + fontface + "'> </FONT></TD>";
    }

    // Write rest of the 1st week
    for (j=vFirstDay; j<7; j++) {
        vCode = vCode + "<TD" + this.write_weekend_string(j) + "><FONT SIZE='2' FACE='" + fontface + "'>" +
            "<A HREF='/' style='text-decoration:none' " +
                "onClick=\"self.opener.document." + this.gReturnItem + ".value='" +
                this.format_data(vDay) +
                "';window.close();\">" +
                this.format_day(vDay) +
            "</A>" +
            "</FONT></TD>";
        vDay=vDay + 1;
    }
    vCode = vCode + "</TR>";

    // Write the rest of the weeks
    for (k=2; k<7; k++) {
        vCode = vCode + "<TR>";

        for (j=0; j<7; j++) {
            vCode = vCode + "<TD" + this.write_weekend_string(j) + "><FONT SIZE='2' FACE='" + fontface + "'>" +
                "<A HREF='/' style='text-decoration:none' " +
                    "onClick=\"self.opener.document." + this.gReturnItem + ".value='" +
                    this.format_data(vDay) +
                    "';window.close();\">" +
                this.format_day(vDay) +
                "</A>" +
                "</FONT></TD>";
            vDay=vDay + 1;

            if (vDay > vLastDay) {
                vOnLastDay = 1;
                break;
            }
        }

        if (j == 6)
            vCode = vCode + "</TR>";
        if (vOnLastDay == 1)
            break;
    }

    // Fill up the rest of last week with proper blanks, so that we get proper square blocks
    for (m=1; m<(7-j); m++) {
        if (this.gYearly)
            vCode = vCode + "<TD" + this.write_weekend_string(j+m) +
            "><FONT SIZE='2' FACE='" + fontface + "' COLOR='gray'> </FONT></TD>";
        else
            vCode = vCode + "<TD" + this.write_weekend_string(j+m) +
           "><FONT SIZE='2' FACE='" + fontface + "' COLOR='gray'>"  + "</FONT></TD>";
    }

    return vCode;
}

Calendar.prototype.format_day = function(vday) {
    var vNowDay = gNow.getDate();
    var vNowMonth = gNow.getMonth();
    var vNowYear = gNow.getFullYear();

    if (vday == vNowDay && this.gMonth == vNowMonth && this.gYear == vNowYear)
        return ("<FONT COLOR=\"RED\"><B>" + vday + "</B></FONT>");
    else
        return (vday);
}

Calendar.prototype.write_weekend_string = function(vday) {
    var i;

    // Return special formatting for the weekend day.
    for (i=0; i<weekend.length; i++) {
        if (vday == weekend[i])
            return (" BGCOLOR=\"" + weekendColor + "\"");
    }

    return "";
}

Calendar.prototype.format_data = function(p_day) {
    var vData;
    var vMonth = 1 + this.gMonth;
    vMonth = (vMonth.toString().length < 2) ? "0" + vMonth : vMonth;
    var vMon = Calendar.get_month(this.gMonth).substr(0,3).toUpperCase();
    var vFMon = Calendar.get_month(this.gMonth).toUpperCase();
    var vY4 = new String(this.gYear);
    var vY2 = new String(this.gYear.substr(2,2));
    var vDD = (p_day.toString().length < 2) ? "0" + p_day : p_day;

    switch (this.gFormat) {
        case "MM\/DD\/YYYY" :
            vData = vMonth + "\/" + vDD + "\/" + vY4;
            break;
        case "MM\/DD\/YY" :
            vData = vMonth + "\/" + vDD + "\/" + vY2;
            break;
        case "MM-DD-YYYY" :
            vData = vMonth + "-" + vDD + "-" + vY4;
            break;
        case "MM-DD-YY" :
            vData = vMonth + "-" + vDD + "-" + vY2;
            break;

        case "DD\/MON\/YYYY" :
            vData = vDD + "\/" + vMon + "\/" + vY4;
            break;
        case "DD\/MON\/YY" :
            vData = vDD + "\/" + vMon + "\/" + vY2;
            break;
        case "DD-MON-YYYY" :
            vData = vDD + "-" + vMon + "-" + vY4;
            break;
        case "DD-MON-YY" :
            vData = vDD + "-" + vMon + "-" + vY2;
            break;

        case "DD\/MONTH\/YYYY" :
            vData = vDD + "\/" + vFMon + "\/" + vY4;
            break;
        case "DD\/MONTH\/YY" :
            vData = vDD + "\/" + vFMon + "\/" + vY2;
            break;
        case "DD-MONTH-YYYY" :
            vData = vDD + "-" + vFMon + "-" + vY4;
            break;
        case "DD-MONTH-YY" :
            vData = vDD + "-" + vFMon + "-" + vY2;
            break;

        case "DD\/MM\/YYYY" :
            vData = vDD + "\/" + vMonth + "\/" + vY4;
            break;
        case "DD\/MM\/YY" :
            vData = vDD + "\/" + vMonth + "\/" + vY2;
            break;
        case "DD-MM-YYYY" :
            vData = vDD + "-" + vMonth + "-" + vY4;
            break;
        case "DD-MM-YY" :
            vData = vDD + "-" + vMonth + "-" + vY2;
            break;

        default :
            vData = vMonth + "\/" + vDD + "\/" + vY4;
    }

    return vData;
}

function Build(p_item, p_month, p_year, p_format) {
    var p_WinCal = ggWinCal;
    gCal = new Calendar(p_item, p_WinCal, p_month, p_year, p_format);

    // Customize your Calendar here..
    gCal.gBGColor="white";
    gCal.gLinkColor="black";
    gCal.gTextColor="black";
    gCal.gHeaderColor="darkgreen";

    // Choose appropriate show function
    if (gCal.gYearly)    gCal.showY();
    else    gCal.show();
}

function show_calendar() {
    /*
        p_month : 0-11 for Jan-Dec; 12 for All Months.
        p_year    : 4-digit year
        p_format: Date format (dd/mm/yyyy, dd/mm/yy, ...)
        p_item    : Return Item.
    */

    p_item = arguments[0];
    if (arguments[1] == null)
        p_month = new String(gNow.getMonth());
    else
        p_month = arguments[1];
    if (arguments[2] == "" || arguments[2] == null)
        p_year = new String(gNow.getFullYear().toString());
    else
        p_year = arguments[2];
    if (arguments[3] == null)
        p_format = "DD/MM/YYYY";
    else
        p_format = arguments[3];

    vWinCal = window.open("", "Calendar",
        "width=240,height=190,status=no,resizable=yes,top=200,left=200");
    vWinCal.opener = self;
    ggWinCal = vWinCal;

    Build(p_item, p_month, p_year, p_format);
}
/*
Yearly Calendar Code Starts here
*/
function show_yearly_calendar(p_item, p_year, p_format) {
    // Load the defaults..
    if (p_year == null || p_year == "")
        p_year = new String(gNow.getFullYear().toString());
    if (p_format == null || p_format == "")
        p_format = "DD/MM/YYYY";

    var vWinCal = window.open("", "Calendar", "scrollbars=yes,status=no");
    vWinCal.opener = self;
    ggWinCal = vWinCal;

    Build(p_item, null, p_year, p_format);
}
// Função para criar janelas com div's e suporte a drag an drop


//*****************************************************************************
// Do not remove this notice.
//
// Copyright 2001 by Mike Hall.
// See http://www.brainjar.com for terms of use.
//*****************************************************************************

// Determine browser and version.

function Browser() {

  var ua, s, i;

  this.isIE    = false;  // Internet Explorer
  this.isNS    = false;  // Netscape
  this.version = null;

  ua = navigator.userAgent;

  s = "MSIE";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isIE = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }

  s = "Netscape6/";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isNS = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }

  // Treat any other "Gecko" browser as NS 6.1.

  s = "Gecko";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isNS = true;
    this.version = 6.1;
    return;
  }
}

var browser = new Browser();

//=============================================================================
// Window Object
//=============================================================================

function Window(el) {

  var i, mapList, mapName;

  // Get window components.

  this.frame                  = el;
  this.titleBar               = winFindByClassName(el, "titleBar");
  this.titleBarText           = winFindByClassName(el, "titleBarText");
  this.titleBarButtons        = winFindByClassName(el, "titleBarButtons");
  this.clientArea             = winFindByClassName(el, "clientArea");
  this.restoreFrameWidth      = this.frame.style.width;
  this.restoreTextWidth       = this.titleBarText.style.width;
  this.restoreClientArea      = this.clientArea.style.width;
  this.clientArea.style.width = "0px";
  this.tgtelid                = el;  
  // Find matching button image map.

  mapName = this.titleBarButtons.useMap.substr(1);
  mapList = document.getElementsByTagName("MAP");
  for (i = 0; i < mapList.length; i++)
    if (mapList[i].name == mapName)
      this.titleBarMap = mapList[i];

  // Save colors.

  this.activeFrameBackgroundColor  = this.frame.style.backgroundColor;
  this.activeFrameBorderColor      = this.frame.style.borderColor;
  this.activeTitleBarColor         = this.titleBar.style.backgroundColor;
  this.activeTitleTextColor        = this.titleBar.style.color;
  this.activeClientAreaBorderColor = this.clientArea.style.borderColor;
  if (browser.isIE)
    this.activeClientAreaScrollbarColor = this.clientArea.style.scrollbarBaseColor;

  // Save images.

  this.activeButtonsImage   = this.titleBarButtons.src;
  this.inactiveButtonsImage = this.titleBarButtons.longDesc;

  // Set flags.

  this.isOpen      = false;
  this.isMinimized = false;

  // Set methods.

  this.open       = winOpen;
  this.close      = winClose;
  this.minimize   = winMinimize;
  this.restore    = winRestore;
  this.makeActive = winMakeActive;

  // Set up event handling.

  this.frame.parentWindow = this;
  this.frame.onmousemove  = winResizeCursorSet;
  this.frame.onmouseout   = winResizeCursorRestore;
  this.frame.onmousedown  = winResizeDragStart;

  this.titleBar.parentWindow = this;
  this.titleBar.onmousedown  = winMoveDragStart;

  this.clientArea.parentWindow = this;
  this.clientArea.onclick      = winClientAreaClick;

  for (i = 0; i < this.titleBarMap.childNodes.length; i++)
    if (this.titleBarMap.childNodes[i].tagName == "AREA")
      this.titleBarMap.childNodes[i].parentWindow = this;

  // Calculate the minimum width and height values for resizing
  // and fix any initial display problems.

  var initLt, initWd, w, dw;

  // Save the inital frame width and position, then reposition
  // the window.

  initLt = this.frame.style.left;
  initWd = parseInt(this.frame.style.width);
  this.frame.style.left = -this.titleBarText.offsetWidth + "px";

  // For IE, start calculating the value to use when setting
  // the client area width based on the frame width.

  if (browser.isIE) {
    this.titleBarText.style.display = "none";
    w = this.clientArea.offsetWidth;
    this.widthDiff = this.frame.offsetWidth - w;
    this.clientArea.style.width = w + "px";
    dw = this.clientArea.offsetWidth - w;
    w -= dw;
    this.widthDiff += dw;
    this.titleBarText.style.display = "";
  }

  // Find the difference between the frame's style and offset
  // widths. For IE, adjust the client area/frame width
  // difference accordingly.

  w = this.frame.offsetWidth;
  this.frame.style.width = w + "px";
  dw = this.frame.offsetWidth - w;
  w -= dw;
  this.frame.style.width = w + "px";
  if (browser.isIE)
    this.widthDiff -= dw;

  // Find the minimum width for resize.

  this.isOpen = true;  // Flag as open so minimize call will work.
  this.minimize();
  // Get the minimum width.
  if (browser.isNS && browser.version >= 1.2)
    // For later versions of Gecko.
    this.minimumWidth = this.frame.offsetWidth;
  else
    // For all others.
    this.minimumWidth = this.frame.offsetWidth - dw;

  // Find the frame width at which or below the title bar text will
  // need to be clipped.

  this.titleBarText.style.width = "";
  this.clipTextMinimumWidth = this.frame.offsetWidth - dw;

  // Set the minimum height.

  this.minimumHeight = 1;

  // Restore window. For IE, set client area width.

  this.restore();
  this.isOpen = false;  // Reset flag.
  initWd = Math.max(initWd, this.minimumWidth);
  this.frame.style.width = initWd + "px";
  if (browser.isIE)
    this.clientArea.style.width = (initWd - this.widthDiff) + "px";

  // Clip the title bar text if needed.

  if (this.clipTextMinimumWidth >= this.minimumWidth)
    this.titleBarText.style.width = (winCtrl.minimizedTextWidth + initWd - this.minimumWidth) + "px";

  // Restore the window to its original position.

  this.frame.style.left = initLt;
}

//=============================================================================
// Window Methods
//=============================================================================

function winOpen() {

  if (this.isOpen)
    return;

  // Restore the window and make it visible.

  this.makeActive();
  this.isOpen = true;
  if (this.isMinimized)
  this.restore();
  this.frame.style.width = this.restoreFrameWidth;
  this.titleBarText.style.width = this.restoreTextWidth;
  this.frame.style.visibility = "visible";
  this.clientArea.style.width = this.restoreClientArea;
  this.tgtel = null;
}

function winClose() {

  // Hide the window.
  this.topold = this.frame.style.top;
  this.restoreFrameWidth = this.frame.style.width;
  this.restoreTextWidth = this.titleBarText.style.width;
 // this.frame.style.top = 0;
  this.frame.style.width = "0px";
  this.titleBarText.style.width = "0px";
  this.frame.style.visibility = "hidden";
  this.isOpen = false;
}

function winMinimize() {

  if (!this.isOpen || this.isMinimized)
    return;

  this.makeActive();

  // Save current frame and title bar text widths.

  this.restoreFrameWidth = this.frame.style.width;
  this.restoreTextWidth = this.titleBarText.style.width;
     // Disable client area display.
   this.clientArea.style.display = "none";

  // Minimize frame and title bar text widths.

  if (this.minimumWidth)
    this.frame.style.width = this.minimumWidth + "px";
  else
    this.frame.style.width = "";
  this.titleBarText.style.width = winCtrl.minimizedTextWidth + "px";

  this.isMinimized = true;
}

function winRestore() {

  if (!this.isOpen || !this.isMinimized)
    return;

  this.makeActive();

  // Enable client area display.

  this.clientArea.style.display = "";

  // Restore frame and title bar text widths.

  this.frame.style.width = this.restoreFrameWidth;
  this.titleBarText.style.width = this.restoreTextWidth;
  this.frame.style.top = this.topold;
  //this.frame.style.left = this.leftold;
  this.isMinimized = false;
}

function winMakeActive() {

  if (winCtrl.active == this)
    return;

  // Inactivate the currently active window.

  if (winCtrl.active) {
    winCtrl.active.frame.style.backgroundColor    = winCtrl.inactiveFrameBackgroundColor;
    winCtrl.active.frame.style.borderColor        = winCtrl.inactiveFrameBorderColor;
    winCtrl.active.titleBar.style.backgroundColor = winCtrl.inactiveTitleBarColor;
    winCtrl.active.titleBar.style.color           = winCtrl.inactiveTitleTextColor;
    winCtrl.active.clientArea.style.borderColor   = winCtrl.inactiveClientAreaBorderColor;
    if (browser.isIE)
      winCtrl.active.clientArea.style.scrollbarBaseColor = winCtrl.inactiveClientAreaScrollbarColor;
    if (browser.isNS && browser.version < 6.1)
      winCtrl.active.clientArea.style.overflow = "hidden";
    if (winCtrl.active.inactiveButtonsImage)
      winCtrl.active.titleBarButtons.src = winCtrl.active.inactiveButtonsImage;
  }

  // Activate this window.

  this.frame.style.backgroundColor    = this.activeFrameBackgroundColor;
  this.frame.style.borderColor        = this.activeFrameBorderColor;
  this.titleBar.style.backgroundColor = this.activeTitleBarColor;
  this.titleBar.style.color           = this.activeTitleTextColor;
  this.clientArea.style.borderColor   = this.activeClientAreaBorderColor;
  if (browser.isIE)
    this.clientArea.style.scrollbarBaseColor = this.activeClientAreaScrollbarColor;
  if (browser.isNS && browser.version < 6.1)
    this.clientArea.style.overflow = "auto";
  if (this.inactiveButtonsImage)
    this.titleBarButtons.src = this.activeButtonsImage;
  this.frame.style.zIndex = ++winCtrl.maxzIndex;
  winCtrl.active = this;
}

//=============================================================================
// Event handlers.
//=============================================================================

function winClientAreaClick(event) {

  // Make this window the active one.

  this.parentWindow.makeActive();
}

//-----------------------------------------------------------------------------
// Window dragging.
//-----------------------------------------------------------------------------

function winMoveDragStart(event) {

  var target;
  var x, y;

  if (browser.isIE)
    target = window.event.srcElement.tagName;
   // tgtel  = window.event.srcElement;
  if (browser.isNS)
    target = event.target.tagName;
    this.tgtel  = event.target;
  if (target == "AREA")
    return;

  this.parentWindow.makeActive();
  // Get cursor offset from window frame.

  if (browser.isIE) {
    x = window.event.x;
    y = window.event.y;
  }
  if (browser.isNS) {
    x = event.pageX;
    y = event.pageY;
  }
  winCtrl.xOffset = winCtrl.active.frame.offsetLeft - x;
  winCtrl.yOffset = winCtrl.active.frame.offsetTop  - y;

  // Set document to capture mousemove and mouseup events.

  if (browser.isIE) {
    document.onmousemove = winMoveDragGo;
    document.onmouseup   = winMoveDragStop;
  }
  if (browser.isNS) {
    document.addEventListener("mousemove", winMoveDragGo,   true);
    document.addEventListener("mouseup",   winMoveDragStop, true);
    event.preventDefault();
  }

  winCtrl.inMoveDrag = true;
}

function winMoveDragGo(event) {

  var x, y;

  if (!winCtrl.inMoveDrag)
    return;

  // Get cursor position.

  if (browser.isIE) {
    x = window.event.x;
    y = window.event.y;
    window.event.cancelBubble = true;
    window.event.returnValue = false;
  }
  if (browser.isNS) {
    x = event.pageX;
    y = event.pageY;
    event.preventDefault();
  }

  // Move window frame based on offset from cursor.

  winCtrl.active.frame.style.left = (x + winCtrl.xOffset) + "px";
  winCtrl.active.frame.style.top  = (y + winCtrl.yOffset) + "px";
}

function winMoveDragStop(event) {

  winCtrl.inMoveDrag = false;
  
  // Remove mousemove and mouseup event captures on document.
  //document.getElementById('janela').className="window";
  if (browser.isIE) {
    document.onmousemove = null;
    document.onmouseup   = null;
  }
  if (browser.isNS) {
    document.removeEventListener("mousemove", winMoveDragGo,   true);
    document.removeEventListener("mouseup",   winMoveDragStop, true);
  }
}

//-----------------------------------------------------------------------------
// Window resizing.
//-----------------------------------------------------------------------------

function winResizeCursorSet(event) {

  var target;
  var xOff, yOff;

  if (this.parentWindow.isMinimized || winCtrl.inResizeDrag)
    return;

  // If not on window frame, restore cursor and exit.

  if (browser.isIE)
    target = window.event.srcElement;
  if (browser.isNS)
    target = event.target;
  if (target != this.parentWindow.frame)
    return;

  // Find resize direction.

  if (browser.isIE) {
    xOff = window.event.offsetX;
    yOff = window.event.offsetY;
  }
  if (browser.isNS) {
    xOff = event.layerX;
    yOff = event.layerY;
  }
  winCtrl.resizeDirection = ""
  if (yOff <= winCtrl.resizeCornerSize)
    winCtrl.resizeDirection += "n";
  else if (yOff >= this.parentWindow.frame.offsetHeight - winCtrl.resizeCornerSize)
    winCtrl.resizeDirection += "s";
  if (xOff <= winCtrl.resizeCornerSize)
    winCtrl.resizeDirection += "w";
  else if (xOff >= this.parentWindow.frame.offsetWidth - winCtrl.resizeCornerSize)
    winCtrl.resizeDirection += "e";

  // If not on window edge, restore cursor and exit.

  if (winCtrl.resizeDirection == "") {
    this.onmouseout(event);
    return;
  }

  // Change cursor.

  if (browser.isIE)
    document.body.style.cursor = winCtrl.resizeDirection + "-resize";
  if (browser.isNS)
    this.parentWindow.frame.style.cursor = winCtrl.resizeDirection + "-resize";
}

function winResizeCursorRestore(event) {

  if (winCtrl.inResizeDrag)
    return;

  // Restore cursor.

  if (browser.isIE)
    document.body.style.cursor = "";
  if (browser.isNS)
    this.parentWindow.frame.style.cursor = "";
}

function winResizeDragStart(event) {

  var target;

  // Make sure the event is on the window frame.

  if (browser.isIE)
    target = window.event.srcElement;
  if (browser.isNS)
    target = event.target;
  if (target != this.parentWindow.frame)
    return;

  this.parentWindow.makeActive();

  if (this.parentWindow.isMinimized)
    return;

  // Save cursor position.

  if (browser.isIE) {
    winCtrl.xPosition = window.event.x;
    winCtrl.yPosition = window.event.y;
  }
  if (browser.isNS) {
    winCtrl.xPosition = event.pageX;
    winCtrl.yPosition = event.pageY;
  }

  // Save window frame position and current window size.

  winCtrl.oldLeft   = parseInt(this.parentWindow.frame.style.left,  10);
  winCtrl.oldTop    = parseInt(this.parentWindow.frame.style.top,   10);
  winCtrl.oldWidth  = parseInt(this.parentWindow.frame.style.width, 10);
  winCtrl.oldHeight = parseInt(this.parentWindow.clientArea.style.height, 10);

  // Set document to capture mousemove and mouseup events.

  if (browser.isIE) {
    document.onmousemove = winResizeDragGo;
    document.onmouseup   = winResizeDragStop;
  }
  if (browser.isNS) {
    document.addEventListener("mousemove", winResizeDragGo,   true);
    document.addEventListener("mouseup"  , winResizeDragStop, true);
    event.preventDefault();
  }

  winCtrl.inResizeDrag = true;
}

function winResizeDragGo(event) {

 var north, south, east, west;
 var dx, dy;
 var w, h;

  if (!winCtrl.inResizeDrag)
    return;

  // Set direction flags based on original resize direction.

  north = false;
  south = false;
  east  = false;
  west  = false;
  if (winCtrl.resizeDirection.charAt(0) == "n")
    north = true;
  if (winCtrl.resizeDirection.charAt(0) == "s")
    south = true;
  if (winCtrl.resizeDirection.charAt(0) == "e" || winCtrl.resizeDirection.charAt(1) == "e")
    east = true;
  if (winCtrl.resizeDirection.charAt(0) == "w" || winCtrl.resizeDirection.charAt(1) == "w")
    west = true;

  // Find change in cursor position.

  if (browser.isIE) {
    dx = window.event.x - winCtrl.xPosition;
    dy = window.event.y - winCtrl.yPosition;
  }
  if (browser.isNS) {
    dx = event.pageX - winCtrl.xPosition;
    dy = event.pageY - winCtrl.yPosition;
  }

  // If resizing north or west, reverse corresponding amount.

  if (west)
    dx = -dx;
  if (north)
    dy = -dy;

  // Check new size.

  w = winCtrl.oldWidth  + dx;
  h = winCtrl.oldHeight + dy;
  if (w <= winCtrl.active.minimumWidth) {
    w = winCtrl.active.minimumWidth;
    dx = w - winCtrl.oldWidth;
  }
  if (h <= winCtrl.active.minimumHeight) {
    h = winCtrl.active.minimumHeight;
    dy = h - winCtrl.oldHeight;
  }

  // Resize the window. For IE, keep client area and frame widths in synch.

  if (east || west) {
    winCtrl.active.frame.style.width = w + "px";
    if (browser.isIE)
      winCtrl.active.clientArea.style.width = (w - winCtrl.active.widthDiff) + "px";
  }
  if (north || south)
    winCtrl.active.clientArea.style.height = h + "px";

  // Clip the title bar text, if necessary.

  if (east || west) {
    if (w < winCtrl.active.clipTextMinimumWidth)
      winCtrl.active.titleBarText.style.width = (winCtrl.minimizedTextWidth + w - winCtrl.active.minimumWidth) + "px";
    else
      winCtrl.active.titleBarText.style.width = "";
  }

  // For a north or west resize, move the window.

  if (west)
    winCtrl.active.frame.style.left = (winCtrl.oldLeft - dx) + "px";
  if (north)
    winCtrl.active.frame.style.top  = (winCtrl.oldTop  - dy) + "px";

  if (browser.isIE) {
    window.event.cancelBubble = true;
    window.event.returnValue = false;
  }
  if (browser.isNS)
    event.preventDefault();
}

function winResizeDragStop(event) {

  winCtrl.inResizeDrag = false;

  // Remove mousemove and mouseup event captures on document.

  if (browser.isIE) {
    document.onmousemove = null;
    document.onmouseup   = null;
  }
  if (browser.isNS) {
    document.removeEventListener("mousemove", winResizeDragGo,   true);
    document.removeEventListener("mouseup"  , winResizeDragStop, true);
  }
}

//=============================================================================
// Utility functions.
//=============================================================================

function winFindByClassName(el, className) {

  var i, tmp;

  if (el.className == className)
    return el;

  // Search for a descendant element assigned the given class.

  for (i = 0; i < el.childNodes.length; i++) {
    tmp = winFindByClassName(el.childNodes[i], className);
    if (tmp != null)
      return tmp;
  }

  return null;
}

//=============================================================================
// Initialization code.
//=============================================================================

var winList = new Array();
var winCtrl = new Object();

function winInit() {

  var elList;

  // Initialize window control object.

  winCtrl.maxzIndex                        = 102;
  winCtrl.resizeCornerSize                 =  16;
  winCtrl.minimizedTextWidth               = 100;
  winCtrl.inactiveFrameBackgroundColor     = "/c0c0c0";
  winCtrl.inactiveFrameBorderColor         = "/f0f0f0 /505050 /404040 /e0e0e0";
  winCtrl.inactiveTitleBarColor            = "/808080";
  winCtrl.inactiveTitleTextColor           = "/c0c0c0";
  winCtrl.inactiveClientAreaBorderColor    = "/404040 /e0e0e0 /f0f0f0 /505050";
  winCtrl.inactiveClientAreaScrollbarColor = "";
  winCtrl.inMoveDrag                       = false;
  winCtrl.inResizeDrag                     = false;

  // Initialize windows and build list.

  elList = document.getElementsByTagName("DIV");
  for (var i = 0; i < elList.length; i++)
    if (elList[i].className == "window")
      winList[elList[i].id] = new Window(elList[i]);
    }

window.onload = winInit();  


function getTextValue(el) {

  var i;
  var s;

    s = "";
  for (i = 0; i < el.childNodes.length; i++)
    if (el.childNodes[i].nodeType == document.TEXT_NODE)
      s += el.childNodes[i].nodeValue;
    else if (el.childNodes[i].nodeType == document.ELEMENT_NODE &&
             el.childNodes[i].tagName == "BR")
      s += " ";
    else
      
      s += getTextValue(el.childNodes[i]);

  return tira_espaco(s);
}

var whtSpEnds = new RegExp("^\\s*|\\s*$", "g");
var whtSpMult = new RegExp("\\s\\s+", "g");

function tira_espaco(s) {

  s = s.replace(whtSpMult, " ");  
  s = s.replace(whtSpEnds, "");   
                                 
  return s;
}

function comparar(v1, v2) {

  var f1, f2;

  

  f1 = parseFloat(v1);
  f2 = parseFloat(v2);
  if (!isNaN(f1) && !isNaN(f2)) {
    v1 = f1;
    v2 = f2;
  }

  if (v1 == v2)
    return 0;
  if (v1 > v2)
    return 1
  return -1;
}

function sortTable(col) {

   
  var tblEl = document.getElementById("tbcorpo");


  if (tblEl.reverseSort == null)
    tblEl.reverseSort = new Array();

  if (col == tblEl.lastColumn)
    tblEl.reverseSort[col] = !tblEl.reverseSort[col];


  tblEl.lastColumn = col;

  
  var oldDsply = tblEl.style.display;
  tblEl.style.display = "none";


  var tmpEl;
  var i, j;
  var minVal, minIdx;
  var testVal;
  var cmp;

  for (i = 0; i < tblEl.rows.length - 1; i++) {

    minIdx = i;
    minVal = getTextValue(tblEl.rows[i].cells[col]);

    for (j = i + 1; j < tblEl.rows.length; j++) {
      testVal = getTextValue(tblEl.rows[j].cells[col]);
      cmp = comparar(minVal, testVal);
      
      if (tblEl.reverseSort[col])
        cmp = -cmp;
     
      if (cmp > 0) {
        minIdx = j;
        minVal = testVal;
      }
    }
    if (minIdx > i) {
      tmpEl = tblEl.removeChild(tblEl.rows[minIdx]);
      tblEl.insertBefore(tmpEl, tblEl.rows[i]);
    }
  }
  tblEl.style.display = oldDsply;
  return false;
}

function proximo2(item,e){
      // var i = document.getElementById(item).childnodes;
        //alert(e.which); 
          if (e.which == 40){
           if (item.nextSibling.nodeName=='A'){
               if (item.nextSibling != null)
                  item.nextSibling.focus();
           }else{
               if (item.nextSibling.nextSibling != null)
                  item.nextSibling.nextSibling.focus();
           }
         }else if (e.which == 38){
           if (item.previousSibling.nodeName=='A'){
               if (item.previousSibling != null)
                  item.previousSibling.focus();
           }else{
               if (item.previousSibling.previousSibling != null )
                  item.previousSibling.previousSibling.focus();
           }
       }
       if (e.which == 13){
          item.click();
       }
       
       
       
}

 function cpicker(x,y,field){
    x +=10;      
    y +=10;
    window.cp.location.href='libs/cpicker.php?field='+field;
    //alert(cpicker.location.href);
    document.getElementById('cpicker').style.left=x+'px';
    document.getElementById('cpicker').style.top=y+'px';
    document.getElementById('cpicker').style.visibility='visible';
    
  }
  function cpicker_close(){
    document.getElementById('cpicker').style.visibility='hidden';
  
  }
  
  function js_completa(Cchave,campo,chave,valor,div){
         document.getElementById(Cchave).value = chave;
         document.getElementById(campo).value = valor;
         document.getElementById(div).innerHTML='';
         document.getElementById(div).style.visibility='hidden';
    }
    
 function doResize(item,evt,thgrid){
		    
		    this.thgrid = document.getElementById(thgrid);
		    this.lastCol = this.thgrid.rows[0].cells.length
		    this.column = null 
			this.el     = item;
			this.size   = el.offsetWidth;
			this.pos    = evt.clientX;
			this.sz     = size + evt.clientX - pos;
			//el.style.width = sz < 5 ? 5 : sz;
			
			//alert(this.thgrid.rows.length);
			for (i = 0;i < this.thgrid.rows.length;i++){
			    for (j = 0;j < this.thgrid.rows[0].cells.length;j++){
			        if (item.innerHTML == this.thgrid.rows[0].cells[j].innerHTML){
			            if (this.thgrid.rows[0].cells[j].id != 'lstColunasgrid'){
			                 item.style.cursor='e-resize';
			                this.column = j;
			                this.m = true;
			            }    
			        }  
			          // alert('ok');
			    }
			}
			//alert(this.column);
			        
		}
		
      function tResize(item,evt){
          this.m = false;
          item.style.cursor='';
          
      }
      function moveResize(item,evt,tbgrid){
          layer = document.getElementById('teste');
          this.tbgrid = document.getElementById(tbgrid);
          tbpai = document.getElementById('tbpai');
          if (this.m == true){
              x = evt.clientX;
              this.sz = size + evt.clientX - pos;
                
			    
			  //}
              item.style.width = this.sz < 5 ? 5 : this.sz+"px";
              
                
               document.getElementById('laddcolumn').style.top        =  y+'px'; 
               document.getElementById('laddcolumn').style.left       =  (x)+'px'; 
              
           }
      }
      
      function mostra_addcolumn(grid,evt){
        grdid = grid+'laddcolumn';
     if (document.getElementById(grdid).style.visibility == 'visible'){
      document.getElementById(grdid).style.visibility = 'hidden';
  }else{   
      layer = document.getElementById(grdid);
      document.getElementById(grdid).style.position   = 'absolute';  
      y = evt.clientY+8;
      x = evt.clientX-90;
      document.getElementById(grdid).style.top        =  y+'px'; 
      document.getElementById(grdid).style.left       =  (x)+'px'; 
      document.getElementById(grdid).style.visibility = 'visible';
  }
}
function addRemColumn(item,grid){
    
    tbgrid = document.getElementById(grid);
   
    if (item.checked == true){    
        column = item.value;
        for (k = 0;k < tbgrid.rows.length;k++){
            
            if (tbgrid.rows[k].cells[column]){ //Evitando que de erro ao tentar dar um display:none no footer
                tbgrid.rows[k].cells[column].style.display = ''; 
            }   

        }
    }else{
        column = item.value;
        for (k = 0;k < tbgrid.rows.length;k++){
           if (tbgrid.rows[k].cells[column]){
               tbgrid.rows[k].cells[column].style.display = 'none'; 
           }
		    
        }
    }
    document.getElementById(grid+'laddcolumn').style.visibility = 'hidden';
}
function showContext(evt,mnu){
    
     document.getElementById(mnu).style.top = evt.clientY +'px';
     document.getElementById(mnu).style.left = evt.clientX +'px';
     document.getElementById(mnu).style.visibility="visible";
}     

/////////////////////////////////////////
//Maximiza o tamanho da coluna no DbClick//
/////////////////////////////////////////
function maxSizeColumn(item,grid){
    
     tbgrid = document.getElementById(grid);
     column = item.id;
     max = 0;
     for (k = 0;k < tbgrid.rows.length;k++){
        if (tbgrid.rows[k].cells[column]){ //Evitando que de erro ao tentar dar um display:none no footer
            cur = tbgrid.rows[k].cells[column].childNodes[0].scrollWidth;
            if ( cur > max ){
                max = cur;
            }
        }   
     }
     item.width = (max+8);
     //tbpai = document.getElementById('tbpai');
     //tbpai.width +=this.sz;   
}
//function next(pag){
//    location.href='?pagina='+pag;
//}

function orderTable(col,grid) {

   
  var tblEl = document.getElementById(grid);


  if (tblEl.reverseSort == null)
    tblEl.reverseSort = new Array();

  if (col == tblEl.lastColumn)
    tblEl.reverseSort[col] = !tblEl.reverseSort[col];


  tblEl.lastColumn = col;

  
  var oldDsply = tblEl.style.display;
  tblEl.style.display = "none";


  var tmpEl;
  var i, j;
  var minVal, minIdx;
  var testVal;
  var cmp;

  for (i = 0; i < tblEl.rows.length - 1; i++) {

    minIdx = i;
    minVal = getTextValue(tblEl.rows[i].cells[col]);

    for (j = i + 1; j < tblEl.rows.length; j++) {
      testVal = getTextValue(tblEl.rows[j].cells[col]);
      cmp = comparar(minVal, testVal);
      
      if (tblEl.reverseSort[col])
        cmp = -cmp;
     
      if (cmp > 0) {
        minIdx = j;
        minVal = testVal;
      }
    }
    if (minIdx > i) {
      tmpEl = tblEl.removeChild(tblEl.rows[minIdx]);
      tblEl.insertBefore(tmpEl, tblEl.rows[i]);
    }
  }
  tblEl.style.display = oldDsply;
  return false;
}
function next(pag,frm){
    //alert(frm);
    frm.pagina.value = pag;
    frm.submit();
}
 function initPage() {
 	  //  if ($i('menu')){
      //  	mainmenu = DynarchMenu.setup('menu' ,{ shadows: false});
 	  //  }
}

/////////////////////////////////////
// Criando um Objeto MLHttpRequest //
/////////////////////////////////////

try{
    xmlhttp = new XMLHttpRequest();
}catch(ee){
    try{
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    }catch(e){
        try{
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }catch(E){
            xmlhttp = false;
        }
    }
}

function carrega(val,tkey,tvalue,ttable,wh,sufix,arq,event){
    if (sufix !=''){
        skey = sufix+tkey;
    }else{
        skey = tkey;   
    }
    tecla = document.all ? event.keyCode : event.which;
    //alert(tecla);
    //if (document.getElementById(skey).value == ""){
       iddiv = tvalue+tkey;   
       var conteudo=document.getElementById(iddiv);
       if (val.value.length >=3 && tecla !=9){
       conteudo.innerHTML='<div class="carregando">carregando...</div>';
       atual=val.value;
       setxy(val,iddiv);
       document.getElementById(iddiv).style.visibility='visible';
       //if (atual.length >=3 ){
          if (sufix){   
              xmlhttp.open("GET", 
                      arq+"?n="+atual+"&ttable="+ttable+"&tkey="+tkey+"&tvalue="+tvalue+"&wh="+wh+"&sufix="+sufix,true);
          }else{
              xmlhttp.open("GET", 
                      arq+"?n="+atual+"&ttable="+ttable+"&tkey="+tkey+"&tvalue="+tvalue+"&wh="+wh,true);
          }
       xmlhttp.onreadystatechange=function() {
       if (xmlhttp.readyState==4){
           var texto=xmlhttp.responseText
           texto=texto.replace(/\+/g," ")
           texto=unescape(texto)
           iddiv = tvalue+tkey
           var conteudo=document.getElementById(iddiv)
           conteudo.innerHTML=texto
            
       }
    }
    xmlhttp.send(null)
//}
}
}

function direto(id,tkey,tvalue,ttable,wh,sufix,arquivo){

     atual=id.value;
     xmlhttp.open("GET",arquivo+"?id="+atual+"&ttable="+ttable+"&tkey="+tkey+"&tvalue="+tvalue+"&wh="+wh,true);

    //Executada quando o navegador obtiver o código
    xmlhttp.onreadystatechange=function() {

        if (xmlhttp.readyState==4){

            //Lê o texto
            var texto=xmlhttp.responseText;

            //Desfaz o urlencode
            texto=texto.replace(/\+/g," ");
            texto=unescape(texto);
         
            if (sufix){
                var conteudo=document.getElementById(sufix+tvalue)
            }else{
                var conteudo=document.getElementById(tvalue)
            }
            
            regexp = new RegExp(' não encontrado');
            texto = new String(texto);
            if (regexp.test(texto)){
               id.value='';
               id.focus();
               
            }
            conteudo.value = texto;
                           
               
            
        }
    }
    xmlhttp.send(null)
}

function mostraDiv(item,div){
        if (item.value != ""){
            setxy(item,div);
    	    document.getElementById(div).style.visibility='visible';
        }
    

}


function setxy(item,div){
             x = getPageOffsetLeft(item);
             y = getPageOffsetTop(item)+20;
             document.getElementById(div).style.top=y+"px";
             document.getElementById(div).style.left=x+"px"
}
function getADate(){
    data = new Date();
     mes  = data.getMonth()+1;
     if (mes < 10){
        mes = "0"+mes;
     }
     dia = data.getDate();
     if (dia < 10){
         dia = "0"+dia;
     }
     ano = data.getYear();
     if(ano < 2000)  anof = 1900 + ano;
     else   anof = ano; 
     
     return anof+""+mes+""+dia;
}
function statusbar(msg){
   if (parent.rodape){
      parent.rodape.document.getElementById('messageboard').innerHTML= msg ==""?'&nbsp;':msg ;
   }else if( top.rodape){
     top.rodape.document.getElementById('messageboard').innerHTML=msg ==" "?'&nbsp;':msg;
   }
}
function $i(obj){
   	
   	return document.getElementById(obj);
  }
  
function addDate(date,years, months, days,treturn){
     
    pDay            = new Number();
    pMonth          = new Number();
    pYear           = new Number();
    nDay            = new Number();
    nMonth          = new Number();
    nYear           = new Number(); 
    month           = new Number();  
    dayOfMonths     = Array();
    dayOfMonths[1] = 31;
    dayOfMonths[2] = 28;
    dayOfMonths[3] = 31;
    dayOfMonths[4] = 30;
    dayOfMonths[5] = 31;
    dayOfMonths[6] = 30;
    dayOfMonths[7] = 31;
    dayOfMonths[8] = 31;
    dayOfMonths[9] = 30;
    dayOfMonths[10] = 31;
    dayOfMonths[11] = 30;
    dayOfMonths[12] = 31;
    
   if (date.indexOf('-') != -1){
		datepart = date.split('-');
		pYear    = datepart[2];
		pMonth   = datepart[1];
		pDay     = datepart[0];
    }else if (date.indexOf('/') != -1){
        datepart = date.split('/');
        pYear    = datepart[2];
		pMonth   = datepart[1];
		pDay     = datepart[0];
    }
    
    pDay = new Number (pDay);
    //adicionando os dias
    nDay = new Number();
    nDay   = (pDay+days);
    nYear  = pYear;
    nMonth = pMonth;
    days   = new Number(days);
    pMonth  = new Number(pMonth);
    nMonth = new Number(nMonth);
   
    if (days < 0){   
        
    	while (nDay <= pDay){    	       	        	       	        	    	     	       	    
    	    
        	nDay = nDay + dayOfMonths[nMonth];   	
        	nMonth--;        	          
        	if (nMonth > 12){
            	nYear--;
            	nMonth = 1;
         	}
         	
         
    	}   
    	if (nDay >= dayOfMonths[nMonth]){
    	
    	    if (dayOfMonths[nMonth] == 31){    		
    	    	nDay = nDay - dayOfMonths[nMonth];
        		nMonth = nMonth + 1;
    	    }else{   	    
    	       	
        		nMonth = nMonth + 1;
        		nDay = nDay - dayOfMonths[nMonth];
    	    }
        	
         		
    	 }      
    }else{
    
    	while (nDay > dayOfMonths[nMonth]){
        	nDay = nDay - dayOfMonths[nMonth];
        	nMonth ++;
       
        	if (nMonth > 12){
            	nYear++;
            	nMonth = 1;
         	}        
         
    	}
     }
     nMonth = new Number(nMonth);
     nMonth = nMonth+months;
     if (nMonth > 12){
         
       	 nMonth = (nMonth-12); 
       	nYear++;
         
     }
     nYear = new Number(nYear);
     nYear = eval(nYear + years);
     if ((nYear % 4 == 0 && nYear % 100 != 0) || nYear % 400 == 0){
         if (nMonth > 2){
              nDay = nDay +1;
              while (nDay > dayOfMonths[nMonth]){
          	  nDay = nDay - dayOfMonths[nMonth];
        	  nMonth ++;
       		  if (nMonth > 12){
                  nYear++;
                 nMonth = 1;
              }                
           }
        }
      }
      //alert(nDay);
      nDay   = new String(nDay);
      nMonth = new String(nMonth);
      nYear  = new String(nYear);
      nDay   = nDay.length < 2 ?'0'+nDay:nDay;
      nMonth = nMonth.length < 2 ?'0'+nMonth:nMonth;
      if (treturn == 'br'){
     	  return nDay+'/'+nMonth+'/'+nYear;
      }else if (treturn == 'en'){
          return nYear+nMonth+(nDay);
      }
}

//Converte urlencode (php) para string js
function prepare(str){
	     
    strpre = str.replace(/\+/g," ");
    strpre = unescape(strpre);
    return strpre;
}

function js_comparadata(data1,data2){
	
	if (data1.indexOf('/') != -1){
        datepart = data1.split('/');
        pYear    = datepart[2];
		pMonth   = datepart[1];
		pDay     = datepart[0];
	}
	  data1 = new Date(pYear,pMonth,pDay);
      data1 = data1.getTime();      
      
	if (data2.indexOf('/') != -1){
        datepart = data2.split('/');
        pYear    = datepart[2];
		pMonth   = datepart[1];
		pDay     = datepart[0];
	}
	nDay   = new String(pDay);
    nMonth = new String(pMonth);
    nYear  = new String(pYear);
    data2 = new Date(pYear,pMonth,pDay);
    data2 = data2.getTime();    
    if (data1 > data2){
    		
       return false;
      
     }else{
     	return true;
     }
}

/*******************************************************
dmsAutoComplete v1.1
Copyright (C) 2006 Rafael Dohms.
**************************

Author:
	Rafael Dohms (rafael at rafaeldohms dot com dot br)
	http://www.rafaeldohms.com.br
Baseado em conceito por: (concept by) 
	joekepley at yahoo (dot) com

*******************************************************
en:
This is an AJAX implementation of a auto-complete/auto-
suggest script. It uses PHP to return a XML result list
and displays it in a div for selection.

pt_br:
Este script é uma implementação AJAX de um script de
auto-compleção/auto-sugestão, similar o utilizado pelo
Google. Ele usa um backend PHP que retorna um XML de 
resultados mostrados em um DIV para seleção
*******************************************************/
/******************************************************
Change Log:

v1.1
- Adaptação para remover limite de "nome do objeto"
- Alteração CSS para quebras de linha no FireFox
- FIX: apertar TAB/ENTER sem nada escolhido gerava erro

*******************************************************/
/******************************************************
USAGE:
----> example.htm
----> http://www.rafaeldohms.com.br/myprojects/autocomplete/example.htm

<script>
//Instanciar objeto
var AC = new dmsAutoComplete('string','acDiv');

//Definir função de retorno
AC.chooseFunc = function(id,label){
	alert(id+'-'+label);
}
</script>
*******************************************************/

function dmsAutoComplete(elem,divname,ajax){
	
	var me           = this;
	this.elem        = document.getElementById(elem);
	this.highlighted = -1;
	this.arrItens    = new Array();
	this.ajaxTarget  = ajax;
	this.ttable      = null;
	this.tkey        = null;
	this.tvalue      = null;
	this.twh         = null;
	this.chooseFunc  = null; //Função para executar com obj selecionado
	this.div = document.getElementById(divname);
   // alert(this.div);
	//Keycodes que devem ser monitorados
	var TAB = 9;
	var ESC = 27;
	var KEYUP = 38;
	var KEYDN = 40;
	var ENTER = 13;
	//Tamanho do DIV = Tamanho do campo
	this.div.style.width = this.elem.style.width;
	
	//Desabilitar autocomplete IE
	me.elem.setAttribute("autocomplete","off");
	
	//Crate AJAX Request
	this.ajaxReq = createRequest();
    
	//Ação a ser executada no KEYDOWN (funções de navegação)
	me.elem.onkeydown = function(ev)
	{
		var key = me.getKeyCode(ev);
        
		switch(key)
		{
			case TAB:
				return true;
			break;
			case ENTER:
				if (me.highlighted.id != undefined){
					me.acChoose(me.highlighted.id);
				}
				me.hideDiv();
				return false;
			break;

			case ESC:
				me.hideDiv();
				return false;
			break;

			case KEYUP:
				me.changeHighlight('up');
				return false;
			break;

			case KEYDN:
				me.changeHighlight('down');
				return false;
			break;
		}
		
	};
	
	this.setElemValue = function(){
		var a = me.highlighted.firstChild;
		me.elem.value = a.innerHTML;
	}
	
	this.highlightThis = function(obj,yn){
		if (yn = 'y'){
			me.highlighted.className = '';
			me.highlighted = obj;
			me.highlighted.className = 'selected';
			
			me.setElemValue(obj);
			
		}else{
			obj.className = '';
			me.highlighted = '';
		}
	}
	
	this.changeHighlight = function(way){
		
		if (me.highlighted != '' && me.highlighted != null ){
			me.highlighted.className = '';
			switch(way){
				case 'up':
					if(me.highlighted.parentNode.firstChild == me.highlighted){
						me.highlighted = me.highlighted.parentNode.lastChild;
					}else{
						me.highlighted = me.highlighted.previousSibling;
					}
				break;
				case 'down':
					if(me.highlighted.parentNode.lastChild == me.highlighted){
						me.highlighted = me.highlighted.parentNode.firstChild;
					}else{
						me.highlighted = me.highlighted.nextSibling;
					}
				break;
				
			}
			me.highlighted.className = 'selected';
			me.setElemValue();
		}else{
			switch(way){
				case 'up':
					me.highlighted = me.div.firstChild.lastChild;
				break;
				case 'down':
					me.highlighted = me.div.firstChild.firstChild;
				break;
				
			}
			me.highlighted.className = 'selected';
			me.setElemValue();
		}
		
	}
	
	//Rotina no KEYUP (pegar input)
	me.elem.onkeyup = function(ev) 
	{
		var key = me.getKeyCode(ev);
		switch(key)
		{
		//The control keys were already handled by onkeydown, so do nothing.
		case TAB:
		  return;
		 break; 
		  
		case ESC:
		case KEYUP:
		case KEYDN:
			return;
		case ENTER:
			return false;
			break;
		default:
			//Enviar query por AJAX
			if (me.ajaxReq != undefined && me.elem.value.length > 2 ){
				
				me.ajaxReq.open("POST", me.ajaxTarget, true);
				me.ajaxReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				me.ajaxReq.onreadystatechange = me.acResult;
				
				var param = 'string=' + me.elem.value+'&ttable='+me.ttable+'&tkey='+me.tkey+'&tvalue='+me.tvalue+'&wh='+me.twh;  
			    me.ajaxReq.send(param);
				
			}
			
			//Remover elementos highlighted
			me.highlighted = '';
		}
		
	};
	
	//Sumir com autosuggest
	me.elem.onblur = function() {
		me.hideDiv();
	}
	
	//Ajax return function
	this.acResult = function(){
		
		if (me.ajaxReq.readyState == 4){
				
			//alert(me.ajaxReq.responseText); //DEBUG
			
			me.showDiv()
			
			//Pegar resposta do servidor
			var xmlRes = me.ajaxReq.responseXML;
		
			var itens = xmlRes.getElementsByTagName('item');
			var itCnt = itens.length;
	
			//Pegar primeiro fliho
			me.div.innerHTML = '';
			var ul = document.createElement('ul');
			me.div.appendChild(ul);
			
			if (itCnt > 0){
				for (i=0; i<itCnt; i++){
					
					//Popular array global
					me.arrItens[itens[i].getAttribute("id")] = new Array();
					me.arrItens[itens[i].getAttribute("id")]['label'] = itens[i].getAttribute("label");
					
					//Adicionar LI
					var li = document.createElement('li');
					li.id = itens[i].getAttribute("id");
					li.onmouseover = function(){ this.className = 'selected'; me.highlightThis(this,'y')}
					li.onmouseout  = function(){ this.className = '';  me.highlightThis(this,'n')}
					li.onmousedown = function() {
						me.acChoose(this.id);
						me.hideDiv();
						return false;
					}
					
					var a = document.createElement('a');
					a.href = '#';
					a.class='normal';
					a.onclick = function() { return false; }
					a.innerHTML = unescape(itens[i].getAttribute("label"));

					li.appendChild(a);
					ul.appendChild(li);	
				}
			}else{
				me.hideDiv();	
			}
		}
	}
	
	this.acChoose = function (id){
		
		
		if (id != ''){
			//Função de retorno (Opcional)
			if (me.chooseFunc != null){
				me.chooseFunc(id,unescape(me.arrItens[id]['label']));
			}
		}
		
		//Esconder lista de clientes
		me.hideDiv();
		me.elem.value = me.elem.value;
		
	}

	this.positionDiv = function()
	{
		var el = this.elem;
		var x = 0;
		var y = el.offsetHeight;
	
		//Walk up the DOM and add up all of the offset positions.
		while (el.offsetParent && el.tagName.toUpperCase() != 'BODY')
		{
			x += el.offsetLeft;
			y += el.offsetTop;
			el = el.offsetParent;
		}

		x += el.offsetLeft;
		y += el.offsetTop;
	   //x = getPageOffsetLeft(el);
       //y = getPageOffsetTop(el);
       //alert(y);
		this.div.style.left = x + 'px';
		this.div.style.top = y + 'px';
	};

	this.hideDiv = function(){
		
		me.highlighted = '';
		me.div.style.visibility = 'hidden';
		me.div.innerHTML = '';
	
	}

	this.showDiv = function(){
		
		me.highlighted = '';
		me.div.style.width='350px';
		me.positionDiv();
		me.div.style.visibility = 'visible';
	
	}
	
	//HELPER FUNCTIONS
	
	/********************************************************
	Helper function to determine the keycode pressed in a 
	browser-independent manner.
	********************************************************/
	this.getKeyCode = function(ev)
	{
		if(ev)			//Moz
		{
			return ev.keyCode;
		}
		if(window.event)	//IE
		{
			return window.event.keyCode;
		}
	};

	/********************************************************
	Helper function to determine the event source element in a 
	browser-independent manner.
	********************************************************/
	this.getEventSource = function(ev)
	{
		if(ev)			//Moz
		{
			return ev.target;
		}
	
		if(window.event)	//IE
		{
			return window.event.srcElement;
		}
	};

	/********************************************************
	Helper function to cancel an event in a 
	browser-independent manner.
	(Returning false helps too).
	********************************************************/
	this.cancelEvent = function(ev)
	{
		if(ev)			//Moz
		{
			ev.preventDefault();
			ev.stopPropagation();
		}
		if(window.event)	//IE
		{
			window.event.returnValue = false;
		}
	}
}


//Função que cria AJAX Request
function createRequest() {
  try {
    request = new XMLHttpRequest();
  } catch (trymicrosoft) {
    try {
      request = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (othermicrosoft) {
      try {
        request = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (failed) {
        request = false;
      }
    }
  }

  if (!request)
    alert("Error initializing XMLHttpRequest!");
  else
  	return request;
}



function findNextWidget(first,form){
		
		var formitens  = $i(form).elements;
		
		for (i = 0; i < formitens.length ;i++){
			
			if ((formitens[i].id == first)){
				
				formitens[i+1].focus();						 	
				
			}
			
		}
		
}

function setfocusonload(){ 
   
 	if (document.forms[0]){
   	 	form = document.forms[0];
   		for (i = 0; i < form.elements.length;i++){       
      
   	   		if (form.elements[i].type == 'text'){  	      
   	        	//alert(form.elements[i].type);
   	      		//form.elements[i].focus();
   	      		break;  	        	       
   	   
   	  		}      
   	  
   		}
   	 } 	 
   
}
function Limpar(valor, validos) {

			// retira caracteres invalidos da string
			var result = "";
			var aux;
			for (var i=0; i < valor.length; i++) {
			aux = validos.indexOf(valor.substring(i, i+1));
			if (aux>=0) {
			result += aux;
			}
			}
			return result;
		} 
		function Formata(campo,tammax,teclapres,decimal) {
		    var tecla = teclapres.keyCode;
		    vr = Limpar(campo.value,"0123456789");
		    tam = vr.length;
		    dec=decimal
		
		    if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }
		
		    if (tecla == 8 )
		    { tam = tam - 1 ; }
		
		    if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 )
		    {
		
		    if ( tam <= dec )
		    { campo.value = vr ; }
		
		    if ( (tam > dec) && (tam <= 5) ){
		    campo.value = vr.substr( 0, tam - 2 ) + "," + vr.substr( tam - dec, tam ) ; }
		    if ( (tam >= 6) && (tam <= 8) ){
		    campo.value = vr.substr( 0, tam - 5 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ) ;
		    }
		    if ( (tam >= 9) && (tam <= 11) ){
		    campo.value = vr.substr( 0, tam - 8 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ) ; }
		    if ( (tam >= 12) && (tam <= 14) ){
		    campo.value = vr.substr( 0, tam - 11 ) + "." + vr.substr( tam - 11, 3 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ) ; }
		    if ( (tam >= 15) && (tam <= 17) ){
		    campo.value = vr.substr( 0, tam - 14 ) + "." + vr.substr( tam - 14, 3 ) + "." + vr.substr( tam - 11, 3 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - 2, tam ) ;}
		    }
	}