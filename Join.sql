/*JOIN = Unifica dados de tabelas
Select A.NOME_DO_PRODUTO, B.PRECO 
from TABELA_ESQUERDA A
inner join TABELA_DIREITA B
on A.CODIGO_DO_PRODUTO = B.CODIGO_DO_PRODUTO
*/

Select * from tabela_de_vendedores;
Select * from notas_fiscais;

/*INNER JOIN = Retorna apenas dados quando as chaves são correspondentes nas duas tabelas*/
select A.MATRICULA, A.NOME, B.CPF, B.DATA_VENDA from tabela_de_vendedores A
inner join notas_fiscais B
on A.MATRICULA = B.MATRICULA;


select A.MATRICULA, A.NOME, B.CPF, B.DATA_VENDA, count(*) from tabela_de_vendedores A
inner join notas_fiscais B
on A.MATRICULA = B.MATRICULA
group by A.MATRICULA, A.NOME; #Mostrando a quantidade de venda de cada vendedor

/*LEFT JOIN = Retorna todos os dados da tabela da esquerda e somente os correspondentes da tabela direita*/
select count(*) from tabela_de_clientes;

select distinct A.CPF, A.NOME, B.CPF
from tabela_de_clientes A
left join notas_fiscais B
on A.CPF = B.CPF;

select distinct A.CPF, A.NOME, B.CPF
from tabela_de_clientes A
left join notas_fiscais B
on A.CPF = B.CPF
where B.CPF is null; #buscando o cliente que não realizou compra

/*RIGHT JOIN = Retorna todos os dados da tabela da direita e somente os correspondentes da tabela esquerda*/
select distinct B.CPF, B.NOME, A.CPF
from notas_fiscais A
right join tabela_de_clientes B
on A.CPF = B.CPF;

/*FULL JOIN = Retorna todos os dados das duas tabelas (não funciona no mySQL)*/
select * from tabela_de_vendedores;
select * from tabela_de_clientes;

select tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME, 
DE_FERIAS, #colunas que só existem em uma das tabelas, não precisa dizer de qual tabela vem
tabela_de_clientes.BAIRRO, 
tabela_de_clientes.NOME
from tabela_de_vendedores left join tabela_de_clientes
on tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

/*CROSS JOIN = retorna um produto cartesiano das duas tabelas (ex: tabela A - João, Pedro / Tabela B - Praia, Futebol / Resultado: João - Praia, João - Futebol, Pedro - Praia, Pedro - Futebol)*/
select tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME, 
DE_FERIAS, #colunas que só existem em uma das tabelas, não precisa dizer de qual tabela vem
tabela_de_clientes.BAIRRO, 
tabela_de_clientes.NOME
from tabela_de_vendedores, tabela_de_clientes;