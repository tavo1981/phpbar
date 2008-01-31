-----------------------------------------------------
----- Tabela concursos_publicos ---------------------
-----------------------------------------------------
create table concursos_publicos (
  con_id   serial not null primary key,
  con_nome varchar(75) not null,
  con_edital varchar   not null,
  con_valor  decimal(10,2),
  con_dtpub  date not null,
  con_dtsai  date not null,
  con_dtinscrini date,
  con_dtinscrfim date
);
create index concursos_publicos_con_dtpub on concursos_publicos (con_dtpub);
create index concursos_publicos_con_dtsai on concursos_publicos (con_dtsai);
-----------------------------------------------------
----- Tabela concursos_documentos -------------------
-----------------------------------------------------
create table concursos_documentos(
  doc_conid integer not null,
  doc_nome  varchar(50) not null
);
create index concursos_documentos_doc_conid on concursos_documentos (doc_conid);
alter table  concursos_documentos add constraint concursos_documentos_doc_conid_fk 
      foreign key (doc_conid) references concursos_publicos (con_id);
      
      
-----------------------------------------------------
----- Tabela concursos_cargos---- -------------------
-----------------------------------------------------

create table concursos_cargos (
   car_conid    integer not null,
   car_descr    varchar(50) not null,
   car_numvagas integer not null
);   
create index concursos_cargos_car_conid on concursos_cargos (car_conid);
alter table  concursos_cargos add constraint concursos_cargos_car_conid_fk 
      foreign key (car_conid) references concursos_publicos (con_id);
      
-----------------------------------------------------
----- Tabela evento_princ ---------------------------
-----------------------------------------------------

create table evento_princ(
    evp_id serial not null primary key,
    evp_nome    varchar(35),
    evp_dtentrada date not null,
    evp_dtsaida   date not null,
    evp_imagem    varchar(50)
);

    
-----------------------------------------------------
----- Tabela lista_saponline ------------------------
-----------------------------------------------------

create table lista_saponline(
   sol_id  serial not null primary key,
   sol_email varchar(255) not null unique,
   sol_nome  varchar(70),
   sol_dtcad date
);   