#LTRIM = Remove espaços da esquerda de uma string
select ltrim('      Olá') as RESULTADO;

#LTRIM = Remove espaços da direita de uma string
select rtrim('Olá      ') as RESULTADO;


#TRIM = Remove espaços dos dois lados de uma string
select trim('      Olá      ') as RESULTADO;

#UPPER = Coloca todo o texto em MAIUSCULO
select upper('Olá! Tudo bem ?') as RESULTADO;

#LOWER = Coloca todo o texto em MINUSCULO
select lower('OLÁ! TUDO BEM ?') as RESULTADO;

#SUBSTRING = Retorna um ou mais caracteres de uma string, de acordo com as definições passadas na query

select substring('Paralelepipedo', 5) as RESULTADO; /* Retorna apartir da letra L */
select substring('Paralelepipedo', 5, 4) as RESULTADO; /* Retorna 4 caracteres, apartir da letra L*/

#CONCAT = Concatena duas ou mais strings
select concat('Olá!', ' Tudo bem ?') as RESULTADO;

select concat(NOME, ' (', CPF,')') as Resultado from tabela_de_clientes;
Select * from tabela_de_clientes;
select NOME, concat(ENDERECO_1, ', ',BAIRRO, ' - ', BAIRRO, ' - ', ESTADO, ' CEP: ', CEP) as ENDERECO_COMPLETO 
from tabela_de_clientes;

/*FUNÇÕES PARA MANIPULAR DATAS*/

#ADDDATE = adiciona valor somado a uma data especificada
select adddate('2024-01-05', interval 1 day);
select adddate('2024-01-05', interval 1 month);
select adddate('2024-01-05', interval 1 year);

#TIMESTAMPDIFF= Retorna a diferença de duas expressões de data e hora, usando as unidades especificadas
#CURDATE = retorna data atual
SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS    IDADE
FROM  tabela_de_clientes;

/*FUNÇÕES MATEMATICAS*/

select (10+(50/5)*56-((89+76)-129)) as resultado;
Select ceiling(12.0492) as resultado; #arrendonda para o numero acima
select round(12.0484) as resultado; #arredonda de acordo com a casa decimal 

select CODIGO_DO_PRODUTO, QUANTIDADE, PRECO, round(QUANTIDADE*PRECO) as FATURAMENTO 
from itens_notas_fiscais; #arredondando o valor de faturamento

select CODIGO_DO_PRODUTO, QUANTIDADE, PRECO, round(QUANTIDADE*PRECO, 2) as FATURAMENTO 
from itens_notas_fiscais; #arredondando o valor de faturamento de acordo com duas casas decimais 

/*Converter tipos de dados*/

select concat('O dia de hoje é:', DATE_FORMAT(CURRENT_TIMESTAMP(), '%W, %d/%m/%y')) as RESULTADO;
#DATE_FORMAT = tranforma o dado em tipo "data"

select convert(23.3, CHAR) as RESULTADO;

SELECT YEAR(DATA_VENDA)as ANO, FLOOR(SUM(IMPOSTO*(QUANTIDADE * PRECO))) as IMPOSTO
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);


SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
round(CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20)))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA);




