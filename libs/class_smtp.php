<?
class Smtp{
//Créditos: Red neck

var $conn;
var $user;
var $pass;
var $html;
var $debug = true;

function Smtp($host){
  $this->conn = fsockopen($host, 25, $errno, $errstr, 30);
  $this->Put("EHLO $host");
}
function Auth(){
  $this->Put("AUTH LOGIN");
  $this->Put(base64_encode($this->user));
  $this->Put(base64_encode($this->pass));
}
function Send($to, $from, $subject, $msg){

  if(isset($this->conn)){
    $this->Auth();
    $this->Put("MAIL FROM: " . $from);
    $this->Put("RCPT TO: " . $to);
    $this->Put("DATA");
    $this->Put($this->toHeader($to, $from, $subject));
    $this->Put("\r\n");
    $this->Put($msg);
    $this->Put(".");
    $this->Close();
    return true;
  }else{
    return false;
  }
}
function Put($value){
  return fputs($this->conn, $value . "\r\n");
}
function toHeader($to, $from, $subject){
  $header  = "Message-Id: <". date('YmdHis').".". md5(microtime()).".". strtoupper($from) ."> \r\n";
  $header .= "From: <" . $from . "> \r\n";
  $header .= "To: <".$to."> \r\n";
  $header .= "Subject: ".$subject." \r\n";
  $header .= "Date: ". date('D, d M Y H:i:s O') ." \r\n";
  if($this->html){ $header .= "Content-Type: text/html; charset=iso-8859-1 \r\n";}
  $header .= "X-MSMail-Priority: High \r\n";
  return $header;
}
function Close(){
  $this->Put("QUIT");
  if($this->debug == true){
  while (!feof ($this->conn)) {
    echo fgets($this->conn) . "<br>\n";
  }
  }
  return fclose($this->conn);
}
}
?>