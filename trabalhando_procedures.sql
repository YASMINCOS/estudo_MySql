call manipulacao_dados;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manipulacao_dados`()
BEGIN
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
    ('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
    ('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
    ('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
    ('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
    ('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
    ('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
    ('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
    ('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
    ('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
    ('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
    ('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';

    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
END


call cliente;
CREATE PROCEDURE `cliente`()

BEGIN

DECLARE Cliente VARCHAR(10);
DECLARE Idade INT;
DECLARE DataNascimento DATE;
DECLARE Custo FLOAT;

SET Cliente = 'João';
SET Idade = 10;
SET DataNascimento = '20170110';
SET Custo = 10.23;

SELECT Cliente;
SELECT Idade;
SELECT DataNascimento;
SELECT Custo;

END
call calcula_idade;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Calcula_Idade`()
BEGIN
UPDATE tabela_de_clientes set idade =  TIMESTAMPDIFF(YEAR, data_de_nascimento, CURDATE());
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `Reajuste_Comissao`(vPercent FLOAT)
BEGIN
UPDATE tabela_de_vendedores SET percentual_comissao = percentual_comissao * (1 + vPercent);
END
call Reajuste_Comissao;

call Quantidade_Notas;
CREATE PROCEDURE `Quantidade_Notas`()
BEGIN
DECLARE NUMNOTAS INT;
SELECT COUNT(*) INTO NUMNOTAS  FROM NOTAS_FISCAIS WHERE DATA_VENDA = '20170101';
SELECT NUMNOTAS;
END
