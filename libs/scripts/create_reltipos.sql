create table reltipos(
   rtp_id    serial not null primary key,
   rtp_descr varchar(50)

);

create table config_relat(
   rel_cod serial not null primary key,
   rel_cab1   varchar(100),
   rel_cab2   varchar(100),
   rel_cab3   varchar(100),
   rel_insid    int8  not null references
                        instituicoes (ins_id),
   rel_cabimg1  varchar(80),
   rel_cabimg2  varchar(80),
   rel_reltipid int8 not null references  reltipos(rtp_id)
);