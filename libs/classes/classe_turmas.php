<?
class turma {
	
	var $tur_id    = null;
	var $db        = null; //objeto id do banco
	var $tur_ano   = null;
	var $tur_serie = null;
	var $tur_insid = null;
	
	function turma ($tur_id,$db){
		
		$this->db = $db;
		$this->tur_id = $tur_id;
		$this->db->dselect("turmas","tur_id",$this->tur_id,true);
		$this->tur_ano        = $this->db->dados["tur_ano"];
		$this->tur_serie      = $this->db->dados["tur_serie"];
		$this->tur_insid      = $this->db->dados["tur_insid"];
		$this->tur_nivel      = $this->db->dados["tur_nivel"];
		$this->tur_modalidade = $this->db->dados["tur_modalidade"];
		$this->tur_tipo       = $this->db->dados["tur_tipo"];
		
		
	}
	
	function descturma($total=0){
		$desc = '';
		$sql = "SELECT	tur_serie,
		                mod_sigla,
		                tip_sigla,
		                niv_sigla,	
		                tur_maxi,
		                niv_ord,
		                (SELECT COUNT(*) 
		                FROM    movalunos
		                WHERE   mov_turid = tur_id
		                AND     mov_dtsaida IS NULL ) AS talunos,
		                (CASE WHEN mod_id = 2 and tip_id = 2 THEN
		                      (SELECT eja_fase||' '||eja_modal 
		                       FROM   ejadesc
		                       WHERE  eja_ano = tur_ano
		                       AND    eja_serie = tur_serie) END ) AS eja_desc
		         FROM turmas INNER JOIN modalidades ON mod_id   = tur_modalidade
		                     INNER JOIN niveis ON niv_id        = tur_nivel
		                     INNER JOIN tipos_turmas ON tip_id  = tur_tipo
		         WHERE tur_id = ".$this->tur_id;		
		
		$this->db->executa($sql,true,"tur");
		if ($this->tur_modalidade != 2){
			
			$desc =  $this->db->tur["tur_serie"]." ";
        	$desc .= $this->db->tur["niv_ord"]." ";
		}
        $desc .= $this->db->tur["mod_sigla"]." ";
        $desc .= $this->db->tur["tip_sigla"]." ";
		$desc .= $this->db->tur["tur_sigla"]." ";
		$desc .= $this->db->tur["eja_desc"]." ";
		$desc .=  $this->db->tur["niv_sigla"];
		
		return str_replace("  "," ",$desc);
		
	}
	
}
?>