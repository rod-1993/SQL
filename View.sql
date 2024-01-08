/*VIEW: tabela lógica, resultado de uma consulta, que pode ser usada em outra consulta*/

#Select usado na view criada (vw_maiores_embalagens)
select EMBALAGEM, max(PRECO_DE_LISTA) as MAIOR_PRECO from tabela_de_produtos
group by EMBALAGEM;

#Utilizando a VIEW criada como tabela da consulta
select X.EMBALAGEM, X.MAIOR_PRECO from
vw_maiores_embalagens X where X.MAIOR_PRECO >= 10;

#Unificando uma tabela com uma VIEW criada
select A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, B.MAIOR_PRECO
from tabela_de_produtos A inner join vw_maiores_embalagens B
on A.EMBALAGEM = B.EMBALAGEM;