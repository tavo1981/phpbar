--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN1';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: bairros; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE bairros (
    bai_id serial NOT NULL,
    bai_descr character varying(40),
    bai_codant character varying(10),
    bai_rural boolean DEFAULT false,
    bai_cidid integer,
    bai_oficial integer
);


ALTER TABLE public.bairros OWNER TO iuri;

--
-- Name: bairros_bai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('bairros', 'bai_id'), 8, true);


SET default_with_oids = false;

--
-- Name: catprodutos; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE catprodutos (
    cat_id serial NOT NULL,
    cat_descr character varying(50)
);


ALTER TABLE public.catprodutos OWNER TO iuri;

--
-- Name: catprodutos_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('catprodutos', 'cat_id'), 1, false);


--
-- Name: catprodutos_itens; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE catprodutos_itens (
    cpi_id serial NOT NULL,
    cpi_item character varying(75),
    cpi_descr text,
    cpi_catid integer,
    cpi_valor numeric(12,2)
);


ALTER TABLE public.catprodutos_itens OWNER TO iuri;

--
-- Name: catprodutos_itens_cpi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('catprodutos_itens', 'cpi_id'), 1, false);


--
-- Name: clientes_cli_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE clientes_cli_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clientes_cli_id_seq OWNER TO iuri;

--
-- Name: clientes_cli_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('clientes_cli_id_seq', 1, false);


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE clientes (
    cli_id integer DEFAULT nextval('clientes_cli_id_seq'::regclass) NOT NULL,
    cli_nome character varying(85) NOT NULL,
    cli_ruaid integer NOT NULL,
    cli_endnum character varying(50),
    cli_complemento character varying(85),
    cli_baiid integer,
    cli_email character varying(150),
    cli_dtnasc date,
    cli_foneprinc integer
);


ALTER TABLE public.clientes OWNER TO iuri;

--
-- Name: COLUMN clientes.cli_id; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clientes.cli_id IS 'C√≥digo do Cliente';


--
-- Name: COLUMN clientes.cli_nome; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clientes.cli_nome IS 'Nome do Cliente';


--
-- Name: COLUMN clientes.cli_ruaid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clientes.cli_ruaid IS 'Rua';


--
-- Name: COLUMN clientes.cli_endnum; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clientes.cli_endnum IS 'N√∫mero';


--
-- Name: COLUMN clientes.cli_complemento; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clientes.cli_complemento IS 'Complemento';


--
-- Name: COLUMN clientes.cli_baiid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clientes.cli_baiid IS 'Bairro';


--
-- Name: clifones_fon_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE clifones_fon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clifones_fon_id_seq OWNER TO iuri;

--
-- Name: clifones_fon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('clifones_fon_id_seq', 1, false);


--
-- Name: clifones; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE clifones (
    fon_id bigint DEFAULT nextval('clifones_fon_id_seq'::regclass) NOT NULL,
    fon_cliid integer NOT NULL,
    fon_tipo integer NOT NULL,
    fon_numero integer NOT NULL
);


ALTER TABLE public.clifones OWNER TO iuri;

--
-- Name: TABLE clifones; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON TABLE clifones IS 'Telefones do Cliente';


--
-- Name: COLUMN clifones.fon_cliid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clifones.fon_cliid IS 'codigo do cliente';


--
-- Name: COLUMN clifones.fon_tipo; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clifones.fon_tipo IS 'tipo do fone';


--
-- Name: COLUMN clifones.fon_numero; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN clifones.fon_numero IS 'Fone';


--
-- Name: comanda_delivery_del_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE comanda_delivery_del_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comanda_delivery_del_id_seq OWNER TO iuri;

--
-- Name: comanda_delivery_del_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('comanda_delivery_del_id_seq', 1, false);


--
-- Name: comanda_delivery; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE comanda_delivery (
    del_id bigint DEFAULT nextval('comanda_delivery_del_id_seq'::regclass) NOT NULL,
    del_comid bigint NOT NULL,
    del_troco numeric(10,2),
    del_ruaid integer,
    del_fone integer,
    del_baiid integer,
    del_complemento character varying(50),
    del_obs text,
    del_cliid integer,
    del_endnum character varying,
    del_nome character varying(75)
);


ALTER TABLE public.comanda_delivery OWNER TO iuri;

--
-- Name: COLUMN comanda_delivery.del_comid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN comanda_delivery.del_comid IS 'codigo da comanda';


--
-- Name: COLUMN comanda_delivery.del_baiid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN comanda_delivery.del_baiid IS 'Bairro ';


--
-- Name: comanda_itens_cti_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE comanda_itens_cti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comanda_itens_cti_id_seq OWNER TO iuri;

--
-- Name: comanda_itens_cti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('comanda_itens_cti_id_seq', 1, false);


--
-- Name: comanda_itens; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE comanda_itens (
    cti_id bigint DEFAULT nextval('comanda_itens_cti_id_seq'::regclass) NOT NULL,
    cti_comid bigint NOT NULL,
    cti_proid integer NOT NULL,
    cti_obs text,
    cti_qtde integer
);


ALTER TABLE public.comanda_itens OWNER TO iuri;

--
-- Name: COLUMN comanda_itens.cti_comid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN comanda_itens.cti_comid IS 'Codigo da comanda';


--
-- Name: comanda_itensextra; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE comanda_itensextra (
    ext_id serial NOT NULL,
    ext_iteid integer,
    ext_cipid integer,
    ext_valor numeric(12,2)
);


ALTER TABLE public.comanda_itensextra OWNER TO iuri;

--
-- Name: comanda_itensextra_ext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('comanda_itensextra', 'ext_id'), 1, false);


--
-- Name: comandas_com_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE comandas_com_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comandas_com_id_seq OWNER TO iuri;

--
-- Name: comandas_com_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('comandas_com_id_seq', 1, false);


--
-- Name: comandas; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE comandas (
    com_id bigint DEFAULT nextval('comandas_com_id_seq'::regclass) NOT NULL,
    com_mesid integer,
    com_delivery character(1),
    com_dtcomanda date NOT NULL,
    com_vltotal numeric(12,2),
    com_aberta character(1)
);


ALTER TABLE public.comandas OWNER TO iuri;

--
-- Name: COLUMN comandas.com_mesid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN comandas.com_mesid IS 'mesa';


--
-- Name: COLUMN comandas.com_delivery; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN comandas.com_delivery IS 'Se √© tele_entrega';


--
-- Name: COLUMN comandas.com_dtcomanda; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN comandas.com_dtcomanda IS 'data da Venda';


--
-- Name: funcionarios_fun_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE funcionarios_fun_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.funcionarios_fun_id_seq OWNER TO iuri;

--
-- Name: funcionarios_fun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('funcionarios_fun_id_seq', 1, true);


--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE funcionarios (
    fun_id integer DEFAULT nextval('funcionarios_fun_id_seq'::regclass) NOT NULL,
    fun_nome character varying(85) NOT NULL,
    fun_senha character varying(50) NOT NULL,
    fun_ativo character(1) NOT NULL
);


ALTER TABLE public.funcionarios OWNER TO iuri;

--
-- Name: mesas_mes_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE mesas_mes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mesas_mes_id_seq OWNER TO iuri;

--
-- Name: mesas_mes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('mesas_mes_id_seq', 1, false);


--
-- Name: mesas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mesas (
    mes_id integer DEFAULT nextval('mesas_mes_id_seq'::regclass) NOT NULL,
    mes_nome character varying(50) NOT NULL,
    mes_local character(1)
);


ALTER TABLE public.mesas OWNER TO postgres;

--
-- Name: TABLE mesas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE mesas IS 'Mesas do bar';


--
-- Name: COLUMN mesas.mes_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN mesas.mes_id IS 'CÛdigo da Mesa';


--
-- Name: COLUMN mesas.mes_nome; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN mesas.mes_nome IS 'Nome da Mesa';


--
-- Name: COLUMN mesas.mes_local; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN mesas.mes_local IS 'Local:';


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
-- Name: mnu_filho_mnu_filid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('mnu_filho', 'mnu_filid'), 7, true);


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
-- Name: mnu_pai_mnu_paiid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('mnu_pai', 'mnu_paiid'), 8, true);


--
-- Name: produtos_pro_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE produtos_pro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.produtos_pro_id_seq OWNER TO iuri;

--
-- Name: produtos_pro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('produtos_pro_id_seq', 1, false);


SET default_with_oids = false;

--
-- Name: produtos; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE produtos (
    pro_id integer DEFAULT nextval('produtos_pro_id_seq'::regclass) NOT NULL,
    pro_nome character varying(85) NOT NULL,
    pro_preco numeric(12,2) NOT NULL,
    pro_descr text,
    pro_foto bytea,
    pro_estoque character(1),
    pro_catid integer
);


ALTER TABLE public.produtos OWNER TO iuri;

--
-- Name: COLUMN produtos.pro_id; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos.pro_id IS 'C√≥digo';


--
-- Name: COLUMN produtos.pro_nome; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos.pro_nome IS 'nome do produto';


--
-- Name: COLUMN produtos.pro_descr; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos.pro_descr IS 'Descri√ß√£o do Produto';


--
-- Name: COLUMN produtos.pro_foto; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos.pro_foto IS 'imagem do Produto';


--
-- Name: produtos_itens_ite_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE produtos_itens_ite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.produtos_itens_ite_id_seq OWNER TO iuri;

--
-- Name: produtos_itens_ite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('produtos_itens_ite_id_seq', 1, false);


--
-- Name: produtos_itens; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE produtos_itens (
    ite_id integer DEFAULT nextval('produtos_itens_ite_id_seq'::regclass) NOT NULL,
    ite_proid integer NOT NULL,
    ite_produto character varying(85) NOT NULL
);


ALTER TABLE public.produtos_itens OWNER TO iuri;

--
-- Name: TABLE produtos_itens; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON TABLE produtos_itens IS 'itens do produto';


--
-- Name: COLUMN produtos_itens.ite_proid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos_itens.ite_proid IS 'codigo do produto';


--
-- Name: COLUMN produtos_itens.ite_produto; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos_itens.ite_produto IS 'Produto';


SET default_with_oids = true;

--
-- Name: ruas; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE ruas (
    rua_id serial NOT NULL,
    rua_nome character varying(40),
    rua_tipo character(1),
    rua_rural boolean DEFAULT false
);


ALTER TABLE public.ruas OWNER TO iuri;

--
-- Name: ruas_rua_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('ruas', 'rua_id'), 12000, false);


--
-- Name: sis_modulos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sis_modulos (
    mod_id serial NOT NULL,
    mod_nome character varying(50),
    mod_arquivo character varying(50),
    mod_descricao text,
    mod_icone character varying(50)
);


ALTER TABLE public.sis_modulos OWNER TO postgres;

--
-- Name: sis_modulos_mod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('sis_modulos', 'mod_id'), 1, false);


--
-- Data for Name: bairros; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY bairros (bai_id, bai_descr, bai_codant, bai_rural, bai_cidid, bai_oficial) FROM stdin;
12	QUATRO COLONIAS		f	4319901	1
1	SANTA FE		f	4319901	1
2	PIQUETE		f	4319901	1
3	VILA IRMA		f	4319901	1
4	CENTENARIO		f	4319901	1
5	OESTE		f	4319901	1
6	SAO JACO		f	4319901	1
7	SAO LUIZ		f	4319901	1
8	CENTRO		f	4319901	1
9	AMARAL RIBEIRO		f	4319901	1
10	SETE DE SETEMBRO		f	4319901	1
11	VILA NOVA		f	4319901	1
13	ZONA RURAL		f	4319901	1
0	NAO CADASTRADO		f	4319901	1
14	NAO INFORMADO		f	4319901	1
\.


--
-- Data for Name: catprodutos; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY catprodutos (cat_id, cat_descr) FROM stdin;
\.


--
-- Data for Name: catprodutos_itens; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) FROM stdin;
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY clientes (cli_id, cli_nome, cli_ruaid, cli_endnum, cli_complemento, cli_baiid, cli_email, cli_dtnasc, cli_foneprinc) FROM stdin;
\.


--
-- Data for Name: clifones; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY clifones (fon_id, fon_cliid, fon_tipo, fon_numero) FROM stdin;
\.


--
-- Data for Name: comanda_delivery; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) FROM stdin;
\.


--
-- Data for Name: comanda_itens; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde) FROM stdin;
\.


--
-- Data for Name: comanda_itensextra; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) FROM stdin;
\.


--
-- Data for Name: comandas; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta) FROM stdin;
\.


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY funcionarios (fun_id, fun_nome, fun_senha, fun_ativo) FROM stdin;
1	iuri	81dc9bdb52d04dc20036dbd8313ed055	1
\.


--
-- Data for Name: mesas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mesas (mes_id, mes_nome, mes_local) FROM stdin;
2	mesa 2	1
3	mesa 3	2
1	mesa 1	1
4	Mesa 4	1
5	Mesa 5	1
7	Mesa 7	1
8	Mesa 8	1
9	Mesa 9	1
10	Mesa 10	1
11	Mesa 11	1
12	Mesa 12	1
13	mesa 13	1
14	mesa 14	1
\.


--
-- Data for Name: mnu_filho; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mnu_filho (mnu_filid, mnu_nome, mnu_pai, mnu_arq, mnu_img, mnu_dir, mnu_paisub, mnu_sub, mnu_ordem) FROM stdin;
6	Entrega	5	del_nentrega.php	novo.png	0	\N	0	\N
7	Clientes	1	cad_ncliente.php	clientes	0	\N	0	\N
4	Mesas	1	cad_nmesa.php	mesas	0	\N	0	\N
2	Configura√ß√£o	1	#	configuracao	0	\N	0	\N
3	Produtos	1	cad_tabproduto.php	produtos	0	\N	0	\N
5	Estoque	1	#	estoque	0	\N	0	\N
1	Atendimentos	1	ate_mapamesas.php	atendimentos	0	\N	0	\N
\.


--
-- Data for Name: mnu_pai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) FROM stdin;
1	Cadastros	1	C
2	Consultas	1	o
3	Procedimentos	1	P
4	Relat√≥rios	1	R
5	Cadastros	2	C
6	Consultas	2	o
7	Procedimentos	2	P
8	Relat√≥rios	2	R
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) FROM stdin;
\.


--
-- Data for Name: produtos_itens; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY produtos_itens (ite_id, ite_proid, ite_produto) FROM stdin;
\.


--
-- Data for Name: ruas; Type: TABLE DATA; Schema: public; Owner: iuri
--

COPY ruas (rua_id, rua_nome, rua_tipo, rua_rural) FROM stdin;
8888	PROBLEMAS 2	R	f
9999	SEM RUA CADASTRADA	R	f
7777	SEM CADASTRO	R	f
1	ANTAO DE FARIAS	A	f
2	AFRANIO PEIXOTO	R	f
3	AFONSO PENA	R	f
4	ALBERTO SCHMIDT	R	f
5	ALBERTO EINSTEIN	R	f
6	ALBERTO BINS	R	f
7	ALMIRANTE BARROSO	R	f
8	ALCINDO GUANABARA	R	f
9	AMERICO VESPUCIO	R	f
10	ANCHIETA	R	f
11	ACRE	R	f
12	ANDRE PUENTE	R	f
13	ASSIS BRASIL	R	f
14	ARTHUR BERNARDES	R	f
15	AUGUSTO PESTANA	R	f
16	AVAI	R	f
17	ALTAMIRA	R	f
18	ALBERTO SCHUCK	R	f
19	AFONSO LAUER	R	f
20	ALFREDO DEODORO REICH	R	f
21	ACAI	R	f
22	ARMANDO SALDANHA	R	f
23	ARI BARROSO	R	f
24	ARCHYMEDES FORTINI	R	f
25	AIMORE	R	f
26	ADOLFO KAUTZMANN	R	f
27	ANTONIO PRADO	R	f
28	ARAUJO VIANA	R	f
29	ALEMANHA	R	f
30	ADOLFO LINDENMEYER	R	f
31	ARGELIA	T	f
32	ALVARO LINS	R	f
33	ARGENTINA	R	f
34	ARNO ALBINO ELY	R	f
35	AMAPA	R	f
37	ALTO DA BOA VISTA	R	f
38	AMAZONAS	R	f
39	ABAETE	T	f
40	AZALEIA	R	f
41	AMAMBAI	R	f
42	ALCINDO JOSE DE MELLO	R	f
43	ANDRADE NEVES	R	f
44	ARTIGAS	R	f
45	ALAGOAS	R	f
46	ASTECA	R	f
47	ARARANGUA	R	f
48	ARROIO DO SILVA	R	f
49	AMARAL NETTO	R	f
50	ANGRA DOS REIS	R	f
51	ANA NERI	R	f
52	ALBERTO NICOLAU WEBER	R	f
53	APPOLO	R	f
54	ALECRIM	R	f
55	ANHEMBI	R	f
56	ADOLFO LUTZ	R	f
57	AIRTON SENNA DA SILVA	R	f
58	ALBERTO KONRATH	R	f
59	ALBINO SIMON	R	f
60	ALTEMAR DUTRA	R	f
61	ARACA	R	f
62	AROEIRA	R	f
63	ALZIRA VALESKA LAMPERT	R	f
64	ARCENO JOSE DE MELLO	R	f
65	ALTAMIR CLETO KAUTZMANN	R	f
66	ALBATROZ	R	f
67	ATLANTIDA	R	f
68	ANITA GARIBALDI	R	f
69	ATENAS	R	f
70	AMSTERD√	R	f
101	BARAO DO RIO BRANCO	R	f
102	BARAO DO GRAVATAI	R	f
103	BARAO DO CERRO LARGO	R	f
104	BARAO DO AMAZONAS	R	f
105	BARAO DO TRIUNFO	R	f
106	BARTOLOMEU DIAS	R	f
107	BARROS CASSAL	R	f
108	BENTO GONCALVES	R	f
109	BENJAMIN CONSTANT	R	f
110	BORGES DE MEDEIROS	R	f
111	BUENOS AIRES	R	f
112	BARBACENA	R	f
113	BUARQUE DE HOLANDA	R	f
114	BAGE	R	f
115	BLUMENAU	R	f
116	BERNARDO LEMKE	R	f
117	BRAGAN«A	R	f
118	BOA VISTA	R	f
119	BAHIA	R	f
121	BARATA RIBEIRO	R	f
122	BEIJA FLOR	R	f
123	BUTIA	R	f
124	BARRA VELHA	R	f
125	BARAO DE ITARARE	A	f
126	BERLIM	R	f
127	BONSUCESSO	A	f
128	BURICA	R	f
129	BOM JESUS	R	f
201	CALDAS JUNIOR	R	f
202	CAMPOS SALES	R	f
203	CARLOS BIEHL	R	f
204	CARLOS BARBOSA	R	f
207	CASEMIRO DE ABREU	R	f
208	CANDIDO RONDON	R	f
209	CAPITAO MONTANHA	R	f
211	CORONEL GENUINO SAMPAIO	R	f
212	FERNANDO MACHADO (CEL)	R	f
213	CEARA	R	f
214	CHUI	R	f
215	CHAVES BARCELOS	R	f
216	CAXIAS DO SUL	R	f
217	CRISTOVAO COLOMBO	R	f
218	CURITIBA	R	f
219	CARMEM MIRANDA	R	f
220	CAMBORIU	R	f
222	CAMPO BOM	T	f
223	CASSIANO RICARDO	R	f
224	CARIJOS	R	f
225	COELHO NETO	R	f
226	CRUZ ALTA	R	f
227	CRUZEIRO DO SUL	R	f
228	CARLOS BRENNER	R	f
229	CAETE	T	f
230	CHARRUA	R	f
231	COIMBRA	T	f
232	CARUARU	R	f
233	CARLOS ALFREDO BERLITZ	R	f
234	CATUMBI	R	f
235	TRAVESSAO CAMPO BOM	R	f
236	CAIOBA	R	f
237	CANTO DO RIO	R	f
238	CORUMBA	R	f
239	CAI	R	f
240	CLEMENTINA DE JESUS	R	f
241	CANTA GALO	R	f
242	CAMPO GRANDE	R	f
243	CRICIUMA	R	f
244	CRISTO REI	R	f
245	CANADA	R	f
246	CORREIO DO POVO	R	f
247	CLARA NUNES	R	f
248	CACEQUI	R	f
249	CARAZINHO	R	f
250	CAICARA	R	f
251	CHICO MENDES	R	f
252	CARLOS GOMES	R	f
253	CABO FRIO	R	f
254	COSTINHA	R	f
255	CAMPO VERDE	R	f
256	CANDIOTA	R	f
257	CLAUDIO ADAO WEISS	R	f
258	CAPAO DA CANOA	R	f
259	CIDREIRA	R	f
260	CABRIUVA	R	f
261	CANELA	R	f
262	CAMBOATA	R	f
263	CEREJEIRA	R	f
264	CHILE	R	f
300	DO VALE	R	f
301	DIOGO ANTONIO FEIJO	R	f
302	DA LADEIRA	R	f
303	DEMETRIO RIBEIRO	R	f
304	ANDRE DA ROCHA (DES)	R	f
305	MARIO TOTTA (DR)	R	f
306	MAURICIO CARDOSO (DR)	R	f
307	PRUDENTE DE MORAES (DR)	R	f
308	DUQUE DE CAXIAS	R	f
309	DOS ESTADOS	R	f
310	DEODORO DA FONSECA	R	f
311	DA ASSOCIACAO	R	f
312	DA CHAPADA	R	f
313	DUQUE ESTRADA	R	f
314	DOIS IRMAOS	R	f
315	DAS FLORES	R	f
316	BONFIM	R	f
317	DALE COUTINHO	R	f
318	DA REPUBLICA	R	f
319	DA IMIGRACAO	T	f
320	DA SAUDADE	T	f
321	DAS ACACIAS	R	f
323	DA GAVEA	R	f
324	DIVINOPOLIS	R	f
325	DA URCA	T	f
326	DAS ROSAS	T	f
327	D	R	f
328	DO IMIGRANTE	R	f
329	DOS XAVANTES	R	f
330	DOS MINUANOS	R	f
331	DOS INCAS	R	f
332	DA BANDEIRA	R	f
333	DAS LAGRIMAS	R	f
334	DA PAZ	R	f
335	DOURADOS	R	f
336	12 DE OUTUBRO	R	f
337	DALTRO FILHO (GEN)	R	f
339	DOS PAMPAS	R	f
340	DO BRAZ	R	f
341	DA MATA	R	f
342	DA PIEDADE	R	f
343	DO GOVERNADOR	R	f
344	DECIO GOMES PEREIRA (DR)	R	f
345	DOM PEDRITO	R	f
346	DOUTEL DE ANDRADE	R	f
347	DOS MUCKERS	R	f
348	DO MAGISTERIO	R	f
349	DAS NACOES	R	f
350	DAS MANGAS	R	f
351	DAS ARAUCARIAS	R	f
352	DONA LEOPOLDINA	R	f
353	DO TRAVESSAO	R	f
354	DAS ANDORINHAS	R	f
355	DAS AMERICAS	R	f
356	DOM PEDRO I	R	f
357	DAS GAIVOTAS	R	f
358	DO SOBRADO	R	f
359	DAS ARARAS	R	f
360	DENER	R	f
361	DA SOLIDARIEDADE	R	f
362	DA AMIZADE	R	f
363	DELMAR CELMAR SCHNEIDER	R	f
364	DOS CRAVOS	R	f
365	DO CEDRO	R	f
366	DAS JABOTICABAS	R	f
367	DOS ANGICOS	R	f
368	DOS GIRASSOIS	R	f
369	DOS COQUEIROS	R	f
370	DOS LAGOS	R	f
371	DAS PEDRAS	R	f
372	DAS ARECAS	R	f
373	DAS GREVILEAS	R	f
400	ERON DOMINGUES	R	f
401	ECA DE QUEIROS	R	f
402	EPITACIO PESSOA	R	f
403	ERNESTO FONTOURA	R	f
404	ESTACIO DE SA	R	f
405	ESPIRITO SANTO	R	f
406	EUCLIDES DA CUNHA	R	f
407	ESPANHA	R	f
408	EDGAR KNACK	R	f
409	ESTRELA	R	f
410	ESTANCIA VELHA	R	f
411	ERICO VERISSIMO	R	f
412	EVERALDO MARQUES DA SILVA	R	f
413	ELIS REGINA	R	f
414	ERNESTO ANTONIO DE PAULA	R	f
415	EMMA DAVILA	R	f
416	ELDORADO	R	f
417	ERMELINO PEREIRA MARTINS	R	f
418	EDWIN KUWER (PREF)	R	f
419	ERNESTO SPINDLER	R	f
420	ESPERANCA	R	f
421	ENEAS ALFEU VIEIRA	R	f
422	ERECHIM	R	f
423	EUGEN WALDER HOCH	R	f
424	EQUADOR	R	f
500	FREDERICO BRUSIUS	R	f
501	FELIPE CAMARAO	R	f
502	FELIX DA CUNHA	R	f
503	FERNANDES VIEIRA	R	f
504	FERRABRAZ	R	f
505	FRANCISCO PEREIRA PASSOS	R	f
506	FARROUPILHA	R	f
507	FELIPE SCHELL	R	f
508	FLORIAN”POLIS	R	f
509	FEDERACAO	R	f
510	FELIZ	R	f
511	FREDERICO	R	f
512	FREI DAMIAO	R	f
513	FAZENDA LEAO	R	f
514	FIGUEIRA	R	f
600	GUARUJA	R	f
601	GABRIELA MISTRAL	R	f
602	NASCIMENTO VARGAS (GEN)	R	f
603	GENERAL JOSE ANTONIO F DA CUNHA	R	f
604	GARIBALDI	T	f
605	GONCALO AFONSO	R	f
606	GENERAL OSORIO	R	f
608	LIMA E SILVA (GEN)	R	f
609	GETULIO VARGAS	R	f
610	GUAPORE	R	f
611	GONCALVES DIAS	R	f
612	GOETHE	R	f
613	GUARARAPES	R	f
614	GRAMADO	R	f
615	GUERRA JUNQUEIRA	R	f
616	GUILHERME GAELZER NETO	R	f
617	GAGO COUTINHO	R	f
618	GASTAO FORMENTI	R	f
619	GALILEIA	T	f
620	GOIAS	R	f
621	GERALDO JOSE DE ALMEIDA	R	f
622	GIRUA	R	f
623	GRAUNA	R	f
624	GUARANI	R	f
625	GOIANIA	R	f
626	GLENIO PERES	R	f
627	GONZAGUINHA	R	f
628	GRANDE	R	f
629	GRAVATAI	R	f
630	GASPAR MARTINS	R	f
631	GUSTAVO CAPANEMA	R	f
632	GALILEU	R	f
633	GUAIBA	R	f
634	GUAJUVIRA	R	f
701	HENRIQUE SCHERER	R	f
702	HENRIQUE DIAS	R	f
703	HUMBERTO DE CAMPOS	R	f
704	HORIZONTINA	R	f
705	HUMAITA	T	f
706	HELIO MUNIZ E SILVA	R	f
707	HENRIQUE SETTI	R	f
708	HORIZONTE	R	f
709	HARMONIA	R	f
710	HERBERT DE SOUZA	R	f
711	HELMUTH ALFREDO GRAEBIN	R	f
712	HENRIQUE PEDRO KOHLRAUSCH	R	f
800	ITAIPU	R	f
801	IGUASSU	R	f
802	INDEPENDENCIA	R	f
803	IPIRANGA	R	f
805	ITORORO	R	f
806	IPE	R	f
807	IVOTI	R	f
808	ITALIA	R	f
809	ITAJAI	R	f
810	IGREJINHA	R	f
811	ITAPEMA	T	f
812	ITU	T	f
813	IRAI	R	f
814	ITAPEMIRIM	R	f
815	IPACARAI	T	f
816	IRA	T	f
817	IJUI	T	f
818	ITAI	T	f
819	ICARO	R	f
820	IPANEMA	R	f
821	IBIRUBA	T	f
822	ITAQUI	R	f
823	INDIRA GHANDI	R	f
824	IRMA DULCE	R	f
825	ITAPIRANGA	R	f
826	IMBE	R	f
827	IMOLA	R	f
828	INGA	R	f
831	ILHEUS	R	f
832	ITABUNA	R	f
900	JOSE POWOLNY	R	f
901	JOAO CORREA	A	f
902	JACINTO GOMES	R	f
903	JOAO CARLOS ZWETSCH	R	f
904	JOAO LUDERITZ	R	f
905	JOAO OTTO SAENGER	R	f
906	JOAO PESSOA	R	f
907	JOAQUIM NABUCO	R	f
908	JOSE BONIFACIO	R	f
909	JOSE SEIBEL	R	f
910	JOSE DE ALENCAR	R	f
911	JOAO LIRA	R	f
912	JOSE MONTAURI	R	f
913	JULIO DE CASTILHOS	R	f
914	JOHANN BACH	R	f
915	JOAO LEHNEN	R	f
916	JERONIMO COELHO	R	f
917	JACOB BAD	T	f
918	JACOB MILTON BENNEMANN	R	f
919	JARAGUA	T	f
920	TRAVESSA JOSE GRIMBERG	T	f
921	JAU	R	f
922	JOSE DO PATROCINIO	R	f
923	JOAO GOULART	R	f
925	JOSE LOPES NOGUEIRA	R	f
926	JOAO EDMUNDO MOHR	R	f
927	JAGUARI	R	f
928	JACOBINA	R	f
929	JORGE CURI	R	f
930	JAPAO	R	f
931	JOSE MENDES	R	f
932	JACARANDA	R	f
1001	KRAEMER-ECK	R	f
1100	LONDRINA	R	f
1101	LIBERATO S VIEIRA DA CUNHA	R	f
1102	LIMA BARRETO	R	f
1103	LINDOLFO COLLOR	R	f
1104	LUIZ OSWALDO BENDER	R	f
1105	LUIZ DE CAMOES	R	f
1106	LUIZ PASTEUR	R	f
1107	LUIZ AFONSO	R	f
1108	LUIZ BRAILLE	R	f
1109	LINDOLFO DRESCH	R	f
1110	LIANE CAMPAO	T	f
1111	LUPCINIO RODRIGUES	T	f
1112	LEBLON	T	f
1113	LOTHAR HOFFMEISTER	R	f
1114	LEME	T	f
1115	LAGUNA	R	f
1116	LIDIA CLOSS	R	f
1117	LAURO RODRIGUES (DEP)	R	f
1118	LAGO DOURADO	R	f
1119	LORI R LUDKE GERHARDT	R	f
1120	LIBERTADORES	R	f
1121	LAGEADO	R	f
1122	LAGOA SANTA	R	f
1123	LUIZ GAMA	R	f
1124	LINDOLFO KUHSLER	R	f
1125	LONDRES	R	f
1126	LOS ¬NGELES	R	f
1200	MAISA	T	f
1201	MAUA	A	f
1202	MACHADO DE ASSIS	R	f
1203	MARCILIO DIAS	R	f
1204	MARTIN LUTERO	R	f
1205	MARTIN AFONSO	R	f
1206	MARTIN BERG	R	f
1207	MARECHAL FLORIANO PEIXOTO	R	f
1208	MARQUES DO ALEGRETE	R	f
1209	MARQUES DO POMBAL	R	f
1210	MARQUES DE OLINDA	R	f
1211	MAJOR BENTO ALVES	R	f
1212	MIGUEL COUTO	R	f
1213	MIGUEL TOSTES	R	f
1214	MONTE CASTELO	R	f
1215	MARAJO	R	f
1216	MAGNUS NADLER	R	f
1217	MAJOR DANTAS	R	f
1218	MARINGA	R	f
1219	MONTE ALVERNE	R	f
1220	MARECHAL ARTHUR DA COSTA E SILVA	R	f
1221	MUNICIPAL	R	f
1222	MARICA	T	f
1223	MAQUINE	R	f
1224	MAJE	T	f
1225	MIRIM	R	f
1226	MIRANDA	R	f
1227	MADRI	R	f
1228	MIRAMAR	R	f
1229	MONTREAL	R	f
1230	MANOEL PEREIRA BRODT	R	f
1231	MUSA	R	f
1232	MANE GARRINCHA	R	f
1233	MORRO DOS CONVENTOS	R	f
1234	MAURICIO SIROTSKI SOBRINHO	R	f
1235	MORUMBI	R	f
1236	MARIO QUINTANA	R	f
1237	MANOEL JOSE LEAO	R	f
1238	MEDELIN	R	f
1239	MADRE SERRA	R	f
1240	MOINHOS DE VENTO	R	f
1241	MARCELA	R	f
1242	MEXICO	R	f
1243	MANAGUA	T	f
1244	MACEDO	R	f
1245	MANAUS	R	f
1246	MARILUZ	R	f
1247	MELTZER	R	f
1248	MARIA CUNHA	R	f
1249	MARAVILHA	R	f
1250	MUNIQUE	R	f
1251	MOSCOU	R	f
1300	NOVA FRIBURGO	R	f
1301	NEREU RAMOS	R	f
1302	NACOES UNIDAS	R	f
1303	NICOLAU BECKER	R	f
1304	NOVO HAMBURGO	R	f
1305	NOE	T	f
1306	NILO PECANHA	R	f
1307	NORIO LEMOS	R	f
1308	NOVA REPUBLICA	R	f
1309	NOVA AURORA	R	f
1310	NOVA ALVORADA	R	f
1311	NOVA HARTZ	R	f
1312	NOVA ROMA	R	f
1313	NOVA LISBOA	R	f
1400	OTTO WALTER BERG	R	f
1401	OLAVO BILAC	R	f
1402	OSWALDO CRUZ	R	f
1403	OTAVIO ROCHA	R	f
1404	OTTO KUNZ	R	f
1405	OURO PRETO	R	f
1406	OTAVIO PINTO	R	f
1407	OSWALDO BASTOS	R	f
1408	OTTO GERHARDT	R	f
1409	OPERARIA	R	f
1410	ORIENTE	R	f
1412	OSCAR ARLINDO VENTER	R	f
1413	OSWALDO ARANHA	R	f
1414	ORQUIDEA	R	f
1415	OLGA BENARIO PRESTES	R	f
1416	OZAIRE LINDOMAR SCHMIDT	R	f
1417	OASIS	R	f
1500	PASSO REAL	R	f
1501	PONTA PORA	R	f
1502	PAISSANDU	R	f
1503	PASTOR DIETSCH	R	f
1504	PAQUETA	R	f
1505	PADRE REUS	R	f
1506	PADRE NOBREGA	R	f
1507	PINDORAMA	R	f
1508	PIAUI	R	f
1509	PIRATINI	R	f
1510	PINHEIRO MACHADO	R	f
1512	PIO XII	R	f
1513	PROF SARMENTO BARATA	R	f
1514	PROF ANNES DIAS	R	f
1515	PROF LANGENDOCK	R	f
1516	PROF FITZGERALD	R	f
1518	PROTASIO ALVES	R	f
1519	PRES FRANKLIN D ROOSEVELT	R	f
1520	1 DE MAIO	R	f
1521	PLINIO BRASIL MILANO	R	f
1522	PRESIDENTE CASTELO BRANCO	R	f
1523	PRESIDENTE KENNEDY	R	f
1524	PAES DE ANDRADE	R	f
1525	PADRE ANTONIO VIEIRA	R	f
1526	PLACIDO DE CASTRO	R	f
1527	PRINCESA ISABEL	R	f
1528	PADRE CICERO	R	f
1529	PEDRO MIGUEL LENZ	R	f
1530	PRESIDENTE DUTRA	R	f
1531	PORTO BELO	R	f
1532	POCOS DE CALDAS	R	f
1533	PRESIDENTE JUCELINO	R	f
1534	PIRIAPOLIS	R	f
1535	PORTO LUCENA	R	f
1536	PLINIO SALGADO	R	f
1537	PROF MONIZ PACHECO	R	f
1538	PARANA	R	f
1539	PALMEIRAS	R	f
1540	PARA	R	f
1541	PALOTINA	R	f
1542	PORTUGAL	R	f
1543	PEDRO CALMON	R	f
1544	PRIMAVERA	R	f
1545	PARATI	T	f
1546	1 DE AGOSTO	R	f
1547	PAROBE	R	f
1548	PASSO FUNDO	R	f
1549	PORTO XAVIER	R	f
1550	PROFESSORA MARGARIDA	R	f
1551	PORTO ALEGRE	R	f
1552	PASSO DO SOBRADO	R	f
1553	PROF LUCIO FLECK	R	f
1554	PAULO GRACINDO	R	f
1555	PANTANAL	R	f
1556	PLANALTO	R	f
1557	PADRE GARCES	R	f
1558	PEQUIM	R	f
1559	PRESIDENTE LUCENA	R	f
1560	PEDRO APOLO DOS SANTOS	R	f
1561	PORTO PALMEIRA	R	f
1562	PAULO FREIRE	R	f
1563	PINHAL	R	f
1564	PAU BRASIL	R	f
1565	PARANHAMA	R	f
1566	PITANGUEIRAS	R	f
1567	PEDRO JACOB FETT	R	f
1568	PEDROSO	R	f
1569	PARIS	R	f
1601	15 DE NOVEMBRO	R	f
1602	QUINTINO BOCAIUVA	R	f
1603	QUARAI	R	f
1700	RAUL PILLA	R	f
1701	RAMIRO BARCELOS	R	f
1702	RAFAEL PINTO BANDEIRA	R	f
1703	RIACHUELO	R	f
1704	REINALDO KLEIN	R	f
1705	RIO DOS SINOS	R	f
1706	ROCHA POMBO	R	f
1707	RUBEM BERTA	R	f
1708	ROLANTE	R	f
1709	RODOVIA ESTADUAL RS 239	O	f
1710	REGIS BITTENCOURT	R	f
1711	RAPOSO TAVARES	R	f
1712	REINALDO HOFFMEISTER	R	f
1713	ROSSINI PINTO	R	f
1714	RAUL SEIXAS	R	f
1715	RANGEL	T	f
1716	RUBEM DANILO GERHARDT	R	f
1717	RONDA ALTA	R	f
1718	ROSARIO	R	f
1719	RECIFE	R	f
1720	RUBEM REINALDO KOHLRAUSCH	R	f
1721	RONDINHA	R	f
1800	SAO FRANCISCO	R	f
1801	SENADOR ALBERTO PASQUALINI	A	f
1802	SALDANHA DA GAMA	R	f
1803	SANTA CATARINA	R	f
1804	SANTA HELENA	R	f
1805	SANTA TEREZINHA	R	f
1806	SILVIO ROMERO	R	f
1807	SANTOS DUMONT	R	f
1808	SANTO ANTONIO	R	f
1809	SAO JOSE	R	f
1810	SAO LUIZ GONZAGA	R	f
1811	S√O JAC”	R	f
1812	SAO JOAO	R	f
1813	SAO PEDRO	R	f
1814	SAO MIGUEL	R	f
1815	SATURNINO DE BRITO	R	f
1816	SARMENTO LEITE	R	f
1817	SAO BERNARDO DO CAMPO	R	f
1818	SENADOR SALGADO FILHO	R	f
1819	SERGIPE	R	f
1820	7 DE SETEMBRO	R	f
1821	SILVA JARDIM	R	f
1822	SIQUEIRA DE CAMPOS	R	f
1823	SOUZA DOCA	R	f
1824	SOUZA LOBO	R	f
1825	SANTAREM	R	f
1826	SILVEIRA MARTINS	R	f
1827	SANTA MARIA	R	f
1828	SAO PAULO	T	f
1829	SIBERI	R	f
1830	SABIA	T	f
1831	SANTA CECILIA	R	f
1832	SAO MARCOS	T	f
1833	SAO BORJA	R	f
1834	SANTA RITA	R	f
1835	SARANDI	R	f
1836	SOLEDADE	R	f
1837	SOMBRIO	R	f
1838	SINIMBU	R	f
1839	SANTA CLARA	R	f
1840	SANTA ROSA	R	f
1841	SAO CONRADO	R	f
1842	SANTA LUCIA	R	f
1843	SAO LOURENCO	R	f
1844	SAO CRISTOVAO	R	f
1845	SAN MARINO	R	f
1846	SAO JOAO DEL REY	R	f
1847	SERGIO MAURINA	R	f
1848	6 DE FEVEREIRO	R	f
1849	7 DE MARCO	R	f
1850	SETE QUEDAS	R	f
1851	SALSEIRO	R	f
1900	THOMAS EDISON	R	f
1901	TAPES	R	f
1902	TIETE	R	f
1903	TIRADENTES	R	f
1904	TENENTE PINHEIRO	R	f
1905	TUIUTI	R	f
1906	13 DE MAIO	R	f
1907	TUPANCIRETA	R	f
1908	TAQUARA	R	f
1909	TAMANDARE	T	f
1910	TUPI	R	f
1911	TIJUCA	R	f
1912	TOLEDO	R	f
1913	TEOTONIO VILELA	A	f
1914	TRIUNFO	R	f
1915	THEOBALDO JOSE BERNARDES	R	f
1916	TERESOPOLIS	R	f
1917	TOBIAS BARRETO	R	f
1918	TANCREDO NEVES (PRES)	R	f
1919	TRAVESSA 5	R	f
1920	TRAVESSA 6	R	f
1921	TRAVESSA 7	R	f
1922	TRAVESSAO DO FERRABRAZ	R	f
1923	TRAVESSAO - VILA S√O PAULO	R	f
1925	TRES COROAS	R	f
1926	TENENTE PORTELA	R	f
1927	THENO EMILIO SCHUTZ	R	f
1928	TRES PASSOS	R	f
1929	TOM JOBIM	R	f
1930	TRAVESSA 13	R	f
1931	TRAVESSA 12	R	f
1932	TRAVESSA 19	R	f
1933	TORRES	R	f
1934	TEREZINA	R	f
1935	TAMBURELLO	R	f
1936	TRAMANDAI	R	f
1937	TIMBAUVA	R	f
1938	TARUMA	R	f
1939	TRAVESSA 14	T	f
1940	TRAVESSA 11	T	f
1941	TRAVESSA 18	T	f
1942	TRAVESSA 15	T	f
1943	TRAVESSA 8	T	f
2001	URSA MAIOR	R	f
2002	URUGUAI	R	f
2003	UNIAO	T	f
2004	UBERABA	R	f
2005	URUGUAIANA	R	f
2100	VISCONDE DO CAIRU	R	f
2101	20 DE SETEMBRO	A	f
2102	VASCO DA GAMA	A	f
2103	VERA CRUZ	R	f
2104	VENANCIO AIRES	R	f
2105	28 DE FEVEREIRO	R	f
2106	VICTOR HUGO	R	f
2107	VIGARIO JOSE INACIO	R	f
2108	VIEIRA DE CASTRO	R	f
2109	VISCONDE DE SAO LEOPOLDO	R	f
2110	VISCONDE DO HERVAL	R	f
2111	VISCONDE DE PELOTAS	R	f
2112	VISCONDE DE OURO PRETO	R	f
2113	25 DE JULHO	R	f
2114	VILLA LOBOS	T	f
2115	VICTOR MEIRELES	R	f
2116	24 DE NOVEMBRO	R	f
2117	VITAL BRASIL	R	f
2118	VITOR MATEUS TEIXEIRA	R	f
2119	VIENA	R	f
2120	VALENCIA	R	f
2121	VOO LIVRE	R	f
2122	VIAMAO	R	f
2123	27 DE MAIO	R	f
2124	VITORIA	R	f
2125	VICENTE CELESTINO	R	f
2200	WALTER SAENGER	R	f
2201	WENSCESLAU BRAZ	R	f
2202	WALDEMAR CARLOS JAEGER	R	f
2203	WALT DISNEY	R	f
2204	WALTER BRUNO KLEIN	R	f
2205	WALDER ANTONIO PLENTZ	R	f
2300	BECO-QUADRA 38	R	f
2301	BECO-QUADRA 73	R	f
2302	BECO-QUADRA 132	R	f
2303	BECO - QUADRA 12	R	f
2304	BECO - SETOR 22	R	f
2305	B	R	f
2350	E QUADRA 119	R	f
2400	SEM DENOM-QDA 18	R	f
2401	SEM DENOM-QDA 15	R	f
2402	PASSAGEM P-6	R	f
2450	N 2	R	f
2451	N 3	R	f
2452	N 6	R	f
2453	N 7	R	f
2454	N 8	R	f
2455	N 9	R	f
2456	N 10	R	f
2457	N 11	R	f
2458	N 12	R	f
2459	N 13	R	f
2460	N 14	R	f
2461	N 15	R	f
2462	N 16	R	f
2463	N 17	R	f
2464	N 19	R	f
2465	N 20	R	f
2466	N 21	R	f
2467	N 22	R	f
2468	N 23	R	f
2469	N 1	R	f
2470	N 5 SETOR 11	R	f
2471	N 4	R	f
2473	BECO - COUL DE SAC	R	f
2474	N 2 SETOR 2	R	f
2475	N 5 SETOR 2	R	f
2476	AC¡CIAS - 1 ( EXCLUÕDA )	R	f
2477	AC¡CIAS - 2 ( EXCLUÕDA )	R	f
2478	AC¡CIAS - 3 ( EXCLUÕDA )	R	f
2479	AC¡CIAS - 4 ( EXCLUÕDA )	R	f
2480	AC¡CIAS - 5 (EXCLUÕDA )	R	f
2481	AC¡CIAS - 2A (EXCLUÕDA)	R	f
2482	AC¡CIAS - 7 ( EXCLUÕDA )	R	f
2483	AC¡CIAS - 8 ( EXCLUÕDA )	R	f
2500	PROJETADA QDA 48	R	f
2501	PROJETADA "A"	R	f
2502	INDUSTRIAL V.NOVA - 5	R	f
2700	ZERO HORA	R	f
2701	ZE FIDELIS	R	f
6001	ESTRADA PASSO DA CRUZ	R	t
6006	REAL MADRI	R	t
6007	URTIGAO	R	t
6010	ESTRADA DO CARLAO	R	t
6011	TRAVESSAO	R	t
6012	FAZENDA LEAO	R	t
6017	SALAO QUEIMADO - PORTO PALMEIRA	R	t
6020	ESTRADA JOAO ADAO HARFF	R	t
6021	RENNER	R	t
6022	MELTZER	R	t
6023	ESTRADA 19 DE JULHO	R	t
6025	CAZUZA	R	t
6027	TIM MAIA	R	t
6030	LAGES	R	t
6031	OSWALDO SILVA	R	t
6032	ESTRADA TRAVESSAO SAO JACO	R	t
6033	CANSI	R	t
6034	REPETIDORA DE UHF	O	t
6035	ESTRADA SAPIRANGA-DOIS IRM√OS	R	t
6036	ESTRADA PEDRO WAGNER	R	t
\.


--
-- Data for Name: sis_modulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sis_modulos (mod_id, mod_nome, mod_arquivo, mod_descricao, mod_icone) FROM stdin;
1	Cadastros	Cadastros Gerais	\N	cadastros
2	Delivery		Delivery	delivery
\.


--
-- Name: bairros_pkey; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY bairros
    ADD CONSTRAINT bairros_pkey PRIMARY KEY (bai_id);


--
-- Name: catprodutos_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY catprodutos_itens
    ADD CONSTRAINT catprodutos_itens_pkey PRIMARY KEY (cpi_id);


--
-- Name: catprodutos_pkey; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY catprodutos
    ADD CONSTRAINT catprodutos_pkey PRIMARY KEY (cat_id);


--
-- Name: comanda_itensextra_pkey; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY comanda_itensextra
    ADD CONSTRAINT comanda_itensextra_pkey PRIMARY KEY (ext_id);


--
-- Name: mnu_filho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mnu_filho
    ADD CONSTRAINT mnu_filho_pkey PRIMARY KEY (mnu_filid);


--
-- Name: mnu_pai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mnu_pai
    ADD CONSTRAINT mnu_pai_pkey PRIMARY KEY (mnu_paiid);


--
-- Name: pkclientes; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT pkclientes PRIMARY KEY (cli_id);


--
-- Name: pkclifones; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY clifones
    ADD CONSTRAINT pkclifones PRIMARY KEY (fon_id);


--
-- Name: pkcomanda_delivery; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY comanda_delivery
    ADD CONSTRAINT pkcomanda_delivery PRIMARY KEY (del_id);


--
-- Name: pkcomanda_itens; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY comanda_itens
    ADD CONSTRAINT pkcomanda_itens PRIMARY KEY (cti_id);


--
-- Name: pkcomandas; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY comandas
    ADD CONSTRAINT pkcomandas PRIMARY KEY (com_id);


--
-- Name: pkfuncionarios; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT pkfuncionarios PRIMARY KEY (fun_id);


--
-- Name: pkmesas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mesas
    ADD CONSTRAINT pkmesas PRIMARY KEY (mes_id);


--
-- Name: pkprodutos; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT pkprodutos PRIMARY KEY (pro_id);


--
-- Name: pkprodutos_itens; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY produtos_itens
    ADD CONSTRAINT pkprodutos_itens PRIMARY KEY (ite_id);


--
-- Name: ruas_pkey; Type: CONSTRAINT; Schema: public; Owner: iuri; Tablespace: 
--

ALTER TABLE ONLY ruas
    ADD CONSTRAINT ruas_pkey PRIMARY KEY (rua_id);


--
-- Name: sis_modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sis_modulos
    ADD CONSTRAINT sis_modulos_pkey PRIMARY KEY (mod_id);


--
-- Name: bairros_bai_descr_in; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX bairros_bai_descr_in ON bairros USING btree (bai_descr);


--
-- Name: catprodutos_itens_cpi_valornn; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX catprodutos_itens_cpi_valornn ON catprodutos_itens USING btree (cpi_valor) WHERE (cpi_valor IS NOT NULL);


--
-- Name: clientes_cli_baiid_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX clientes_cli_baiid_idx ON clientes USING btree (cli_baiid);


--
-- Name: clientes_cli_ruaid_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX clientes_cli_ruaid_idx ON clientes USING btree (cli_ruaid);


--
-- Name: clifones_fon_cliid_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX clifones_fon_cliid_idx ON clifones USING btree (fon_cliid);


--
-- Name: comanda_delivery_del_baiid_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comanda_delivery_del_baiid_idx ON comanda_delivery USING btree (del_baiid);


--
-- Name: comanda_delivery_del_ruaid_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comanda_delivery_del_ruaid_idx ON comanda_delivery USING btree (del_ruaid);


--
-- Name: comanda_itens_cti_comid_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comanda_itens_cti_comid_idx ON comanda_itens USING btree (cti_comid);


--
-- Name: comanda_itens_cti_proid_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comanda_itens_cti_proid_idx ON comanda_itens USING btree (cti_proid);


--
-- Name: comanda_itensextra_ext_cipid; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comanda_itensextra_ext_cipid ON comanda_itensextra USING btree (ext_cipid);


--
-- Name: comanda_itensextra_ext_iteid; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comanda_itensextra_ext_iteid ON comanda_itensextra USING btree (ext_iteid);


--
-- Name: comanda_itensextra_sempreco; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comanda_itensextra_sempreco ON comanda_itensextra USING btree (ext_valor) WHERE (ext_valor IS NULL);


--
-- Name: comandas_com_aberta; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comandas_com_aberta ON comandas USING btree (com_aberta);


--
-- Name: comandas_com_dtcomanda; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comandas_com_dtcomanda ON comandas USING btree (com_dtcomanda);


--
-- Name: funcionarios_fun_ativo_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX funcionarios_fun_ativo_idx ON funcionarios USING btree (fun_ativo);


--
-- Name: mnu_filho_mnu_pai; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mnu_filho_mnu_pai ON mnu_filho USING btree (mnu_pai);


--
-- Name: mnu_filho_mnu_paisub; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mnu_filho_mnu_paisub ON mnu_filho USING btree (mnu_paisub);


--
-- Name: mnu_pai_mnu_modid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mnu_pai_mnu_modid ON mnu_pai USING btree (mnu_modid);


--
-- Name: produtos_itens_ite_proid_idx; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX produtos_itens_ite_proid_idx ON produtos_itens USING btree (ite_proid);


--
-- Name: ruas_rua_nome_in; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX ruas_rua_nome_in ON ruas USING btree (rua_nome);


--
-- Name: clifones_fon_cliid_fk; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY clifones
    ADD CONSTRAINT clifones_fon_cliid_fk FOREIGN KEY (fon_cliid) REFERENCES clientes(cli_id);


--
-- Name: comanda_itensextra_ext_iteid_fk; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY comanda_itensextra
    ADD CONSTRAINT comanda_itensextra_ext_iteid_fk FOREIGN KEY (ext_iteid) REFERENCES comanda_itens(cti_id) ON DELETE CASCADE;


--
-- Name: fk_comanda_delivery_comandas; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY comanda_delivery
    ADD CONSTRAINT fk_comanda_delivery_comandas FOREIGN KEY (del_comid) REFERENCES comandas(com_id);


--
-- Name: fk_comanda_itens_comandas; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY comanda_itens
    ADD CONSTRAINT fk_comanda_itens_comandas FOREIGN KEY (cti_comid) REFERENCES comandas(com_id) ON DELETE CASCADE;


--
-- Name: fk_comanda_itens_produtos; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY comanda_itens
    ADD CONSTRAINT fk_comanda_itens_produtos FOREIGN KEY (cti_proid) REFERENCES produtos(pro_id);


--
-- Name: fk_comandas_mesas; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY comandas
    ADD CONSTRAINT fk_comandas_mesas FOREIGN KEY (com_mesid) REFERENCES mesas(mes_id);


--
-- Name: fk_produtos_itens_produtos; Type: FK CONSTRAINT; Schema: public; Owner: iuri
--

ALTER TABLE ONLY produtos_itens
    ADD CONSTRAINT fk_produtos_itens_produtos FOREIGN KEY (ite_proid) REFERENCES produtos(pro_id);


--
-- Name: per_mod_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnu_pai
    ADD CONSTRAINT per_mod_id_fk FOREIGN KEY (mnu_modid) REFERENCES sis_modulos(mod_id);


--
-- Name: per_pai_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnu_filho
    ADD CONSTRAINT per_pai_id_fk FOREIGN KEY (mnu_pai) REFERENCES mnu_pai(mnu_paiid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: bairros; Type: ACL; Schema: public; Owner: iuri
--

REVOKE ALL ON TABLE bairros FROM PUBLIC;
REVOKE ALL ON TABLE bairros FROM iuri;
GRANT ALL ON TABLE bairros TO iuri;


--
-- Name: mnu_filho; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE mnu_filho FROM PUBLIC;
REVOKE ALL ON TABLE mnu_filho FROM postgres;
GRANT ALL ON TABLE mnu_filho TO postgres;


--
-- Name: mnu_pai; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE mnu_pai FROM PUBLIC;
REVOKE ALL ON TABLE mnu_pai FROM postgres;
GRANT ALL ON TABLE mnu_pai TO postgres;


--
-- Name: ruas; Type: ACL; Schema: public; Owner: iuri
--

REVOKE ALL ON TABLE ruas FROM PUBLIC;
REVOKE ALL ON TABLE ruas FROM iuri;
GRANT ALL ON TABLE ruas TO iuri;


--
-- Name: sis_modulos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE sis_modulos FROM PUBLIC;
REVOKE ALL ON TABLE sis_modulos FROM postgres;
GRANT ALL ON TABLE sis_modulos TO postgres;


--
-- PostgreSQL database dump complete
--

