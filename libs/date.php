<?
 //funcao para formatacao de data
 //$tipo : define se a função ira pegar a data atual,sendo 0 para data atual ou sem parametro 
 // ou 1 para data passada normal para a funçao
  function dateformat($data,$tipo,$st){
    switch($tipo){
    case null:
           $X = getdate();
           $m = $X["mon"];
           $d = $X["mday"];
           $y = $X["year"];
           break;
    case 0 :
           $X = getdate();
           $m = $X["mon"];
           $d = $X["mday"];
           $y = $X["year"];
           break;
     case 1 :
          $X = explode("/",$data);
          $m = $X["1"];
          $d = $X["0"];
          $y = $X["2"];
          break;
     }            
    switch ($m){
      case 0:
      case 1:
        $m = "Janeiro";
        break;
      case 2:
        $m = "Fevereiro";
        break;
      case 3:
        $m = "Março";
        break;
      case 4:
        $m = "Abril";
        break;
      case 5:
        $m = "Maio";
        break;
      case 6:
        $m = "Junho";
        break;
      case 7:
        $m = "Julho";
        break;
      case 8:
        $m = "Agosto";
        break;
      case 9:
        $m = "Setembro";
        break;
      case 10:
        $m = "Outubro";
        break;
      case 11:
        $m = "Novembro";
        break;
      case 12:
        $m = "Dezembro";
        break;
}
 if ($st == "c"){
   $data = "Sapiranga, ".$d." de ".$m." de ".$y;
   return $data;
 } elseif ($st == "m") {
   $data = $m;
   return $data;
 }   
}//fecha funcao

        
?>         
