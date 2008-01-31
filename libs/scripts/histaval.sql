--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;

SET SESSION AUTHORIZATION 'iuri';

SET search_path = public, pg_catalog;

--
-- TOC entry 3 (OID 27524)
-- Name: histaval; Type: TABLE; Schema: public; Owner: iuri
--

CREATE TABLE histaval (
    hia_aluid integer,
    hia_ano character(4) NOT NULL,
    hia_insid integer NOT NULL,
    hia_serie character varying(2) NOT NULL,
    hia_disid integer,
    hia_nota character varying(5)
);


--
-- TOC entry 4 (OID 27538)
-- Name: histval_hia_aluid; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX histval_hia_aluid ON histaval USING btree (hia_aluid);


--
-- TOC entry 5 (OID 27539)
-- Name: histval_hia_ano; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX histval_hia_ano ON histaval USING btree (hia_ano);


--
-- TOC entry 7 (OID 27540)
-- Name: histval_hia_insid; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX histval_hia_insid ON histaval USING btree (hia_insid);


--
-- TOC entry 8 (OID 27541)
-- Name: histval_hia_serie; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX histval_hia_serie ON histaval USING btree (hia_serie);


--
-- TOC entry 6 (OID 27542)
-- Name: histval_hia_disid; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX histval_hia_disid ON histaval USING btree (hia_disid);


--
-- TOC entry 11 (OID 27526)
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY histaval
    ADD CONSTRAINT "$1" FOREIGN KEY (hia_aluid) REFERENCES alunos(alu_id);


--
-- TOC entry 10 (OID 27530)
-- Name: $2; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY histaval
    ADD CONSTRAINT "$2" FOREIGN KEY (hia_insid) REFERENCES instituicoes(ins_id);


--
-- TOC entry 9 (OID 27534)
-- Name: $3; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY histaval
    ADD CONSTRAINT "$3" FOREIGN KEY (hia_disid) REFERENCES disciplinas(dis_id);


