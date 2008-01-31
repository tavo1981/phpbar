-----Merenda.sql
--------------------tabela Alimentos

alter table alimentos add ali_caltotal decimal(10,2);
alter table alimentos add ali_sodio decimal(10,2);
alter table alimentos add ali_colesterol decimal(10,2);
alter table alimentos add ali_potacio decimal(10,2);
alter table alimentos add ali_categoria integer;

-----------tabela est_entrada ------------------

alter table est_entrada add est_marca varchar(75);

