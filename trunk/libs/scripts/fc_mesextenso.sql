drop function fc_mesextenso(numeric);
create or replace function fc_mesextenso(numeric)
returns varchar(35) as '
DECLARE
    par    alias for $1; 
    mes    varchar(35);
BEGIN
mes := case when par = 1  then ''Janeiro''
              when par = 2  then ''Fevereiro''
              when par = 3  then ''Março''
              when par = 4  then ''Abril''
              when par = 5  then ''Maio''
              when par = 6  then ''Junho''
              when par = 7  then ''Julho''
              when par = 8  then ''Agosto''
              when par = 9  then ''Setembro''
              when par = 10 then ''Outubro''
              when par = 11 then ''Novembro'' 
              when par = 12 then ''Dezembro'' end ;
return mes;
end;'
language 'plpgsql';





