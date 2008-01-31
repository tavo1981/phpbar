/************ Update: Tables ***************/

/******************** Add Table: projetossociais ************************/
CREATE SEQUENCE projetossociais_pro_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE projetossociais
(
	pro_id INTEGER NOT NULL DEFAULT nextval('projetossociais_pro_id_seq'),
	pro_descr VARCHAR(60) NOT NULL
);

/******************** Add Table: reqativpro ************************/
CREATE SEQUENCE reqativpro_ati_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE reqativpro
(
	ati_id INTEGER NOT NULL DEFAULT nextval('reqativpro_ati_id_seq'),
	ati_reqid INTEGER NOT NULL,
	req_profid INTEGER NULL,
	ati_atividade VARCHAR(40) NULL,
	ati_local VARCHAR(45) NULL,
	ati_salario DECIMAL(10, 2) NULL,
	ati_tempotrab VARCHAR(50) NOT NULL,
	ati_munid INTEGER NULL
);
ALTER TABLE reqativpro ADD CONSTRAINT pkreqativpro
	PRIMARY KEY (ati_id);

/* Set Comments */
COMMENT ON TABLE reqativpro IS 'atividades profissionais do requerente';

/* Update Indexes for: reqativpro */
CREATE INDEX reqativpro_ati_munid ON reqativpro (ati_munid);
CREATE INDEX reqativpro_ati_reqid ON reqativpro (ati_reqid);

/******************** Add Table: reqdeficientes ************************/
CREATE SEQUENCE reqdeficientes_def_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE reqdeficientes
(
	def_id INTEGER NOT NULL DEFAULT nextval('reqdeficientes_def_id_seq'),
	def_morid INTEGER NOT NULL,
	def_nome VARCHAR(75) NULL,
	def_idade INTEGER NULL,
	def_deficiencia VARCHAR(50) NULL,
	def_beneficio CHAR(1) NULL,
	def_benevalor DECIMAL(10, 2) NULL
);
ALTER TABLE reqdeficientes ADD CONSTRAINT pkreqdeficientes
	PRIMARY KEY (def_id);

/* Update Indexes for: reqdeficientes */
CREATE INDEX reqdeficientes_def_morid ON reqdeficientes (def_morid);

/******************** Add Table: reqdependentes ************************/
CREATE SEQUENCE reqdependentes_dep_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE reqdependentes
(
	dep_id INTEGER NOT NULL DEFAULT nextval('reqdependentes_dep_id_seq'),
	dep_reqid INTEGER NOT NULL,
	dep_nome VARCHAR(75) NOT NULL,
	dep_dtnasc DATE NULL,
	dep_escid INTEGER NULL,
	dep_rg INTEGER NULL,
	dep_cpf VARCHAR(11) NULL
);
ALTER TABLE reqdependentes ADD CONSTRAINT pkreqdependentes
	PRIMARY KEY (dep_id);

/* Set Comments */
COMMENT ON TABLE reqdependentes IS 'cadastro de dependentes';

/* Update Indexes for: reqdependentes */
CREATE INDEX reqdependentes_dep_reqid ON reqdependentes (dep_reqid);

/******************** Add Table: reqidosos ************************/
CREATE SEQUENCE reqidosos_ido_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE reqidosos
(
	ido_id INTEGER NOT NULL DEFAULT nextval('reqidosos_ido_id_seq'),
	ido_morid INTEGER NOT NULL,
	ido_nome VARCHAR(75) NULL,
	ido_idade INTEGER NULL,
	ido_beneficio CHAR(1) NULL,
	ido_benevalor DECIMAL(10, 2) NULL
);

/* Update Indexes for: reqidosos */
CREATE INDEX reqidosos_ido_morid ON reqidosos (ido_morid);

/******************** Add Table: reqmoradias ************************/
CREATE SEQUENCE reqmoradias_mor_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE reqmoradias
(
	mor_id INTEGER NOT NULL DEFAULT nextval('reqmoradias_mor_id_seq'),
	mor_reqid INTEGER NOT NULL,
	mor_tipoesgoto CHAR(1) NULL,
	mor_tipo CHAR(1) NULL,
	mor_valaluga DECIMAL(10, 2) NULL,
	mor_nuncomodos INTEGER NULL,
	mor_nummora INTEGER NULL,
	mor_tipoconstruc CHAR(1) NULL,
	mor_agua CHAR(1) NULL,
	mor_luz CHAR(1) NULL,
	mor_banheiro CHAR(1) NULL,
	mor_numcompremu BYTEA NOT NULL
);
ALTER TABLE reqmoradias ADD CONSTRAINT pkreqmoradias
	PRIMARY KEY (mor_id);

/* Set Comments */
COMMENT ON COLUMN reqmoradias.mor_nummora IS 'Número dem moradores na casa';
COMMENT ON COLUMN reqmoradias.mor_tipoconstruc IS 'Tipo da Construcao';
COMMENT ON COLUMN reqmoradias.mor_numcompremu IS 'Númetro de componentes remunerados';
COMMENT ON TABLE reqmoradias IS 'Número dem moradores na casa';

/* Update Indexes for: reqmoradias */
CREATE INDEX reqmoradias_mor_reqid ON reqmoradias (mor_reqid);

/******************** Add Table: reqprojsocial ************************/

/* Build Table Structure */
CREATE TABLE reqprojsocial
(
	pro_reqid INTEGER NOT NULL,
	pro_proid INTEGER NOT NULL
);

/* Set Comments */
COMMENT ON TABLE reqprojsocial IS 'projetos socias que participa';

/* Update Indexes for: reqprojsocial */
CREATE INDEX reqprojsocial_pro_proid ON reqprojsocial (pro_proid);
CREATE INDEX reqprojsocial_pro_reqid ON reqprojsocial (pro_reqid);
CREATE UNIQUE INDEX reqprojsocial_pro_reqid_pro_proid ON reqprojsocial (pro_reqid, pro_proid);

/******************** Add Table: requerentes ************************/
CREATE SEQUENCE requerentes_req_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE requerentes
(
	req_id INTEGER NOT NULL DEFAULT nextval('requerentes_req_id_seq'),
	req_nome VARCHAR(75) NOT NULL,
	req_dtnasc DATE NOT NULL,
	req_sexo CHAR(1) NULL,
	req_nacid INTEGER NULL,
	req_numrg INTEGER NULL,
	req_rgcomp VARCHAR(15) NULL,
	req_rgemite INTEGER NULL,
	req_ufemissor INTEGER NULL,
	req_rgdtemiss DATE NULL,
	req_pis DECIMAL(40, 0) NULL,
	req_cpf INTEGER NULL,
	req_naturalidade INTEGER NULL,
	req_estcivil INTEGER NULL,
	req_fone VARCHAR(15) NULL,
	req_ruaid INTEGER NULL,
	req_endnun VARCHAR(15) NULL,
	req_compl VARCHAR(30) NULL,
	req_baiid INTEGER NULL,
	req_dtcad DATE NULL,
	req_obs TEXT NULL,
	req_rendafamiliar DECIMAL(12, 2) NOT NULL,
	req_habmun CHAR(1) NULL,
	req_habest CHAR(1) NULL
);
ALTER TABLE requerentes ADD CONSTRAINT pkrequerentes
	PRIMARY KEY (req_id);

/* Set Comments */
COMMENT ON COLUMN requerentes.req_rgcomp IS 'Complemento da RG';
COMMENT ON COLUMN requerentes.req_rgemite IS 'Orgão Emissor da RG';
COMMENT ON TABLE requerentes IS 'Complemento da RG';

/* Update Indexes for: requerentes */
CREATE INDEX requerentes_req_baiid ON requerentes (req_baiid);
CREATE INDEX requerentes_req_nacid ON requerentes (req_nacid);
CREATE INDEX requerentes_req_naturalidade ON requerentes (req_naturalidade);
CREATE INDEX requerentes_req_ruaid ON requerentes (req_ruaid);


/************ Add Foreign Keys to Database ***************/

/************ Foreign Key: reqativpro_ati_reqid_fk ***************/
ALTER TABLE reqativpro ADD CONSTRAINT reqativpro_ati_reqid_fk
	FOREIGN KEY (ati_reqid) REFERENCES requerentes (req_id) ON DELETE NO ACTION;

/************ Foreign Key: reqdeficientes_def_morid_fk ***************/
ALTER TABLE reqdeficientes ADD CONSTRAINT reqdeficientes_def_morid_fk
	FOREIGN KEY (def_morid) REFERENCES reqmoradias (mor_id) ON DELETE NO ACTION;

/************ Foreign Key: reqdependentes_dep_escid_fk ***************/
ALTER TABLE reqdependentes ADD CONSTRAINT reqdependentes_dep_escid_fk
	FOREIGN KEY (dep_escid) REFERENCES escolaridade (esc_id) ON DELETE NO ACTION;

/************ Foreign Key: reqdependentes_dep_reqid_fk ***************/
ALTER TABLE reqdependentes ADD CONSTRAINT reqdependentes_dep_reqid_fk
	FOREIGN KEY (dep_reqid) REFERENCES requerentes (req_id) ON DELETE NO ACTION;

/************ Foreign Key: reqidosos_ido_morid_fk ***************/
ALTER TABLE reqidosos ADD CONSTRAINT reqidosos_ido_morid_fk
	FOREIGN KEY (ido_morid) REFERENCES reqmoradias (mor_id) ON DELETE NO ACTION;

/************ Foreign Key: reqmoradias_mor_reqid_fk ***************/
ALTER TABLE reqmoradias ADD CONSTRAINT reqmoradias_mor_reqid_fk
	FOREIGN KEY (mor_reqid) REFERENCES requerentes (req_id) ON DELETE NO ACTION;

/************ Foreign Key: reqprojsocial_pro_proid_fk ***************/
ALTER TABLE reqprojsocial ADD CONSTRAINT reqprojsocial_pro_proid_fk
	FOREIGN KEY (pro_proid) REFERENCES projetossociais (pro_id) ON DELETE NO ACTION;

/************ Foreign Key: reqprojsocial_pro_reqid_fk ***************/
ALTER TABLE reqprojsocial ADD CONSTRAINT reqprojsocial_pro_reqid_fk
	FOREIGN KEY (pro_reqid) REFERENCES requerentes (req_id) ON DELETE NO ACTION;

/************ Foreign Key: requerentes_req_baiid_fk ***************/
ALTER TABLE requerentes ADD CONSTRAINT requerentes_req_baiid_fk
	FOREIGN KEY (req_baiid) REFERENCES bairros (bai_id) ON DELETE NO ACTION;

/************ Foreign Key: requerentes_req_nacid_fk ***************/
ALTER TABLE requerentes ADD CONSTRAINT requerentes_req_nacid_fk
	FOREIGN KEY (req_nacid) REFERENCES nacionalidades (nac_id) ON DELETE NO ACTION;

/************ Foreign Key: requerentes_req_naturalidade_fk ***************/
ALTER TABLE requerentes ADD CONSTRAINT requerentes_req_naturalidade_fk
	FOREIGN KEY (req_naturalidade) REFERENCES municipios (mun_id) ON DELETE NO ACTION;

/************ Foreign Key: requerentes_req_ruaid_fk ***************/
ALTER TABLE requerentes ADD CONSTRAINT requerentes_req_ruaid_fk
	FOREIGN KEY (req_ruaid) REFERENCES ruas (rua_id) ON DELETE NO ACTION;