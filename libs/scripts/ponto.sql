--create table cartaoponto(
--  pto_id   serial not null,
--  pto_data  date not null,
--  pto_mat   integer,
--  pto_insid integer,
--  pto_entrada time,
--  pto_saida  time,
--  pto_turno integer
  
--);

--create table permponto(
-- ppto_id serial not null,
--  ppto_horaent time, 
--  ppto_horasai time,
--  ppto_matricula integer

--);

-----------
--Alter table cartaoponto add constraint cartaoponto_pkey primary key  (pto_id);
--alter table cartaoponto add constraint cartaoponto_pto_insid_fkey foreing key (pto_insid) references instituicoes(ins_id);
--create index  cartaoponto_pto_insid on cartaoponto(pto_insid);
  
create table ponto_horasprep(
  php_id  serial not null primary key,
  php_mat integer not null,
  php_dthp date not null,
  php_insid integer,
  php_horaini time,
  php_horafim time
);

--------------------
--criando indices --
--------------------

create index ponto_horasprep_php_mat on ponto_horasprep(php_mat);
create index ponto_horasprep_phpdt on ponto_horasprep(php_dthp);
create unique index ponto_horasprep_phpdt_phpmat on ponto_horasprep(php_dthp,php_mat); 
