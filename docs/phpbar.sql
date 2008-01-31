/************ Update: Schemas ***************/


/************ Update: Tables ***************/

/******************** Add Table: clientes ************************/
CREATE SEQUENCE clientes_cli_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE clientes
(
	cli_id INTEGER NOT NULL DEFAULT nextval('clientes_cli_id_seq'),
	cli_nome VARCHAR(85) NOT NULL,
	cli_ruaid INTEGER NOT NULL,
	cli_endnum VARCHAR(50) NULL,
	cli_complemento VARCHAR(85) NULL,
	cli_baiid INTEGER NULL
);

/* Table Items: clientes */
ALTER TABLE clientes ADD CONSTRAINT pkclientes
	PRIMARY KEY (cli_id);

/* Set Comments */
COMMENT ON COLUMN clientes.cli_id IS 'Código do Cliente';
COMMENT ON COLUMN clientes.cli_nome IS 'Nome do Cliente';
COMMENT ON COLUMN clientes.cli_ruaid IS 'Rua';
COMMENT ON COLUMN clientes.cli_endnum IS 'Número';
COMMENT ON COLUMN clientes.cli_complemento IS 'Complemento';
COMMENT ON COLUMN clientes.cli_baiid IS 'Bairro';

/* Update Indexes for: clientes */
CREATE INDEX clientes_cli_baiid_Idx ON clientes (cli_baiid);
CREATE INDEX clientes_cli_ruaid_Idx ON clientes (cli_ruaid);

/******************** Add Table: clifones ************************/
CREATE SEQUENCE clifones_fon_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE clifones
(
	fon_id BIGINT NOT NULL DEFAULT nextval('clifones_fon_id_seq'),
	fon_cliid INTEGER NOT NULL,
	fon_tipo INTEGER NOT NULL,
	fon_numero INTEGER NOT NULL
);

/* Table Items: clifones */
ALTER TABLE clifones ADD CONSTRAINT pkclifones
	PRIMARY KEY (fon_id);

/* Set Comments */
COMMENT ON COLUMN clifones.fon_cliid IS 'codigo do cliente';
COMMENT ON COLUMN clifones.fon_tipo IS 'tipo do fone';
COMMENT ON COLUMN clifones.fon_numero IS 'Fone';
COMMENT ON TABLE clifones IS 'Telefones do Cliente';

/* Update Indexes for: clifones */
CREATE INDEX clifones_fon_cliid_Idx ON clifones (fon_cliid);

/******************** Add Table: comanda_delivery ************************/
CREATE SEQUENCE comanda_delivery_del_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE comanda_delivery
(
	del_id BIGINT NOT NULL DEFAULT nextval('comanda_delivery_del_id_seq'),
	del_comid BIGINT NOT NULL,
	del_troco DECIMAL(10, 2) NULL,
	del_ruaid INTEGER NULL,
	del_fone INTEGER NOT NULL,
	del_baiid INTEGER NULL,
	del_complemento VARCHAR(50) NULL,
	del_obs TEXT NULL
);

/* Table Items: comanda_delivery */
ALTER TABLE comanda_delivery ADD CONSTRAINT pkcomanda_delivery
	PRIMARY KEY (del_id);

/* Set Comments */
COMMENT ON COLUMN comanda_delivery.del_comid IS 'codigo da comanda';
COMMENT ON COLUMN comanda_delivery.del_baiid IS 'Bairro ';

/* Update Indexes for: comanda_delivery */
CREATE INDEX comanda_delivery_del_baiid_Idx ON comanda_delivery (del_baiid);
CREATE INDEX comanda_delivery_del_ruaid_Idx ON comanda_delivery (del_ruaid);

/******************** Add Table: comanda_itens ************************/
CREATE SEQUENCE comanda_itens_cti_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE comanda_itens
(
	cti_id BIGINT NOT NULL DEFAULT nextval('comanda_itens_cti_id_seq'),
	cti_comid BIGINT NOT NULL,
	cti_proid INTEGER NOT NULL,
	cti_obs TEXT NULL
);

/* Table Items: comanda_itens */
ALTER TABLE comanda_itens ADD CONSTRAINT pkcomanda_itens
	PRIMARY KEY (cti_id);

/* Set Comments */
COMMENT ON COLUMN comanda_itens.cti_comid IS 'Codigo da comanda';

/* Update Indexes for: comanda_itens */
CREATE INDEX comanda_itens_cti_comid_Idx ON comanda_itens (cti_comid);
CREATE INDEX comanda_itens_cti_proid_Idx ON comanda_itens (cti_proid);

/******************** Add Table: comandas ************************/
CREATE SEQUENCE comandas_com_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE comandas
(
	com_id BIGINT NOT NULL DEFAULT nextval('comandas_com_id_seq'),
	com_mesid INTEGER NULL,
	com_delivery CHAR(1) NULL,
	com_dtcomanda DATE NOT NULL,
	com_vltotal NUMERIC(12, 2) NOT NULL
);

/* Table Items: comandas */
ALTER TABLE comandas ADD CONSTRAINT pkcomandas
	PRIMARY KEY (com_id);

/* Set Comments */
COMMENT ON COLUMN comandas.com_mesid IS 'mesa';
COMMENT ON COLUMN comandas.com_delivery IS 'Se é tele_entrega';
COMMENT ON COLUMN comandas.com_dtcomanda IS 'data da Venda';

/******************** Add Table: funcionarios ************************/
CREATE SEQUENCE funcionarios_fun_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE funcionarios
(
	fun_id INTEGER NOT NULL DEFAULT nextval('funcionarios_fun_id_seq'),
	fun_nome VARCHAR(85) NOT NULL,
	fun_senha VARCHAR(50) NOT NULL,
	fun_ativo CHAR(1) NOT NULL
);

/* Table Items: funcionarios */
ALTER TABLE funcionarios ADD CONSTRAINT pkfuncionarios
	PRIMARY KEY (fun_id);

/* Update Indexes for: funcionarios */
CREATE INDEX funcionarios_fun_ativo_Idx ON funcionarios (fun_ativo);

/******************** Add Table: mesas ************************/
CREATE SEQUENCE mesas_mes_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE mesas
(
	mes_id INTEGER NOT NULL DEFAULT nextval('mesas_mes_id_seq'),
	mes_descr VARCHAR(50) NOT NULL,
	mes_local CHAR(1) NULL
);

/* Table Items: mesas */
ALTER TABLE mesas ADD CONSTRAINT pkmesas
	PRIMARY KEY (mes_id);

/* Set Comments */
COMMENT ON COLUMN mesas.mes_id IS 'Codigo';
COMMENT ON COLUMN mesas.mes_descr IS 'Nome da Mesa';
COMMENT ON COLUMN mesas.mes_local IS 'Local:';

/******************** Add Table: produtos ************************/
CREATE SEQUENCE produtos_pro_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE produtos
(
	pro_id INTEGER NOT NULL DEFAULT nextval('produtos_pro_id_seq'),
	pro_nome VARCHAR(85) NOT NULL,
	pro_preco NUMERIC(12, 2) NOT NULL,
	pro_descr TEXT NULL,
	pro_imagem BYTEA NULL
);

/* Table Items: produtos */
ALTER TABLE produtos ADD CONSTRAINT pkprodutos
	PRIMARY KEY (pro_id);

/* Set Comments */
COMMENT ON COLUMN produtos.pro_id IS 'Código';
COMMENT ON COLUMN produtos.pro_nome IS 'nome do produto';
COMMENT ON COLUMN produtos.pro_descr IS 'Descrição do Produto';
COMMENT ON COLUMN produtos.pro_imagem IS 'imagem do Produto';

/******************** Add Table: produtos_itens ************************/
CREATE SEQUENCE produtos_itens_ite_id_seq INCREMENT 1;

/* Build Table Structure */
CREATE TABLE produtos_itens
(
	ite_id INTEGER NOT NULL DEFAULT nextval('produtos_itens_ite_id_seq'),
	ite_proid INTEGER NOT NULL,
	ite_produto VARCHAR(85) NOT NULL
);

/* Table Items: produtos_itens */
ALTER TABLE produtos_itens ADD CONSTRAINT pkprodutos_itens
	PRIMARY KEY (ite_id);

/* Set Comments */
COMMENT ON COLUMN produtos_itens.ite_proid IS 'codigo do produto';
COMMENT ON COLUMN produtos_itens.ite_produto IS 'Produto';
COMMENT ON TABLE produtos_itens IS 'itens do produto';

/* Update Indexes for: produtos_itens */
CREATE INDEX produtos_itens_ite_proid_Idx ON produtos_itens (ite_proid);

/* Remove Schemas */


/************ Add Foreign Keys to Database ***************/

/************ Foreign Key: clifones_fon_cliid_fk ***************/
ALTER TABLE clifones ADD CONSTRAINT clifones_fon_cliid_fk
	FOREIGN KEY (fon_cliid) REFERENCES clientes (cli_id) ON DELETE NO ACTION;

/************ Foreign Key: fk_comanda_delivery_comandas ***************/
ALTER TABLE comanda_delivery ADD CONSTRAINT fk_comanda_delivery_comandas
	FOREIGN KEY (del_comid) REFERENCES comandas (com_id) ON DELETE NO ACTION;

/************ Foreign Key: fk_comanda_itens_comandas ***************/
ALTER TABLE comanda_itens ADD CONSTRAINT fk_comanda_itens_comandas
	FOREIGN KEY (cti_comid) REFERENCES comandas (com_id) ON DELETE NO ACTION;

/************ Foreign Key: fk_comanda_itens_produtos ***************/
ALTER TABLE comanda_itens ADD CONSTRAINT fk_comanda_itens_produtos
	FOREIGN KEY (cti_proid) REFERENCES produtos (pro_id) ON DELETE NO ACTION;

/************ Foreign Key: fk_comandas_mesas ***************/
ALTER TABLE comandas ADD CONSTRAINT fk_comandas_mesas
	FOREIGN KEY (com_mesid) REFERENCES mesas (mes_id) ON DELETE NO ACTION;

/************ Foreign Key: fk_produtos_itens_produtos ***************/
ALTER TABLE produtos_itens ADD CONSTRAINT fk_produtos_itens_produtos
	FOREIGN KEY (ite_proid) REFERENCES produtos (pro_id) ON DELETE NO ACTION;
