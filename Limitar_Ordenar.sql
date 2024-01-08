/*Limitar quantidade de registros para retornar na consulta*/
Select * from tabela_de_vendedores
limit 5;

Select * from tabela_de_vendedores
limit 2,2; #Seleciona apartir de qual linha iniciar a consulta e quantas deverão retornar

/*Limitar quantidade de registros para retornar na consulta*/
Select * from tabela_de_vendedores
order by NOME; #ordena em ordem crescente (A a Z)

Select * from tabela_de_vendedores
order by NOME desc; #ordena em ordem crescente (A a Z)

Select * from tabela_de_produtos
order by PRECO_DE_LISTA, NOME_DO_PRODUTO; #ordenação composta

Select * from tabela_de_produtos
order by PRECO_DE_LISTA desc, NOME_DO_PRODUTO asc; #ordenação composta


/*Agrupar registros para retornar na consulta, possibilitando calculos (IMPORTANTE: utilizar group by)*/
Select ESTADO, LIMITE_DE_CREDITO from tabela_de_clientes
group by ESTADO;

Select ESTADO, sum(LIMITE_DE_CREDITO) as LIMITE_TOTAL 
from tabela_de_clientes; 

Select ESTADO, sum(LIMITE_DE_CREDITO) as LIMITE_TOTAL 
from tabela_de_clientes
group by ESTADO; 
#Soma a coluna "LIMITE_DE_CREDITO" (obrigatorio nomear a coluna. Ex "as LIMITE_TOTAL"). 
#Importante utilizar o "group by" para juntar as informações da coluna (ex: ESTADO). Caso contrario somaria tudo em um só

Select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO 
from tabela_de_produtos
group by EMBALAGEM; #Mostra o maior preço de cada produto

Select EMBALAGEM 
from tabela_de_produtos
where EMBALAGEM = 'Garrafa';

Select EMBALAGEM, count(*) as CONTADOR 
from tabela_de_produtos
group by EMBALAGEM; #Conta quantas linhas de determinada informação, determinada pelo group by

Select BAIRRO, sum(LIMITE_DE_CREDITO) as LIMITE 
from tabela_de_clientes
where CIDADE = 'Rio de Janeiro'
group by BAIRRO;

/*Having cria critério para retorno da consulta*/
Select ESTADO, sum(LIMITE_DE_CREDITO) as LIMITE 
from tabela_de_clientes
group by ESTADO having sum(LIMITE_DE_CREDITO) > 900000;

SELECT CPF, COUNT(*) FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING COUNT(*) > 2000;

/*Case é utilizado para condições (ex Se acontecer X, traga Y)*/
select NOME_DO_PRODUTO, PRECO_DE_LISTA,
case 
	when PRECO_DE_LISTA >= 12 then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 2 and PRECO_DE_LISTA < 12 then 'PRODUTO EM CONTA'
	else 'PRODUTO BARATO'
end as STATUS_PREÇO
from tabela_de_produtos;


select EMBALAGEM,
case 
	when PRECO_DE_LISTA >= 12 then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 2 and PRECO_DE_LISTA < 12 then 'PRODUTO EM CONTA'
	else 'PRODUTO BARATO'
end as STATUS_PREÇO,
avg(PRECO_DE_LISTA) as PRECO_MEDIO
from tabela_de_produtos
group by EMBALAGEM, 
case 
	when PRECO_DE_LISTA >= 12 then 'PRODUTO CARO'
	when PRECO_DE_LISTA >= 2 and PRECO_DE_LISTA < 12 then 'PRODUTO EM CONTA'
	else 'PRODUTO BARATO'
end; #Utilizando CASE e e agrupando preco baseado na média geral dos produtos

