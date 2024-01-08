select * from itens_notas_fiscais;
select * from notas_fiscais;

/*CONSULTA COM VENDAS DE CLIENTES POR MÊS*/

#1º Unificar tabelas itens_notas_fiscais e notas_fiscais pelo campo "NUMERO"
select * 
from itens_notas_fiscais INF inner join notas_fiscais NF 
on NF.NUMERO = INF.NUMERO;

#2º Selecionar apenas os campos que desejamos visualizar e editar o campo "DATA_VENDA" para exibir apenas mes e ano
select NF.CPF, date_format(NF.DATA_VENDA, '%m-%y') as MES_ANO, INF.QUANTIDADE
from itens_notas_fiscais INF inner join notas_fiscais NF 
on NF.NUMERO = INF.NUMERO;

#3º Agrupar as quantidades de compras dos dias que tiveram mais de uma compra
select NF.CPF, date_format(NF.DATA_VENDA, '%m-%y') as MES_ANO, 
sum(INF.QUANTIDADE) QNTD_VENDAS #sum para somar as quantidades
from itens_notas_fiscais INF 
inner join notas_fiscais NF 
on NF.NUMERO = INF.NUMERO
group by NF.CPF, date_format(NF.DATA_VENDA, '%m-%y');#Para agrupar considerando a mesma regra do campo, necessário repeti-lo no group by


/*LIMITE DE COMPRA POR CLIENTE*/
select * from tabela_de_clientes TC;
select TC.CPF, TC.NOME, tc.VOLUME_DE_COMPRA as QNTD_LIMITE from tabela_de_clientes TC;

select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%m-%y') as MES_ANO, 
sum(INF.QUANTIDADE) QNTD_VENDAS,
max(TC.VOLUME_DE_COMPRA) as QNTD_LIMITE #Utilizado o MAX, pois o numero de limite de compra é sempre o mesmo
from itens_notas_fiscais INF 
inner join notas_fiscais NF 
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC
on TC.CPF = NF.CPF #unificando a 3ª tabela (tabela_de_clientes) na consulta
group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%m-%y');

#Criando uma subquery
select X.CPF, X.NOME, X.QNTD_VENDAS, X.QNTD_LIMITE,
QNTD_LIMITE - X.QNTD_VENDAS as DIFERENCA,
case when (QNTD_LIMITE - X.QNTD_VENDAS) < 0 then 'Fora do Límite' else 'Dentro do Límite' end as STATUS_LIMITE #Criando um campo lógico para avaliar se ultrapassou o limite de venda
from (
select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%m-%y') as MES_ANO, 
sum(INF.QUANTIDADE) QNTD_VENDAS,
max(TC.VOLUME_DE_COMPRA) as QNTD_LIMITE #Utilizado o MAX, pois o numero de limite de compra é sempre o mesmo
from itens_notas_fiscais INF 
inner join notas_fiscais NF 
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC
on TC.CPF = NF.CPF #unificando a 3ª tabela (tabela_de_clientes) na consulta
group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%m-%y')
) X;

#4º retiramos o campo "DIFERENÇA" que não é mais necessário e chegamos a consulta final
#Criando uma subquery
select X.CPF, X.NOME, X.QNTD_VENDAS, X.QNTD_LIMITE,
QNTD_LIMITE - X.QNTD_VENDAS as DIFERENCA,
case when (QNTD_LIMITE - X.QNTD_VENDAS) < 0 then 'Fora do Límite' else 'Dentro do Límite' end as STATUS_LIMITE #Criando um campo lógico para avaliar se ultrapassou o limite de venda
from (
select NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%m-%y') as MES_ANO, 
sum(INF.QUANTIDADE) QNTD_VENDAS,
max(TC.VOLUME_DE_COMPRA) as QNTD_LIMITE #Utilizado o MAX, pois o numero de limite de compra é sempre o mesmo
from itens_notas_fiscais INF 
inner join notas_fiscais NF 
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC
on TC.CPF = NF.CPF #unificando a 3ª tabela (tabela_de_clientes) na consulta
group by NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%m-%y')
) X;