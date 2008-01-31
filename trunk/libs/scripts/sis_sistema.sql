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
   