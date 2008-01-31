<?
/**
 * Classe abstrata para criar widgets html ;
 * @author  Iuri Andrei Guntchnigg
 * @version  0.9a
 * @copyright  CC-GPL
 */

abstract  class widget {
   
	public $top        = 0;
	public $left       = 0;
	public $name       = null;
	public $size       = null;
	public $valida ; 
	public $onblur     = null;
	public $onchange   = null;
	public $onkeypress = null;
	public $onkeyup    = null;
	public $onkeydown  = null;
	public $onclick    = null;
	public $ondblclick = null;
	public $onfocus    = null;
	public $tabindex   = null;
	private $disabled  = false;
	protected $_obj;
	public $_style;
	
	
    function  __construct(){
    	
    	$this->left  = 0 ;
    	$this->top   = 0;
    	$this->name = null;
    	$this->size  = null;
    	
    	
    	 
    	
    }	
    
    function __set($var,$value){
    	
    	if ($var == "onkeydown"){
    		$this->$var .= $value;
    		
    	}else if ($var == "onfocus"){
    		$this->$var .= $value;
    		
    	}else if ($var == "onkeyup"){
    		$this->$var .= $value;
    		
    	}else if ($var == "onkeypress"){
    		$this->$var .= $value;
    		
    	}else if ($var == "ondblclick"){
    		$this->$var .= $value;
    		
    	}else if ($var == "onclick"){
    		$this->$var .= $value;
    		
    	}else if ($var == "ondblclick"){
    		$this->$var .= $value;
    		
    	}else if ($var == "onchange"){
    		$this->$var .= $value;
    		
    	}else if ($var == "onblur"){
    		$this->$var .= $value;
    	}    		
    	
    	echo $var;
    	
    }
    function realize(){
        $this->validadate();
    	$this->_obj .= " style=\"".$this->_style."\"";
    	$this->_obj .= " onKeyDown=\"".$this->onkeydown."\"";
		$this->_obj .= " onFocus=\"".$this->onfocus."\"";
		$this->_obj .= " onKeyPress=\"".$this->onkeypress."\"";
		$this->_obj .= " onKeyUp=\"".$this->onkeyup."\"";
		$this->_obj .= " onDblClick=\"".$this->ondblclick."\"";
		$this->_obj .= " onClick=\"".$this->onclick."\"";
		$this->_obj .= " onChange=\"".$this->onchange."\"";
		$this->_obj .= " onBlur=\"".$this->onblur."\"";
		$this->_obj .= ">\n";
	  	return  $this->_obj;
	  	echo $this->_style;
   	}
   	
   	function validadate(){
   		   		
    		
    		$parm = strlen($this->valida);
            for ($i = 0;$i < $parm;$i++){
                $fcn = substr($this->valida,$i,1);
                if ($fcn == "A"){
                    $this->onkeyup .= "c_maiuscula(this);";
                }else if($fcn == "E"){
                    $this->_obj .= " class=\"nnulo\"";
                }else if($fcn =="N"){
                    $this->onkeypress .=  "return teclas(event);";
                }else if($fcn =="R"){
                    $this->_obj    .= " readonly";
                    $this->_style .= " background-color:#E6E6E6";
                }
             }
   	}	
}

class form{
    
	public $name;
	public $method = "post";
	public $_absolute = 0;
	protected $_form;
	
	
	function __construct($name,$method='post',$absolute=0){
		
		DEFINE(FRMNAME,$name);
		
		//$frmname=$name;
		
		$this->_absolute = $absolute;
		$this->name = $name;
		if ($this->absolute == 0){
			$this->_form .= "<table border='0' cellspacing='0'>";
		}
		$this->_form .= "<form name='$name' method='$method'>";
		
	}
	
	function add($obj,$label='',$ln=0){
		
		if ($this->absolute == 0){
			if ($ln == 1){
				$this->_form .= "<tr>\n";
			}
			$this->_form .= "<td><b>$label</b></td><td>$obj</td>\n";
			if ($ln == 1){
				$this->_form .= "</tr>\n";
			}
		}else{
			$this->_form .= $obj;
		}		
	}

	function show(){
		
		$this->_form .= "</form>";
		if ($this->_absolute == 0){
			$this->_form .= "</table>";	
		}
		echo $this->_form;
	}
	
}
/**
 * Classe para criar < input > do tiop texto html ;
 * @author  Iuri Andrei Guntchnigg
 * @version  0.1.11
 * @copyright  CC-GPL
 * @criation  05/04/2006 
*/  


class input extends widget {
	
	/**
	 * tamanho máximo de caracteres no Campo
	 *
	 * @var int
	 */
	private $maxlength = null;
	/**
	 * Mostra ou não so valor do campo (input type=password)
	 *
	 * @var bolean;
	 */
	private $blind;
	private $value;
	private $tooltip   = null;
	//public  $form;



	function __construct($name,$valida='',$value='',$abs=0,$left = 0, $top = 0, $size=25){
		
		$this->name   = $name;
		$this->valida = $valida;
		if ($abs == 1){
			
			$this->_style .= "top:".$top."px;left:".$left."px;position:absolute";
		}
		$this->_obj .= "<input type='text' id=\"$name\" size=\"$size\" name=\"$name\" value=\"$value\"";
		
		
	}

	function __set($var,$value){
		
		if ($var == "maxlength"){
			$this->$var = $value;
			$this->_obj .= " maxlength=\"$value\"";
		}
		else if ($var == "disabled"){
    		$this->$var .= $value;
    		$this->_obj  .= " disabled";
    		
    	}else if ($var == "value"){
    	  	$this->$var = $value;
    	  	$this->_obj .= " value=\"$value\"";
    		
    	}else if ($var == "tooltip"){
    	  	$this->$var = $value;
    	  	$this->_obj .= " title=\"$value\"";
    	  	
    	}else if ($var == "blind"){
    	  	$this->$var = $value;
    	  	if ($value == 1){
    	  		$this->_obj = str_replace("type='text'","type='password'",$this->_obj);
    	  	}else{
    	  		$this->_obj = str_replace("type='password'","type='text'",$this->_obj);
    	  	}
    	}
		
		
	}
	
}

class label{
	
	public $name;
	public $caption;
	public $top        = 0;
	public $left       = 0;
	function __construct($name,$caption,$top,$left){
		$this->lbl = "<label id=\"$name\" style='position:absolute;top:$top;left:$left'><b>$caption</b></label>";
		return $this->lbl;
		
	}
	function realize(){
		return $this->lbl;
		
	}
}

class inputData extends input {
	
	public $abs;
	
	/**
	 * Função construtora da classe
	 *
	 * @param string $name
	 * @param string $valida
	 * @param string $value
	 * @param bolean $abs
	 * @param int $left
	 * @param int $top
	 */
	function __construct($name,$valida='',$value='',$abs=0,$left = 0, $top = 0){
		
		$this->name   = $name;
		$this->valida = $valida;
		$this->top    = $top;
		$this->left   = $left;
		$this->form   = $frmname; 
		if ($abs == 1){
			$this->abs = $abs;
			$this->_style .= "top:".$top."px;left:".$left."px;position:absolute";
		}
		$this->_obj .= "<input type='text' size=\"10\" id=\"$name\" name=\"$name\" value=\"$value\"";
		$this->onkeydown  .= "FormataData(this,event);";
		$this->onkeypress .= "return teclas(event);";
		$this->maxlength = 10;		
	}
	
	function realize(){

		$inpuData = widget::realize();		
		$this->left += 95;
		if ($this->abs == 1 ){
			$style = "style='top:".$this->top."px;left:".$this->left."px;position:absolute'";
		} 	
		$inpuData .= "<a $style ><img src='libs/show-calendar.gif'id='img_$this->name'		                        
                     onClick=\"show_calendar('".FRMNAME.".".$this->name."');\"
                    width=18 height=16 border=0 title='escolha a data' style='cursor:pointer'></a>\n";
		return $inpuData;
		
	}	
}

class select  extends widget {
	
	public $value;
	public $itens;
	function __construct($name,$valida='',$value=0,$abs=0,$left = 0, $top = 0){
		
		$this->name   = $name;
		$this->valida = $valida;
		$this->value  = $value;	
		if ($abs == 1){
			$this->_style .= "top:".$top."px;left:".$left."px;position:absolute";
		}
		$this->_obj .= "<select name=\"$name\" size=\"$size\" id=\"$name\"";
		$this->addItem("","Selecione");
	}
	function addItem($id,$value){
		
		if ($this->value == $id){
			$sel = " selected";
		}else{
			$sel = null;
		}
		$this->itens .= "<option value=\"$id\" $sel >$value</option>\n";
	}
	
	function addFromDb($table,$fId,$fDescr,$wh=''){
		
		if ($wh != ""){
			$wh = " where ".$wh;
		}
		$sql = "select $fId,$fDescr from $table	$wh order by $fDescr";
		$rs  = pg_query($sql);
		while ($ln = pg_fetch_array($rs)){
			$this->addItem($ln[$fId],$ln[$fDescr]); 
		}
		
	}
	
	function realize(){
		
		$select = widget::realize();
		$select .= $this->itens;
		$select .= "</select>";
		return $select;
		
	}		
}

class button extends widget {
    
	private $accesskey;
	public $caption;
	public $type;
	function __construct($name,$caption='',$type,$accesskey='', $abs=0,$left = 0, $top = 0){
		
		$this->name      = $name;
		$this->type      = $type;
		$this->caption   = $caption;	
		$this->accesskey = $accesskey;
		if ($abs == 1){
			$this->_style .= "top:".$top."px;left:".$left."px;position:absolute";
		}
		$this->_obj .= "<button type=\"$type\" accesskey='$accesskey' name=\"$name\" id=\"$name\"";
		
	}

	function __set($var, $value){
			
		if ($this->$var == "accesskey"){
			$this->$var = $value;
			$this->_obj  .= " accesskey=\"$value\"";
		}
		
	}
	
	function realize(){
		
		$button        = widget::realize();
		$this->caption = str_replace($this->accesskey,"<u>".$this->accesskey."</u>",$this->caption);
		$button       .= $this->caption."</button>\n";
		return $button;
	}	
}
class inputDbquery extends widget  {
	
	private $table;
	private $tsuffix = "";
	private $tkey;
	private $tvalue;
	private $wh;
	private $arquive = "fc_ajax.php";
	private $sizeaux = 20;
	private $popup;
	private $leftaux;		
	
	function __construct($name,$valida='',$abs=0,$left = 0, $top = 0, $size=25){	
		
		$this->name   = $name;
		$this->valida = $valida;
		$this->top    = $top;
		$this->left   = $left;
		$this->size   = $size;
		
		$this->abs;
		if ($abs == 1){
			$this->abs = $abs;
			
			$this->_style .= "top:".$top."px;left:".$left."px;position:absolute";
		}
		$this->_obj = "<input type='text' name=\"$name\" size=\"$size\"";
	}
	
	function __set($var,$value){
		$this->$var = $value;
	}
	
	function realize(){
		
		//$this->validate();
		$this->onblur .= "direto(this.value,'$this->tkey','$this->tvalue','$this->table','$this->wh','$this->tsuffix','$this->arquive');";
        $this->validadate();
        $this->_obj .= " id=\"$this->tsuffix$this->tkey\"";
    	$this->_obj .= " style=\"".$this->_style."\"";
    	$this->_obj .= " onKeyDown=\"".$this->onkeydown."\"";
		$this->_obj .= " onFocus=\"".$this->onfocus."\"";
		$this->_obj .= " onKeyPress=\"".$this->onkeypress."\"";
		$this->_obj .= " onKeyUp=\"".$this->onkeyup."\"";
		$this->_obj .= " onDblClick=\"".$this->ondblclick."\"";
		$this->_obj .= " onClick=\"".$this->onclick."\"";
		$this->_obj .= " onChange=\"".$this->onchange."\"";
		$this->_obj .= " onBlur=\"".$this->onblur."\"";
		$this->_obj .= ">\n&nbsp;";
		if ($this->popup){
			$fcpop = "onKeyUp=\"carrega(this,'$this->tkey','$this->tvalue','$this->table','$this->wh','$this->tsuffix','$this->arquive');\"";
		}
		if ($this->abs == 1){
			$left = $this->leftaux;
			$_style .= "top:".$this->top."px;left:".$left."px;position:absolute";
		}
		$this->_obj .= "<input type=\"text\" style=\"$_style\" id=\"$this->tsuffix$this->tvalue\" size=\"$this->sizeaux\" $fcpop >\n";
		if ($this->popup == true){  
			$this->_obj .= "
           	<div id='$this->tvalue$this->tkey' 
                  style='position:absolute;width:350px;border:1px solid #999999; z-index:1;max-height:100px;overflow:auto; visibility:hidden;background-color:#eeeee2'>
                 </div> ";
        }
	  	return  $this->_obj;
	  	
   	}	
}

class checkbox extends widget {

	private $caption;
	
	function __construct($name,$caption,$abs=0,$left = 0, $top = 0){
		
		$this->name    = $name;
		$this->caption = $caption;
		$this->top     = $top;
		$this->left    = $left;
	
		
		if ($abs == 1){
			$this->abs = $abs;
			
			$this->_style .= "top:".$top."px;left:".$left."px;position:absolute";
		}
		$this->_obj = "<input type='checkbox' id=\"$name\" name=\"$name\" size=\"$size\"";
	}
	
	function realize(){

		$checkBox = widget::realize();		
		$this->left += 10;
		if ($this->abs == 1 ){
			$style = "style='top:".$this->top."px;left:".$this->left."px;position:absolute'";
		}
		$checkBox += "<label for=\"".$this->name."\">$this->caption</label>";
		return $checkBox; 	
		
	}
	
}
?>