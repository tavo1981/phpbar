create table tipo_autonomia (
    tpa_id serial not null primary key,
    tpa_descr varchar(35)  
);

create table cont_agualuz (
   cal_id     serial not null primary key,
   cal_insid  integer not null,
   cal_tipo   char(1) not null,
   cal_valor  decimal(10,2) not null
);

-- alterações tabela instituicoes --
--                                --   
------------------------------------
alter table instituicoes add constraint instituicoes_ins_autonomia_fk 
      foreign key (ins_autonomia) references tipo_autonomia(tpa_id);
      
create index instituicoes_ins_autonomia on instituicoes(ins_autonomia);

-- alterações tabela cont_agualuz --
--                                --   
------------------------------------

alter table cont_agualuz add constraint cont_agualuz_cal_insid_fk 
      foreign key (cal_insid) references instituicoes(ins_id);
      
create index cont_agualuz_ins_id on cont_agualuz(cal_insid);    
      






