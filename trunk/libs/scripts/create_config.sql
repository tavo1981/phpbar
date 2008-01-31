CREATE TABLE tipo_avaliacoes (
  avl_id SERIAL NOT NULL,
  avl_nome VARCHAR(50) NOT NULL,
  PRIMARY KEY(avl_id)
);

CREATE TABLE conf_anoletivo (
  cfg_id         SERIAL     NOT NULL,
  cfg_ano        CHAR(4)    NOT NULL,
  cfg_dtmatr     date,
  cfg_dtencerra  date,  
  cfg_tipoid     INT8       NOT NULL,
  cfg_notamax    varchar(5),
  cfg_notamin    varchar(6),
  cfg_media      varchar(6),
  primary key (cfg_id)
 
);



CREATE TABLE periodos (
  per_id       serial primary key not null,
  per_cfgid    integer not null,
  per_insid    integer    NOT NULL,
  per_periodo  integer not null,
  per_dtini    date,
  per_dtfim    date,
  per_diaslet  integer,
  per_cargahor integer,
  per_peso     integer
);

-- Criacão dos indices e chaves estrabgeiras das tabelas;--
--                                                       --  
-----------------------------------------------------------

--table conf_anoletivo
alter table conf_anoletivo add constraint conf_anoletivo_cfg_tipoid_rel 
foreign key (cfg_tipoid) references tipo_avaliacoes (avl_id);

create index conf_anoletivo_cfg_tipoid_fk on conf_anoletivo(cfg_tipoid);


-- table periodos
alter table periodos add constraint periodos_per_cfgid 
foreign key (per_cfgid) references conf_anoletivo (cfg_id);

alter table periodos add constraint periodos_per_insid_rel 
foreign key (per_insid) references instituicoes (ins_id);

create index periodos_per_cfgid on periodos(per_cfgid);
create index periodos_per_periodo on periodos(per_periodo);
create index periodos_per_insid on periodos(per_insid);



