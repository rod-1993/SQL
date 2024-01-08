/*UNION: Faz a união entre duas ou mais tabelas.
Contém a restrição: obrigatoriamente precisa ter as mesmas colunas nas duas ou mais tabelas, para poder unificar.*/

select distinct * from tabela_de_clientes;
select distinct * from tabela_de_vendedores;

#Unificando sem duplicidade
select distinct BAIRRO from tabela_de_clientes
union
select distinct BAIRRO from tabela_de_vendedores;

#Unificando com duplicidade
select distinct BAIRRO from tabela_de_clientes
union all
select distinct BAIRRO from tabela_de_vendedores;

#Distinguindo CLIENTE e VENDEDOR
select distinct BAIRRO, NOME, 'CLIENTE' as TIPO from tabela_de_clientes
union all
select distinct BAIRRO, NOME, 'VENDEDOR' as TIPO from tabela_de_vendedores;