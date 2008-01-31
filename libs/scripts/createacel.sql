create table aceleracao (
  ace_id serial not null primary key,
  ace_aluid   integer  not null,
  ace_sorig   char(1),
  ace_spromo  char(1),
  ace_insid   integer,
  ace_ano     integer not null
);

alter table aceleracao add constraint aceleracao_ace_aluid_fk 
            foreign key (ace_aluid) references  alunos(alu_id);

alter table aceleracao add constraint aceleracao_ace_insid_fk 
            foreign key (ace_insid) references  instituicoes(ins_id);
            
create index aceleracao_ace_aluid  on aceleracao(ace_aluid);           
create index aceleracao_ace_insid  on aceleracao(ace_insid);
create index aceleracao_ace_ano    on aceleracao(ace_ano);


create table destinos (
   des_id serial not null primary key,
   des_aluid  integer not null,
   des_dtsaida date not null,
   des_local   integer,
   des_fone    varchar(15),
   des_motivo  varchar(150),
   des_insid   integer,
   des_localdesc varchar(60)  
);

alter table destinos add constraint destinos_des_aluid_fk 
            foreign key (des_aluid) references  alunos(alu_id);
alter table destinos add constraint destinos_des_insid_fk 
            foreign key (des_insid) references  instituicoes(ins_id);
            
create index destinos_des_aluid  on destinos(des_aluid);           
create index destinos_des_insid  on destinos(des_insid);
                     
create table sis_ajuda(
  aju_id serial not null primary key,
  aju_item varchar(100),
  aju_descricao   text
);
  
create table tipos_logs(
	
  tip_id serial not null primary key,
  tip_descr  varchar(50)
); 

create table sis_log(
	
	log_id     serial not null primary key,
	log_usuid  integer not null,
	log_dtlog  date,
	log_hora   time,
	log_tipid  integer,
	log_tabela varchar(30)
);	

alter table sis_log add constraint sis_log_log_tip_id_fk 
            foreign key (log_tipid) references  tipos_logs(tip_id);

create index sis_log_log_usuid on sis_log (log_usuid);
create index sis_log_log_tipid on sis_log (log_tipid);

create table campos_log (
	
	cam_logid integer,
	cam_nome  varchar (50),
	cam_valor varchar(100)
);

alter table campos_log add constraint campos_log_cam_logid_fk 
            foreign key (cam_logid) references  sis_log(log_id);
create index campos_log_cam_logid on campos_log (cam_logid);           

create table sis_versaobase(
   bas_dtaltera date,
   bas_versao varchar(15),
   base_usuid integer,
   base_descricao text,
   base_mudado text
);   

create table ins_dtcriacao(
    cria_insid         integer not null,
	cria_decreto       varchar(20),
	cria_dtdecreto     date,
	cria_dtdecdiario   date,
	cria_portaria      varchar(20),
	cria_dtportaria    date,
	cria_dtportdiario  date,
	cria_decreorg      varchar(20),
	cria_dtdecreorg    date,
	cria_dtreorfdiario date,
);

alter table ins_dtcriacao add constraint ins_dtcriacao foreign key (cria_insid) references instituicoes (ins_id);
create index ins_dtcriacao_cria_insid  on ins_dtcriacao(cria_insid);

create table ataobs (

	ata_id serial not null,
	ata_ano integer not null,
	ata_insid  integer,
	ata_turid integer,
	ata_obs   text
	
);

create table obsdocpad (
	
   obs_id serial not null primary key,
   obs_ano integer,
   obs_modid  integer,
   obs_tipid  integer,
   obs_texto  text
);   

create table acelera (
  ace_id serial  not null primary key,
  ace_aluid      integer  not null,
  ace_serieorig  char(1),
  ace_serieapro  char(1),
  ace_insid      integer,
  ace_ano        integer not null
);

alter table acelera add constraint acelera_ace_aluid_fk 
            foreign key (ace_aluid) references  alunos(alu_id);

alter table acelera add constraint acelera_ace_insid_fk 
            foreign key (ace_insid) references  instituicoes(ins_id);
            
create index acelera_ace_aluid  on acelera(ace_aluid);           
create index acelera_ace_insid  on acelera(ace_insid);
create index acelera_ace_ano    on acelera(ace_ano);

CREATE FUNCTION minusculas(text) RETURNS text AS '
    SELECT translate( lower($1),
           text ''¡…Õ”⁄¿»Ã“Ÿ√’¬ Œ‘€ƒÀœ÷‹«'',
           text ''·ÈÌÛ˙‡ËÏÚ˘„ı‚ÍÓÙÙ‰ÎÔˆ¸Á'')
' LANGUAGE SQL STRICT;


create or replace function month(date)
returns text as 
'

BEGIN
return date_part(''MONTH'', $1);
end;
'
Language 'plpgsql' VOLATILE;

drop function day(date);
create or replace function day(date)
returns interval as 
'
BEGIN

return date_part(''DAY'',$1);
end;
' 
Language 'plpgsql' VOLATILE;

create or replace function year(date)
returns text as 
'
BEGIN

return date_part(''YEAR'',$1);
end;
' 
Language 'plpgsql' VOLATILE;


create table esctransportes (
     
   tra_id  serial not null primary key,
   tra_aluid    integer not null,
   tra_insid    integer not null,
   tra_ano    integer,
   tra_org    char(1),
   tra_zona   char(1)
);   

alter table esctransportes add constraint esctransportes_tra_aluid_fk
      foreign key (tra_aluid) references alunos (alu_id);

create index esctransportes_tra_aluid on esctransportes(tra_aluid);
  