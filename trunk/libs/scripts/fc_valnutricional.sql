drop function fc_valnutricional(integer);
create function fc_valnutricional(integer)returns varchar as '
DECLARE 
      cardapio            alias for $1;
      lalimentos          record;
      valnutricional      varchar;
      sql                 varchar;
      vproteinas          decimal(12,2);
      vcarboidratos       decimal(12,2);
      vcalorias           decimal(12,2);   
BEGIN
SELECT into lalimentos round(sum((itc_quantidade*ali_proteina)/100),2) as proteinas,
                       round(sum((itc_quantidade*ali_carboidrato)/100),2) as carboidratos,
                       round(sum((itc_quantidade*ali_lipidios)/100),2) as lipidios,
                       round((sum(itc_quantidade*ali_calcio)/100),2) as calcio,
                       round(sum((itc_quantidade*ali_fosforo)/100),2) as fosforo,
                       round(sum((itc_quantidade*ali_ferro)/100),2) as ferro,
                       round(sum((itc_quantidade*ali_vitama)/100),2) as vitamina_a,
                       round(sum((itc_quantidade*ali_vitamc)/100),2) as vitamina_C 
FROM  alimentos inner join itens_cardapio on ali_id = itc_aliid 
      inner join cardapios on itc_carid = car_id
WHERE ali_id  IN(select ali_id FROM itens_cardapio WHERE itc_carid=2) and car_id = cardapio;

vcalorias = (lalimentos.carboidratos*4)+(lalimentos.proteinas*4)+(lalimentos.lipidios*9);
valnutricional := ''pro''||lalimentos.proteinas::varchar||''#car''||lalimentos.carboidratos::varchar;
valnutricional := valnutricional||''#lip''||lalimentos.lipidios::varchar||''#cal''||lalimentos.calcio::varchar||''#fos''||lalimentos.fosforo;
valnutricional := valnutricional||''#fer''||lalimentos.ferro::varchar||''#via''||lalimentos.vitamina_a||''#vic''||lalimentos.vitamina_c||''#cal''||vcalorias;
RETURN  valnutricional;
END;'
language 'plpgsql' VOLATILE;