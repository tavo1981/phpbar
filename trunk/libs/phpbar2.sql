--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: sis_modulos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sis_modulos (
    mod_id serial NOT NULL,
    mod_nome character varying(50),
    mod_arquivo character varying(50),
    mod_descricao text
);


ALTER TABLE public.sis_modulos OWNER TO postgres;

--
-- Name: sis_modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sis_modulos
    ADD CONSTRAINT sis_modulos_pkey PRIMARY KEY (mod_id);


--
-- Name: sis_modulos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE sis_modulos FROM PUBLIC;
REVOKE ALL ON TABLE sis_modulos FROM postgres;
GRANT ALL ON TABLE sis_modulos TO postgres;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: mnu_pai; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mnu_pai (
    mnu_paiid serial NOT NULL,
    mnu_nome character varying(50),
    mnu_modid integer,
    mnu_akey character varying(10)
);


ALTER TABLE public.mnu_pai OWNER TO postgres;

--
-- Name: mnu_pai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mnu_pai
    ADD CONSTRAINT mnu_pai_pkey PRIMARY KEY (mnu_paiid);


--
-- Name: mnu_pai_mnu_modid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mnu_pai_mnu_modid ON mnu_pai USING btree (mnu_modid);


--
-- Name: per_mod_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnu_pai
    ADD CONSTRAINT per_mod_id_fk FOREIGN KEY (mnu_modid) REFERENCES sis_modulos(mod_id);


--
-- Name: mnu_pai; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE mnu_pai FROM PUBLIC;
REVOKE ALL ON TABLE mnu_pai FROM postgres;
GRANT ALL ON TABLE mnu_pai TO postgres;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: mnu_filho; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mnu_filho (
    mnu_filid serial NOT NULL,
    mnu_nome character varying(50),
    mnu_pai integer,
    mnu_arq character varying(50),
    mnu_img character varying(30),
    mnu_dir character(1),
    mnu_paisub integer,
    mnu_sub integer,
    mnu_ordem integer
);


ALTER TABLE public.mnu_filho OWNER TO postgres;

--
-- Name: mnu_filho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mnu_filho
    ADD CONSTRAINT mnu_filho_pkey PRIMARY KEY (mnu_filid);


--
-- Name: mnu_filho_mnu_pai; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mnu_filho_mnu_pai ON mnu_filho USING btree (mnu_pai);


--
-- Name: mnu_filho_mnu_paisub; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mnu_filho_mnu_paisub ON mnu_filho USING btree (mnu_paisub);


--
-- Name: per_pai_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnu_filho
    ADD CONSTRAINT per_pai_id_fk FOREIGN KEY (mnu_pai) REFERENCES mnu_pai(mnu_paiid);


--
-- Name: mnu_filho; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE mnu_filho FROM PUBLIC;
REVOKE ALL ON TABLE mnu_filho FROM postgres;
GRANT ALL ON TABLE mnu_filho TO postgres;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: per_menus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE per_menus (
    mnu_id integer NOT NULL,
    per_usuid integer NOT NULL,
    mnu_mod integer NOT NULL
);


ALTER TABLE public.per_menus OWNER TO postgres;

--
-- Name: per_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY per_menus
    ADD CONSTRAINT per_menus_pkey PRIMARY KEY (mnu_id, per_usuid);


--
-- Name: per_menus_mnu_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX per_menus_mnu_id ON per_menus USING btree (mnu_id);


--
-- Name: per_menus_per_mnu_mod; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX per_menus_per_mnu_mod ON per_menus USING btree (mnu_mod);


--
-- Name: per_menus_per_usuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX per_menus_per_usuid ON per_menus USING btree (per_usuid);


--
-- Name: per_menu_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY per_menus
    ADD CONSTRAINT per_menu_id_fk FOREIGN KEY (mnu_id) REFERENCES mnu_filho(mnu_filid);


--
-- Name: per_mnu_mod_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY per_menus
    ADD CONSTRAINT per_mnu_mod_fk FOREIGN KEY (mnu_mod) REFERENCES sis_modulos(mod_id);


--
-- Name: per_menus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE per_menus FROM PUBLIC;
REVOKE ALL ON TABLE per_menus FROM postgres;
GRANT ALL ON TABLE per_menus TO postgres;


--
-- PostgreSQL database dump complete
--

