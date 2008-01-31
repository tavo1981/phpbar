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

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('catprodutos', 'cat_id'), 4, true);


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

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('catprodutos_itens', 'cpi_id'), 2, true);


--
-- Name: clientes_cli_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE clientes_cli_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clientes_cli_id_seq OWNER TO iuri;

--
-- Name: clientes_cli_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('clientes_cli_id_seq', 89, true);


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

COMMENT ON COLUMN clientes.cli_id IS 'CÃ³digo do Cliente';


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

COMMENT ON COLUMN clientes.cli_endnum IS 'NÃºmero';


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
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comanda_delivery_del_id_seq OWNER TO iuri;

--
-- Name: comanda_delivery_del_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('comanda_delivery_del_id_seq', 50, true);


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
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comanda_itens_cti_id_seq OWNER TO iuri;

--
-- Name: comanda_itens_cti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('comanda_itens_cti_id_seq', 85, true);


--
-- Name: comanda_itens; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE comanda_itens (
    cti_id bigint DEFAULT nextval('comanda_itens_cti_id_seq'::regclass) NOT NULL,
    cti_comid bigint NOT NULL,
    cti_proid integer NOT NULL,
    cti_obs text,
    cti_qtde integer,
    cti_valor numeric(12,2)
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

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('comanda_itensextra', 'ext_id'), 123, true);


--
-- Name: comandaentrega; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE comandaentrega (
    cet_comid bigint,
    cet_funid integer
);


ALTER TABLE public.comandaentrega OWNER TO iuri;

--
-- Name: comandas_com_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE comandas_com_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comandas_com_id_seq OWNER TO iuri;

--
-- Name: comandas_com_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('comandas_com_id_seq', 115, true);


--
-- Name: comandas; Type: TABLE; Schema: public; Owner: iuri; Tablespace: 
--

CREATE TABLE comandas (
    com_id bigint DEFAULT nextval('comandas_com_id_seq'::regclass) NOT NULL,
    com_mesid integer,
    com_delivery character(1),
    com_dtcomanda date NOT NULL,
    com_vltotal numeric(12,2),
    com_aberta character(1),
    com_hora time without time zone
);


ALTER TABLE public.comandas OWNER TO iuri;

--
-- Name: COLUMN comandas.com_mesid; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN comandas.com_mesid IS 'mesa';


--
-- Name: COLUMN comandas.com_delivery; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN comandas.com_delivery IS 'Se Ã© tele_entrega';


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

SELECT pg_catalog.setval('funcionarios_fun_id_seq', 3, true);


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
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mesas_mes_id_seq OWNER TO iuri;

--
-- Name: mesas_mes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('mesas_mes_id_seq', 1, true);


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

COMMENT ON COLUMN mesas.mes_id IS 'Código da Mesa';


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

COMMENT ON COLUMN produtos.pro_id IS 'CÃ³digo';


--
-- Name: COLUMN produtos.pro_nome; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos.pro_nome IS 'nome do produto';


--
-- Name: COLUMN produtos.pro_descr; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos.pro_descr IS 'DescriÃ§Ã£o do Produto';


--
-- Name: COLUMN produtos.pro_foto; Type: COMMENT; Schema: public; Owner: iuri
--

COMMENT ON COLUMN produtos.pro_foto IS 'imagem do Produto';


--
-- Name: produtos_itens_ite_id_seq; Type: SEQUENCE; Schema: public; Owner: iuri
--

CREATE SEQUENCE produtos_itens_ite_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.produtos_itens_ite_id_seq OWNER TO iuri;

--
-- Name: produtos_itens_ite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iuri
--

SELECT pg_catalog.setval('produtos_itens_ite_id_seq', 6, true);


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
-- Data for Name: catprodutos; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO catprodutos (cat_id, cat_descr) VALUES (1, 'XIS');
INSERT INTO catprodutos (cat_id, cat_descr) VALUES (2, 'REFRIS');
INSERT INTO catprodutos (cat_id, cat_descr) VALUES (3, 'PIZZAS');
INSERT INTO catprodutos (cat_id, cat_descr) VALUES (4, 'CALZONES');


--
-- Data for Name: catprodutos_itens; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (1, 'Cebola', 'Cebola Frita', 1, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (2, 'Batata Frita', 'Batata Frita', 1, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (101, 'ALLA BARRIGA', 'mussarela, tomate, calabresa picada, champignon, azeitona picante, pimentão, manjericão e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (102, 'ALLA BLUM', 'mussarela, calabresa, alho picado, ovo, pimentão, tomate e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (103, 'ALLA DOUTORAS', 'mussarela, abacaxi, bacon e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (104, 'ALLA FELTES', 'mussarela, bacon, ovo, azeitona, provolone e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (105, 'ALLA FUORTE', 'mussarela, alho e óleo e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (106, 'ALLA NANDO', 'mussarela, frango, tomate seco, provolone, óleo de oliva e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (107, 'ALLA ORKUT', 'mussarela, strogonoff, champignon e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (108, 'ALLA PORCHER (Sérgio Porcher)', 'mussarela, palmito, salsinha, atum, parmesão e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (109, 'ALLA TIÇÃO (Moda da Casa)', 'mussarela, frango, bacon frito, parmesão, requeijão e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (110, 'ALLA TININHA', 'mussarela, presunto, cebola, pimentão, ovos, azeitona, milho, calabresa picada, alho e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (111, 'ALLA WIRTH', 'mussarela, tomate, tomate seco, gorgonzola, champignon, manjericão, óleo de oliva, copa, ervilha e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (112, 'ALLA WEB (Webplash)', 'mussarela, filé, alho, provolone, catupiry e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (113, 'DIOGUITO', 'mussarela, filé ao molho branco c/ alho, pomodoro, champignon e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (114, 'DON ALEX', 'mussarela, milho e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (115, 'DON LUCCA (Lucas Dietrich)', 'mussarela, copa, requeijão, ovo e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (116, 'DON OLIVIO', 'mussarela, copa, tomate seco, gorgonzola, azeite de oliva e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (117, 'DON PEDROT', 'mussarela, palmito, brócolis, champignon, pimentão e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (118, 'DON RIGGO', 'mussarela, pimentão, brócolis, tomate, ovo, requeijão e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (119, 'FUNDO DEL MAR', 'mussarela, camarão a molho especial e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (120, 'ITALIANÍSSIMA', 'mussarela, calabresa, alho e óleo, parmesão e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (121, 'MANNÜ', 'mussarela, berinjela temperada, tomate seco, azeitona picante, champignon e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (122, 'SIRACUZZA', 'mussarela, brócolis, catupiry, provolone e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (201, '5 QUEIJOS', 'mussarela, parmesão, provolone, gorgonzola, requeijão e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (202, 'ATUM', 'mussarela, atum e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (203, 'CALABRESA', 'mussarela, calabresa e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (204, 'CHAMPIGNON', 'mussarela e champignon', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (205, 'CORAÇÃO', 'mussarela, coração e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (206, 'CORLLEONE', 'mussarela, azeitona temperada, cebola e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (207, 'FILÉ', 'mussarela, filé, batata palha e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (208, 'MARGHERITA à moda Italiana', 'mussarela, rodelas de tomate, parmesão, manjericão, óleo de oliva e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (209, 'NAPOLITANA', 'mussarela, salame italiano, requeijão e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (210, 'PALMITO', 'mussarela, palmito e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (211, 'PIEMONTE', 'mussarela, atum, ovos, gorgonzola e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (212, 'PORTUGUESA', 'mussarela, presunto, cebola, pimentão, ovos, azeitona e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (213, 'ROMANA', 'mussarela, calabresa, tomate, cebola, catupiry e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (214, 'SIRACUZZA', 'mussarela, brócolis, catupiry, provolone e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (215, 'STROGONOFF', 'mussarela, strogonoff, champignon e molho de tomate', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (301, 'BRIGADEIRO', 'brigadeiro', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (302, 'CALIFÓRNIA', 'pêssego, figo e abacaxi', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (303, 'CHOCOLATE BRANCO', 'chocolate branco e leite condensado', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (304, 'CHOCOLATE PRETO', 'chocolate preto e leite condensado', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (305, 'CÔCO', 'côco ralado e leite condensado', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (306, 'DIÉRICK (Diego e Érick)', 'brigadeiro, morango, pêssego e leite condensado', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (307, 'DON RODRIGUES', 'mussarela, chocolate branco, chocolate preto, côco, banana, pêssego e leite condensado', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (308, 'MESCLADO', 'chocolate branco, chocolate preto e leite condensado', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (309, 'PRESTÍGIO', 'côco ralado, chocolate preto e leite condensad', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (310, 'SAN DANIELO D''FRAGOLI', 'chocolate preto, chocolate branco, uva e morango', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (311, 'SANDI', 'chocolate preto e morango', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (312, 'SUSPIRATTO (Pizza do Brasileiro)', 'banana c/ canela, açucar ou gemada', 3, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (401, 'ALLA NAPOLITANA', 'mussarela, salame italiano e ovo', 4, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (402, 'ALL''EMILIANA', 'mussarela, presunto, parmesão e salsa', 4, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (403, '5 FORMAGGI', 'mussarela, parmesão, provolone, gorgonzola e catupiry', 4, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (404, 'VIAREGGIO', 'mussarela, calabresa, tomate seco e provolone', 4, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (405, 'ALLA MONDRAGONE', 'mussarela, palmito, aspargos, ervilha e ovo', 4, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (406, 'PIEMONTE', 'mussarela, frango, ervilha e ovo', 4, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (407, 'PINEROLO', 'mussarela e coração de galinha', 4, NULL);
INSERT INTO catprodutos_itens (cpi_id, cpi_item, cpi_descr, cpi_catid, cpi_valor) VALUES (408, 'ALLA PORTO FINO', 'mussarela, atum, ervilha, ovo e azeitona temperada', 4, NULL);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO clientes (cli_id, cli_nome, cli_ruaid, cli_endnum, cli_complemento, cli_baiid, cli_email, cli_dtnasc, cli_foneprinc) VALUES (87, 'IURI ANDREI GUNTCHNIGG', 501, '237', NULL, NULL, NULL, NULL, 35595101);
INSERT INTO clientes (cli_id, cli_nome, cli_ruaid, cli_endnum, cli_complemento, cli_baiid, cli_email, cli_dtnasc, cli_foneprinc) VALUES (88, 'TIAGO', 2112, '222', NULL, NULL, NULL, NULL, 35591526);
INSERT INTO clientes (cli_id, cli_nome, cli_ruaid, cli_endnum, cli_complemento, cli_baiid, cli_email, cli_dtnasc, cli_foneprinc) VALUES (89, 'TIAGO', 2112, '237', NULL, NULL, NULL, NULL, 35591526);


--
-- Data for Name: clifones; Type: TABLE DATA; Schema: public; Owner: iuri
--



--
-- Data for Name: comanda_delivery; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (34, 65, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (35, 66, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (36, 67, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (37, 68, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (38, 69, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (39, 70, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (40, 71, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (41, 72, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (45, 80, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (46, 81, NULL, 501, 35595101, NULL, 'FUNDOS', NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (47, 82, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (48, 83, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (49, 84, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');
INSERT INTO comanda_delivery (del_id, del_comid, del_troco, del_ruaid, del_fone, del_baiid, del_complemento, del_obs, del_cliid, del_endnum, del_nome) VALUES (50, 86, NULL, 501, 35595101, NULL, NULL, NULL, 87, '237', 'IURI ANDREI GUNTCHNIGG');


--
-- Data for Name: comanda_itens; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (49, 65, 1, ' A: ALLA PORCHER (Sérgio Porcher), ALLA TIÇÃO (Moda da Casa), CALABRESA, PORTUGUESA', 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (50, 65, 53, NULL, 2, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (51, 66, 53, NULL, 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (52, 66, 1, ' A: ALLA FUORTE, ALLA NANDO, ALLA ORKUT, ALLA PORCHER (Sérgio Porcher)', 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (53, 67, 53, NULL, 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (54, 67, 2, ' A: ALLA WEB (Webplash)', 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (55, 68, 1, ' A: CALABRESA, NAPOLITANA, PORTUGUESA', 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (56, 69, 1, ' A: ALLA BARRIGA, ALLA BLUM, ALLA DOUTORAS, ALLA FELTES', 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (57, 70, 1, ' A: CALABRESA, FILÉ, PORTUGUESA', 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (58, 72, 1, 'metade file A: CALABRESA, FILÉ, PORTUGUESA', 1, NULL);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (67, 80, 1, ' A: ALLA TIÇÃO (Moda da Casa), ALLA WIRTH, ALLA WEB (Webplash), DON ALEX', 1, 27.00);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (68, 80, 2, ' A: SANDI', 1, 13.00);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (69, 80, 53, NULL, 1, 3.80);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (71, 81, 1, ' A: ALLA TIÇÃO (Moda da Casa), ALLA TININHA, DON PEDROT, ITALIANÍSSIMA', 1, 29.00);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (72, 81, 50, NULL, 3, 1.00);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (73, 82, 2, ' A: SANDI', 1, 14.00);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (74, 82, 53, NULL, 1, 3.75);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (75, 83, 1, ' A: ALLA WIRTH, ALLA WEB (Webplash), DIOGUITO', 1, 29.00);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (76, 84, 3, ' A: ALLA WIRTH, ALLA WEB (Webplash), DIOGUITO', 1, 16.00);
INSERT INTO comanda_itens (cti_id, cti_comid, cti_proid, cti_obs, cti_qtde, cti_valor) VALUES (77, 86, 3, ' A: ALLA WIRTH, ALLA WEB (Webplash)', 1, 16.00);


--
-- Data for Name: comanda_itensextra; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (65, 49, 108, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (66, 49, 109, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (67, 49, 203, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (68, 49, 212, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (69, 52, 105, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (70, 52, 106, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (71, 52, 107, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (72, 52, 108, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (73, 54, 112, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (74, 55, 203, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (75, 55, 209, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (76, 55, 212, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (77, 56, 101, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (78, 56, 102, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (79, 56, 103, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (80, 56, 104, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (81, 57, 203, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (82, 57, 207, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (83, 57, 212, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (84, 58, 203, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (85, 58, 207, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (86, 58, 212, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (106, 67, 109, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (107, 67, 111, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (108, 67, 112, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (109, 67, 114, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (110, 68, 311, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (111, 71, 109, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (112, 71, 110, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (113, 71, 117, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (114, 71, 120, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (115, 73, 311, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (116, 75, 111, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (117, 75, 112, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (118, 75, 113, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (119, 76, 111, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (120, 76, 112, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (121, 76, 113, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (122, 77, 111, NULL);
INSERT INTO comanda_itensextra (ext_id, ext_iteid, ext_cipid, ext_valor) VALUES (123, 77, 112, NULL);


--
-- Data for Name: comandaentrega; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO comandaentrega (cet_comid, cet_funid) VALUES (78, 3);
INSERT INTO comandaentrega (cet_comid, cet_funid) VALUES (5, 3);
INSERT INTO comandaentrega (cet_comid, cet_funid) VALUES (7, 3);
INSERT INTO comandaentrega (cet_comid, cet_funid) VALUES (8, 3);
INSERT INTO comandaentrega (cet_comid, cet_funid) VALUES (83, 3);
INSERT INTO comandaentrega (cet_comid, cet_funid) VALUES (84, 1);
INSERT INTO comandaentrega (cet_comid, cet_funid) VALUES (86, 3);


--
-- Data for Name: comandas; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (65, NULL, '1', '2007-07-04', 36.50, '0', '10:59:22');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (66, NULL, '1', '2007-07-04', 32.75, '0', '11:02:15');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (67, NULL, '1', '2007-07-04', 17.75, '0', '11:03:07');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (68, NULL, '1', '2007-07-04', 29.00, '0', '11:04:51');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (69, NULL, '1', '2007-07-04', 29.00, '0', '11:12:21');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (70, NULL, '1', '2007-07-04', 29.00, '0', '11:19:27');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (71, NULL, '1', '2007-07-04', 0.00, '0', '11:20:55');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (72, NULL, '1', '2007-07-04', 29.00, '0', '11:21:40');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (80, NULL, '1', '2007-07-20', 43.80, '0', '02:02:15');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (81, NULL, '1', '2007-07-20', 32.00, '0', '02:04:33');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (82, NULL, '1', '2007-07-20', 17.75, '0', '02:13:44');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (83, NULL, '1', '2007-07-27', 29.00, '0', '14:41:19');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (84, NULL, '1', '2007-07-27', 16.00, '0', '14:41:45');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (86, NULL, '1', '2007-07-27', 16.00, '0', '14:45:29');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (87, NULL, '1', '2007-08-11', NULL, '0', '19:53:27');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (89, NULL, '1', '2007-08-11', NULL, '0', '20:27:40');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (90, NULL, '1', '2007-08-11', NULL, '0', '20:28:38');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (91, NULL, '1', '2007-08-11', NULL, '0', '20:52:20');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (92, NULL, '1', '2007-08-11', NULL, '0', '20:52:44');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (93, NULL, '1', '2007-08-11', NULL, '0', '20:53:05');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (94, NULL, '1', '2007-08-11', NULL, '0', '21:02:45');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (95, NULL, '1', '2007-08-11', NULL, '0', '21:05:33');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (96, NULL, '1', '2007-08-11', NULL, '0', '21:43:27');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (97, NULL, '1', '2007-08-11', NULL, '0', '21:55:10');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (98, NULL, '1', '2007-08-11', NULL, '0', '22:03:21');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (99, NULL, '1', '2007-08-11', NULL, '0', '22:03:31');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (100, NULL, '1', '2007-08-11', NULL, '0', '22:03:41');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (101, NULL, '1', '2007-08-11', NULL, '0', '22:05:06');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (102, NULL, '1', '2007-08-11', NULL, '0', '22:05:23');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (103, NULL, '1', '2007-08-11', NULL, '0', '22:07:06');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (104, NULL, '1', '2007-08-11', NULL, '0', '22:08:26');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (105, NULL, '1', '2007-08-11', NULL, '0', '22:09:21');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (106, NULL, '1', '2007-08-11', NULL, '0', '22:14:24');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (107, NULL, '1', '2007-08-11', NULL, '0', '22:14:39');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (108, NULL, '1', '2007-08-11', NULL, '0', '22:14:51');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (109, NULL, '1', '2007-08-11', NULL, '0', '22:18:32');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (110, NULL, '1', '2007-08-11', NULL, '0', '22:19:11');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (111, NULL, '1', '2007-08-12', NULL, '0', '13:09:50');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (112, NULL, '1', '2007-08-12', NULL, '0', '13:10:43');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (114, NULL, '1', '2007-08-12', NULL, '0', '13:55:35');
INSERT INTO comandas (com_id, com_mesid, com_delivery, com_dtcomanda, com_vltotal, com_aberta, com_hora) VALUES (115, NULL, '1', '2007-08-12', NULL, '0', '14:14:03');


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO funcionarios (fun_id, fun_nome, fun_senha, fun_ativo) VALUES (1, 'iuri', '81dc9bdb52d04dc20036dbd8313ed055', '1');
INSERT INTO funcionarios (fun_id, fun_nome, fun_senha, fun_ativo) VALUES (3, 'asdrubal', '81dc9bdb52d04dc20036dbd8313ed055', '1');


--
-- Data for Name: mesas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (2, 'mesa 2', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (3, 'mesa 3', '2');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (1, 'mesa 1', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (4, 'Mesa 4', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (5, 'Mesa 5', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (7, 'Mesa 7', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (8, 'Mesa 8', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (9, 'Mesa 9', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (10, 'Mesa 10', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (11, 'Mesa 11', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (12, 'Mesa 12', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (13, 'mesa 13', '1');
INSERT INTO mesas (mes_id, mes_nome, mes_local) VALUES (14, 'mesa 14', '1');


--
-- Data for Name: mnu_filho; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mnu_filho (mnu_filid, mnu_nome, mnu_pai, mnu_arq, mnu_img, mnu_dir, mnu_paisub, mnu_sub, mnu_ordem) VALUES (7, 'Clientes', 1, 'cad_ncliente.php', 'cadastro_clientes', '0', NULL, 0, NULL);
INSERT INTO mnu_filho (mnu_filid, mnu_nome, mnu_pai, mnu_arq, mnu_img, mnu_dir, mnu_paisub, mnu_sub, mnu_ordem) VALUES (4, 'Mesas', 1, 'cad_nmesa.php', 'cadastro_mesas', '0', NULL, 0, NULL);
INSERT INTO mnu_filho (mnu_filid, mnu_nome, mnu_pai, mnu_arq, mnu_img, mnu_dir, mnu_paisub, mnu_sub, mnu_ordem) VALUES (3, 'Produtos', 1, 'cad_tabproduto.php', 'cadastro_produtos', '0', NULL, 0, NULL);
INSERT INTO mnu_filho (mnu_filid, mnu_nome, mnu_pai, mnu_arq, mnu_img, mnu_dir, mnu_paisub, mnu_sub, mnu_ordem) VALUES (5, 'Estoque', 1, '#', 'cadastro_estoque', '0', NULL, 0, NULL);
INSERT INTO mnu_filho (mnu_filid, mnu_nome, mnu_pai, mnu_arq, mnu_img, mnu_dir, mnu_paisub, mnu_sub, mnu_ordem) VALUES (1, 'Atendimentos', 1, 'ate_mapamesas.php', 'cadastro_atendimento', '0', NULL, 0, NULL);
INSERT INTO mnu_filho (mnu_filid, mnu_nome, mnu_pai, mnu_arq, mnu_img, mnu_dir, mnu_paisub, mnu_sub, mnu_ordem) VALUES (6, 'Entrega', 5, 'del_nentrega.php', 'delivery_atendimento', '0', NULL, 0, NULL);
INSERT INTO mnu_filho (mnu_filid, mnu_nome, mnu_pai, mnu_arq, mnu_img, mnu_dir, mnu_paisub, mnu_sub, mnu_ordem) VALUES (2, 'Configuracao', 1, 'cfg_itens.php', 'cadastro_configuracoes', '0', NULL, 0, NULL);


--
-- Data for Name: mnu_pai; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) VALUES (1, 'Cadastros', 1, 'C');
INSERT INTO mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) VALUES (2, 'Consultas', 1, 'o');
INSERT INTO mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) VALUES (3, 'Procedimentos', 1, 'P');
INSERT INTO mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) VALUES (4, 'RelatÃ³rios', 1, 'R');
INSERT INTO mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) VALUES (5, 'Cadastros', 2, 'C');
INSERT INTO mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) VALUES (6, 'Consultas', 2, 'o');
INSERT INTO mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) VALUES (7, 'Procedimentos', 2, 'P');
INSERT INTO mnu_pai (mnu_paiid, mnu_nome, mnu_modid, mnu_akey) VALUES (8, 'RelatÃ³rios', 2, 'R');


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (1, 'PIZZA FAMILIA', 29.00, NULL, NULL, '0', 3);
INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (2, 'PIZZA BROTO', 14.00, NULL, NULL, '0', 3);
INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (3, 'PIZZA MEDIA', 16.00, NULL, NULL, '0', 3);
INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (4, 'PIZZA GRANDE', 19.00, NULL, NULL, '0', 3);
INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (5, 'CAlZONES', 16.00, NULL, NULL, '0', 4);
INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (50, 'AGUA TONICA LATA', 1.50, NULL, NULL, '1', 2);
INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (51, 'COCA COLA LATA', 1.50, NULL, NULL, '1', 2);
INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (52, 'COCA-COLA LITRO', 2.75, NULL, NULL, '1', 2);
INSERT INTO produtos (pro_id, pro_nome, pro_preco, pro_descr, pro_foto, pro_estoque, pro_catid) VALUES (53, 'COCA-COLA 2 LITROS', 3.75, NULL, NULL, '1', 2);


--
-- Data for Name: produtos_itens; Type: TABLE DATA; Schema: public; Owner: iuri
--



--
-- Data for Name: ruas; Type: TABLE DATA; Schema: public; Owner: iuri
--

INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (8888, 'PROBLEMAS 2', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (9999, 'SEM RUA CADASTRADA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (7777, 'SEM CADASTRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1, 'ANTAO DE FARIAS', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2, 'AFRANIO PEIXOTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (3, 'AFONSO PENA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (4, 'ALBERTO SCHMIDT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (5, 'ALBERTO EINSTEIN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6, 'ALBERTO BINS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (7, 'ALMIRANTE BARROSO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (8, 'ALCINDO GUANABARA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (9, 'AMERICO VESPUCIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (10, 'ANCHIETA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (11, 'ACRE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (12, 'ANDRE PUENTE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (13, 'ASSIS BRASIL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (14, 'ARTHUR BERNARDES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (15, 'AUGUSTO PESTANA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (16, 'AVAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (17, 'ALTAMIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (18, 'ALBERTO SCHUCK', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (19, 'AFONSO LAUER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (20, 'ALFREDO DEODORO REICH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (21, 'ACAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (22, 'ARMANDO SALDANHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (23, 'ARI BARROSO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (24, 'ARCHYMEDES FORTINI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (25, 'AIMORE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (26, 'ADOLFO KAUTZMANN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (27, 'ANTONIO PRADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (28, 'ARAUJO VIANA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (29, 'ALEMANHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (30, 'ADOLFO LINDENMEYER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (31, 'ARGELIA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (32, 'ALVARO LINS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (33, 'ARGENTINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (34, 'ARNO ALBINO ELY', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (35, 'AMAPA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (37, 'ALTO DA BOA VISTA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (38, 'AMAZONAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (39, 'ABAETE', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (40, 'AZALEIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (41, 'AMAMBAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (42, 'ALCINDO JOSE DE MELLO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (43, 'ANDRADE NEVES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (44, 'ARTIGAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (45, 'ALAGOAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (46, 'ASTECA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (47, 'ARARANGUA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (48, 'ARROIO DO SILVA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (49, 'AMARAL NETTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (50, 'ANGRA DOS REIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (51, 'ANA NERI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (52, 'ALBERTO NICOLAU WEBER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (53, 'APPOLO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (54, 'ALECRIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (55, 'ANHEMBI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (56, 'ADOLFO LUTZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (57, 'AIRTON SENNA DA SILVA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (58, 'ALBERTO KONRATH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (59, 'ALBINO SIMON', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (60, 'ALTEMAR DUTRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (61, 'ARACA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (62, 'AROEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (63, 'ALZIRA VALESKA LAMPERT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (64, 'ARCENO JOSE DE MELLO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (65, 'ALTAMIR CLETO KAUTZMANN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (66, 'ALBATROZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (67, 'ATLANTIDA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (68, 'ANITA GARIBALDI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (69, 'ATENAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (70, 'AMSTERDÃ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (101, 'BARAO DO RIO BRANCO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (102, 'BARAO DO GRAVATAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (103, 'BARAO DO CERRO LARGO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (104, 'BARAO DO AMAZONAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (105, 'BARAO DO TRIUNFO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (106, 'BARTOLOMEU DIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (107, 'BARROS CASSAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (108, 'BENTO GONCALVES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (109, 'BENJAMIN CONSTANT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (110, 'BORGES DE MEDEIROS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (111, 'BUENOS AIRES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (112, 'BARBACENA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (113, 'BUARQUE DE HOLANDA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (114, 'BAGE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (115, 'BLUMENAU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (116, 'BERNARDO LEMKE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (117, 'BRAGANÇA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (118, 'BOA VISTA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (119, 'BAHIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (121, 'BARATA RIBEIRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (122, 'BEIJA FLOR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (123, 'BUTIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (124, 'BARRA VELHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (125, 'BARAO DE ITARARE', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (126, 'BERLIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (127, 'BONSUCESSO', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (128, 'BURICA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (129, 'BOM JESUS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (201, 'CALDAS JUNIOR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (202, 'CAMPOS SALES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (203, 'CARLOS BIEHL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (204, 'CARLOS BARBOSA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (207, 'CASEMIRO DE ABREU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (208, 'CANDIDO RONDON', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (209, 'CAPITAO MONTANHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (211, 'CORONEL GENUINO SAMPAIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (212, 'FERNANDO MACHADO (CEL)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (213, 'CEARA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (214, 'CHUI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (215, 'CHAVES BARCELOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (216, 'CAXIAS DO SUL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (217, 'CRISTOVAO COLOMBO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (218, 'CURITIBA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (219, 'CARMEM MIRANDA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (220, 'CAMBORIU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (222, 'CAMPO BOM', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (223, 'CASSIANO RICARDO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (224, 'CARIJOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (225, 'COELHO NETO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (226, 'CRUZ ALTA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (227, 'CRUZEIRO DO SUL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (228, 'CARLOS BRENNER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (229, 'CAETE', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (230, 'CHARRUA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (231, 'COIMBRA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (232, 'CARUARU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (233, 'CARLOS ALFREDO BERLITZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (234, 'CATUMBI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (235, 'TRAVESSAO CAMPO BOM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (236, 'CAIOBA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (237, 'CANTO DO RIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (238, 'CORUMBA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (239, 'CAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (240, 'CLEMENTINA DE JESUS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (241, 'CANTA GALO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (242, 'CAMPO GRANDE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (243, 'CRICIUMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (244, 'CRISTO REI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (245, 'CANADA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (246, 'CORREIO DO POVO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (247, 'CLARA NUNES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (248, 'CACEQUI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (249, 'CARAZINHO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (250, 'CAICARA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (251, 'CHICO MENDES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (252, 'CARLOS GOMES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (253, 'CABO FRIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (254, 'COSTINHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (255, 'CAMPO VERDE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (256, 'CANDIOTA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (257, 'CLAUDIO ADAO WEISS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (258, 'CAPAO DA CANOA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (259, 'CIDREIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (260, 'CABRIUVA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (261, 'CANELA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (262, 'CAMBOATA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (263, 'CEREJEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (264, 'CHILE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (300, 'DO VALE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (301, 'DIOGO ANTONIO FEIJO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (302, 'DA LADEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (303, 'DEMETRIO RIBEIRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (304, 'ANDRE DA ROCHA (DES)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (305, 'MARIO TOTTA (DR)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (306, 'MAURICIO CARDOSO (DR)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (307, 'PRUDENTE DE MORAES (DR)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (308, 'DUQUE DE CAXIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (309, 'DOS ESTADOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (310, 'DEODORO DA FONSECA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (311, 'DA ASSOCIACAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (312, 'DA CHAPADA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (313, 'DUQUE ESTRADA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (314, 'DOIS IRMAOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (315, 'DAS FLORES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (316, 'BONFIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (317, 'DALE COUTINHO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (318, 'DA REPUBLICA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (319, 'DA IMIGRACAO', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (320, 'DA SAUDADE', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (321, 'DAS ACACIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (323, 'DA GAVEA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (324, 'DIVINOPOLIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (325, 'DA URCA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (326, 'DAS ROSAS', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (327, 'D', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (328, 'DO IMIGRANTE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (329, 'DOS XAVANTES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (330, 'DOS MINUANOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (331, 'DOS INCAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (332, 'DA BANDEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (333, 'DAS LAGRIMAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (334, 'DA PAZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (335, 'DOURADOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (336, '12 DE OUTUBRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (337, 'DALTRO FILHO (GEN)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (339, 'DOS PAMPAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (340, 'DO BRAZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (341, 'DA MATA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (342, 'DA PIEDADE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (343, 'DO GOVERNADOR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (344, 'DECIO GOMES PEREIRA (DR)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (345, 'DOM PEDRITO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (346, 'DOUTEL DE ANDRADE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (347, 'DOS MUCKERS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (348, 'DO MAGISTERIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (349, 'DAS NACOES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (350, 'DAS MANGAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (351, 'DAS ARAUCARIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (352, 'DONA LEOPOLDINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (353, 'DO TRAVESSAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (354, 'DAS ANDORINHAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (355, 'DAS AMERICAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (356, 'DOM PEDRO I', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (357, 'DAS GAIVOTAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (358, 'DO SOBRADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (359, 'DAS ARARAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (360, 'DENER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (361, 'DA SOLIDARIEDADE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (362, 'DA AMIZADE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (363, 'DELMAR CELMAR SCHNEIDER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (364, 'DOS CRAVOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (365, 'DO CEDRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (366, 'DAS JABOTICABAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (367, 'DOS ANGICOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (368, 'DOS GIRASSOIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (369, 'DOS COQUEIROS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (370, 'DOS LAGOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (371, 'DAS PEDRAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (372, 'DAS ARECAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (373, 'DAS GREVILEAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (400, 'ERON DOMINGUES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (401, 'ECA DE QUEIROS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (402, 'EPITACIO PESSOA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (403, 'ERNESTO FONTOURA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (404, 'ESTACIO DE SA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (405, 'ESPIRITO SANTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (406, 'EUCLIDES DA CUNHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (407, 'ESPANHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (408, 'EDGAR KNACK', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (409, 'ESTRELA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (410, 'ESTANCIA VELHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (411, 'ERICO VERISSIMO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (412, 'EVERALDO MARQUES DA SILVA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (413, 'ELIS REGINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (414, 'ERNESTO ANTONIO DE PAULA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (415, 'EMMA DAVILA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (416, 'ELDORADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (417, 'ERMELINO PEREIRA MARTINS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (418, 'EDWIN KUWER (PREF)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (419, 'ERNESTO SPINDLER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (420, 'ESPERANCA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (421, 'ENEAS ALFEU VIEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (422, 'ERECHIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (423, 'EUGEN WALDER HOCH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (424, 'EQUADOR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (500, 'FREDERICO BRUSIUS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (501, 'FELIPE CAMARAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (502, 'FELIX DA CUNHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (503, 'FERNANDES VIEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (504, 'FERRABRAZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (505, 'FRANCISCO PEREIRA PASSOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (506, 'FARROUPILHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (507, 'FELIPE SCHELL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (508, 'FLORIANÓPOLIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (509, 'FEDERACAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (510, 'FELIZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (511, 'FREDERICO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (512, 'FREI DAMIAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (513, 'FAZENDA LEAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (514, 'FIGUEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (600, 'GUARUJA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (601, 'GABRIELA MISTRAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (602, 'NASCIMENTO VARGAS (GEN)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (603, 'GENERAL JOSE ANTONIO F DA CUNHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (604, 'GARIBALDI', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (605, 'GONCALO AFONSO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (606, 'GENERAL OSORIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (608, 'LIMA E SILVA (GEN)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (609, 'GETULIO VARGAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (610, 'GUAPORE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (611, 'GONCALVES DIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (612, 'GOETHE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (613, 'GUARARAPES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (614, 'GRAMADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (615, 'GUERRA JUNQUEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (616, 'GUILHERME GAELZER NETO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (617, 'GAGO COUTINHO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (618, 'GASTAO FORMENTI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (619, 'GALILEIA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (620, 'GOIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (621, 'GERALDO JOSE DE ALMEIDA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (622, 'GIRUA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (623, 'GRAUNA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (624, 'GUARANI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (625, 'GOIANIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (626, 'GLENIO PERES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (627, 'GONZAGUINHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (628, 'GRANDE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (629, 'GRAVATAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (630, 'GASPAR MARTINS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (631, 'GUSTAVO CAPANEMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (632, 'GALILEU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (633, 'GUAIBA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (634, 'GUAJUVIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (701, 'HENRIQUE SCHERER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (702, 'HENRIQUE DIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (703, 'HUMBERTO DE CAMPOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (704, 'HORIZONTINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (705, 'HUMAITA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (706, 'HELIO MUNIZ E SILVA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (707, 'HENRIQUE SETTI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (708, 'HORIZONTE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (709, 'HARMONIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (710, 'HERBERT DE SOUZA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (711, 'HELMUTH ALFREDO GRAEBIN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (712, 'HENRIQUE PEDRO KOHLRAUSCH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (800, 'ITAIPU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (801, 'IGUASSU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (802, 'INDEPENDENCIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (803, 'IPIRANGA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (805, 'ITORORO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (806, 'IPE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (807, 'IVOTI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (808, 'ITALIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (809, 'ITAJAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (810, 'IGREJINHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (811, 'ITAPEMA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (812, 'ITU', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (813, 'IRAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (814, 'ITAPEMIRIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (815, 'IPACARAI', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (816, 'IRA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (817, 'IJUI', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (818, 'ITAI', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (819, 'ICARO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (820, 'IPANEMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (821, 'IBIRUBA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (822, 'ITAQUI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (823, 'INDIRA GHANDI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (824, 'IRMA DULCE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (825, 'ITAPIRANGA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (826, 'IMBE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (827, 'IMOLA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (828, 'INGA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (831, 'ILHEUS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (832, 'ITABUNA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (900, 'JOSE POWOLNY', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (901, 'JOAO CORREA', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (902, 'JACINTO GOMES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (903, 'JOAO CARLOS ZWETSCH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (904, 'JOAO LUDERITZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (905, 'JOAO OTTO SAENGER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (906, 'JOAO PESSOA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (907, 'JOAQUIM NABUCO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (908, 'JOSE BONIFACIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (909, 'JOSE SEIBEL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (910, 'JOSE DE ALENCAR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (911, 'JOAO LIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (912, 'JOSE MONTAURI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (913, 'JULIO DE CASTILHOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (914, 'JOHANN BACH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (915, 'JOAO LEHNEN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (916, 'JERONIMO COELHO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (917, 'JACOB BAD', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (918, 'JACOB MILTON BENNEMANN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (919, 'JARAGUA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (920, 'TRAVESSA JOSE GRIMBERG', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (921, 'JAU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (922, 'JOSE DO PATROCINIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (923, 'JOAO GOULART', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (925, 'JOSE LOPES NOGUEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (926, 'JOAO EDMUNDO MOHR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (927, 'JAGUARI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (928, 'JACOBINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (929, 'JORGE CURI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (930, 'JAPAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (931, 'JOSE MENDES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (932, 'JACARANDA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1001, 'KRAEMER-ECK', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1100, 'LONDRINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1101, 'LIBERATO S VIEIRA DA CUNHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1102, 'LIMA BARRETO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1103, 'LINDOLFO COLLOR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1104, 'LUIZ OSWALDO BENDER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1105, 'LUIZ DE CAMOES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1106, 'LUIZ PASTEUR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1107, 'LUIZ AFONSO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1108, 'LUIZ BRAILLE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1109, 'LINDOLFO DRESCH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1110, 'LIANE CAMPAO', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1111, 'LUPCINIO RODRIGUES', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1112, 'LEBLON', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1113, 'LOTHAR HOFFMEISTER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1114, 'LEME', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1115, 'LAGUNA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1116, 'LIDIA CLOSS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1117, 'LAURO RODRIGUES (DEP)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1118, 'LAGO DOURADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1119, 'LORI R LUDKE GERHARDT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1120, 'LIBERTADORES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1121, 'LAGEADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1122, 'LAGOA SANTA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1123, 'LUIZ GAMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1124, 'LINDOLFO KUHSLER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1125, 'LONDRES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1126, 'LOS ÂNGELES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1200, 'MAISA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1201, 'MAUA', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1202, 'MACHADO DE ASSIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1203, 'MARCILIO DIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1204, 'MARTIN LUTERO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1205, 'MARTIN AFONSO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1206, 'MARTIN BERG', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1207, 'MARECHAL FLORIANO PEIXOTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1208, 'MARQUES DO ALEGRETE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1209, 'MARQUES DO POMBAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1210, 'MARQUES DE OLINDA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1211, 'MAJOR BENTO ALVES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1212, 'MIGUEL COUTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1213, 'MIGUEL TOSTES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1214, 'MONTE CASTELO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1215, 'MARAJO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1216, 'MAGNUS NADLER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1217, 'MAJOR DANTAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1218, 'MARINGA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1219, 'MONTE ALVERNE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1220, 'MARECHAL ARTHUR DA COSTA E SILVA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1221, 'MUNICIPAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1222, 'MARICA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1223, 'MAQUINE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1224, 'MAJE', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1225, 'MIRIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1226, 'MIRANDA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1227, 'MADRI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1228, 'MIRAMAR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1229, 'MONTREAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1230, 'MANOEL PEREIRA BRODT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1231, 'MUSA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1232, 'MANE GARRINCHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1233, 'MORRO DOS CONVENTOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1234, 'MAURICIO SIROTSKI SOBRINHO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1235, 'MORUMBI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1236, 'MARIO QUINTANA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1237, 'MANOEL JOSE LEAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1238, 'MEDELIN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1239, 'MADRE SERRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1240, 'MOINHOS DE VENTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1241, 'MARCELA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1242, 'MEXICO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1243, 'MANAGUA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1244, 'MACEDO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1245, 'MANAUS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1246, 'MARILUZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1247, 'MELTZER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1248, 'MARIA CUNHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1249, 'MARAVILHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1250, 'MUNIQUE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1251, 'MOSCOU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1300, 'NOVA FRIBURGO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1301, 'NEREU RAMOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1302, 'NACOES UNIDAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1303, 'NICOLAU BECKER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1304, 'NOVO HAMBURGO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1305, 'NOE', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1306, 'NILO PECANHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1307, 'NORIO LEMOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1308, 'NOVA REPUBLICA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1309, 'NOVA AURORA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1310, 'NOVA ALVORADA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1311, 'NOVA HARTZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1312, 'NOVA ROMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1313, 'NOVA LISBOA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1400, 'OTTO WALTER BERG', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1401, 'OLAVO BILAC', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1402, 'OSWALDO CRUZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1403, 'OTAVIO ROCHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1404, 'OTTO KUNZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1405, 'OURO PRETO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1406, 'OTAVIO PINTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1407, 'OSWALDO BASTOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1408, 'OTTO GERHARDT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1409, 'OPERARIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1410, 'ORIENTE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1412, 'OSCAR ARLINDO VENTER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1413, 'OSWALDO ARANHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1414, 'ORQUIDEA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1415, 'OLGA BENARIO PRESTES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1416, 'OZAIRE LINDOMAR SCHMIDT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1417, 'OASIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1500, 'PASSO REAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1501, 'PONTA PORA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1502, 'PAISSANDU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1503, 'PASTOR DIETSCH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1504, 'PAQUETA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1505, 'PADRE REUS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1506, 'PADRE NOBREGA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1507, 'PINDORAMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1508, 'PIAUI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1509, 'PIRATINI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1510, 'PINHEIRO MACHADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1512, 'PIO XII', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1513, 'PROF SARMENTO BARATA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1514, 'PROF ANNES DIAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1515, 'PROF LANGENDOCK', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1516, 'PROF FITZGERALD', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1518, 'PROTASIO ALVES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1519, 'PRES FRANKLIN D ROOSEVELT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1520, '1 DE MAIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1521, 'PLINIO BRASIL MILANO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1522, 'PRESIDENTE CASTELO BRANCO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1523, 'PRESIDENTE KENNEDY', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1524, 'PAES DE ANDRADE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1525, 'PADRE ANTONIO VIEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1526, 'PLACIDO DE CASTRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1527, 'PRINCESA ISABEL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1528, 'PADRE CICERO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1529, 'PEDRO MIGUEL LENZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1530, 'PRESIDENTE DUTRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1531, 'PORTO BELO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1532, 'POCOS DE CALDAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1533, 'PRESIDENTE JUCELINO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1534, 'PIRIAPOLIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1535, 'PORTO LUCENA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1536, 'PLINIO SALGADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1537, 'PROF MONIZ PACHECO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1538, 'PARANA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1539, 'PALMEIRAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1540, 'PARA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1541, 'PALOTINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1542, 'PORTUGAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1543, 'PEDRO CALMON', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1544, 'PRIMAVERA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1545, 'PARATI', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1546, '1 DE AGOSTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1547, 'PAROBE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1548, 'PASSO FUNDO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1549, 'PORTO XAVIER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1550, 'PROFESSORA MARGARIDA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1551, 'PORTO ALEGRE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1552, 'PASSO DO SOBRADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1553, 'PROF LUCIO FLECK', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1554, 'PAULO GRACINDO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1555, 'PANTANAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1556, 'PLANALTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1557, 'PADRE GARCES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1558, 'PEQUIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1559, 'PRESIDENTE LUCENA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1560, 'PEDRO APOLO DOS SANTOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1561, 'PORTO PALMEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1562, 'PAULO FREIRE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1563, 'PINHAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1564, 'PAU BRASIL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1565, 'PARANHAMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1566, 'PITANGUEIRAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1567, 'PEDRO JACOB FETT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1568, 'PEDROSO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1569, 'PARIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1601, '15 DE NOVEMBRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1602, 'QUINTINO BOCAIUVA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1603, 'QUARAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1700, 'RAUL PILLA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1701, 'RAMIRO BARCELOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1702, 'RAFAEL PINTO BANDEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1703, 'RIACHUELO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1704, 'REINALDO KLEIN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1705, 'RIO DOS SINOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1706, 'ROCHA POMBO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1707, 'RUBEM BERTA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1708, 'ROLANTE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1709, 'RODOVIA ESTADUAL RS 239', 'O', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1710, 'REGIS BITTENCOURT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1711, 'RAPOSO TAVARES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1712, 'REINALDO HOFFMEISTER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1713, 'ROSSINI PINTO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1714, 'RAUL SEIXAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1715, 'RANGEL', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1716, 'RUBEM DANILO GERHARDT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1717, 'RONDA ALTA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1718, 'ROSARIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1719, 'RECIFE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1720, 'RUBEM REINALDO KOHLRAUSCH', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1721, 'RONDINHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1800, 'SAO FRANCISCO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1801, 'SENADOR ALBERTO PASQUALINI', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1802, 'SALDANHA DA GAMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1803, 'SANTA CATARINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1804, 'SANTA HELENA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1805, 'SANTA TEREZINHA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1806, 'SILVIO ROMERO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1807, 'SANTOS DUMONT', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1808, 'SANTO ANTONIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1809, 'SAO JOSE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1810, 'SAO LUIZ GONZAGA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1811, 'SÃO JACÓ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1812, 'SAO JOAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1813, 'SAO PEDRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1814, 'SAO MIGUEL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1815, 'SATURNINO DE BRITO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1816, 'SARMENTO LEITE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1817, 'SAO BERNARDO DO CAMPO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1818, 'SENADOR SALGADO FILHO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1819, 'SERGIPE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1820, '7 DE SETEMBRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1821, 'SILVA JARDIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1822, 'SIQUEIRA DE CAMPOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1823, 'SOUZA DOCA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1824, 'SOUZA LOBO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1825, 'SANTAREM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1826, 'SILVEIRA MARTINS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1827, 'SANTA MARIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1828, 'SAO PAULO', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1829, 'SIBERI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1830, 'SABIA', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1831, 'SANTA CECILIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1832, 'SAO MARCOS', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1833, 'SAO BORJA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1834, 'SANTA RITA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1835, 'SARANDI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1836, 'SOLEDADE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1837, 'SOMBRIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1838, 'SINIMBU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1839, 'SANTA CLARA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1840, 'SANTA ROSA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1841, 'SAO CONRADO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1842, 'SANTA LUCIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1843, 'SAO LOURENCO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1844, 'SAO CRISTOVAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1845, 'SAN MARINO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1846, 'SAO JOAO DEL REY', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1847, 'SERGIO MAURINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1848, '6 DE FEVEREIRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1849, '7 DE MARCO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1850, 'SETE QUEDAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1851, 'SALSEIRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1900, 'THOMAS EDISON', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1901, 'TAPES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1902, 'TIETE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1903, 'TIRADENTES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1904, 'TENENTE PINHEIRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1905, 'TUIUTI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1906, '13 DE MAIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1907, 'TUPANCIRETA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1908, 'TAQUARA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1909, 'TAMANDARE', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1910, 'TUPI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1911, 'TIJUCA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1912, 'TOLEDO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1913, 'TEOTONIO VILELA', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1914, 'TRIUNFO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1915, 'THEOBALDO JOSE BERNARDES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1916, 'TERESOPOLIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1917, 'TOBIAS BARRETO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1918, 'TANCREDO NEVES (PRES)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1919, 'TRAVESSA 5', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1920, 'TRAVESSA 6', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1921, 'TRAVESSA 7', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1922, 'TRAVESSAO DO FERRABRAZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1923, 'TRAVESSAO - VILA SÃO PAULO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1925, 'TRES COROAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1926, 'TENENTE PORTELA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1927, 'THENO EMILIO SCHUTZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1928, 'TRES PASSOS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1929, 'TOM JOBIM', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1930, 'TRAVESSA 13', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1931, 'TRAVESSA 12', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1932, 'TRAVESSA 19', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1933, 'TORRES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1934, 'TEREZINA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1935, 'TAMBURELLO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1936, 'TRAMANDAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1937, 'TIMBAUVA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1938, 'TARUMA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1939, 'TRAVESSA 14', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1940, 'TRAVESSA 11', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1941, 'TRAVESSA 18', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1942, 'TRAVESSA 15', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (1943, 'TRAVESSA 8', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2001, 'URSA MAIOR', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2002, 'URUGUAI', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2003, 'UNIAO', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2004, 'UBERABA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2005, 'URUGUAIANA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2100, 'VISCONDE DO CAIRU', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2101, '20 DE SETEMBRO', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2102, 'VASCO DA GAMA', 'A', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2103, 'VERA CRUZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2104, 'VENANCIO AIRES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2105, '28 DE FEVEREIRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2106, 'VICTOR HUGO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2107, 'VIGARIO JOSE INACIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2108, 'VIEIRA DE CASTRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2109, 'VISCONDE DE SAO LEOPOLDO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2110, 'VISCONDE DO HERVAL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2111, 'VISCONDE DE PELOTAS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2112, 'VISCONDE DE OURO PRETO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2113, '25 DE JULHO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2114, 'VILLA LOBOS', 'T', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2115, 'VICTOR MEIRELES', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2116, '24 DE NOVEMBRO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2117, 'VITAL BRASIL', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2118, 'VITOR MATEUS TEIXEIRA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2119, 'VIENA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2120, 'VALENCIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2121, 'VOO LIVRE', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2122, 'VIAMAO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2123, '27 DE MAIO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2124, 'VITORIA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2125, 'VICENTE CELESTINO', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2200, 'WALTER SAENGER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2201, 'WENSCESLAU BRAZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2202, 'WALDEMAR CARLOS JAEGER', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2203, 'WALT DISNEY', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2204, 'WALTER BRUNO KLEIN', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2205, 'WALDER ANTONIO PLENTZ', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2300, 'BECO-QUADRA 38', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2301, 'BECO-QUADRA 73', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2302, 'BECO-QUADRA 132', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2303, 'BECO - QUADRA 12', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2304, 'BECO - SETOR 22', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2305, 'B', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2350, 'E QUADRA 119', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2400, 'SEM DENOM-QDA 18', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2401, 'SEM DENOM-QDA 15', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2402, 'PASSAGEM P-6', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2450, 'N 2', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2451, 'N 3', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2452, 'N 6', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2453, 'N 7', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2454, 'N 8', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2455, 'N 9', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2456, 'N 10', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2457, 'N 11', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2458, 'N 12', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2459, 'N 13', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2460, 'N 14', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2461, 'N 15', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2462, 'N 16', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2463, 'N 17', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2464, 'N 19', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2465, 'N 20', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2466, 'N 21', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2467, 'N 22', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2468, 'N 23', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2469, 'N 1', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2470, 'N 5 SETOR 11', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2471, 'N 4', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2473, 'BECO - COUL DE SAC', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2474, 'N 2 SETOR 2', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2475, 'N 5 SETOR 2', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2476, 'ACÁCIAS - 1 ( EXCLUÍDA )', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2477, 'ACÁCIAS - 2 ( EXCLUÍDA )', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2478, 'ACÁCIAS - 3 ( EXCLUÍDA )', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2479, 'ACÁCIAS - 4 ( EXCLUÍDA )', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2480, 'ACÁCIAS - 5 (EXCLUÍDA )', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2481, 'ACÁCIAS - 2A (EXCLUÍDA)', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2482, 'ACÁCIAS - 7 ( EXCLUÍDA )', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2483, 'ACÁCIAS - 8 ( EXCLUÍDA )', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2500, 'PROJETADA QDA 48', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2501, 'PROJETADA "A"', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2502, 'INDUSTRIAL V.NOVA - 5', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2700, 'ZERO HORA', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (2701, 'ZE FIDELIS', 'R', false);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6001, 'ESTRADA PASSO DA CRUZ', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6006, 'REAL MADRI', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6007, 'URTIGAO', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6010, 'ESTRADA DO CARLAO', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6011, 'TRAVESSAO', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6012, 'FAZENDA LEAO', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6017, 'SALAO QUEIMADO - PORTO PALMEIRA', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6020, 'ESTRADA JOAO ADAO HARFF', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6021, 'RENNER', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6022, 'MELTZER', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6023, 'ESTRADA 19 DE JULHO', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6025, 'CAZUZA', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6027, 'TIM MAIA', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6030, 'LAGES', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6031, 'OSWALDO SILVA', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6032, 'ESTRADA TRAVESSAO SAO JACO', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6033, 'CANSI', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6034, 'REPETIDORA DE UHF', 'O', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6035, 'ESTRADA SAPIRANGA-DOIS IRMÃOS', 'R', true);
INSERT INTO ruas (rua_id, rua_nome, rua_tipo, rua_rural) VALUES (6036, 'ESTRADA PEDRO WAGNER', 'R', true);


--
-- Data for Name: sis_modulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sis_modulos (mod_id, mod_nome, mod_arquivo, mod_descricao, mod_icone) VALUES (1, 'Cadastros', 'Cadastros Gerais', NULL, 'cadastros');
INSERT INTO sis_modulos (mod_id, mod_nome, mod_arquivo, mod_descricao, mod_icone) VALUES (2, 'Delivery', '', 'Delivery', 'delivery');


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
-- Name: comandaentrega_cet_comid; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comandaentrega_cet_comid ON comandaentrega USING btree (cet_comid);


--
-- Name: comandaentrega_cet_funid; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE INDEX comandaentrega_cet_funid ON comandaentrega USING btree (cet_funid);


--
-- Name: comandaentrega_unique; Type: INDEX; Schema: public; Owner: iuri; Tablespace: 
--

CREATE UNIQUE INDEX comandaentrega_unique ON comandaentrega USING btree (cet_comid, cet_funid);


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
    ADD CONSTRAINT fk_comanda_delivery_comandas FOREIGN KEY (del_comid) REFERENCES comandas(com_id) ON DELETE CASCADE;


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

