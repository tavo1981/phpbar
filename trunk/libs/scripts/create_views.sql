-- viem professor_disciplina
create view professor_disciplina as select distinct on(prof_nome) prof_nome,p.prof_id,car_id as cod_cargahoraria, dis_nome,dis_id,ins_nome,car_instint,car_anofrom carga_prof cp inner join contratos c on cp.con_id  = c.con_id inner join professores p on c.prof_id = p.prof_id inner join disciplinas d on cp.dis_id = d.dis_id inner join instituicoes i on  i.ins_id = car_instint;

-- viem turma_ins
create view turma_ins as select tur_id,tur_serie||tur_turno||tur_turma as turma ,tur_serie,tur_turno,tur_turma,tur_modalidade,tur_insid,tur_ano from turmas;