CREATE TABLE cardapios (
  car_id serial NOT NULL,
  car_nome VARCHAR(35) NULL,
  car_descr TEXT NULL,
  PRIMARY KEY(car_id)
);

CREATE TABLE grupos_alimentares (
  gra_id serial not null,
  gra_descr VARCHAR NULL,
  PRIMARY KEY(gra_id)
);

CREATE TABLE alimentos (
  ali_id serial NOT NULL,
  ali_descricao VARCHAR(50) NULL,
  ali_unmed CHAR(2) NULL,
  ali_vitamc DECIMAL(10,2) NULL,
  ali_carboidrato DECIMAL(10,2) NULL,
  ali_proteina DECIMAL(10,2) NULL,
  ali_lipidios DECIMAL(10,2) NULL,
  ali_calcio DECIMAL(10,2) NULL,
  ali_ferro DECIMAL(10,2) NULL,
  ali_vitama DECIMAL(10,2) NULL,
  ali_fibras DECIMAL(10,2) NULL,
  ali_fosforo DECIMAL(10,2) NULL,
  ali_graid INTEGER NULL,
  PRIMARY KEY(ali_id),
  FOREIGN KEY(ali_graid)
    REFERENCES grupos_alimentares(gra_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Est_entrada (
  ent_id serial NOT NULL,
  ent_aliid INTEGER ,
  ali_dtentrada DATE NOT NULL,
  ent_forid INTEGER ,
  ent_validade DATE NOT NULL,
  ent_lote INTEGER ,
  ent_quantidade INTEGER ,
  ent_receptor INTEGER ,
  ent_modlicit INTEGER ,
  ent_numero INTEGER ,
  ent_motentrada INTEGER ,
  ent_insid INTEGER ,
  ent_notafiscal INTEGER ,
  ent_precomedio DECIMAL(15,2) NULL,
  PRIMARY KEY(ent_id),
  FOREIGN KEY(ent_aliid)
    REFERENCES alimentos(ali_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE itens_cardapio (
  itc_aliid INTEGER  NOT NULL,
  itc_carid INTEGER ,
  itc_quantidade INTEGER ,
  FOREIGN KEY(itc_carid)
    REFERENCES cardapios(car_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(itc_aliid)
    REFERENCES alimentos(ali_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE est_saida (
  sai_id serial NOT NULL,
  sai_dtsaida DATE NULL,
  sai_aliid INTEGER NULL,
  sai_lote INTEGER NULL,
  sai_receptor INTEGER NULL,
  sai_gerador INTEGER NULL,
  sai_insid INTEGER NULL,
  PRIMARY KEY(sai_id),
  FOREIGN KEY(sai_aliid)
    REFERENCES alimentos(ali_id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


