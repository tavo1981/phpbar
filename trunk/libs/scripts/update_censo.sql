--criando tabela uf
create table uf (
  uf_id      integer primary key not null,
  uf_sigla   char(2);
  uf_nome    varchar(60)
);

--criando tabela municipios
create table municipios (
  mun_id       integer not null  primary key,
  mun_codmunic decimal(30) not null,
  mun_anocria  char(4),
  mun_ufid     integer not null,
  mun_nome     varchar(80) not null,
  mun_cepini   integer,
  mun_cepfim   integer
);

alter table municipios add constraint municipios_ufid_fk
      foreign key ( mun_ufid ) references uf(uf_id);
create index municipios_mun_ufid  on municipios(mun_ufid);

--criando tabela orgaos_emissores

create table orgaos_emissores (
   org_id integer primary key not null,
   org_nome varchar(100)
);   

create table nacionalidades(
  nac_id serial not null primary key,
  nac_nome varchar(75) not null
  );
--alterando a tabela professoress
alter table professores add prof_sexo char(1);
alter table professores add prof_logra integer;
alter table professores add prof_munid integer ;
alter table professores add prof_tcertidao char(1);
alter table professores add prof_numcertidao integer;
alter table professores add prof_certlivro   varchar(30);
alter table professores add prof_certfolha   varchar(30);
alter table professores add prof_dtcertidao  date;
alter table professores add prof_certuf      integer;
alter table professores add prof_dtrgemiss   date;
alter table professores add prof_rguf        integer;
alter table professores add prof_rgom        integer;
alter table professores add prof_ctps        integer;
alter table professores add prof_ctpsserie   varchar(30);
alter table professores add prof_dtctpemiss  date;
alter table professores add prof_ctpsuf      integer;
alter table professores add prof_ufnat       integer;
alter table professores add prof_uf          integer;
alter table professores add prof_nacionalidade  integer;
ALTER TABLE professores ADD prof_certom integer;

create index professores_prof_rgom on professores (prof_rgom);
create index professores_prof_logra on professores (prof_logra);

create table escolaridade (
  esc_id serial not null primary key,
  esc_descr   varchar(70)
);

insert into escolaridade values (1,'Fundamental Incompleto');
insert into escolaridade values (2,'Fundamental Completo');
insert into escolaridade values (3,'Médio com Magisterio');
insert into escolaridade values (4,'Médio');
insert into escolaridade values (5,'Licenciatura completa');
insert into escolaridade values (6,'Superior sem licenciatura(c/magis)');
insert into escolaridade values (7,'Superior sem licenciatura(s/magis)');
select setval('escolaridade_esc_id_seq',7);