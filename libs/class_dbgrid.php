<?/**
 * Classe para criar um DataGrid;
 * @author  Iuri Andrei Guntchnigg
 * @version  0.0.9
 * @copyright  LGPL
 */
class dbGrid {
    
     /**
     * Possibilita ou não redimensionar os campos
     *
     * @var boolean
     */ 
    var $resize = true;
     /**
     * Colunas do que irão fazer parte do grid,
     * cada item deve ser o nome da coluna desejada
     *
     * @var array
     */ 
    var $fields;    
    /**
     * Largurda do grid
     *
     * @var integer
     */
    var $size   = "600";
      /**
     * Altura do Grid
     *
     * @var integer
     */
    var $height = "150"; 
    var $header;
     /**
     * Campos que  são padrões no grid
     *
     * @var array
     */
    var $pfields;
    
   
      /**
     * Variavel privada da classe;guarda a descrição do grid
     *
     * @var string
     */
    var $_table;
      /**
     * Nome do grid
     *
     * @var string
     */
    var $name = "grid1";
     /**
     * Nome da função a ser executa pelo grid;
     *
     * @var integer
     */
    var $js;
     /**
     * evento que sera chamado a função ;
     *
     * @var string
     */
    var $event = "onClick";
     /**
     * Campos que irão como paremetro para a função 
     *
     * @var string
     */       
    var $js_campos = "";
      /**
     * Se existe ou não uma função a ser executa
     *
     * @var boolean
     */
    var $func      = "";
     /**
     * o grid deverá mostrar um checkbox no inicio de cada item. a valor do grid é o campo passada na variavel
     *
     * @var string
     */
    var $checkbox  = "";
    
    /**
     * o grid deverá mostrar um radio no inicio de cada item. a valor do grid é o campo passada na variavel
     *
     * @var string
     */
    var $radiobox  = "";
    
    var $radioname = null;
    
     /**
     * Alterar cores das linhas do grid
     *
     * @var boolean
     */
    var $altercolor  = "";
    /**
     * Cria Formulario para consulta
     *
     * @var boolean
     */
     var $showForm = false;
     
      var $exec = 1;
     
    var $sql;
    var $limite;
    var $checkfunc;
    var $marca   = null;
    var $cut     = null;
    var $length  = 15;
    var $f_align = null;
    var $rs = null;
     /**
     * o devera criar o form interno ou não
     *
     * @var string
     */
     var $form;    
     var $frm_name = null;
    function dbGrid(){
        
      
      
       
       
    } 
    
    /**
     * Função privada para gerer um Error da classe 
     *
     * @param string $msg
     */
    function _error($msg){
        
        echo '<b>DbGrid::Erro-></b>'.$msg;
        exit;
    }
       
    /**
     * função privada para testar as variaveis do cabeçalho
     *
     * @return false,true
     */
    function _testaHeader(){
        
        if (!is_array($this->header)){
            $this->_error("Variavel \$header deve ser Do tipo Array!");
            return false;
        }elseif (count($this->header) != count($this->fields)){
            $this->_error("Número de campos do header diferente do recorset");
            return false;
        }else{
            return true;
        }
            
    }
    
  
    /**
     * função privada cria a descrição do grid
     *
     */
    function _get_table(){
        
        $this->frm_name = "frm".$this->name;
        if (isset($_GET["campos"])){
          unset($this->pfields); 
          $aux = explode(",",$_GET["campos"]);
          for ($aux1 = 0;$aux1 < count($aux);$aux1 ++){
              if ($aux[$aux1] !=''){
                 $this->pfields[] = $aux[$aux1];
              }  
          }
       }
      
        
       if ($this->js_campos != ""){
           $vl = explode("#",$this->js_campos);
           $par = count($vl);
       }
       
  
       if ($this->_testaHeader()){ 
           if (!$_POST["dbsql"]){
               $asql =  $this->sql;
           }else{
               $asql = str_replace("\\'","'",$_POST["dbsql"]);
           }
           if (!$_POST["pagina"]) {
               $pc = "1";
           }else{
               $pc = $_POST["pagina"];
           }
           if (!$this->form){ 
               $this->frm_name = "frm$this->name";
               echo "<form name='".$this->frm_name."' method='post'>";
            }else{
               $this->frm_name = $this->form;
               
           }
           echo "<input type='hidden' name='dbsql' value=\"".$asql."\">";
           echo "<input type='hidden' name='pagina' value='".$pc."'>";
           if ($this->form){
               echo "</form>";
           }
           $this->_table  = "<div id='tbpai' style='width:".($this->size+12)."px;overflow:scroll;overflow-y: hidden'>";
           $this->_table .= "<table border='0' style='border:2px inset white;width:".$this->size."' id='".$this->name."' cellspacing=0 >";
           $this->_table .= "<tr>";
           if ($this->checkbox or $this->radiobox){
              $this->_table .= "<td style='width:17px' class='cabecalho'>&nbsp;</td>";
               	
           }
               
           $display = "display:none";
           for ($i = 0;$i < count($this->header);$i++){
               if ($this->checkbox or $this->radiobox){
                   $col = $i+1;
               }else{
                   $col = $i;
               }
               for ($j = 0;$j <count($this->pfields);$j++){
                  if ($this->header[$i] === $this->pfields[$j]){
                      $display = "";
                   }
               }
               
               
               $this->_table .="<td class='cabecalho' nowrap style='$display;' id='$col'
                                    onmousedown=\"doResize(this,event,'".$this->name."')\" 
                                    onmousemove=\"moveResize(this,event,'".$this->name."')\" 
                                    onmouseup=\"tResize(this,event,'".$this->name."')\"
                                    ondblclick=\"maxSizeColumn(this,'".$this->name."')\"><div style='overflow:hidden'><a onclick='return orderTable(".($col).",\"tb".$this->name."\")'><b>".$this->header[$i]."</b></a></div></td>\n";
               $display = "display:none";
           }
           
           if ($this->resize){   
             $this->_table .= "<td class='cabecalho' id='lstColunasgrid' style='width:17px'>\n
                               <img src='libs/addcolumn.png' id='aqui' border='0' 
                                onclick=\"mostra_addcolumn('".$this->name."',event)\">
                               </td>\n";
           }
           
           $this->_table .= "</tr>\n";
   
           $this->_table .= "<tbody id='tb".$this->name."' style='height:".$this->height."px;overflow:scroll'>\n";
           /*
            inicio da paginação
           */
           if (!$_POST["dbsql"]){
               $_sql =  $this->sql;
           }else{
               $_sql = str_replace("\\'","'",$_POST["dbsql"]);
           }
           //echo $_sql;
           $total_reg = $this->limite;
          /* if (!$_POST["pagina"]) {
               $pc = "1";
           }else{
               $pc = $_POST["pagina"];
           }*/
           $this->sql = str_replace("\\","",$this->sql);
           $a = $sql;
           $inicio = $pc - 1;
           $inicio = $inicio * $total_reg; 
           if ($this->limite){
          
           $rs  = @pg_query($_sql." limit $total_reg offset $inicio");
           
           $tds = @pg_query($_sql);
           $tr  = @pg_num_rows($tds); // verifica o número total de registros
           $mostra = $pc * $total_reg;
           if ($mostra > $tr){
              $mostra = $tr;
           }   
           $tp = $tr / $total_reg; 
           $pag = ceil($tp);
           }else{
               $rs = @pg_query($this->sql);
               $tr = @pg_num_rows($rs);
           }
           
           $this->rs = $rs;
           $i = 0;
           while ($ln = @pg_fetch_array($rs)){
               
               if ($this->marca){
                   
                   //$str = "if (".$this->marca."){\$cor ='#4AB4FF';\$chk='checked';}else{\$cor ='#ffffff';\$chk='';}";
                   //$this->marca;
                   eval ($this->marca);
               }else{
               	   if ($this->altercolor){
               	   	  if ($i % 2 == 0){
               	   	  	  $cor  ='#ffffff';
                          $font ='#000000'; 
               	      }else{
               	          $cor  ='#EEEEEE';
                          $font ='#000000'; 
               	      }  	
               	   }else{    
                   	  $cor  ='#ffffff';
                      $font ='#000000'; 
               	   }
               }   
               if ($this->checkbox){
                   $this->_table .= "<tr class='trlinha'>\n";
                   $this->_table .= "<td class='linha' nowrap bgcolor='$cor' style='text-align:center;width:17px;color:$font;'>
                                     <input type='checkbox' value='".$ln[$this->checkbox]."' $chk 
                                     name='".$this->name."chk[]' onclick=\"".$this->checkfunc."\"></td>\n";
               }else if ($this->radiobox){
               	   $this->_table .= "<tr class='trlinha'>\n";
                   $this->_table .= "<td class='linha' nowrap bgcolor='$cor' style='text-align:center;width:17px;color:$font;'>
                                     <input type='radio' value='".$ln[$this->radiobox]."' $chk 
                                     name='".$this->radioname."'></td>\n";
               	
               }else{
                   $this->_table .= "<tr class='trlinha'>\n";
               }
                                           
               $display = "display:none";
               for ($jl = 0;$jl < count($this->fields);$jl++){
                    $align = $this->f_align[$jl]==""?"left":$this->f_align[$jl];
                    
                  for ($j = 0;$j < count($this->pfields);$j++){
                     if ($this->header[$jl] === $this->pfields[$j]){
                        $display = "";
                     }
                          
                  }
                  if ($this->js != ""){
                      if ($par > 1){
                          $virgula="";
                          $pass = "";
                          for ($f = 0;$f < $par;$f++){
                             $pass = $pass.$virgula."'".trim($ln[$vl[$f]])."'";
                             $virgula=",";
                          }
                      }else{
                        $pass = $ln[$js_campos];
                      } 
                      
                      //echo $align;
                      if ($this->cut == $this->fields[$jl]){
                          $text = substr($ln[$this->fields[$jl]],0,$this->length);
                          $comp = $ln[$this->fields[$jl]];
                      }else{
                          $text = $ln[$this->fields[$jl]];
                          $comp = null;
                      }
                      $this->_table .= "<td $mfunc nowrap bgcolor='$cor'  style='$display;color:$font;text-align:$align;'
                                         class='linha' ".$this->event."=\"".$this->js."($pass)\">
                                         <div style='overflow:hidden'>
                                        <a style='cursor:default;' class='teste' title='$comp'>";
                      #$this->_table .= $ln[$this->fields[$jl]] == "" ? "&nbsp;" : $ln[$this->fields[$jl]];
                      $this->_table .= $text == "" ? "&nbsp; " : $text;
                      $this->_table .= "</a></div></td>\n";
                     // echo $font;
                  }else{
                      if ($this->cut == $this->fields[$jl]){
                          $text = substr($ln[$this->fields[$jl]],0,$this->length);
                          $comp = $ln[$this->fields[$jl]]; 
                      }else{
                          $text = $ln[$this->fields[$jl]];
                          $comp = null;
                     }
                     $this->_table .= "<td $mfunc bgcolor='$cor' nowrap title='$comp' class='linha' style='$display;color:$font;
                                       text-align:$align;'><div style='overflow:hidden'>";
                     #$this->_table .= $ln[$this->fields[$jl]] == "" ? "&nbsp;" : $ln[$this->fields[$jl]];
                     $this->_table .= $text == "" ? "&nbsp; " : $text;
                     //$this->_table .= $ln[$this->fields[$jl]] == "" ? "&nbsp;" : $text;
                     $this->_table .= "</div></td>\n";
                  } 
                  $display = "display:none";
               }
               $this->_table .= "</tr>";
               $i++; 	  
           }
       }
      if (@pg_num_rows($rs) == 1 && $this->exec == 1 && $pc == 1){
           echo "<script>$this->js($pass);</script>";
       }
       $this->_table .="</tbody>\n";  
       $this->_table .= "<tfoot><tr><td colspan='40' class='cabecalho' style='text-align:left;font-size:15px;color:black'>";
       if ($this->limite){
           $anterior = $pc -1;
           $proximo = $pc +1;
           if ($pc>1) {
               $this->_table .= "<a style='text-decoration:none;color:black;cursor:pointer' 
                                 onclick=\"next(1,document.".$this->frm_name.")\" >&#9664;&#9664;&nbsp;</a> ";
               $this->_table .=" <a style='text-decoration:none;color:black;cursor:pointer'
                                  onclick=\"next($anterior,document.".$this->frm_name.")\">&#9664;</a> ";
           }else{
               $this->_table .= "<font color='#C6D099'>&#9664;&#9664;&nbsp; ";
               $this->_table .= " &#9664;&nbsp;</font>";
           }
           $this->_table .= "<input type='text' value='".$pc."/$pag' readonly 
                           style='border:1px solid black;text-align:center;cursor:pointer' size='5'> ";
           if ($pc<$tp) {
               #$this->_table .=" <a style='text-decoration:none;color:black' onclick='next(\"$proximo&dbsql=.$_sql\")'>&#9654</a>";
               $this->_table .=" <a style='text-decoration:none;color:black;cursor:pointer'
                                onclick=\"next($proximo,document.".$this->frm_name.")\">&#9654</a>";
               $this->_table .= "&nbsp;&nbsp;<a style='text-decoration:none;color:black;cursor:pointer' 
                                  onclick=\"next($pag,document.".$this->frm_name.")\">&#9654;&#9654;</a> ";
           }else{
               $this->_table .= " <font color='#C6D099'>&#9654;";
               $this->_table .= " &#9654;&#9654;&nbsp;</font>";
           }
          
       }
       if (!$this->limite){
       	   $lbltotal = "mostrando $tr registros";
       	   
       }else{
       	  $lbltotal  = "mostrando $mostra de $tr registros";
       }
       $this->_table .= "$lbltotal</td></tr></tfoot>"; 
       $this->_table .= "</table></div>\n";
       $this->_table .= "<div id='".$this->name."laddcolumn' class='cabecalho'style='position:absolute;visibility:hidden;text-align:left'>\n";
       //$this->_table .= "<form name='addremovec'>\n";
       for ($ai = 0;$ai < count($this->header);$ai++){
            $chk = "";
            for ($j = 0;$j <count($this->pfields);$j++){
                if ($this->header[$ai] == $this->pfields[$j]){
                    $chk = "checked";
                }
            }
            if ($this->checkbox){
                $inc = 1;
            }else{
                $inc = 0;
            }   
                              
            if ($ai == 0){
                
               $this->_table .="<input type='checkbox' disabled checked id='c".($ai+$inc)."' name='c".($ai+$inc)."' 
                               value='".($ai+$inc)."'>
                               <label for='c".($ai+$inc)."'>".$this->header[$ai]."</label><br>\n";
            }else{
               
               $this->_table .= "<input type='checkbox' $chk 
                                 onclick=\"addRemColumn(this,'".$this->name."');_add(this,'".$this->header[$ai]."')\" 
                                  id='c".($ai+$inc)."' 
                                  name='c".($ai+$inc)."' value='".($ai+$inc)."'>
                                 <label for='c".($ai+$inc)."'>".$this->header[$ai]."&nbsp;</label><br>\n";
           }
                               
       }
       $this->_table .= "</div>\n";
      // $this->_table .= "</form>\n";
       $this->_table .= "<script>";
       $this->_table .= "this.pfields = new Array();\n";
       for ($jsa = 0; $jsa < count($this->pfields);$jsa++){
           $this->_table .= "this.pfields[$jsa] = '".$this->pfields[$jsa]."';\n";
       }
                            
       $this->_table .= "</script>";
       
      
       
    }
       
    /**
     * Renderiza o grid;
     * 
     */
    function show(){

        if ($this->showForm){
        	//$this->table .= "";
         	$this->drawForm();
        }
        $this->_get_table(); 
        echo $this->_table;
    }
    
    function drawForm(){
    	require("libs/class_interface.php");
    	reset($this->fields);
    	reset($this->header);
    	
    	$form .= "<form name='frmconsgrid' method='post'>";
    	$form .= "<table>\n"; 
    	echo $this->rs;
    	
        for ($i = 0;$i < count($this->fields);$i++){
			$form .= "<tr><td style='font-weight:bold'>".$this->header[$i]."</td>";
			$fc   = "onkeyUp='c_maiuscula(this)'";
				
			
			$form .= "<td><input $fc  type='text' class='input' name='".$this->fields[$i]."'></td></tr>\n";
				
     	
       }
       $form .= "<tr><td colspan='2' style='text-align:center'>
                     <input type='submit' name='btncons' value='Consultar'>"; 
                      
       $form .= "</table></form>";
       $winaux = new windowAux(5,5,500,300,'consaux','Consultar',$form);
       $winaux->show();  	
       echo"<a style='visibility:hidden' accesskey='w' onclick=\"winList['consaux'].open();\">sjow</a>";
    }
}             