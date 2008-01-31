<?
class window {
	
	public    $left;
	public    $top;
	public    $ifname;
	public    $width;
	public    $height;
	public    $id;
	public    $ifarq;	
	protected $window;
	
	function __construct($left, $top ,$width, $height, $id, $ifname, $ifarq,$title,$body=''){
		
		$this->top    = $top;
		$this->left   = $left;
		$this->width  = $width;
		$this->height = $height;
		$this->id     = $id;
		$this->ifarq  = $ifarq;
		$this->ifname = $ifname;
		
		$this->window .= "<div id='$id' class='window' style='left:".$left."px; top:".$top."px;width:$width;'>\n"
                		."<div class='titleBar'>\n"
               			."<span class='titleBarText' id='titulo$id'>$title</span>\n"
               			."<img class='titleBarButtons' alt='' src='libs/imagens/buttons.gif' usemap='#$ifname' />\n"
               			."<map id='$ifname' name='$ifname'>\n"
               			."<area shape='rect' coords='0,0,15,13'  href='' alt='' title='Minimize'
                		  onclick=\"this.parentWindow.minimize();return false;\" />\n"
               			."<area shape='rect' coords='16,0,31,13' href='' alt=' title='Restore'
                			onclick=\"this.parentWindow.restore();return false;\" />\n"
               			."<area shape='rect' coords='34,0,49,13' href='' alt=' title='Close'
                			onclick=\"this.parentWindow.close();return false;\" />\n"
               			."</map>\n"
               			."</div>\n"
               			."<div class='clientArea' id='".$id."cliarea' style='padding:0px;height:".$height.";background-color:#eeeee2'>\n"
               			."<iframe name='$ifname' src='$ifarq'  width='100%' height='100%'frameborder=0>$body</iframe>\n"
               			."</div>\n"
               			."</div>\n";
	}
	
	function show(){
		
		echo $this->window;
	}
	
}

class windowAux {
	
	public    $left;
	public    $top;
	public    $ifname;
	public    $width;
	public    $height;
	public    $id;
	public    $ifarq;	
	protected $window;
	
	function __construct($left, $top ,$width, $height, $id,$title,$body=''){
		
		$this->top    = $top;
		$this->left   = $left;
		$this->width  = $width;
		$this->height = $height;
		$this->id     = $id;
		$this->ifarq  = $ifarq;
		$this->ifname = $ifname;
		
		$this->window .= "<div id='$id' class='window' style='left:".$left."px; top:".$top."px;width:$width;'>\n"
                		."<div class='titleBar'>\n"
               			."<span class='titleBarText' id='titulo$id'>$title</span>\n"
               			."<img class='titleBarButtons' alt='' src='libs/imagens/buttons.gif' usemap='#$ifname' />\n"
               			."<map id='$ifname' name='$ifname'>\n"
               			."<area shape='rect' coords='0,0,15,13'  href='' alt='' title='Minimize'
                		  onclick=\"this.parentWindow.minimize();return false;\" />\n"
               			."<area shape='rect' coords='16,0,31,13' href='' alt=' title='Restore'
                			onclick=\"this.parentWindow.restore();return false;\" />\n"
               			."<area shape='rect' coords='34,0,49,13' href='' alt=' title='Close'
                			onclick=\"this.parentWindow.close();return false;\" />\n"
               			."</map>\n"
               			."</div>\n"
               			."<div class='clientArea' id='".$id."cliarea' style='padding:0px;height:".$height.";background-color:#eeeee2'>\n$body"                   
               			."\n"
               			."</div>\n"
               			."</div>\n";
	}
	
	function show(){
		
		echo $this->window;
	}
	
}

class header {
	
	private   $arq_config = "config/config.php";
	protected $header;
	
	function __construct($dirlibs,$onload){
	
		
		$this->header = "<html>
						<head>
 						<title>Form designer 1.0</title>
  						<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">
  						<link rel=\"stylesheet\" href=\"$dirlibs/estilos.css\" media=\"all\" type=\"text/css\">
  						<script language=\"JavaScript\" src=\"$dirlibs/funcoes.js\"></script>
  						<SCRIPT LANGUAGE='JavaScript' SRC='$dirlibs/menuw.js'></SCRIPT>
  						<link rel='stylesheet' href='$dirlibs/menuw.css' type='text/css' media='all'>
 						</head>\n
 						<body bgcolor='#EEEEE2'style=\"margin:0;\" onload=\"$onload\">";
	
	}

	function show(){
		
		return $this->header;
	}
		
	
}
	    