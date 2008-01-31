/************ Update: Tables ***************/

/******************** Add Table: assatendimentos ************************/
CREATE SEQUENCE assatendimentos_ate_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE assatendimentos
(
	ate_id BIGINT NOT NULL DEFAULT nextval('assatendimentos_ate_id_seq'),
	ate_reqid INTEGER NOT NULL,
	ate_dtatende DATE NOT NULL,
	ate_obs VARCHAR(100) NOT NULL
);
ALTER TABLE assatendimentos ADD CONSTRAINT pkassatendimentos
	PRIMARY KEY (ate_id);

/* Set Comments */
COMMENT ON TABLE assatendimentos IS 'Atendimentos realizados pela Assitência';

/* Update Indexes for: assatendimentos */
CREATE INDEX assatendimentos_ate_reqid ON assatendimentos (ate_reqid);

/******************** Add Table: assservicosprest ************************/
CREATE SEQUENCE assservicosprest_ser_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE assservicosprest
(
	ser_id INTEGER NOT NULL DEFAULT nextval('assservicosprest_ser_id_seq'),
	ser_nome VARCHAR(50) NOT NULL
);
ALTER TABLE assservicosprest ADD CONSTRAINT pkassservicosprest
	PRIMARY KEY (ser_id);

/* Set Comments */
COMMENT ON TABLE assservicosprest IS 'servicos prestados pela assistencia';

/******************** Add Table: itens_assatendimentos ************************/

/* Build Table Structure */
CREATE TABLE itens_assatendimentos
(
	ite_ateid BIGINT NOT NULL,
	ite_serid INTEGER NOT NULL,
	ite_situacao CHAR(1) NOT NULL
);

/* Set Comments */
COMMENT ON COLUMN itens_assatendimentos.ite_serid IS 'código do servico prestados';

/* Update Indexes for: itens_assatendimentos */
CREATE INDEX itens_assatendimentos_ite_ateid ON itens_assatendimentos (ite_ateid);
CREATE INDEX itens_assatendimentos_ite_serid ON itens_assatendimentos (ite_serid);


/************ Add Foreign Keys to Database ***************/

/************ Foreign Key: assatendimentos_ate_reqid_fk ***************/
ALTER TABLE assatendimentos ADD CONSTRAINT assatendimentos_ate_reqid_fk
	FOREIGN KEY (ate_reqid) REFERENCES requerentes (req_id) ON DELETE NO ACTION;

/************ Foreign Key: itens_assatendimentos_ite_ateid_fk ***************/
ALTER TABLE itens_assatendimentos ADD CONSTRAINT itens_assatendimentos_ite_ateid_fk
	FOREIGN KEY (ite_ateid) REFERENCES assatendimentos (ate_id) ON DELETE NO ACTION;

/************ Foreign Key: itens_assatendimentos_ite_serid_fk ***************/
ALTER TABLE itens_assatendimentos ADD CONSTRAINT itens_assatendimentos_ite_serid_fk
	FOREIGN KEY (ite_serid) REFERENCES assservicosprest (ser_id) ON DELETE NO ACTION;