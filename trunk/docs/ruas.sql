--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: bairros_bai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('bairros', 'bai_id'), 8, true);


--
-- Data for Name: bairros; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (17, 'CENTRO', NULL, false, 4313409, NULL);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (15, 'VILA ESPERANÇA', NULL, false, 4319901, NULL);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (16, 'VILA OPERARIA', NULL, false, 4319901, NULL);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (18, 'TESTE2', NULL, false, 4319901, NULL);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (19, 'IURI', NULL, false, 4319901, NULL);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (20, 'LALALALA', NULL, false, 4319901, NULL);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (21, 'TE', NULL, false, 4319901, NULL);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (12, 'QUATRO COLONIAS', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (1, 'SANTA FE', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (2, 'PIQUETE', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (3, 'VILA IRMA', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (4, 'CENTENARIO', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (5, 'OESTE', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (6, 'SAO JACO', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (7, 'SAO LUIZ', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (8, 'CENTRO', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (9, 'AMARAL RIBEIRO', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (10, 'SETE DE SETEMBRO', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (11, 'VILA NOVA', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (13, 'ZONA RURAL', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (0, 'NAO CADASTRADO', '', false, 4319901, 1);
INSERT INTO bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) VALUES (14, 'NAO INFORMADO', '', false, 4319901, 1);


--
-- PostgreSQL database dump complete
--

