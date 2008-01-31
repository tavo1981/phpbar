--create table sis_feriados(
--   fer_id        serial   not null primary key,
--  fer_descr     varchar  not null,
--  fer_dtferiado date     not null
--);
drop function fc_feriado(date);
create  function fc_feriado(date)
returns varchar(50)
as '
Declare
      feriado  varchar(100);
      data     date;
      rs       record;
Begin

  data := $1;
  select fer_descr into rs
  from   sis_feriados
  where  fer_dtferiado = data;

  feriado := rs.fer_descr;
  return feriado;
End;
' language 'plpgsql';

