--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;

SET SESSION AUTHORIZATION 'iuri';

SET search_path = public, pg_catalog;

--
-- TOC entry 3 (OID 27010)
-- Name: sittipos; Type: TABLE; Schema: public; Owner: iuri
--

CREATE TABLE sittipos (
    stp_id serial NOT NULL,
    stp_descr character varying(35) NOT NULL,
    stp_tipo character(1),
    CONSTRAINT sittipos_stp_tipo CHECK (((stp_tipo = 'E'::bpchar) OR (stp_tipo = 'S'::bpchar)))
);


--
-- TOC entry 4 (OID 27014)
-- Name: sittipos_pkey; Type: CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY sittipos
    ADD CONSTRAINT sittipos_pkey PRIMARY KEY (stp_id);


