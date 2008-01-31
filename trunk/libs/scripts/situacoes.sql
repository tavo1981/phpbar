--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;

SET SESSION AUTHORIZATION 'iuri';

SET search_path = public, pg_catalog;

--
-- TOC entry 3 (OID 27025)
-- Name: situacoes; Type: TABLE; Schema: public; Owner: iuri
--

CREATE TABLE situacoes (
    sit_aluid integer NOT NULL,
    sit_insid integer NOT NULL,
    sit_modid integer NOT NULL,
    sit_grauid integer NOT NULL,
    sit_turmaid integer NOT NULL,
    sit_dtentrada date,
    sit_se integer NOT NULL,
    sit_dtsaida date,
    sit_ss integer NOT NULL,
    sit_ano character(4) NOT NULL
);


--
-- TOC entry 5 (OID 27049)
-- Name: situacoes_sit_aluid; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX situacoes_sit_aluid ON situacoes USING btree (sit_aluid);


--
-- TOC entry 7 (OID 27050)
-- Name: situacoes_sit_insid; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX situacoes_sit_insid ON situacoes USING btree (sit_insid);


--
-- TOC entry 8 (OID 27051)
-- Name: situacoes_sit_modsid; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX situacoes_sit_modsid ON situacoes USING btree (sit_modid);


--
-- TOC entry 9 (OID 27052)
-- Name: situacoes_sit_se; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX situacoes_sit_se ON situacoes USING btree (sit_se);
CREATE INDEX situacoes_turmaid ON situacoes USING btree (sit_turmaid);


--
-- TOC entry 10 (OID 27053)
-- Name: situacoes_sit_ss; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX situacoes_sit_ss ON situacoes USING btree (sit_ss);


--
-- TOC entry 6 (OID 27054)
-- Name: situacoes_sit_ano; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX situacoes_sit_ano ON situacoes USING btree (sit_ano);


--
-- TOC entry 4 (OID 27027)
-- Name: situacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY situacoes
    ADD CONSTRAINT situacoes_pkey PRIMARY KEY (sit_aluid, sit_insid, sit_ano);


--
-- TOC entry 15 (OID 27029)
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY situacoes
    ADD CONSTRAINT "$1" FOREIGN KEY (sit_aluid) REFERENCES alunos(alu_id);


--
-- TOC entry 14 (OID 27033)
-- Name: $2; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY situacoes
    ADD CONSTRAINT "$2" FOREIGN KEY (sit_insid) REFERENCES instituicoes(ins_id);


--
-- TOC entry 13 (OID 27037)
-- Name: $3; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY situacoes
    ADD CONSTRAINT "$3" FOREIGN KEY (sit_modid) REFERENCES modalidades(mod_id);


--
-- TOC entry 12 (OID 27041)
-- Name: $4; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY situacoes
    ADD CONSTRAINT "$4" FOREIGN KEY (sit_grauid) REFERENCES grau(gra_id);


--
-- TOC entry 11 (OID 27045)
-- Name: $5; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY situacoes
    ADD CONSTRAINT "$5" FOREIGN KEY (sit_se) REFERENCES sittipos(stp_id);


ALTER TABLE ONLY situacoes
    ADD CONSTRAINT situacoes_turma_id FOREIGN KEY (sit_turmaid) REFERENCES turmas(tur_id);
