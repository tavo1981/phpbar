create or replace function fc_turmasigla(integer)
returns varchar as '
DECLARE
	turid     alias for $1;
	turma     record;
BEGIN

 SELECT into turma
            (CASE WHEN tur_modalidade = 4
                  THEN (SELECT mod_sigla FROM modalidades WHERE mod_id = 4)
                  WHEN  tur_nivel     = 1
                  THEN (SELECT niv_sigla FROM niveis WHERE niv_id = 1 )
                  WHEN  tur_nivel     = 2
                  THEN (SELECT niv_descr FROM niveis WHERE niv_id = 2 )
            else (SELECT tip_sigla FROM tipos_turmas WHERE tip_id = tur_tipo)
            end ) as sigla
 FROM   turmas WHERE tur_id = turid;
 
 RETURN turma.sigla;
 END;'
 Language 'plpgsql' VOLATILE;