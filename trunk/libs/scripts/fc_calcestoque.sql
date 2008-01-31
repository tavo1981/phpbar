-- FUNÇÃO PARA RETORNAR O TOTAL DE ITENS DO ESTOQUE
-- PARAMETROS $1 ID DO ALIMENTO;$2 NUMERO DO LOTE ;$3 ID DA INSTITUICAO
create or replace function fc_calcestoque(integer,integer,integer)
returns int8 as '
DECLARE
   valimento alias for $1;
   vlote     alias for $2;
   vinst     alias for $3;
   rtentrada record;
   rtsaida   record;
   rttrans   record;
   vtotalent integer;
   vtotalsai integer; 
   vtotalest integer;
   vtotal    integer;
BEGIN
-- SELECIONA O TOTAL DOS ITENS DA ENTRADA 

   SELECT into rtentrada SUM(ent_quantidade) AS tentrada
   FROM   est_entrada 
   WHERE  ent_aliid = valimento
   AND    ent_lote  = vlote
   AND    ent_insid = vinst;

vtotalent := rtentrada.tentrada;

-- SELECIONA O TOTAL DOS ITENS DA SAIDA

   SELECT into rtsaida SUM(sai_quantidade) AS tsaida
   FROM   est_saida 
   WHERE  sai_aliid = valimento
   AND    sai_lote  = vlote
   AND    sai_insid = vinst;
 ---- SELECIONA OS ITENS QUE ESTÃO EM TRANSFERENCIAS ABERTAS...
   
 vtotalsai := rtsaida.tsaida;
 SELECT into rttrans SUM(itt_quantidade) AS tsaida
   FROM   est_transferitens inner join est_transferencias
          on itt_transid = tra_id    
   WHERE  itt_aliid = valimento
   AND    itt_lote  = vlote
   AND    tra_insid = vinst
   AND   (tra_sit = ''0'' or tra_sit isnull);  
vtotalest := rttrans.tsaida;   
RETURN  (sum((vtotalent - coalesce(vtotalsai,0))-coalesce(vtotalest,0)));
END;'
Language 'plpgsql' VOLATILE;



     
    
   
 
