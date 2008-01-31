create table locais(
   loc_id serial not null primary key,
   loc_desc varchar(50), 
   loc_locid integer
 );

create table tipo_equipamento(
	tip_id serial not null primary key,
	tip_descricao varchar(50)


);

create table equipeinf(
     equ_id    serial not null primary key,
     equ_nome  varchar(75),
     equ_tipid integer not null,
     equ_locid integer not null,
     equ_ip    varchar(50),
     equ_insid integer

);

alter table   equipeinf add constraint 
              equipeinf_equ_locid_fk foreign key references locais(loc_id);
create index  equipeinf_equ_locid  on equipeinf(equ_locid);
         