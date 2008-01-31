create or replace function fc_calchoras(numeric)
returns int8 as '
DECLARE
    horas_ft  int8;
    total     record;
    horas_tot int8;
    total2    record;
BEGIN

SELECT  into total con_horas-sum(car_horas) as total
from   carga_prof cp inner join contratos c
       on  cp.con_id = c.con_id
where  con_matricula = $1
group  by con_horas;
IF not found THEN
   select into total2 con_horas
   from   contratos where con_matricula = $1;
   horas_tot := total2.con_horas;
ELSE
   horas_tot := total.total;
end if;
return horas_tot;
end;'
language 'plpgsql';





