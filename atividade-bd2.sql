/*

1. Listar veículos
● Colunas: placa, quilometragem atual e data de aquisição
● Filtro: adquiridos antes de 2015 e com quilometragem maior que 40000
● Ordenação: quilometragem atual (descendente) e placa (ascendente);

*/

SELECT placa_veiculo,quilometragem_atual_veiculo,data_aquisicao_veculo
FROM tb_veiculos
WHERE data_aquisicao_veculo < '2015-01-01' AND quilometragem_atual_veiculo > '4000' ORDER BY quilometragem_atual_veiculo DESC,placa_veiculo ASC;



/*

2. Listar modelos:
● Colunas: todas
● Filtro: nome contém a palavra "gol" em qualquer local;


*/

SELECT * FROM tb_modelos WHERE nome_modelo LIKE 'Gol%';



/*

3. Listar fabricante:
● Colunas: endereço (logradouro todo em minúsculo, primeiros 10 caracteres do
complemento); nome do fabricante todo em maiúsculo;
● Filtro: cnpj com menos de 14 caracteres (lembre-se de remover os caracteres em branco do
início e fim do campo durante a consulta) ou que possuam caracteres não numéricos;

*/

SELECT  LOWER(CONCAT(e.logradouro_endereco,' ,',e.complemento_endereco)) AS endereco, UPPER(f.nome_fabricante) as nome_fabricante
FROM tb_enderecos e INNER JOIN tb_fabricantes f
ON  e.cnpj_fabricante = f.cnpj_fabricante
WHERE LENGTH(REPLACE(REPLACE(REPLACE(e.cnpj_fabricante,'.',''),'/',''),'-','')) < 20


/*
4. Listar veículos:
● Colunas: quantidade total de veículos, quantidade de veículos vendidos, quilometragem do
mais rodado; quilometragem do menos rodado; quilometragem média; total de quilômetros
rodados por todos os veículos
● Filtro: nenhum;
*/

SELECT COUNT(*) AS quantidade_total_veiculos,
COUNT(data_venda_veiculo) AS quantidade_veiculos_vendidos,
MAX(quilometragem_atual_veiculo) as quilometragem_veiculo_mais_rodado,
MIN(quilometragem_atual_veiculo) AS quilometragem_veiculo_menos_rodado,
AVG(CAST(quilometragem_atual_veiculo AS INTEGER)) AS quilometragem_media,
SUM(CAST(quilometragem_atual_veiculo AS INTEGER)) AS total_quilometros_rodados_todos_veiculos
FROM tb_veiculos
	



/*
5. Listar veículos:
● Colunas: ano de fabricação, quantidade; quilometragem do mais rodado; quilometragem do
menos rodado; quilometragem média; total de quilômetros rodados por todos os veículos
● Filtro: nenhum.
*/

SELECT
COUNT(*) AS quantidade_veiculo,
MAX(quilometragem_atual_veiculo) as quilometragem_veiculo_mais_rodado,
MIN(quilometragem_atual_veiculo) AS quilometragem_veiculo_menos_rodado,
AVG(CAST(quilometragem_atual_veiculo AS INTEGER)) AS quilometragem_media,
SUM(CAST(quilometragem_atual_veiculo AS INTEGER)) AS total_quilometros_rodados_todos_veiculos
FROM tb_veiculos GROUP BY ano_fabricacao_veiculo




/*
6. Listar as distintas siglas de acessórios que estão instalados em algum veículo:
● Colunas: sigla_acessorio
● Filtro: nenhum;
*/

SELECT sigla_acessorio FROM tb_acessorios_veiculos


/*
7. Veículos e suas respectivas datas de venda. Para os veículos não vendidos, exibir a mensagem
'(não vendido)':
● Colunas: placa, data_venda (mensagem '(não vendido)' para as data_venda nulas)
● Filtro: nenhum;
*/


SELECT placa_veiculo,COALESCE(CAST(data_venda_veiculo AS VARCHAR),'Não Vendido') AS data_venda_veiculo
FROM tb_veiculos


/*

		MM-DD-YYYY
		YYYY-MM-DD
		
		(básico, utilitário, luxo)
*/

INSERT INTO TB_PRECOS  (codigo_preco_diaria,valor_diaria,data_inicio_vigencia,data_fim_vigencia) VALUES (1,10.00,'01/01/2010','12/31/2010');
INSERT INTO TB_CIDADES  (sigla_cidade,nome_cidade) VALUES ('SSA','Salvador');
INSERT INTO TB_ESTADOS  (sigla_estado,nome_estado) VALUES ('BA','Bahia');
INSERT INTO TB_ACESSORIOS (sigla_acessorio,nome_acessorio) VALUES ('VOL2','Volante com airbag duplo');
INSERT INTO TB_ACESSORIOS (sigla_acessorio,nome_acessorio) VALUES ('SOMD','Aparelho de som digital');
INSERT INTO TB_FABRICANTES (cnpj_fabricante,nome_fabricante,telefones_fabricante) VALUES ('59.104.760/0001-91','Toyota','759999999,718888888');
INSERT INTO TB_MODELOS (codigo_modelo,nome_modelo,cnpj_fabricante) VALUES (1,'Gol','59.104.760/0001-91');
INSERT INTO TB_GRUPOS (codigo_grupo,nome_grupo,codigo_preco_diaria) VALUES (1,'Básico',1);
INSERT INTO TB_VEICULOS (placa_veiculo,codigo_modelo,codigo_grupo,ano_fabricacao_veiculo,data_aquisicao_veculo,data_venda_veiculo,quilometragem_atual_veiculo) VALUES ('AAA-123',1,1,'10/10/2014','11/21/2014','12/17/2014','5000');
INSERT INTO TB_VEICULOS (placa_veiculo,codigo_modelo,codigo_grupo,ano_fabricacao_veiculo,data_aquisicao_veculo,data_venda_veiculo,quilometragem_atual_veiculo) VALUES ('BBB-456',1,1,'05/12/2014','07/10/2014','07/11/2014','5500');
INSERT INTO TB_VEICULOS (placa_veiculo,codigo_modelo,codigo_grupo,ano_fabricacao_veiculo,data_aquisicao_veculo,data_venda_veiculo,quilometragem_atual_veiculo) VALUES ('CCC-789',1,1,'09/07/2014','09/13/2014','10/01/2014','6000');
INSERT INTO TB_VEICULOS (placa_veiculo,codigo_modelo,codigo_grupo,ano_fabricacao_veiculo,data_aquisicao_veculo,data_venda_veiculo,quilometragem_atual_veiculo) VALUES ('LOP-333',1,1,'10/10/2014','11/21/2014','12/17/2014','5000');
INSERT INTO TB_VEICULOS (placa_veiculo,codigo_modelo,codigo_grupo,ano_fabricacao_veiculo,data_aquisicao_veculo,data_venda_veiculo,quilometragem_atual_veiculo) VALUES ('CDA-331',1,1,'06/12/2014','07/10/2014','07/11/2014','5500');
INSERT INTO TB_VEICULOS (placa_veiculo,codigo_modelo,codigo_grupo,ano_fabricacao_veiculo,data_aquisicao_veculo,data_venda_veiculo,quilometragem_atual_veiculo) VALUES ('BBP-498',1,1,'09/07/2014','09/13/2014','10/01/2014','6000');
INSERT INTO TB_VEICULOS (placa_veiculo,codigo_modelo,codigo_grupo,ano_fabricacao_veiculo,data_aquisicao_veculo,quilometragem_atual_veiculo) VALUES ('ZZZ-111',1,1,'09/07/2014','09/13/2014','6000');
INSERT INTO TB_ENDERECOS(codigo_endereco,numero_endereco,complemento_endereco,logradouro_endereco,bairro_endereco,cnpj_fabricante,sigla_cidade,sigla_estado) VALUES (1,'283','Ao lado do COT Canela','Rua João das Botas','Canela','59.104.760/0001-91','SSA','BA');
INSERT INTO TB_ACESSORIOS_VEICULOS(placa_veiculo,sigla_acessorio) values ('AAA-123','VOL2');
INSERT INTO TB_ACESSORIOS_VEICULOS(placa_veiculo,sigla_acessorio) values ('AAA-123','SOMD');
INSERT INTO TB_ACESSORIOS_VEICULOS(placa_veiculo,sigla_acessorio) values ('BBB-456','SOMD');
INSERT INTO TB_ACESSORIOS_VEICULOS(placa_veiculo,sigla_acessorio) values ('CCC-789','VOL2');



CREATE TABLE TB_PRECOS (
codigo_preco_diaria integer  NOT NULL,
valor_diaria decimal NOT NULL,
data_inicio_vigencia Date NOT NULL,
data_fim_vigencia Date,
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
nome_acessorio VARCHAR(255) NOT NULL,
CONSTRAINT pk_sigla_acessorio PRIMARY KEY (sigla_acessorio)
);



CREATE TABLE TB_FABRICANTES(
cnpj_fabricante VARCHAR(55) UNIQUE NOT NULL,
nome_fabricante VARCHAR(255) NOT NULL,
telefones_fabricante VARCHAR(255) NOT NULL,
CONSTRAINT pk_cnpj_fabricante PRIMARY KEY (cnpj_fabricante)
);



CREATE TABLE TB_MODELOS(
codigo_modelo integer NOT NULL,
nome_modelo VARCHAR(50) NOT NULL,
cnpj_fabricante VARCHAR(55) NOT NULL,
FOREIGN KEY (cnpj_fabricante) REFERENCES TB_FABRICANTES (cnpj_fabricante),
CONSTRAINT pk_codigo_modelo  PRIMARY KEY (codigo_modelo)
);

CREATE TABLE TB_GRUPOS(
codigo_grupo integer NOT NULL,
nome_grupo VARCHAR(50) NOT NULL,
codigo_preco_diaria integer NOT NULL,
FOREIGN KEY (codigo_preco_diaria) REFERENCES TB_PRECOS (codigo_preco_diaria),
CONSTRAINT pk_codigo_grupo  PRIMARY KEY (codigo_grupo)
);

CREATE TABLE TB_VEICULOS(
placa_veiculo VARCHAR(255) UNIQUE NOT NULL,
codigo_modelo integer NOT NULL,
codigo_grupo integer NOT NULL,
ano_fabricacao_veiculo Date NOT NULL,
data_aquisicao_veculo Date NOT NULL,
data_venda_veiculo Date,
quilometragem_atual_veiculo VARCHAR(255) NOT NULL,
FOREIGN KEY (codigo_modelo) REFERENCES TB_MODELOS (codigo_modelo),
FOREIGN KEY (codigo_grupo) REFERENCES TB_GRUPOS (codigo_grupo),
CONSTRAINT pk_placa_veiculo PRIMARY KEY (placa_veiculo)
);

CREATE TABLE TB_ENDERECOS(
codigo_endereco integer NOT NULL,
numero_endereco VARCHAR(15) NOT NULL,
complemento_endereco VARCHAR(255) NOT NULL,
logradouro_endereco VARCHAR(255) NOT NULL,
bairro_endereco VARCHAR(55) NOT NULL,
cnpj_fabricante VARCHAR(55) NOT NULL,
sigla_cidade  VARCHAR(10) NOT NULL,
sigla_estado  VARCHAR(10) NOT NULL,
FOREIGN KEY (cnpj_fabricante) REFERENCES TB_FABRICANTES (cnpj_fabricante),
FOREIGN KEY (sigla_cidade) REFERENCES TB_CIDADES (sigla_cidade),
FOREIGN KEY (sigla_estado) REFERENCES TB_ESTADOS (sigla_estado),
CONSTRAINT pk_codigo_endereco PRIMARY KEY(codigo_endereco)
);

CREATE TABLE TB_ACESSORIOS_VEICULOS(
codigo_acessorios_veiculos serial primary key,
placa_veiculo VARCHAR(255),
sigla_acessorio VARCHAR(50)
);

/*
Listar a descrição do prédio seguido da quantidade de salas existentes em cada
prédio, ordenada pela descrição do prédio.
*/

SELECT pr.descricacaopredio as descricao_predio, count(s.numsala) as qnt_sala_existentes
FROM tb_predio pr INNER JOIN tb_sala s
ON pr.codpredio = s.codpredio
GROUP by descricacaopredio


/*
Listar a descrição do prédio seguido da quantidade de salas existentes em cada
prédio, somente se a quantidade de salas por prédio for maior do que 3.
*/

SELECT pr.descricacaopredio as descricao_predio, count(s.numsala) as qnt_sala_existentes
FROM tb_predio pr INNER JOIN tb_sala s
ON pr.codpredio = s.codpredio
GROUP by descricacaopredio HAVING count(s.numsala) > 3
