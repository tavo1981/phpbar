----------------------
-- Tabela: empresas --
----------------------
CREATE TABLE empresas (
   emp_id       integer not null primary key,
   emp_nome     varchar(60) not null,
   emp_ruaid    integer not null,
   emp_num      integer not null,
   emp_baiid    integer not null,
   emp_cnpj     varchar(14) not null,
   emp_respons  varchar(60) not null,
   emp_rescpf   varchar(11) not null,
   emp_resrg    varchar(15) not null,
   emp_email    varchar(70) not null,
   emp_fone     varchar(15)
);

----------------------------
-- Tabela: tipo_convenios --
----------------------------
CREATE TABLE tipo_convenios (
  tco_id    SERIAL NOT NULL PRIMARY KEY,
  tco_descr VARCHAR(30) NOT NULL,
  tco_valor DECIMAL(8,2)
);

-----------------------
-- Tabela: convenios --
-----------------------

CREATE TABLE convenios(
  con_id       INTEGER PRIMARY KEY NOT NULL,
  con_empid    INTEGER NOT NULL,
  con_tipoid   INTEGER NOT NULL,
  con_dtini    DATE NOT NULL,
  con_dtfim    DATE NOT NULL,
  con_numvagas INTEGER,
  con_ativo    CHAR(1)  
);

---------------------------
-- Tabela: alunos_creche --
---------------------------

CREATE TABLE alunos_creche (
   acr_id     SERIAL NOT NULL PRIMARY KEY,
   acr_nome   VARCHAR(60) NOT NULL,
   acr_resp   VARCHAR(60) NOT NULL,
   acr_sexo   CHAR(1),
   acr_dtnasc DATE NOT NULL,
   acr_insid  INTEGER NOT NULL,
   ac_conv    CHAR(1)
);

---------------------------------------
-- Tabela: Pagamentos_conv           --
-- Descrição: controla os pagamentos --
--            dos termos e convênios --
---------------------------------------

 CREATE TABLE pagamentos(
   pag_empid  INTEGER,
   pag_valor  DECIMAL(15,2),
   pag_dtpag  date
 );

 -----------------------------------------
 -- Tabela: empresas_creches            --
 -- descrição: Controla as instituicoes --
 --            que cada empresa coopera -- 
 -----------------------------------------
 
 CREATE TABLE empresas_creches(
    ecr_id serial not null primary key,
    ecr_conid integer not null,
    ecr_insid integer not null,
    ecr_ano   char(4) not null
  );  
  
  
 -----------------------------------------
 -- Tabela: alunos_convenios            --
 -- descrição: Controla os alunos por   --
 --            convenio                 -- 
 -----------------------------------------
 
 CREATE TABLE aluno_convenio(
    acon_id     serial   not null primary key,
    acon_acrid  integer  not null,
    acon_conid  integer  not null,
    acon_ano    integer  not null 
 );
 --------------------------------
 -- Indices e FKs: Empresas    -- 
 --------------------------------
 CREATE INDEX empresas_emp_nome  ON empresas (emp_nome);
 CREATE INDEX empresas_emp_ruaid ON empresas(emp_ruaid);
 CREATE INDEX empresas_emp_baiid ON empresas(emp_baiid);
 CREATE UNIQUE INDEX empresas_emp_cnpj ON empresas (emp_cnpj);
 
 ALTER TABLE empresas ADD CONSTRAINT empresas_emp_ruaid_fk FOREIGN KEY (emp_ruaid) REFERENCES ruas(rua_id);
 ALTER TABLE empresas ADD CONSTRAINT empresas_emp_baiid_fk FOREIGN KEY (emp_baiid) REFERENCES bairros(bai_id);
 
 -----------------------------------
 -- Indices e FKs: tipo_convenios -- 
 -----------------------------------
 
 CREATE INDEX tipo_convenios_tco_descr ON tipo_convenios(tco_descr);
 
 
 -----------------------------------
 -- Indices e FKs: convenios      -- 
 -----------------------------------
 CREATE INDEX convenios_con_empid  ON convenios(con_empid);
 CREATE INDEX convenios_con_tipoid ON convenios(con_tipoid);
 
 ALTER TABLE convenios ADD CONSTRAINT convenios_con_empid_fk FOREIGN KEY (con_empid) REFERENCES empresas(emp_id);
 ALTER TABLE convenios ADD CONSTRAINT convenios_con_tipoid_fk FOREIGN KEY (con_tipoid) REFERENCES tipo_convenios(tco_id); 
 
 -----------------------------------
 -- Indices e FKs: Alunos_creche  -- 
 -----------------------------------
 
 
 CREATE INDEX alunos_creche_acr_insid ON alunos_creche(acr_insid);
 
 ALTER TABLE  alunos_creche ADD CONSTRAINT alunos_creche_acr_insid_fk FOREIGN KEY (acr_insid) REFERENCES instituicoes(ins_id);
    
 -----------------------------------
 -- Indices e FKs: PAGAMENTOS     -- 
 -----------------------------------
 
CREATE INDEX pagamentos_pag_empid ON pagamentos(pag_empid);
ALTER TABLE pagamentos add CONSTRAINT pagamentos_pag_empid_fk FOREIGN KEY(pag_empid) REFERENCES empresas(emp_id);

 -------------------------------------
 -- Indices e FKs: empresas-crecehs -- 
 -------------------------------------
 CREATE INDEX empresas_creches_conid ON empresas_creches(ecr_conid);
 CREATE INDEX empresas_creches_insid ON empresas_creches(ecr_insid);
 
 create unique index empresas_creches_unique on empresas_creches (ecr_conid,ecr_insid,ecr_ano);
 ALTER TABLE empresas_creches ADD CONSTRAINT empresas_creches_ecr_conid_fk FOREIGN KEY (ecr_conid) REFERENCES convenios(con_id);
 ALTER TABLE empresas_creches ADD CONSTRAINT empresas_creches_ecr_insid_FK FOREIGN KEY (ecr_insid) REFERENCES instituicoes(ins_id);
 