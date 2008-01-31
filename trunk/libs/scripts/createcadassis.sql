CREATE TABLE cadsoc (
  Cad_Id  serial NOT NULL primary key
  Cad_nome varchar(35) NOT NULL default '',
  Cad_Sobrenome varchar(35) NOT NULL default '',
  Cad_DataCad date NOT NULL ,
  Cad_DataNasc date NOT NULL ,
  Cad_Pai varchar(60) default NULL,
  Cad_Mae varchar(60) default NULL,
  Cad_ruaid varchar(60) NOT NULL default '',
  Cad_Baiid integer NOT NULL default '0',
  Cad_PtoRef varchar(60) default NULL,
  Cad_Profid integer NOT NULL default '0',
  Cad_Escolaridade integer NOT NULL default '',
  Cad_Prog varchar(100) default NULL,
  Cad_BenFinan varchar(100) default NULL,
  Cad_Renda decimal(10,2) default NULL,
  Cad_Patologia varchar(100) default NULL,
  Cad_AtendPub varchar(100) default NULL,
  Cad_Obs text default NULL,
);

create index cadsoc_cad_baiid on cadsoc (cad_baiid);
create index cadsoc_cad_ruaid on cadsoc (cad_ruaid);
create index cadsoc_cad_profid on cadsoc (cad_profid);
alter table cadsoc add constraint cadsoc_cad_baiid_fk 
            foreign key (cad_baiid) references bairros (bai_id);
alter table cadsoc add constraint cadsoc_cad_ruaid_fk 
            foreign key (cad_ruaid) references ruas (rua_id);        
alter table cadsoc add constraint cadsoc_cad_profid_fk 
            foreign key (cad_ruaid) references profissoes (prof_id);                  
             


CREATE TABLE Atendimentos (
  Ate_Id serial NOT NULL primary key,
  Cad_Id integer NOT NULL,
  Ate_dtatdend date NOT NULL ,
  Ate_Obs varchar(255) default NULL,
);
 