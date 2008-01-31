create table albuns(
 alb_id serial not null primary key,
 alb_nome varchar(100) not null,
 alb_descr text
 );
 
 create unique index albuns_alb_nome on albuns(alb_nome);
 
 create table albuns_fotos(
   fot_id serial not null primary key,
   fot_nome varchar(100),
   fot_fotografo varchar(120),
   fot_arquivo   varchar(100),
   fot_tamanho   varchar(100),
   fot_descricao text,
   fot_albid     integer,
   fot_ano       char(4),
   fot_bytes     decimal(30)
 );  

 create index albuns_fotos_fot_albid on albuns_fotos(albuns_fotos);
 