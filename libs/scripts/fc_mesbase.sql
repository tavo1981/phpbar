drop function fc_mesbase(date);
create function fc_mesbase(date) returns integer
as '
DECLARE
    data    alias for $1; 
    mesbase integer;
    mes     integer;
    dia     integer;
BEGIN
 dia := extract (day from data);
 mes := extract(month from data);
 if dia <=10 then
    mesbase := mes -1;
 else
    mesbase := mes;
 end if;

 return mesbase;
 end;'
 language 'plpgsql';  