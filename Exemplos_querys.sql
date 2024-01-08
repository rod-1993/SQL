select * from tabela_de_clientes;
/*Seleção inserindo novos nomes para colunas*/
select 
CPF as ID,
NOME as CLIENTE,
DATA_DE_NASCIMENTO as DT_NASC
from tabela_de_clientes;

/*Utilizando buscas especificas WHERE*/
select NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP from tabela_de_clientes where CPF = '19290992743';
select * from tabela_de_produtos where SABOR = 'Laranja';

/*Consultas condicionais*/
select * from tabela_de_produtos where PRECO_DE_LISTA > 19.50 ;
select * from tabela_de_produtos where PRECO_DE_LISTA between 10.00 and 19.50 ;

select * from tabela_de_produtos where SABOR = 'Manga' or SABOR = 'Maça';
select * from tabela_de_produtos where SABOR in ('Manga', 'Maça'); #Executa mesma consulta que a acima

/*Consultas com Like*/
select * from tabela_de_clientes where NOME like '%Mattos'; #termina com "Carvalho"
select * from tabela_de_produtos where SABOR like 'Ma%'; #Começa com "Ma"
select * from tabela_de_produtos where SABOR like '%Maça%'; #Contem "Maça" no nome, independente na posição

/*Consultas com Distinct= retorna linhas com combinacoes unicas, sem mostrar duplicidades*/
select EMBALAGEM, TAMANHO from tabela_de_produtos;
select distinct EMBALAGEM, TAMANHO from tabela_de_produtos;

select distinct EMBALAGEM, TAMANHO 
from tabela_de_produtos
where SABOR = 'Laranja';

SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';

