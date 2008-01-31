--create table sis_grupos(
--   grp_id serial not null primary key,
--   grp_descr varchar(35) not null
--);

--alter table sis_usuarios add usu_grpid integer;
--alter table sis_usuarios add constraint sis_usuarios_usu_grpid 
--            Foreign key (usu_grpid) references sis_grupos (grp_id);   

create table tipos_chamados(
  tch_id serial not null primary key,
  tch_descricao varchar(50)
);

create table chamados( 
   cha_id serial not null primary key,
   cha_dtini     date,
   cha_dtprazo   date,
   cha_descricao text,
   cha_micro     varchar(75),
   cha_usuid     integer,
   cha_tchid     integer,
   cha_situcao   char(1)
);

alter table chamados add constraint chamados_cha_usuid 
                     foreign key (cha_usuid) references sis_usuarios(usu_id);
                     
alter table chamados add constraint chamados_cha_tchid 
                     foreign key (cha_tchid) references tipos_chamados(tch_id);

                     
create table movimentos_chamados (
   mov_id serial not null primary key,
   mov_dtmov   date,
   mov_usuid   integer,
   mov_descricao text
);

alter table movimentos_chamados add constraint movimentos_chamados_mov_usuid 
                     foreign key (mov_usuid) references sis_usuarios(usu_id);
                                            
    