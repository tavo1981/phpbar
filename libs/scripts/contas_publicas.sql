create table cp_tipoitem(
  tpi_id serial  primary key not null,
  tpi_ano   char(4) not null,
  tpi_tipo  decimal(2),
  tpi_nomeitem varchar(75)
);  

CREATE index cp_tipoitem_tpi_ano on cp_tipoitem(tpi_ano);
CREATE index cp_tipoitem_tpi_tipo on cp_tipoitem(tpi_tipo);


drop table cp_orcamento;
drop table cp_ldo;
drop table cp_balancete;
drop table cp_lrf;
create table cp_orcamento (
  orc_id serial not null primary key,
  orc_tpiid     integer  not null,
  orc_arquivo   varchar(150),
  orc_ano       char(4),
  orc_dtlanc    date
);
  
create index cp_orcamento_orc_ano on cp_orcamento(orc_ano);
create index cp_orcamento_orc_tpiid on cp_orcamento(orc_tpiid);
alter table cp_orcamento add constraint cp_orcamento_orc_tpiid_fk
       foreign key (orc_tpiid) references cp_tipoitem(tpi_id);

create table cp_ldo (
  ldo_id serial not null primary key,
  ldo_tpiid     integer not null,
  ldo_arquivo   varchar(150),
  ldo_ano       char(4),
  ldo_dtlanc    date
);

create index cp_ldo_ldo_ano on cp_ldo(ldo_ano);
create index cp_ldo_ldo_tpiid on cp_ldo(ldo_tpiid);
alter table cp_ldo add constraint cp_ldo_ldo_tpiid_fk
       foreign key (ldo_tpiid) references cp_tipoitem(tpi_id);

create table cp_balancete (
  bal_id  serial not null primary key,
  bal_mes        integer not null,
  bal_arquiv     varchar(150),
  bal_ano        char(4),
  bal_tipo       char(1)
);
create index cp_balacente_bal_ano on cp_balancete(bal_ano);
create index cp_balacente_bal_tipo on cp_balancete(bal_tipo);

create table cp_lrf (
  lrf_id  serial not null primary key,
  lrf_tpiid      integer not null,
  lrf_periodo    varchar(60) not null,
  lrf_arquiv     varchar(150),
  lrf_ano        char(4),
  lrf_tipo       char(1)
);
create index cp_lrf_lrf_ano on cp_lrf(lrf_ano);
create index cp_lrf_lrf_tipo on cp_lrf(lrf_tipo);
create index cp_lrf_lrf_tpiid on cp_lrf(lrf_tpiid);
alter table cp_lrf add constraint cp_lrf_lrf_tpiid_fk
       foreign key (lrf_tpiid) references cp_tipoitem(tpi_id);

