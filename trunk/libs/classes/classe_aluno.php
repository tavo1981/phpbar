<?
class aluno {
	
	var $alu_id           = null;
	var $alu_nome         = null;
	var $alu_pai          = null;
	var $alu_dtnasc       = null;
	var $alu_procedid     = null;
	var $pro_nome         = null;
	var $alu_mae          = null;
	var $alu_resplegal    = null;
	var $alu_sexo         = null;
	var $alu_dtprocede    = null;
	var $alu_ruaid        = null;
	var $rua_nome         = null;
	var $bai_descr        = null;
	var $alu_endnum       = null;
	var $alu_endcompl     = null;
	var $alu_baiid        = null;
	var $alu_respfone     = null;
	var $alu_resideid     = null;
	var $alu_zimid        = null;
	var $alu_movid        = null;
	var $db               = null; //objeto id do banco
	var $mov_id           = null;
	var $mov_insid        = null;
	var $mov_ano          = null;
	var $mov_turid        = null;
	var $mov_dtentrada    = null;
	var $mov_tipoentrada  = null;
	var $mov_tiposaida    = null;
	var $mov_dtsaida      = null;
	var $mov_serie        = null;
	var $mov_sitant       = null;
	var $ins_nome         = null;
	var $tur_nome         = null;
	
	
	function __construct($alu_id,$db){
		
		
		$this->db = $db;
		//$this->db->_DEBUG = 1;
		$this->db->executa($this->db->getJoinRecord("alunos(=)movalunos|alu_movid=mov_id
		                                                   (+)procedencias|alu_procedid=pro_id
		                                                   (+)ruas|alu_ruaid=rua_id
		                                                   (+)bairros|alu_baiid=bai_id
		                                                   (+)instituicoes|ins_id=mov_insid
		                                                   (+)turmas|tur_id=mov_turid",		
		                                                   "alu_id=$alu_id","",0),true,"aluno");
		$rscam    = $this->db->getAttTable("alunos");      
				
		while ($ln = $this->db->fetch_array($rscam)){
			
			$this->$ln["attname"] = $this->db->aluno[$ln["attname"]];
						
		}
		
		$rsmov    = $this->db->getAttTable("movalunos"); 
		while ($ln = $this->db->fetch_array($rsmov)){
			
			$this->$ln["attname"] = $this->db->aluno[$ln["attname"]];
					
		}
		$this->pro_nome      = $this->db->aluno["pro_nome"];
		$this->bai_descr     = $this->db->aluno["bai_descr"];
		$this->rua_nome      = $this->db->aluno["rua_nome"];
		$this->alu_dtnasc    = strformat($this->alu_dtnasc,"dtbr");
		$this->mov_dtentrada = strformat($this->mov_dtentrada,"dtbr");
		$this->ins_nome      = $this->db->aluno["ins_nome"];
		$this->tur_nome      = $this->db->aluno["tur_nome"];		
		if ($this->mov_turid != null){
			if (class_exists(turma)){
				$turma = new turma($this->mov_turid,$this->db);
			}else{
			
				require("../libs/classes/classe_turmas.php");
				$turma = new turma($this->mov_turid,$this->db);			
			}
			$this->tur_nome .= " ".$turma->descturma();
			$this->tur_tipo  = $turma->tur_tipo;
		}
		if ($this->alu_id != null){
			$this->db->executa($this->db->getAll("histserie","hse_aluid = ".$this->alu_id,"hse_ano desc limit 1",0),true,"hse");
		}
		$this->hse_resfim = $this->db->hse["hse_resfim"];
		$this->hse_ano    = $this->db->hse["hse_ano"];
		$this->hse_serie  = $this->db->hse["hse_serie"];
		
	}
	
	function getDocs(){
		
		
		      
		
		
	}
	
	function getResp(){
		
		
		   
		
		
	}
	
	function validaDados(){
		
		
		
		
	}
	
		
	function ajxDadosAlunos(){
		
		$json   = new Services_JSON();
		$rscam  = $this->db->getAttTable("alunos");      
				
		while ($ln = $this->db->fetch_array($rscam)){
			
			$dados[$ln["attname"]] = $this->$ln["attname"];
						
		}
		
		$rsmov   = $this->db->getAttTable("movalunos"); 
		while ($ln = $this->db->fetch_array($rsmov)){
			
			$dados[$ln["attname"]] = $this->$ln["attname"];
					
		}
		
		$dados["rua_nome"]   = urlencode($this->rua_nome);
		$dados["bai_descr"]  = urlencode($this->bai_descr);
		$dados["pro_nome"]   = urlencode($this->pro_nome);
		$dados["ins_nome"]   = urlencode($this->ins_nome);
		$dados["tur_nome"]   = urlencode($this->tur_nome);
		$dados["hse_resfim"] = $this->hse_resfim;
		$dados["hse_ano"]    = $this->hse_ano;
		$dados["hse_serie"]  = $this->hse_serie;
		$dados["tur_tipo"]   = $this->tur_tipo;
		return $json->encode($dados);
		
		
	}
	
}