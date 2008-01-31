<?
define('FPDF_FONTPATH','fpdf151/font/'); 
require('fpdf151/fpdf.php');
 class pdf extends fpdf{
 	
    function Footer(){
      
      
    }    
  function cut($texto, $maxwidth){
  	
  	$texto = trim($texto);	
  	$width = 0;
    $words = explode(' ', $texto);
    $wordwidth1 = 0;
    $widthletra = 0;
    $rtexto = '';
    foreach ($words as $word){  	
    	
        $wordwidth1 = round($this->GetStringWidth($word),2);
        if ($widthletra+$wordwidth1 > $maxwidth){
        	
        	
        	for ($i = 0;$i < strlen($word);$i++){
        		
        		//echo $this->GetStringWidth(substr($word,$i,1))."<br>";
        		$widthletra  += round($this->GetStringWidth(substr($word,$i,1)),2);
        		if ($widthletra >= $maxwidth){
        			
        			$rtexto = $rtexto;
        			
        		}else{
        			
        			$rtexto      .= substr($word,$i,1);
        			$widthletra += round($this->GetStringWidth(substr($word,$i,1)),2);
        			
        		}
        		
        	}
        	
        }else{
        	
        	$rtexto      .= $word;
        	$widthletra += round($this->GetStringWidth($word),2);
        	
        }
       
        if ($rtexto != ''){
        	
        	$rtexto .=" ";
        	
        }       
    	
     }
    
     $rtexto = trim($rtexto);
     $count++;       
     return $rtexto;
   }
}
?>