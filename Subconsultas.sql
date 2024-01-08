/*Subconsultas podem ser utilizadas dentro de outra consulta*/

#Buscando todos os bairros (sem duplicidade)
select distinct BAIRRO from tabela_de_vendedores;

#Select buscando todos os bairros, porém que necessita de constante atualização
select * from tabela_de_clientes where BAIRRO in ('Tijuca', 'Jardins', 'Copacabana');

#Inserindo o primeiro select, dentro da condição do where, a busca não precisará ser atualizada na query
select * from tabela_de_clientes where BAIRRO in (select distinct BAIRRO from tabela_de_vendedores);


select X.EMBALAGEM, X.PRECO_MAXIMO
from (select EMBALAGEM, MAX(PRECO_DE_LISTA) as PRECO_MAXIMO 
	from tabela_de_produtos
    group by EMBALAGEM) X;
    
    
select X.EMBALAGEM, X.PRECO_MAXIMO
from (select EMBALAGEM, MAX(PRECO_DE_LISTA) as PRECO_MAXIMO 
	from tabela_de_produtos
    group by EMBALAGEM) X
where X.PRECO_MAXIMO >= 10;