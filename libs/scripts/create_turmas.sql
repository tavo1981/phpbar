--create table grau(
--  gra_id      serial not null primary key,
--  grau_descr  varchar not null

--);


create table turmas(
  tur_id          serial not null primary key,
  tur_idgrau      int8 references grau(gra_id) not null,
  tur_insid       int8 references instituicoes(ins_id) not null,
  tur_modalidade  int8 references modalidades (mod_id) not null,
  tur_serie       numeric(1),
  tur_turno       numeric(1),
  tur_turma       numeric(2),
  tur_ano         char(4),
  tur_alias       varchar(5)
);
