create table req_mudancas(
   
   req_id serial not null primary key,
   req_nome varchar(70),
   req_documento varchar(20),
   req_ruaid integer,
   req_num varchar(20),
   req_baiid   integer,
   req_servico integer,
   req_obs1    text,
   req_obs2    text
);
   
alter table req_mudancas add constraint req_mudancas_ruaid_fk
             foreign key  (req_ruaid) references ruas (rua_id);
             
alter table req_mudancas add constraint req_mudancas_baiid_fk
             foreign key  (req_baiid) references bairros (bai_id);
             
create index req_mudancas_ruaid on req_mudancas (req_ruaid);          

create index req_mudancas_baiid on req_mudancas (req_baiid);