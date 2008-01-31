<?
class atendimento {
	
	
	private $nota;
	function __construct($com_id,$conn){
		
		$this->conn = $conn;
		$this->com_id = $com_id;	
		
	}
	
	function  emite(){
		
		$this->conn->executa($this->conn->getAll("comandas","com_id=$this->com_id",'',0),true,"com");
		$this->nota .= "       PIZZARIA IURI\n";
		$this->nota .= "       TELE-ENTREGA\n\n";
		$this->nota .= "Rua Felipe Camarao,237 Centenario\n";
		$this->nota .= "Sapiranga - RS\n";		
		$this->nota .= "_______________________________________________\n";
		$this->nota .= "comanda nº $this->com_id\t\t";
		$this->nota .= strformat($this->conn->com["com_dtcomanda"],"dtbr")." - ".$this->conn->com["com_hora"]."\n";
		if ($this->conn->com["com_delivery"] == 1){			
			
			$this->conn->executa($this->conn->getJoinRecord("comanda_delivery(+)ruas|rua_id=del_ruaid
			                                              (+)bairros|bai_id=del_baiid","del_comid=$this->com_id",'',0),true,"ped");
			$this->nota .= "Entregar:\n";
			$this->nota .= "_______________________________________________\n";
			$this->nota .= (RemoveAcentos($this->conn->ped["del_nome"]))."   (".$this->conn->ped["del_fone"].")"."\n";
			$this->nota .= (RemoveAcentos($this->conn->ped["rua_nome"]))." ".$this->conn->ped["del_endnum"]." ";
			$this->nota .= (RemoveAcentos($this->conn->ped["del_complemento"]))."\n";
			$this->nota .= "_______________________________________________\n";
			$this->nota .= "Qtde\t".str_pad("Item",20," ",STR_PAD_RIGHT)."Valor\t Total\n";
			$sql =  $this->conn->getJoinRecord("comandas(=)comanda_itens|com_id=cti_comid
                                     (=)produtos|cti_proid=pro_id","com_id=".$this->com_id,'',0);
			$rs = $this->conn->executa($sql);
			$preco_total = 0;
			while ($ln = $this->conn->fetch_array($rs)){
				
				$total = ($ln["cti_qtde"]*$ln["cti_valor"]);
				$this->nota .= $ln["cti_qtde"]."\t".str_pad(strtoupper(RemoveAcentos($ln["pro_nome"])),20," ",STR_PAD_RIGHT)
				."".number_format($ln["cti_valor"],2,",",".")."\t".number_format($total,2,",",".")."\n";			
				if ($ln["cti_obs"] != ''){
					$this->nota .="".RemoveAcentos($ln["cti_obs"])."\n";
					
				}
				$preco_total += $total;
							
				
			}	
			$this->nota .= "\t\t_______________________________\n";
			$this->nota .= "\t\tTOTAL \t\t\t\t".number_format($preco_total,2,",",".")."\n";				
			$this->nota .= "_______________________________________________\n";
			$this->nota .= "Obrigado pela Preferencia\n\n\n\n\n\n\n\n\n\n\n";
				
		}
		$arq=fopen("/tmp/".$this->com_id.".rec","w");
		fputs($arq,$this->nota);		
		fclose($arq);
		echo exec("lpr -P impmat /tmp/".$this->com_id.".rec");			
		sleep(2);
		unlink("/tmp/".$this->com_id.".rec");
		
	}
	
	
}