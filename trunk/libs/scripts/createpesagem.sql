create table pesoidade (
    
    pes_sexo  char(1),
    pes_anos  integer,
    pes_meses integer,
    pes_p3    decimal(5,2),  
    pes_p10   decimal(5,2),
    pes_p97   decimal(5,2)
);

create table estadonutric (

	est_id integer not null primary key,
	est_descr varchar(70)
);


create table pesagem (

  pes_aluid integer not null,
  pes_insid integer not null,
  pes_dtpes date,
  pes_ano   integer,
  pes_mes   integer,
  pes_altura decimal(8,2),
  pes_peso   decimal(5,2),
  pes_estnutri integer
);

create index pesagem_pes_aluid on pesagem (pes_aluid);
create index pesagem_pes_insid on pesagem (pes_insid);
alter table pesagem add constraint pesagem_pes_aluid_fk 
            foreign key (pes_aluid) references alunos (alu_id);

alter table pesagem add constraint pesagem_pes_insid_fk 
            foreign key (pes_insid) references instituicoes (ins_id);             
            
