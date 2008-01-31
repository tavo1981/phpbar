--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;

SET SESSION AUTHORIZATION 'iuri';

SET search_path = public, pg_catalog;

--
-- TOC entry 3 (OID 27563)
-- Name: histseries; Type: TABLE; Schema: public; Owner: iuri
--

CREATE TABLE histseries (
    his_aluid integer,
    his_insid integer,
    his_ano character(4),
    his_modid integer,
    his_grau integer,
    his_turmaid integer NOT NULL,
    his_sit character(1),
    his_ra integer,
    his_rf character(1),
    his_dl numeric(5,0),
    his_ha numeric(5,0),
    CONSTRAINT histseries_his_rf CHECK ((((his_rf = 'A'::bpchar) OR (his_rf = 'R'::bpchar)) OR (his_rf = NULL::bpchar))),
    CONSTRAINT histseries_his_sit CHECK ((((his_sit = '0'::bpchar) OR (his_sit = '1'::bpchar)) OR (his_sit = NULL::bpchar)))
);


--
-- TOC entry 8 (OID 27567)
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY histseries
    ADD CONSTRAINT "$1" FOREIGN KEY (his_aluid) REFERENCES alunos(alu_id);


--
-- TOC entry 7 (OID 27571)
-- Name: $2; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY histseries
    ADD CONSTRAINT "$2" FOREIGN KEY (his_insid) REFERENCES instituicoes(ins_id);


--
-- TOC entry 6 (OID 27575)
-- Name: $3; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY histseries
    ADD CONSTRAINT "$3" FOREIGN KEY (his_modid) REFERENCES modalidades(mod_id);


--
-- TOC entry 5 (OID 27579)
-- Name: $4; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY histseries
    ADD CONSTRAINT "$4" FOREIGN KEY (his_grau) REFERENCES grau(gra_id);


--
-- TOC entry 4 (OID 27583)
-- Name: $5; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY histseries
    ADD CONSTRAINT "$5" FOREIGN KEY (his_ra) REFERENCES resant(res_id);


ALTER TABLE ONLY histseries
    ADD CONSTRAINT "histseries_his_turmaid_fk" FOREIGN KEY (his_turmaid) REFERENCES turmas(tur_id);
