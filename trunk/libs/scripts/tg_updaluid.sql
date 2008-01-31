drop trigger tg_updatealuno on movalunos;
drop function fc_updalumov();
create function fc_updalumov() returns trigger
as $$
begin
 if TG_OP = 'INSERT' or TG_OP = 'UPDATE' then
 	update alunos set alu_movid = new.mov_id,alu_turid = new.mov_turid where alu_id = new.mov_aluid;
 	return new;
  elsif TG_OP = 'DELETE' then
    update alunos set alu_movid =  null where alu_id = old.mov_aluid;	
    return old;
 end if;	
end;
$$
language 'plpgsql';    

CREATE TRIGGER tg_updatealuno
    BEFORE INSERT OR UPDATE  OR DELETE ON movalunos FOR EACH ROW
    EXECUTE PROCEDURE fc_updalumov();
  
    
    drop function fc_pesagem(char,integer,integer,decimal);
create function fc_pesagem(char,integer,integer,decimal)returns varchar as 
'
DECLARE 
      vdados  record;
      linhas  record;
      estnut  integer;
      regra   varchar;
      regra2  varchar;
      streval varchar;
BEGIN   
SELECT into vdados 
       pes_p3,
       pes_p10,
       pes_p97
from pesoidade       
where pes_sexo  = $1
and   pes_anos  = $2
and   pes_meses = $3;
if not found then 
        estnut := 0;
else
	for linhas in select est_id,est_regra from estadonutric order by est_id loop
 	   if regra2 = 1 then 
    	  exit;
   	   end if;   
   	   regra := replace(linhas.est_regra,'pes_p3',vdados.pes_p3);
       regra := replace(regra,''pes_p10'',vdados.pes_p10);
       regra := replace(regra,''pes_p97'',vdados.pes_p97);
       regra2 := regra2||regra;
       streval := $4||'' ''||regra::text;
       if eval(streval) = ''t'' then 
          estnut := linhas.est_id;
          regra2 = 1;
      end if;
   end loop;
end if;    
RETURN estnut;
--RETURN regra;
END;
'
language 'plpgsql' VOLATILE;

drop function eval(text);
create or replace function eval(text) returns varchar as '
declare res record;
begin
	for res in execute ''select '' || $1 || '' as result'' loop
return res.result;
end loop;
end' 
language plpgsql;

