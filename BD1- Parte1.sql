INSERT INTO TB_PRECOS  (codigo_preco_diaria,valor_diaria,data_inicio_vigencia,data_fim_vigencia) VALUES (1,40.50,'1/8/1999','9/8/1999');
INSERT INTO TB_CIDADES  (sigla_cidade,nome_cidade) VALUES ('SSA','Salvador');
INSERT INTO TB_ESTADOS  (sigla_estado,nome_estado) VALUES ('BA','Bahia');
INSERT INTO TB_ACESSORIOS (sigla_acessorio,nome_acessorio) VALUES ('VOL2','Volante com airbag duplo');
INSERT INTO TB_FABRICANTES (cnpj_fabricante,nome_fabricante,telefones_fabricante) VALUES ('59.104.760/0001-91','Toyota','759999999,718888888');
INSERT INTO TB_MODELOS (codigo_modelo,nome_modelo,cnpj_fabricante) VALUES (1,'Corolla','59.104.760/0001-91');
INSERT INTO TB_GRUPOS (codigo_grupo,nome_grupo,codigo_preco_diaria) VALUES (1,'BÃ¡sico',1);
INSERT INTO TB_VEICULOS (placa_veiculo,codigo_modelo,codigo_grupo,sigla_acessorio,ano_fabricacao_veiculo,data_aquisicao_veculo,data_venda_veiculo,quilometragem_atual_veiculo) VALUES ('AAA-123',1,1,'VOL','01/20/2022','01/24/2022','01/25/2022','10KM');
INSERT INTO TB_ENDERECOS(codigo_endereco,numero_endereco,logradouro_endereco,bairro_endereco,cnpj_fabricante,sigla_cidade,sigla_estado) VALUES (1,'283','Rua João das Botas','Canela','59.104.760/0001-91','SSA','BA');




CREATE TABLE TB_PRECOS (
codigo_preco_diaria smallint  NOT NULL,
valor_diaria decimal NOT NULL,
data_inicio_vigencia Date NOT NULL,
data_fim_vigencia Date
CONSTRAINT pk_codigo_preco_diaria  PRIMARY KEY (codigo_preco_diaria)
);



CREATE TABLE TB_CIDADES (
sigla_cidade  VARCHAR(10) NOT NULL,
nome_cidade VARCHAR(50) NOT NULL,
CONSTRAINT pk_sigla_cidade PRIMARY KEY (sigla_cidade)
);


CREATE TABLE TB_ESTADOS (
sigla_estado  VARCHAR(10) NOT NULL,
nome_estado VARCHAR(50) NOT NULL,
CONSTRAINT pk_sigla_estado PRIMARY KEY (sigla_estado)
);



CREATE TABLE TB_ACESSORIOS(
sigla_acessorio VARCHAR(50) UNIQUE NOT NULL,
nome_acessorio VARCHAR(255) NOT NULL
CONSTRAINT pk_sigla_acessorio PRIMARY KEY (sigla_acessorio)
);



CREATE TABLE TB_FABRICANTES(
cnpj_fabricante VARCHAR(55) UNIQUE NOT NULL,
nome_fabricante VARCHAR(255) NOT NULL,
telefones_fabricante VARCHAR(255) NOT NULL
CONSTRAINT pk_cnpj_fabricante PRIMARY KEY (cnpj_fabricante)
);



CREATE TABLE TB_MODELOS(
codigo_modelo integer NOT NULL,
nome_modelo VARCHAR(50) NOT NULL,
cnpj_fabricante VARCHAR(55) NOT NULL,
FOREIGN KEY (cnpj_fabricante) REFERENCES TB_FABRICANTES (cnpj_fabricante)
CONSTRAINT pk_codigo_modelo  PRIMARY KEY (codigo_modelo)
);

CREATE TABLE TB_GRUPOS(
codigo_grupo integer NOT NULL,
nome_grupo VARCHAR(50) NOT NULL,
codigo_preco_diaria integer NOT NULL,
FOREIGN KEY (codigo_preco_diaria) REFERENCES TB_PRECOS (codigo_preco_diaria)
CONSTRAINT pk_codigo_grupo  PRIMARY KEY (codigo_grupo)
);

CREATE TABLE TB_VEICULOS(
placa_veiculo VARCHAR(255) UNIQUE NOT NULL,
codigo_modelo integer NOT NULL,
codigo_grupo integer NOT NULL,
sigla_acessorio VARCHAR(50) NOT NULL,
ano_fabricacao_veiculo Date NOT NULL,
data_aquisicao_veculo Date NOT NULL,
data_venda_veiculo Date NOT NULL,
quilometragem_atual_veiculo VARCHAR(255) NOT NULL,
FOREIGN KEY (codigo_modelo) REFERENCES TB_MODELOS (codigo_modelo)
FOREIGN KEY (codigo_grupo) REFERENCES TB_GRUPOS (codigo_grupo)
FOREIGN KEY (sigla_acessorio) REFERENCES TB_ACESSORIOS (sigla_acessorio)
CONSTRAINT pk_placa_veiculo PRIMARY KEY (placa_veiculo)
);


CREATE TABLE TB_ENDERECOS(
codigo_endereco integer NOT NULL,
numero_endereco VARCHAR(15) NOT NULL,
logradouro_endereco VARCHAR(255) NOT NULL,
bairro_endereco VARCHAR(55) NOT NULL,
cnpj_fabricante VARCHAR(55) NOT NULL,
sigla_cidade  VARCHAR(10) NOT NULL,
sigla_estado  VARCHAR(10) NOT NULL,
FOREIGN KEY (cnpj_fabricante) REFERENCES TB_FABRICANTES (cnpj_fabricante)
FOREIGN KEY (sigla_cidade) REFERENCES TB_CIDADES (sigla_cidade)
FOREIGN KEY (sigla_estado) REFERENCES TB_ESTADOS (sigla_estado)
CONSTRAINT pk_codigo_endereco PRIMARY KEY(codigo_endereco)
);
