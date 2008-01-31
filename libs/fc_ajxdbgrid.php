<?
require("classes.class");
class ajxdbgrid {
	
	var $_table = null;
	var $pag    = null;
	var $grid   = null;
	var $sql    = null;
	var $js     = null;
	var $event  = null;
	var $js_campos = null;
	var $limite    = null;
	function ajxdbgrid($pag,$grid,$sql,$fc,$evento,$fields,$limite){
		
		$this->pag       = $pag;
		$this->grid      = $grid;
		$this->sql       = $sql;
		$this->js        = $fc;
		$this->event     = $evento;
		$this->js_campos = $fields;
		$this->limite    = $limite;
	
	    $this->total_reg = $this->limite;
	   // $this->_table .= "Erro 1 = ".$this->pag .",".$this->limite."<br>";

	    
          /* if (!$_POST["pagina"]) {
               $pc = "1";
           }else{
               $pc = $_POST["pagina"];
           }*/
           $this->sql = str_replace("\'","'",$this->sql);
           $_sql = $this->sql;
           $this->inicio = $this->pag - 1;
           $this->inicio = $this->inicio * $this->total_reg; 
           
           //$this->_table .= " $this->inicio , $this->total_reg , Talvez aqui<br>";
           $this->sql .= " limit $this->total_reg offset $this->inicio"; 	 
           $rs  = pg_query($this->sql);
           
           $tds = pg_query($this->sql);
           $tr  = pg_num_rows($tds); // verifica o n�mero total de registros
           //$mostra = $pc * $total_reg;
          // if ($mostra > $tr){
           //   $mostra = $tr;
           //}   
           //$tp = $tr / $total_reg; 
           //$pag = ceil($tp);
          
           $this->rs = $rs;
           $i = 0;
           while ($ln = pg_fetch_array($rs)){
               
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
                      $this->_table .= $ln[$this->fields[$jl]] == "" ? "&nbsp;" : $text;
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
                     $this->_table .= $ln[$this->fields[$jl]] == "" ? "&nbsp;" : $text;
                     $this->_table .= "</div></td>\n";
                  } 
                  $display = "display:none";
               }
               $this->_table .= "</tr>";
               $i++; 	  
           }
       
		
			
		
	  //return  $this->_table;
	   //echo $this->_table;
	  
	}
	function show(){
		
		echo $this->_table;
	
	}
	
}

$db = new db();

$table = new ajxdbgrid($_POST["pag"], $_POST["grid"], $_POST["sql"], $_POST["fc"], $_POST["event"], $_POST["fields"], $_POST["limit"],
$_POST["header"]);
echo $table->show()

?>