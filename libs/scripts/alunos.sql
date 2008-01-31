--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;

SET SESSION AUTHORIZATION 'iuri';

SET search_path = public, pg_catalog;

--
-- TOC entry 3 (OID 26978)
-- Name: alunos; Type: TABLE; Schema: public; Owner: iuri
--

CREATE TABLE alunos (
    alu_id serial NOT NULL,
    alu_codord integer,
    alu_hist character(1),
    alu_dtinicial date,
    alu_procedencia character varying(65),
    alu_nome character varying(65) NOT NULL,
    alu_sexo character(1) NOT NULL,
    alu_dtnasc date NOT NULL,
    alu_codsus numeric(20,0),
    alu_rg character varying(11),
    alu_pai character varying(65),
    alu_mae character varying(65),
    alu_resp character varying(65),
    alu_lograd character varying(60),
    alu_endnum numeric(8,0),
    alu_endcomp character varying(50),
    alu_fone numeric(15,0),
    alu_celular numeric(15,0),
    alu_connome character varying(65),
    alu_conlog integer,
    alu_connum numeric(8,0),
    alu_confone character varying(15),
    alu_conbaiid integer,
    alu_natural bigint,
    alu_certidaonasc numeric(15,0),
    alu_dtcertidao date,
    alu_certidaolivro character varying(8),
    alu_certidaofolha integer,
    alu_muncart integer,
    alu_obspes text
);


--
-- TOC entry 5 (OID 26990)
-- Name: alunos_alu_lograd; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX alunos_alu_lograd ON alunos USING btree (alu_lograd);


--
-- TOC entry 6 (OID 26991)
-- Name: alunos_alu_natural; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX alunos_alu_natural ON alunos USING btree (alu_natural);


--
-- TOC entry 7 (OID 26992)
-- Name: alunos_alu_nome; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX alunos_alu_nome ON alunos USING btree (alu_nome);


--
-- TOC entry 4 (OID 26993)
-- Name: alunos_alu_codord; Type: INDEX; Schema: public; Owner: iuri
--

CREATE INDEX alunos_alu_codord ON alunos USING btree (alu_codord);


--
-- TOC entry 8 (OID 26984)
-- Name: alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (alu_id);


--
-- TOC entry 9 (OID 26986)
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY alunos
    ADD CONSTRAINT "$1" FOREIGN KEY (alu_lograd) REFERENCES ruas(rua_id);


